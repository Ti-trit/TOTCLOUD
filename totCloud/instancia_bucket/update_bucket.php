<?php
include "../funcions.php";
include "../connexio.php";
include "../atributsClasses/instancia_bucket.php";

$db = new Database($conn);
$file = "llista_bucket.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$pk]) && !empty($_GET[$a1]) && !empty($_GET[$a2])) {
    // Recoger valores GET
    $bk = $_GET[$pk];
    $b1 = $_GET[$a1];
    $b2 = $_GET[$a2];

    // Crear la consulta SQL
    $re1 = "UPDATE instancia_bucket SET $a1 = '$b1', $a2 = '$b2' WHERE $pk = '$bk'";

    $db->consultar($re1);
    $db->regresar($file);

} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>