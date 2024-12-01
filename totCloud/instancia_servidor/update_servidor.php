<?php
include "../funcions.php";
include "../connexio.php";
include "../atributsClasses/instancia_servidor.php"; 

$db = new Database($conn);
$file = "llista_servidor.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$pk]) && !empty($_GET[$a1]) && !empty($_GET[$a2]) && !empty($_GET[$a3])
&& !empty($_GET[$a4]) && !empty($_GET[$a5]) && !empty($_GET[$a6]) && !empty($_GET[$a7])
&& !empty($_GET[$a8]) && !empty($_GET[$a9])) {
    // Recoger valores GET
    $bk = $_GET[$pk];
    $b1 = $_GET[$a1];
    $b2 = $_GET[$a2];
    $b3 = $_GET[$a3];
    $b4 = $_GET[$a4];
    $b5 = $_GET[$a5];
    $b6 = $_GET[$a6];
    $b7 = $_GET[$a7];
    $b8 = $_GET[$a8];
    $b9 = $_GET[$a9];

    // Crear la consulta SQL
    $re1 = 'UPDATE instancia_servidor SET $a1 = "'.$b1.'", a2 = "'.$b2.'", $a3 = "'.$b3.'",
    $a4 = "'.$b4.'", $a5 = "'.$b5.'", $a6 = "'.$b6.'", $a7 = "'.$b7.'", $a8 = "'.$b8.'", $a9 = "'.$b9.'"
    WHERE $pk = "'.$bk.'"';

    $db->consultar($re1);
    $db->regresar($file);

} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>
