<?php
include "../funciones.php";
include "../connexio.php";

$db = new Database($conn);
$file = "llista_bd.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET['nick']) && !empty($_GET['password']) && !empty($_GET['nom']) && !empty($_GET['llinat'])
&& !empty($_GET['foto']) && !empty($_GET['telf']) && !empty($_GET['mail']) && !empty($_GET['domic'])
&& !empty($_GET['pob']) && !empty($_GET['dep'])) {
    // Recoger valores GET
    $n = $_GET['nick'];
    $p = $_GET['password'];
    $no = $_GET['nom'];
    $l = $_GET['llinat'];
    $f = $_GET['foto'];
    $t = $_GET['telf'];
    $m = $_GET['mail'];
    $d = $_GET['domic'];
    $po = $_GET['pob'];
    $de = $_GET['dep'];

    // Crear la consulta SQL
    $re1 = 'UPDATE persona SET password = "'.$p.'", nom = "'.$no.'", llinat = "'.$l.'",
    foto = "'.$f.'", telf = "'.$t.'", mail = "'.$m.'", domic = "'.$d.'", pob = "'.$po.'", dep = "'.$de.'"
    WHERE nick = "'.$n.'"';

    $db->consultar($re1);
    $db->regresar($file);

} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>
