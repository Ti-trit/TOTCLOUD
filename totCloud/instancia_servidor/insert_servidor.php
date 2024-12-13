<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_servidor.php";
include "../atributsClasses/clau_sessio.php";
include "../atributsClasses/configuracio.php";
include "../atributsClasses/emmagatzematge.php";
include "../atributsClasses/grup_seguretat.php";
?>
<!DOCTYPE html>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<?php
$db = new Database($conn);
$file = "llista_servidor.php";

list($nomConfig, $numCPU, $RAM, $preuPerHora) = explode('|', $_GET["configS"]);

function validarIP($IP) {
    return filter_var($IP, FILTER_VALIDATE_IP) !== false;
}

//verificar primero que la IP es correcta
if (!validarIP($_GET["IPS"])){
    //  echo " IP NO VALIDA ";
      echo '<div class="alert alert-danger" role = "alert"> IP NO VALIDA 
      LA IP DEBE SER IPv4/IPv6 </div>';

      exit;

  }

  

// Crear la consulta SQL
$re1 = "INSERT INTO configuracio (numCPU, RAM, preuPerHora, nom, IP)
    VALUES ('$numCPU', '$RAM', '$preuPerHora','$nomConfig' ,'{$_GET["IPS"]}')";

$db->consultar($re1);
$idConfigS = mysqli_insert_id($db->conn);


$query = "SELECT tipusSource FROM source WHERE source = '{$_GET['sourceS']}'";
$result1 = $db->consultar($query);
$row1 = $result1->fetch_assoc();

//obtener clave del protocol
$query2 = "SELECT tipus FROM protocol WHERE Protocol = '{$_GET['protocolS']}'";
$result2 = $db->consultar($query2);
$row2 = $result2->fetch_assoc();


// Recoger valores GET
$f1 = $_GET["nomGSS"];
$f2 = $_GET["descripcioGSS"];
$f4 = $row1['tipusSource'];
$f5 = $row2['tipus'];
$f6 = $_GET["protocolS"];

// Crear la consulta SQL
$re1 = "INSERT INTO grup_seguretat (nom, descripcio, tipusSource, tipus, Protocol)
   VALUES ('$f1', '$f2', '$f4', '$f5', '$f6')";

$db->consultar($re1);
$idGSS = mysqli_insert_id($db->conn);

// Recoger valores GET
$h1 = $_GET["tipusEmgS"];
$h2 = $_GET["MemoriaEMGS"];

// Crear la consulta SQL
$re1 = "INSERT INTO emmagatzamatge ($g1, $g2)
    VALUES ('$h1', '$h2')";

$db->consultar($re1);
$db->consultar($re1);
$idEmmgS = mysqli_insert_id($db->conn);

function esIdentificadorVPCValido($idVPC) {
    //  el identificador debe tener  el formato "vpc-xxxxxxxxxxxxxxxxx"
    return preg_match('/^vpc-[a-f0-9]{17}$/', $idVPC);
}

if (!esIdentificadorVPCValido($_GET["idVPCS"])){
    echo '<div class="alert alert-danger" role = "alert"> Identifcador de VPC NO VALIDO 
    El VPC TIENE EL SIGUIENTE FORMATO vpc-xxxxxxxxxxxxxxxxx, con letras de a-f y números de 0-9
    </div>';
    exit;

}


$re1 = "INSERT INTO SUBXARXA (nomSubxarxa, descripcio, idVPC, nomReg)
        VALUES ('{$_GET["nomSUBXS"]}', '{$_GET["descripcioSUBXS"]}', '{$_GET["idVPCS"]}', '{$_GET["nomRegSUBXS"]}')";
$db->consultar($re1);
$idSubxarS = mysqli_insert_id($db->conn);



// Recoger valores GET
$k1 = $_GET["nomFitxer"];
$k2 = $_GET["tipusClau"];
$k3 = $_GET["nomClau"];

// Crear la consulta SQL
$re1 = "INSERT INTO clau_sessio (nomFitxer, tipusClau, nomClau)
    VALUES ('$k1', '$k2', '$k3')";

$db->consultar($re1);
$idClauSessio = mysqli_insert_id($db->conn);

list($descripcioAMI, $arquitectura) = explode('|', $_GET["AMI"]);
$query = "SELECT idAMI FROM AMI WHERE descripcioAMI = '$descripcioAMI'
                AND arquitectura = '$arquitectura'";

$result = $db->consultar($query);
$row5 = $result->fetch_assoc();


$b9 = $row5[$a9];

// Crear la consulta INSERT
$re1 = "INSERT INTO instancia_servidor (nomServ, dataCreacio, idServidorInfra,idGS,  idSubXar, idConfig, idEmmg, idClauSessio, idAMI) 
        VALUES ('{$_GET["nomServidor"]}', CURRENT_TIMESTAMP, '1', '$idGSS' , '$idSubxarS','$idConfigS', '$idEmmgS', '$idClauSessio',  '$b9')";

$db->consultar($re1);

$db->regresar($file);
$db->close();
