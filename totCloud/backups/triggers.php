<?php
$mysqli = new mysqli("localhost", "root", "", "practica2");

if ($mysqli->connect_error) {
    die("Conexión fallida: " . $mysqli->connect_error);
}



$tables = ['CLAU_SESSIO', 'INSTANCIA_SERVIDOR', 'INSTANCIA_BD', 'INSTANCIA_BUCKET', 'SUBXARXA', 'GRUP_SEGURETAT']; // Lista de tablas
$insertOnlyTables = ['CLAU_SESSIO', 'SUBXARXA', 'GRUP_SEGURETAT']; // Tablas a las que solo se les creará el trigger AFTER INSERT

foreach ($tables as $table) {
    // Primero obtenemos las columnas de la tabla actual para formar el JSON dinámicamente
    $columnsQuery = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{$table}' AND TABLE_SCHEMA = 'parquing'";
    $columnsResult = $mysqli->query($columnsQuery);

    if ($columnsResult === FALSE) {
        echo "Error al obtener las columnas de la tabla {$table}: " . $mysqli->error . "<br>";
        continue;
    }

    $columns = [];
    while ($column = $columnsResult->fetch_assoc()) {
        $columns[] = $column['COLUMN_NAME'];
    }

    // Crear la parte de JSON_OBJECT para insertar y actualizar
    $columnJsonInsert = implode(", ", array_map(function($col) { 
        return "IFNULL(NEW.`$col`, 'NULL')"; 
    }, $columns));
        $columnJsonUpdate = implode(", ", array_map(function($col) { return "OLD.`$col`"; }, $columns));

    // Si la tabla está en la lista de tablas para solo INSERT
    if (in_array($table, $insertOnlyTables)) {
        $triggerSQL_insert = "
        CREATE TRIGGER tr_{$table}_after_insert
        AFTER INSERT ON {$table}
        FOR EACH ROW
        BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('{$table}', NULL, JSON_OBJECT($columnJsonInsert), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END;
        ";

        // Ejecutar solo el trigger de INSERT
        if ($mysqli->query($triggerSQL_insert) === TRUE) {
            echo "Trigger de INSERT creado correctamente para la tabla {$table}.<br>";
        } else {
            echo "Error creando trigger de INSERT para {$table}: " . $mysqli->error . "<br>";
        }
    } else {
        // Crear los triggers para INSERT, UPDATE y DELETE para el resto de tablas
        $triggerSQL_insert = "
        CREATE TRIGGER tr_{$table}_after_insert
        AFTER INSERT ON {$table}
        FOR EACH ROW
        BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('{$table}', NULL, JSON_OBJECT($columnJsonInsert), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END;
        ";

        $triggerSQL_update = "
        CREATE TRIGGER tr_{$table}_after_update
        AFTER UPDATE ON {$table}
        FOR EACH ROW
        BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('{$table}', JSON_OBJECT($columnJsonUpdate), JSON_OBJECT($columnJsonInsert), 'UPDATE', NOW(), CURRENT_TIMESTAMP);
        END;
        ";

        $triggerSQL_delete = "
        CREATE TRIGGER tr_{$table}_after_delete
        AFTER DELETE ON {$table}
        FOR EACH ROW
        BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('{$table}', JSON_OBJECT($columnJsonUpdate), NULL, 'DELETE', NOW(), CURRENT_TIMESTAMP);
        END;
        ";

        // Ejecutar los triggers de INSERT, UPDATE y DELETE para el resto de tablas
        if ($mysqli->query($triggerSQL_insert) === TRUE) {
            echo "Trigger de INSERT creado correctamente para la tabla {$table}.<br>";
        } else {
            echo "Error creando trigger de INSERT para {$table}: " . $mysqli->error . "<br>";
        }

        if ($mysqli->query($triggerSQL_update) === TRUE) {
            echo "Trigger de UPDATE creado correctamente para la tabla {$table}.<br>";
        } else {
            echo "Error creando trigger de UPDATE para {$table}: " . $mysqli->error . "<br>";
        }

        if ($mysqli->query($triggerSQL_delete) === TRUE) {
            echo "Trigger de DELETE creado correctamente para la tabla {$table}.<br>";
        } else {
            echo "Error creando trigger de DELETE para {$table}: " . $mysqli->error . "<br>";
        }
    }
}

$mysqli->close();
?>
