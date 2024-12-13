<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bd.php";
include "../atributsClasses/configuracio.php";
include "../atributsClasses/emmagatzematge.php";
include "../atributsClasses/grup_seguretat.php";
include "../header.php";
?>
<!DOCTYPE html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<?php

$db = new Database($conn);
$file = "llista_bd.php";

function validarIP($IP) {
    return filter_var($IP, FILTER_VALIDATE_IP) !== false;
}


function esIdentificadorVPCValido($idVPC) {
    //  el identificador debe tener  el formato "vpc-xxxxxxxxxxxxxxxxx"
    return preg_match('/^vpc-[a-f0-9]{17}$/', $idVPC);
}

    list($nomConfig, $numCPU, $RAM, $xarxa) = explode('|', $_GET["config"]);

    // Recoger valores GET
    $d1 = $numCPU;
    $d2 = $RAM;
    $d3 = $xarxa;
    $d5 = $nomConfig;
    $IPBD = $_GET["IP"];
    if (!validarIP($IPBD)){
      //  echo " IP NO VALIDA ";
        echo '<div class="alert alert-danger" role = "alert"> IP NO VALIDA 
        LA IP DEBE SER IPv4/IPv6 </div>';


        exit;

    }
    if (!esIdentificadorVPCValido($_GET["idVPC"])){
        echo '<div class="alert alert-danger" role = "alert"> Identifcador de VPC NO VALIDO 
        El VPC TIENE EL SIGUIENTE FORMATO vpc-xxxxxxxxxxxxxxxxx, con letras de a-f y números de 0-9
        </div>';
        exit;

    }



    // Crear la consulta SQL
    $re1 = "INSERT INTO configuracio (numCPU, RAM, xarxa, preuPerHora, nom, IP) 
    VALUES ('$d1', '$d2', '$d3', NULL, '$d5', NULL)";


    $db->consultar($re1);
    $idConfig = mysqli_insert_id($db->conn); 



    //obtener clave tipusSource
    $query = "SELECT tipusSource FROM source WHERE source = '{$_GET['source']}'";
    $result1 = $db->consultar($query);
    $row1 = $result1->fetch_assoc();
    //obtener clave del protocol
    $query2 = "SELECT tipus FROM protocol WHERE Protocol = '{$_GET['protocol']}'";
    $result2 = $db->consultar($query2);
    $row2 = $result2->fetch_assoc();

    // Recoger valores GET
    $f1 = $_GET["nomGS"];
    $f2 = $_GET["descripcioGS"];
    $f4 = $row1['tipusSource'];
    $f5 = $row2['tipus'];
    $f6 = $_GET["protocol"];

    // Crear la consulta SQL
    $re1 = "INSERT INTO grup_seguretat (nom, descripcio, tipusSource, tipus, Protocol)
    VALUES ('$f1', '$f2', '$f4', '$f5', '$f6')";

    $db->consultar($re1);
    $idGS = mysqli_insert_id($db->conn); // Suponiendo que $db->conexion es la conexión activa


    // Recoger valores GET
    $h1 = $_GET["tipusEmg"];
    $h2 = $_GET["MemoriaEMG"];

    // Crear la consulta SQL
    $re1 = "INSERT INTO emmagatzamatge ($g1, $g2)
VALUES ('$h1', '$h2')";

    $db->consultar($re1);
    $db->consultar($re1);
    $idEmmg = mysqli_insert_id($db->conn); 

    //hay que hacer copia de segretat?

    if (empty($_GET["copiaSeguretat"])){
        $_GET["periodeRetencio"] = "NULL";
    }
   

    $re1 = "INSERT INTO SUBXARXA (nomSubxarxa, descripcio, idVPC, nomReg)
    VALUES ('{$_GET["nomSUBX"]}', '{$_GET["descripcioSUBX"]}', '{$_GET["idVPC"]}', '{$_GET["nomRegSUBX"]}')";
    $db->consultar($re1);
    $idSubxar = mysqli_insert_id($db->conn); 



    // Crear la consulta SQL
    $re1 = "INSERT INTO instancia_bd (idBDServei, nomMaster, nomBD, grupParametresBD, periodeRetencioCS, tipusMotor, idSubxar, idConfig, idGS, idEmmg) 
        VALUES ('1', '{$_GET["nomMaster"]}', '{$_GET["nomBD"]}', '{$_GET["GParametreBD"]}', '{$_GET["periodeRetencio"]}', '{$_GET["motor_tipus"]}', '$idSubxar', '$idConfig', '$idGS', '$idEmmg')";

    $db->consultar($re1);


$db->regresar($file);
$db->close();
?>
