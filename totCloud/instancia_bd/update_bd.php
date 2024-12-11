<?php
include "../funcions.php";
include "../connexio.php";
include "../atributsClasses/instancia_bd.php"; 

$db = new Database($conn);
$file = "llista_bd.php";

if (!empty($_GET[$a6])) {
    $b5 = !empty($_GET[$a5]) ? $_GET[$a5] : "NULL";
} else {
    $b5 = "NULL";
}

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$pk]) && !empty($_GET[$a2]) && !empty($_GET[$a3])
&& !empty($_GET[$a4]) && !empty($b5) && !empty($_GET[$a7])
&& !empty($_GET[$a8]) && !empty($_GET[$a9]) && !empty($_GET[$a10]) 
&& !empty($_GET[$a11])) {
    // Recoger valores GET
    $bk = $_GET[$pk];
    $b2 = $_GET[$a2];
    $b3 = $_GET[$a3];
    $b4 = $_GET[$a4];
    $b7 = $_GET[$a7];
    $b8 = $_GET[$a8];
    $b9 = $_GET[$a9];
    $b10 = $_GET[$a10];
    $b11 = $_GET[$a11];

    // Crear la consulta SQL
    $re1 = "UPDATE instancia_bd SET $a2 = '$b2', $a3 = '$b3',
    $a4 = '$b4', $a5 = '$b5', $a7 = '$b7', $a8 = '$b8',  
    $a9 = '$b9', $a10 = '$b10', $a11 = '$b11' WHERE $pk = '$bk'";

    $db->consultar($re1);
    $db->regresar($file);

} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>
