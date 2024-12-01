<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bd.php";

$db = new Database($conn);
$file = "llista_bd.php";

$bitValido = $_GET[$a5] === '0' || $_GET[$a5] === '1';

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$a1]) && !empty($_GET[$a2]) && !empty($_GET[$a3])
&& !empty($_GET[$a4]) && $bitValido && !empty($_GET[$a6]) && !empty($_GET[$a7])
&& !empty($_GET[$a8]) && !empty($_GET[$a9]) && !empty($_GET[$a10]) && !empty($_GET[$a11])) {
    // Recoger valores GET
    $b1 = $_GET[$a1];
    $b2 = $_GET[$a2];
    $b3 = $_GET[$a3];
    $b4 = $_GET[$a4];
    $b5 = $_GET[$a5];
    $b6 = $_GET[$a6];
    $b7 = $_GET[$a7];
    $b8 = $_GET[$a8];
    $b9 = $_GET[$a9];
    $b10 = $_GET[$a10];
    $b11 = $_GET[$a11];

    // Crear la consulta SQL
    $re1 = "INSERT INTO instancia_bd ($a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9, $a10, $a11) 
        VALUES ('$b1', '$b2', '$b3', '$b4', $b5, '$b6', '$b7', '$b8', '$b9', '$b10', '$b11')";

    $db->consultar($re1);
    $db->regresar($file);
} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>
