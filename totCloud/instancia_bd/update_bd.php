<?php
include "../funcions.php";
include "../connexio.php";
include "../atributsClasses/instancia_bd.php"; 

$db = new Database($conn);
$file = "llista_bd.php";

if (!empty($_GET[$a6])) {
    $b5 = !empty($_GET["periodeRetencioCS"]) ? $_GET["periodeRetencioCS"] : "NULL";
} else {
    $b5 = "NULL";
}

    

    // Crear la consulta SQL
    $re1 = "UPDATE instancia_bd SET nomMaster = '{$_GET["nomMaster"]}', nomBD = '{$_GET["nomBD"]}',
    grupParametresBD = '{$_GET["GParametreBD"]}', periodeRetencioCS = '$b5'  WHERE idInstanciaBD = '$_GET[$pk]'";

    $db->consultar($re1);
    $db->regresar($file);


$db->close();
?>
