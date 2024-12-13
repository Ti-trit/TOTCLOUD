<?php

include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_servidor.php";
include "../atributsClasses/clau_sessio.php";
include "../atributsClasses/configuracio.php";
include "../atributsClasses/emmagatzematge.php";
include "../atributsClasses/grup_seguretat.php";
include "../header.php";

$db = new Database($conn);

if (!isset($_GET[$pk]) || empty($_GET[$pk])) {
    die("Error: No se ha proporcionado un ID válido.");
}

$k = $_GET[$pk];

// Consultar datos para los select
$query = "SELECT * FROM instancia_servidor WHERE $pk = $k";
$resultado = $db->consultar($query);

if ($resultado && $resultado->num_rows > 0) {
    $datos = $resultado->fetch_assoc(); // Obtiene los datos en un array asociativo
} else {
    die("Error: No se encontró el servidor con el ID especificado.");
}

$query = "SELECT nom, descripcio FROM grup_seguretat gs JOIN instancia_servidor i 
ON gs.idGS = i.idGS";
$resultado = $db->consultar($query);
$datosGS = $resultado->fetch_assoc();

$query = "SELECT emgAssignat FROM emmagatzamatge em JOIN instancia_servidor i 
ON em.idEmmg = i.idEmmg";
$resultado = $db->consultar($query);
$datosEM = $resultado->fetch_assoc();

$query = "SELECT nomFitxer, nomClau FROM clau_sessio cs JOIN instancia_servidor i 
ON cs.idClauSessio = i.idClauSessio";
$resultado = $db->consultar($query);
$datosCS = $resultado->fetch_assoc();

$query = "SELECT numCPU, RAM, xarxa, nom FROM configuracio";
$result = $db->consultar($query);
$arr3 = $arr4 = $arr5 = $arr6 = [];
while ($reg = mysqli_fetch_assoc($result)) {
    $arr3[] = $reg["nom"];
    $arr4[] = $reg["numCPU"];
    $arr5[] = $reg["RAM"];
    $arr6[] = $reg["xarxa"];
}

$query = "SELECT source FROM source";
$result = $db->consultar($query);
$arr7 = [];
while ($reg = mysqli_fetch_assoc($result)) {
    $arr7[] = $reg["source"];
}

$query = "SELECT Protocol FROM protocol";
$result = $db->consultar($query);
$arr8 = [];
while ($reg = mysqli_fetch_assoc($result)) {
    $arr8[] = $reg["Protocol"];
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Servidor</title>
    <link rel="stylesheet" type="text/css" href="../estils/new.css">
</head>

<body>
<section>
        <a href="home.php">
            <h2>Servidor</h2>
        </a>
        <div class="subtitulo">
            <div>
                Canvia els valors que necessitis pel teu servidor
            </div>
        </div>
    </section>
    <form action="update_servidor.php" method="GET">
        <input type="hidden" name="<?php echo $pk; ?>" value="<?php echo $_GET[$pk]; ?>">

        Nom servidor:
        <input name="<?php echo $a1; ?>" value="<?php echo $datos[$a1]; ?>"><br><br>

        Configuració:
        <select name="<?php echo $a5; ?>">
            <?php
            for ($i = 0; $i < count($arr3); $i++) {
                $selected = ($datos[$a5] == "{$arr3[$i]}|{$arr4[$i]}|{$arr5[$i]}|{$arr6[$i]}") ? "selected" : "";
                echo "<option value='{$arr3[$i]}|{$arr4[$i]}|{$arr5[$i]}|{$arr6[$i]}' $selected>
                        Nom: {$arr3[$i]} | Nº CPU: {$arr4[$i]} | RAM: {$arr5[$i]} | Xarxa: {$arr6[$i]}
                      </option>";
            }
            ?>
        </select><br><br>
        
        Grup de seguretat:
        Nom:
        <input name="<?php echo $e1; ?>" value="<?php echo $datosGS['nom']; ?>"><br>
        Descripcio:
        <input name="<?php echo $e2; ?>" value="<?php echo $datosGS['descripcio']; ?>"><br>
        Source:
        <select name="<?php echo $e7; ?>">
            <?php
            foreach ($arr7 as $source) {
                $selected = ($datos[$e7] == $source) ? "selected" : "";
                echo "<option value='$source' $selected>$source</option>";
            }
            ?>
        </select><br>
        Protocol:
        <select name="<?php echo $e6; ?>">
            <?php
            foreach ($arr8 as $protocol) {
                $selected = ($datos[$e6] == $protocol) ? "selected" : "";
                echo "<option value='$protocol' $selected>$protocol</option>";
            }
            ?>
        </select><br><br>

        Quantitat emmagatzematge:
        <input name="<?php echo $g2; ?>" value="<?php echo $datosEM[$g2]; ?>"> GiB<br><br>

        Clau de sessió:
        Nom fitxer:
        <input name="<?php echo $j1; ?>" value="<?php echo $datosCS[$j1]; ?>"><br>
        Nom clau:
        <input name="<?php echo $j3; ?>" value="<?php echo $datosCS[$j3]; ?>"><br>

        <input type="submit" value="MODIFICAR">
    </form>
</body>

</html>

<?php
$db->close();
?>