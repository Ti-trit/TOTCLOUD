<?php
include "../connexio.php";
include "../funciones.php";

$db = new Database($conn);
$file = "llista_bd.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET['nick'])) {
    // Recoger valores GET
    $n = $_GET['nick'];

    // Crear la consulta SQL
    $re1 = 'DELETE FROM persona WHERE nick = "'.$n.'"';

    $db->consultar($re1);
    $db->regresar($file);
} else {
    echo "No se ha proporcionado suficiente información";
}
$db->close();
?>
