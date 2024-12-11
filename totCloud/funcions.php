<?php

class Database {
    private $conn;

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function consultar($consulta){
        $resultado = $this->conn->query($consulta);
        if ($resultado === false) {
            echo "Error en la consulta: " . $this->conn->error;
        }
        return $resultado;
    }

    public function contarFilas($query) {
        $resultado = $this->consultar($query);
        if ($resultado) {
            return $resultado->num_rows;
        }
        return 0;
    }

    public function regresar($file){
        header("Location: $file");
        exit();
    }

    public function close(){
        mysqli_close($this->conn);
    }
}