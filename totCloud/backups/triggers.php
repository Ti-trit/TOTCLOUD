<?php
// Conexión a la base de datos
$mysqli = new mysqli("localhost", "root", "", "practica2");

if ($mysqli->connect_error) {
    die("Conexión fallida: " . $mysqli->connect_error);
}

// Listado de tablas
$tables = ['CLAU_SESSIO', 'INSTANCIA_SERVIDOR', 'INSTANCIA_BD', 'INSTANCIA_BUCKET', 'SUBXARXA', 'GRUP_SEGURETAT'];
//tablas con solo triggers after INSERT
$insertOnlyTables = ['CLAU_SESSIO', 'SUBXARXA', 'GRUP_SEGURETAT'];

/**
 * Crear un trigger en la base de datos
 * @param mysqli: variable de conexión a la base de datos
 * @param triggerSQL: consulta SQL para crear el trigger
 * @param table: nombre de la tabla al cual creamos el trigger
 * @param type: tipo de operación (INSERT, UPDATE, DELETE)
 */
function createTrigger($mysqli, $triggerSQL, $table, $type) {
    if ($mysqli->query($triggerSQL) === TRUE) {
        echo "Trigger de $type creado correctamente para la tabla $table.<br>";
    } else {
        echo "Error creando trigger de $type para la tabla $table: " . $mysqli->error . "<br>";
    }
}

//recorrer todas las tablas
foreach ($tables as $table) {
    // Obtener columnas de la tabla
    $columnsQuery = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '$table' AND TABLE_SCHEMA = 'practica2';";
    $columnsResult = $mysqli->query($columnsQuery);

    if (!$columnsResult) {
        echo "Error al obtener columnas de la tabla $table: " . $mysqli->error . "<br>";
        continue;
    }
    //
    $columns = [];
    while ($column = $columnsResult->fetch_assoc()) {
        $columns[] = $column['COLUMN_NAME'];
    }
    //expresiones JSON_OBJECT para triggers insert y update_or_delete
    $columnJsonInsert = implode(", ", array_map(fn($col) => "'$col', IFNULL(NEW.`$col`, 'NULL')", $columns));
    $columnJsqonUorD = implode(", ", array_map(fn($col) => "'$col', IFNULL(OLD.`$col`, 'NULL')", $columns));

    // Crear trigger AFTER INSERT
    $triggerSQL_insert = "
        CREATE TRIGGER tr_{$table}_after_insert
        AFTER INSERT ON $table
        FOR EACH ROW
        BEGIN
            INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
            VALUES ('$table', NULL, JSON_OBJECT($columnJsonInsert), 'INSERT', NOW(), CURRENT_TIMESTAMP);
        END;
    ";

    createTrigger($mysqli, $triggerSQL_insert, $table, 'INSERT');

    // Si la tabla no está limitada a solo INSERT, agregar triggers para UPDATE y DELETE
    if (!in_array($table, $insertOnlyTables)) {
        $triggerSQL_update = "
            CREATE TRIGGER tr_{$table}_after_update
            AFTER UPDATE ON $table
            FOR EACH ROW
            BEGIN
                INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
                VALUES ('$table', JSON_OBJECT($columnJsqonUorD), JSON_OBJECT($columnJsonInsert), 'UPDATE', NOW(), CURRENT_TIMESTAMP);
            END;
        ";

        $triggerSQL_delete = "
            CREATE TRIGGER tr_{$table}_after_delete
            AFTER DELETE ON $table
            FOR EACH ROW
            BEGIN
                INSERT INTO audit_table_user (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
                VALUES ('$table', JSON_OBJECT($columnJsqonUorD), NULL, 'DELETE', NOW(), CURRENT_TIMESTAMP);
            END;
        ";

        createTrigger($mysqli, $triggerSQL_update, $table, 'UPDATE');
        createTrigger($mysqli, $triggerSQL_delete, $table, 'DELETE');
    }
}

$mysqli->close();
?>
