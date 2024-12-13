<?php
include "../funcions.php";
include "../connexio.php";
include "../atributsClasses/instancia_bd.php"; 

$db = new Database($conn);
$file = "llista_bd.php";

if (!empty($_GET[$a6])) {
    $b5 = !empty($_POST["periodeRetencioCS"]) ? $_POST["periodeRetencioCS"] : "NULL";
} else {
    $b5 = "NULL";
}

    

    // Crear la consulta SQL
    $re1 = "UPDATE instancia_bd SET nomMaster = '{$_POST["nomMaster"]}', nomBD = '{$_POST["nomBD"]}',
    grupParametresBD = '{$_POST["GParametreBD"]}', periodeRetencioCS = '$b5'  WHERE idInstanciaBD = '$_POST[$pk]'";

    $db->consultar($re1);
    $db->regresar($file);


$db->close();
?>
