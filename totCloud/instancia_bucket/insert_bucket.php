<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bucket.php";

$db = new Database($conn);
$file = "llista_bucket.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$pk]) && !empty($_GET[$a1]) && !empty($_GET[$a2]) && !empty($_GET[$a3])) {
    // Recoger valores GET
    $bk = $_GET[$pk];
    $b1 = $_GET[$a1];
    $b2 = $_GET[$a2];
    $b3 = $_GET[$a3];

    // Crear la consulta SQL
    $re1 = 'INSERT INTO instancia_bucket ($a1, $a2, $pk, $a3) 
    VALUES ("'.$b1.'", "'.$b2.'", "'.$bk.'", "'.$b3.'")';

    $db->consultar($re1);
    $db->regresar($file);
} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>