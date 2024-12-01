<?php
include "../connexio.php";
include "../funciones.php";

$db = new Database($conn);
$file = "llista_bd.php";

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET['nomMaster']) && !empty($_GET['nomBD']) && !empty($_GET['grupParametresBD']) && !empty($_GET['periodeRetencioCS'])
&& !empty($_GET['tipusMotor']) && !empty($_GET['idEmmg']) && !empty($_GET['idConfig']) && !empty($_GET['idSubXar'])
&& !empty($_GET['idGS'])) {
    // Recoger valores GET
    $n = $_GET['nomMaster'];
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
    $re1 = 'INSERT INTO persona (nick, password, nom, llinat, foto, telf, mail, domic, pob, dep) 
    VALUES ("'.$n.'", "'.$p.'", "'.$no.'", "'.$l.'", "'.$f.'", "'.$t.'", "'.$m.'", "'.$d.'", 
    "'.$po.'", "'.$de.'")';

    $db->consultar($re1);
    $db->regresar($file);
} else {
    echo "Por favor, rellena todos los campos.";
}
$db->close();
?>
