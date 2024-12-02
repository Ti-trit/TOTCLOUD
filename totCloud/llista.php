<?php

class Llista {
    private $conn;
    private $table;

    public function __construct($conn, $table, $idxPK) {
        $this->conn = $conn;
        $this->table = $table;
        $this->idxPK = $idxPK;
    }

    // Mostrar todos los registros de la tabla
    public function showTable($l1,$l2,$l3) {
        $consulta = "SELECT * FROM $this->table";
        $resultat = mysqli_query($this->conn, $consulta);

        // Obtener los nombres de las columnas
        $columns = array();
        while ($column = mysqli_fetch_field($resultat)) {
            $columns[] = $column->name;
        }

        // Construir la tabla HTML
        echo "<TABLE border='1'>";
        echo "<TR>";

        // Encabezados de columna
        foreach ($columns as $col) {
            echo "<TD>" . ucfirst($col) . "</TD>";
        }
        echo "<TD>Modificar</TD>";
        echo "<TD>Eliminar</TD>";
        echo "</TR>";

        // Filas de datos
        while ($reg = mysqli_fetch_assoc($resultat)) {
            echo "<TR>";
            foreach ($columns as $col) {
                echo "<TD>" . $reg[$col] . "</TD>";
            }

            // Generar URLs de modificación y eliminación usando la plantilla i reemplazando {id} por el valor real de la clave primaria
            $primaryKeyValue = $reg[$columns[$this->idxPK]];  // La clave primaria es el contenido de la columna a especificar
            $modifyUrl = str_replace("{id}", $primaryKeyValue, $l1);
            $deleteUrl  = str_replace("{id}", $primaryKeyValue, $l2);

            echo "<TD>$modifyUrl</TD>";
            echo "<TD>$deleteUrl</TD>";
            echo "</TR>";
        }
        echo "</TABLE>";
        echo $l3;
    }
}