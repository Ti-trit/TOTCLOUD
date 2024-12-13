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

if (!isset($_POST[$pk]) || empty($_POST[$pk])) {
    die("Error: No se ha proporcionado un ID válido.");
}

$k = $_POST[$pk];

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
    <link rel="stylesheet" type="text/css" href="../home.css">
</head>

<body>
    <h1>Modificar servidor</h1>
    <form action="update_servidor.php" method="POST">
        <input type="hidden" name="<?php echo $pk; ?>" value="<?php echo $_POST[$pk]; ?>">

        Nom servidor:
        <input name="<?php echo $a1; ?>" value="<?php echo $datos[$a1]; ?>" ><br><br>

        Configuració
        <?php
            // Suponiendo que este es el valor actual de la configuración que el usuario ha elegido previamente
            $configSeleccionada = $datos[$a4] ?? '';  // Se obtiene el valor de la configuración actual
            $arr3 = ['db.t3.micro', 'db.t3.small','db.t3.medium','db.m5.large'];
            $arr4 =['2','3', '4', '2'];
            $arr5 = ['1', '2', '4', '8'];
            $arr6 = ['3,00$', '5,00$','5,00$', '10,00$'];

            // Separamos las partes del valor seleccionado (si está definido)
            $valorSeleccionadoArray = explode('|', $configSeleccionada);
            ?>


        <select name="<?php echo $a5; ?>">
        <?php
            // Recorremos todas las opciones y las mostramos, agregando el atributo 'selected' si coincide
            for ($i = 0; $i < count($arr3); $i++) {
                $valor = "{$arr3[$i]}|{$arr4[$i]}|{$arr5[$i]}|{$arr6[$i]}";
                $selected = ($valor === $configSeleccionada) ? 'selected' : '';  // Verifica si esta opción es la seleccionada
                echo "<option value='$valor' $selected>
                        Nom: {$arr3[$i]} | vCPUs: {$arr4[$i]} |  GiB RAM: {$arr5[$i]} | Network: {$arr6[$i]}
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