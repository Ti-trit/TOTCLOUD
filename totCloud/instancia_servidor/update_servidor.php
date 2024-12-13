<?php
include "../funcions.php";
include "../connexio.php";
include "../atributsClasses/instancia_servidor.php";
include "../atributsClasses/clau_sessio.php";
include "../atributsClasses/configuracio.php";
include "../atributsClasses/emmagatzematge.php";
include "../atributsClasses/grup_seguretat.php";

$db = new Database($conn);
$file = "llista_servidor.php";

if (
    !empty($_GET[$a5]) && !empty($_GET[$a5])
) {
    list($nomConfig, $numCPU, $RAM, $PreuPerhora) = explode('|', $_GET[$a5]);

    $query = "SELECT c.idConfig AS idConfig FROM configuracio c
                JOIN instancia_servidor i ON i.idConfig = c.idConfig
                AND $pk = '$_GET[$pk]'";
    $result = $db->consultar($query);
    $row = $result->fetch_assoc();

    // Recoger valores GET
    $dk = $row['idConfig'];
    $d1 = $numCPU;
    $d2 = $RAM;
    $d3 = $PreuPerhora;
    $d5 = $nomConfig;

    // Crear la consulta SQL
    $re1 = "UPDATE configuracio SET $c1 = '$d1', $c2 = '$d2',
    $c3 = '$d3', $c5 = '$d5' WHERE $ck = '$dk'";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de configuracio.";
}

if (
    !empty($_GET[$e1]) && !empty($_GET[$e2])
    && !empty($_GET[$e6]) && !empty($_GET[$e7]) && !empty($_GET[$pk])
) {
    $query = "SELECT tipusSource FROM source WHERE source = '$_GET[$e7]'";
    $result1 = $db->consultar($query);
    $row1 = $result1->fetch_assoc();

    $query2 = "SELECT tipus FROM protocol WHERE Protocol = '$_GET[$e6]'";
    $result2 = $db->consultar($query2);
    $row2 = $result2->fetch_assoc();

    $query3 = "SELECT gs.idGS AS idGS FROM grup_seguretat gs 
                JOIN instancia_servidor i ON i.idGS = gs.idGS
                AND $pk = '$_GET[$pk]'";

    $result3 = $db->consultar($query3);
    $row3 = $result3->fetch_assoc();

    // Recoger valores GET
    $fk = $row3['idGS'];
    $f1 = $_GET[$e1];
    $f2 = $_GET[$e2];
    $f4 = $row1['tipusSource'];
    $f5 = $row2['tipus'];
    $f6 = $_GET[$e6];

    // Crear la consulta SQL
    $re1 = "UPDATE grup_seguretat SET $e1 = '$f1', $e2 = '$f2',
    $e4 = '$f4', $e5 = '$f5', $e6 = '$f6' WHERE $ek = '$fk'";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de grup_seguretat.";
}

if (
    !empty($_GET[$g2])
) {

    $query = "SELECT em.idEmmg AS idEmmg FROM emmagatzamatge em JOIN 
            instancia_servidor i ON em.idEmmg = i.idEmmg 
            AND $pk = '$_GET[$pk]'";
    $result = $db->consultar($query);
    $row = $result->fetch_assoc();

    // Recoger valores GET
    $hk = $row['idEmmg'];
    $h2 = $_GET[$g2];

    // Crear la consulta SQL
    $re1 = "UPDATE emmagatzamatge SET $g2 = '$h2'
            WHERE $gk = '$hk'";

    $db->consultar($re1);

} else {
    echo "Por favor, rellena todos los campos de emmatgatzematge.";
}

if (!empty($_GET[$j1]) && !empty($_GET[$j3]) && !empty($_GET[$pk])) {

    $query = "SELECT cs.idClauSessio AS idClauSessio FROM clau_sessio cs 
                JOIN instancia_servidor i ON i.idClauSessio = cs.idClauSessio
                AND $pk = '$_GET[$pk]'";
    $result = $db->consultar($query);
    $row = $result->fetch_assoc();

    // Recoger valores GET
    $kk = $row['idClauSessio'];
    $k1 = $_GET[$j1];
    $k3 = $_GET[$j3];

    // Crear la consulta SQL
    $re1 = "UPDATE clau_sessio SET $j1 = '$k1', $j3 = '$k3' 
            WHERE $jk = '$kk'";

    $db->consultar($re1);

} else {
    echo "Por favor, rellena todos los campos de clau_sessio.";
}


if (
    !empty($_GET[$pk]) && !empty($_GET[$a1])
) {

    // Recoger valores GET
    $bk = $_GET[$pk];
    $b1 = $_GET[$a1];
    $b5 = $dk;
    $b6 = $fk;

    $re1 = "UPDATE instancia_servidor SET $a1 = '$b1', $a5 = '$b5', 
            $a6 = '$b6' WHERE $pk = '$bk'";

    $db->consultar($re1);
} else {
    echo "Por favor, rellena todos los campos de instancia_servidor.";
}

$db->regresar($file);
$db->close();
?>