<?php
$dbhost = "localhost";
$dbuser = "root";
$dbpassword = "";
$dbname = "PRACTICA2";

// Connexión a MySQL
$conn = new mysqli($dbhost, $dbuser, $dbpassword, $dbname);

// Comprobar la conexión
if ($conn->connect_error) {
    echo "Error de conexión: " . $conn->connect_error;
}