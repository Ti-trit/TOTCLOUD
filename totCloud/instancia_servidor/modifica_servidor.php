<?php

include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_servidor.php"; 

$db = new Database($conn);

if (!isset($_GET[$pk]) || empty($_GET[$pk])) {
    die("Error: No se ha proporcionado un ID válido.");
}

$k = $_GET[$pk];

$query = "SELECT * FROM instancia_servidor WHERE $pk = $k";
$resultado = $db->consultar($query);

if ($resultado && $resultado->num_rows > 0) {
    $datos = $resultado->fetch_assoc(); // Obtiene los datos en un array asociativo
} else {
    die("Error: No se encontró el servidor con el ID especificado.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Servidor</title>
</head>
<body>
    <h1>Modificar servidor</h1>
    <form action="update_servidor.php" method="GET">
        <input type="hidden" name="<?php echo $pk; ?>" value="<?php echo $datos[$pk]; ?>">

        Nom servidor:
        <input name="<?php echo $a1; ?>" value="<?php echo htmlspecialchars($datos[$a1]); ?>"><br><br>

        Data de creació:
        <input type="date" name="<?php echo $a2; ?>" value="<?php echo $datos[$a2]; ?>"><br><br>

        Subxarxa:
        <select name="<?php echo $a4; ?>">
            <option value="1" <?php echo $datos[$a4] == 1 ? 'selected' : ''; ?>>Subxarxa 1</option>
            <option value="2" <?php echo $datos[$a4] == 2 ? 'selected' : ''; ?>>Subxarxa 2</option>
            <option value="3" <?php echo $datos[$a4] == 3 ? 'selected' : ''; ?>>Subxarxa 3</option>
        </select><br><br>

        Configuració:
        <select name="<?php echo $a5; ?>">
            <option value="2" <?php echo $datos[$a5] == 2 ? 'selected' : ''; ?>>Bàsica</option>
            <option value="1" <?php echo $datos[$a5] == 1 ? 'selected' : ''; ?>>Avançada</option>
            <option value="3" <?php echo $datos[$a5] == 3 ? 'selected' : ''; ?>>Completa</option>
        </select><br><br>

        Grup de seguretat:
        <select name="<?php echo $a6; ?>">
            <option value="1" <?php echo $datos[$a6] == 1 ? 'selected' : ''; ?>>WebServerGroup</option>
            <option value="2" <?php echo $datos[$a6] == 2 ? 'selected' : ''; ?>>DBGroup</option>
            <option value="3" <?php echo $datos[$a6] == 3 ? 'selected' : ''; ?>>DNSGroup</option>
            <option value="4" <?php echo $datos[$a6] == 4 ? 'selected' : ''; ?>>PingGroup</option>
        </select><br><br>

        Emmagatzament:
        <select name="<?php echo $a7; ?>">
            <option value="2" <?php echo $datos[$a7] == 2 ? 'selected' : ''; ?>>GP1</option>
            <option value="1" <?php echo $datos[$a7] == 1 ? 'selected' : ''; ?>>GP2</option>
            <option value="3" <?php echo $datos[$a7] == 3 ? 'selected' : ''; ?>>GP3</option>
            <option value="4" <?php echo $datos[$a7] == 4 ? 'selected' : ''; ?>>IO1</option>
        </select><br><br>

        Clau de sessió:
        <select name="<?php echo $a8; ?>">
            <option value="1" <?php echo $datos[$a8] == 1 ? 'selected' : ''; ?>>RSA</option>
            <option value="2" <?php echo $datos[$a8] == 2 ? 'selected' : ''; ?>>ED25519</option>
        </select><br><br>

        AMI:
        <select name="<?php echo $a9; ?>">
            <option value="1" <?php echo $datos[$a9] == 1 ? 'selected' : ''; ?>>Amazon Linux 2 AMI</option>
            <option value="4" <?php echo $datos[$a9] == 4 ? 'selected' : ''; ?>>Amazon Linux 2 ARM</option>
            <option value="5" <?php echo $datos[$a9] == 5 ? 'selected' : ''; ?>>Ubuntu 18.04 LTS</option>
            <option value="2" <?php echo $datos[$a9] == 2 ? 'selected' : ''; ?>>Ubuntu 20.04 LTS</option>
            <option value="3" <?php echo $datos[$a9] == 3 ? 'selected' : ''; ?>>Windows Server 2019</option>
        </select><br><br>

        <input type="submit" value="MODIFICAR">
    </form>
</body>
</html>

<?php
$db->close(); 
?>
