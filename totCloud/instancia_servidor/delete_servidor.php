<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_servidor.php";

$db = new Database($conn);
$file = "llista_servidor.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$pk])) {
    // Recoger valores GET
    $k = $_GET[$pk];

    // Crear la consulta SQL
    $re1 = "DELETE FROM instancia_servidor WHERE $pk = '$k'";

    $db->consultar($re1);
    $db->regresar($file);
} else {
    echo "No se ha proporcionado suficiente información";
}
$db->close();
?>
