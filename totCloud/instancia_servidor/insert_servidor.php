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

if (
    !empty($_GET[$a5]) && !empty($_GET[$c6])
) {
    list($nomConfig, $numCPU, $RAM, $xarxa) = explode('|', $_GET[$a5]);

    // Recoger valores GET
    $d1 = $numCPU;
    $d2 = $RAM;
    $d3 = $xarxa;
    $d5 = $nomConfig;
    $d6 = $_GET[$c6];

    // Crear la consulta SQL
    $re1 = "INSERT INTO configuracio ($c1, $c2, $c3, $c4, $c5, $c6)
    VALUES ('$d1', '$d2', '$d3', NULL, '$d5', '$d6')";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de configuracio.";
}

if (
    !empty($_GET[$e1]) && !empty($_GET[$e2])
    && !empty($_GET[$e7]) && !empty($_GET[$e5]) && !empty($_GET[$e6])
) {
    $query = "SELECT tipusSource FROM source WHERE source = '$_GET[$e7]'";
    $result1 = $db->consultar($query);
    $row1 = $result1->fetch_assoc();

    $query2 = "SELECT tipus FROM protocol WHERE Protocol = '$_GET[$e6]'";
    $result2 = $db->consultar($query2);
    $row2 = $result2->fetch_assoc();

    // Recoger valores GET
    $f1 = $_GET[$e1];
    $f2 = $_GET[$e2];
    $f4 = $row1['tipusSource'];
    $f5 = $row2['tipus'];
    $f6 = $_GET[$e6];

    // Crear la consulta SQL
    $re1 = "INSERT INTO grup_seguretat ($e1, $e2, $e3, $e4, $e5, $e6)
    VALUES ('$f1', '$f2', NULL, '$f4', '$f5', '$f6')";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de grup_seguretat.";
}

if (
    !empty($_GET[$g1]) && !empty($_GET[$g2])
) {
    // Recoger valores GET
    $h1 = $_GET[$g1];
    $h2 = $_GET[$g2];

    // Crear la consulta SQL
    $re1 = "INSERT INTO emmagatzamatge ($g1, $g2)
VALUES ('$h1', '$h2')";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de emmatgatzematge.";
}

if (!empty($_GET[$j1]) && !empty($_GET[$j2]) && !empty($_GET[$j3])) {
    // Recoger valores GET
    $k1 = $_GET[$j1];
    $k2 = $_GET[$j2];
    $k3 = $_GET[$j3];

    // Crear la consulta SQL
    $re1 = "INSERT INTO clau_sessio ($j1, $j2, $j3)
    VALUES ('$k1', '$k2', '$k3')";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de clau_sessio.";
}


if (
    !empty($_GET[$a1]) && !empty($_GET[$a2])
    && !empty($_GET[$a4]) && !empty($_GET[$a5]) && !empty($_GET[$a9])
) {
    // Obtener valores para la consulta
    list($nomSubxarxa, $idVPC, $nomRegio) = explode('|', $_GET[$a4]);
    $query = "SELECT idSubXar FROM subxarxa WHERE nomSubxarxa = '$nomSubxarxa'
                AND idVPC = '$idVPC' AND nomReg = '$nomRegio'";
    $result = $db->consultar($query);
    $row = $result->fetch_assoc();

    list($nomConfig, $numCPU, $RAM, $xarxa) = explode('|', $_GET[$a5]);
    $query = "SELECT idConfig FROM configuracio WHERE nom = '$nomConfig'
                AND numCPU = '$numCPU' AND RAM = '$RAM' AND xarxa = '$xarxa'";
    $result = $db->consultar($query);
    $row1 = $result->fetch_assoc();

    $query = "SELECT idGS FROM grup_seguretat WHERE nom = '$_GET[$e1]'
                AND descripcio = '$_GET[$e2]' AND tipusSource = '$f4'";
    $result = $db->consultar($query);
    $row2 = $result->fetch_assoc();

    $query = "SELECT idEmmg FROM emmagatzamatge WHERE tipus = '$h1'
                AND emgAssignat = '$h2'";
    $result = $db->consultar($query);
    $row3 = $result->fetch_assoc();

    $query = "SELECT idClauSessio FROM clau_sessio WHERE tipusClau = '$k2'
                AND nomFitxer = '$k1' AND nomClau = '$k3'";
    $result = $db->consultar($query);
    $row4 = $result->fetch_assoc();

    list($descripcioAMI, $arquitectura) = explode('|', $_GET[$a9]);
    $query = "SELECT idAMI FROM AMI WHERE descripcioAMI = '$descripcioAMI'
                AND arquitectura = '$arquitectura'";
    $result = $db->consultar($query);
    $row5 = $result->fetch_assoc();

    // Recoger valores GET
    $b1 = $_GET[$a1];
    $b2 = $_GET[$a2];
    $b4 = $row[$a4];
    $b5 = $row1[$a5];
    $b6 = $row2[$a6];
    $b7 = $row3[$a7];
    $b8 = $row4[$a8];
    $b9 = $row5[$a9];

    // Crear la consulta INSERT
    $re1 = "INSERT INTO instancia_servidor ($a1, $a2, $a3, $a4, $a5, $a6, $a7, $a8, $a9) 
        VALUES ('$b1', '$b2', 1, '$b4', '$b5', '$b6', '$b7', '$b8', '$b9')";

    $db->consultar($re1);
}

$db->regresar($file);
$db->close();
?>