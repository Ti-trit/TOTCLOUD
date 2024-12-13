<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bd.php";
include "../atributsClasses/configuracio.php";
include "../atributsClasses/emmagatzematge.php";
include "../atributsClasses/grup_seguretat.php";

$db = new Database($conn);
$file = "llista_bd.php";

if (
    !empty($_GET[$a9]) && !empty($_GET[$c6])
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

if (!empty($_GET[$a6])) {
    $b5 = !empty($_GET[$a5]) ? $_GET[$a5] : "NULL";
} else {
    $b5 = "NULL";
}

// Verificar si los parámetros GET están definidos y no están vacíos
if (!empty($_GET[$a2]) && !empty($_GET[$a3]) && !empty($_GET[$a4]) 
&& !empty($b5) && !empty($_GET[$a7]) && !empty($_GET[$a8]) 
&& !empty($_GET[$a9]) && !empty($_GET[$a10]) && !empty($_GET[$a11])) {
    
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

    // Recoger valores GET
    $b2 = $_GET[$a2];
    $b3 = $_GET[$a3];
    $b4 = $_GET[$a4];
    $b7 = $_GET[$a7];
    $b8 = $row[$a8];
    $b9 = $row1[$a9];
    $b10 = $row2[$a10];
    $b11 = $row3[$a11];

    // Crear la consulta SQL
    $re1 = "INSERT INTO instancia_bd ($a1, $a2, $a3, $a4, $a5, $a7, $a8, $a9, $a10, $a11) 
        VALUES ('1', '$b2', '$b3', '$b4', $b5, '$b7', '$b8', '$b9', '$b10', '$b11')";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos.";
}
$db->regresar($file);
$db->close();
?>
