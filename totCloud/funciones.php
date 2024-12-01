<?php

class Database {
    private $conn;

    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function consultar($consulta){
        if (mysqli_query($this->conn, $consulta)) {
            echo "Consulta realizada correctamente";
        } else {
            echo "Error en la consulta: " . mysqli_error($this->conn);
        }
    }

    public function regresar($file){
        header("Location: $file");
        exit();
    }

    public function close(){
        mysqli_close($this->conn);
    }
}