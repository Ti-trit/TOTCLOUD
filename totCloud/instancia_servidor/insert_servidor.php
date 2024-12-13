<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_servidor.php";
include "../atributsClasses/clau_sessio.php";
include "../atributsClasses/configuracio.php";
include "../atributsClasses/emmagatzematge.php";
include "../atributsClasses/grup_seguretat.php";

$db = new Database($conn);
$file = "llista_servidor.php";

    list($nomConfig, $numCPU, $RAM, $preuPerHora) = explode('|', $_POST["configS"]);


    
    //verificar primero que la IP es correcta

    // Crear la consulta SQL
    $re1 = "INSERT INTO configuracio (numCPU, RAM, preuPerHora, nom, IP)
    VALUES ('$numCPU', '$RAM', '$preuPerHora','$nomConfig' ,'{$_POST["IPS"]}')";

    $db->consultar($re1);
    $idConfigS = mysqli_insert_id($db->conn); 


    $query = "SELECT tipusSource FROM source WHERE source = '{$_POST['sourceS']}'";
    $result1 = $db->consultar($query);
    $row1 = $result1->fetch_assoc();

    //obtener clave del protocol
    $query2 = "SELECT tipus FROM protocol WHERE Protocol = '{$_POST['protocolS']}'";
    $result2 = $db->consultar($query2);
    $row2 = $result2->fetch_assoc();


    // Recoger valores POST
    $f1 = $_POST["nomGSS"];
    $f2 = $_POST["descripcioGSS"];
    $f4 = $row1['tipusSource'];
    $f5 = $row2['tipus'];
    $f6 = $_POST["protocolS"];

   // Crear la consulta SQL
   $re1 = "INSERT INTO grup_seguretat (nom, descripcio, tipusSource, tipus, Protocol)
   VALUES ('$f1', '$f2', '$f4', '$f5', '$f6')";

    $db->consultar($re1);
    $idGSS = mysqli_insert_id($db->conn);

    // Recoger valores POST
    $h1 = $_POST["tipusEmgS"];
    $h2 = $_POST["MemoriaEMGS"];

    // Crear la consulta SQL
    $re1 = "INSERT INTO emmagatzamatge ($g1, $g2)
VALUES ('$h1', '$h2')";

    $db->consultar($re1);
    $db->consultar($re1);
    $idEmmgS = mysqli_insert_id($db->conn); 



$re1 = "INSERT INTO SUBXARXA (nomSubxarxa, descripcio, idVPC, nomReg)
VALUES ('{$_POST["nomSUBXS"]}', '{$_POST["descripcioSUBXS"]}', '{$_POST["idVPCS"]}', '{$_POST["nomRegSUBXS"]}')";
$db->consultar($re1);
$idSubxarS = mysqli_insert_id($db->conn); 



    // Recoger valores POST
    $k1 = $_POST["nomFitxer"];
    $k2 = $_POST["tipusClau"];
    $k3 = $_POST["nomClau"];

    // Crear la consulta SQL
    $re1 = "INSERT INTO clau_sessio (nomFitxer, tipusClau, nomClau)
    VALUES ('$k1', '$k2', '$k3')";

    $db->consultar($re1);
    $idClauSessio = mysqli_insert_id($db->conn); 

    list($descripcioAMI, $arquitectura) = explode('|', $_POST["AMI"]);
    $query = "SELECT idAMI FROM AMI WHERE descripcioAMI = '$descripcioAMI'
                AND arquitectura = '$arquitectura'";

    $result = $db->consultar($query);
    $row5 = $result->fetch_assoc();

   
    $b9 = $row5[$a9];

    // Crear la consulta INSERT
    $re1 = "INSERT INTO instancia_servidor (nomServ, dataCreacio, idServidorInfra,idGS,  idSubXar, idConfig, idEmmg, idClauSessio, idAMI) 
        VALUES ('{$_POST["nomServidor"]}', CURRENT_TIMESTAMP, '1', '$idGSS' , '$idSubxarS','$idConfigS', '$idEmmgS', '$idClauSessio',  '$b9')";

    $db->consultar($re1);
// }

$db->regresar($file);
$db->close();
?>