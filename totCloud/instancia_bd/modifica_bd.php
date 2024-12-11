<?php

include "../connexio.php";
include "../atributsClasses/instancia_bd.php"; 

$db = new Database($conn);

// Verifica que se haya pasado un ID por GET
if (!isset($_GET[$pk]) || empty($_GET[$pk])) {
    die("Error: No se ha proporcionado un ID válido.");
}

$k = $_GET[$pk];

// Consulta para obtener los datos del servidor a modificar
$query = "SELECT * FROM instancia_bd WHERE $pk = $k";
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
    <title>Modificar BD</title>
</head>
<body>
    <h1>Modificar base de dades</h1>
    <form action="update_bd.php" method="GET">
        <input type = "hidden" name = <?php echo $pk; ?> value = <?php echo $k; ?>>
        
        Nom master:
        <input name="<?php echo $a2; ?>" value="<?php echo htmlspecialchars($datos[$a2]); ?>"><br><br>

        Nom base de dades:
        <input name="<?php echo $a3; ?>" value="<?php echo htmlspecialchars($datos[$a3]); ?>"><br><br>

        Grup de paràmetres:
        <select name="<?php echo $a4; ?>">
            <option value="default" <?php echo $datos[$a4] == "default" ? 'selected' : ''; ?>>Per defecte</option>
            <option value="optimized" <?php echo $datos[$a4] == "optimized" ? 'selected' : ''; ?>>Optimitzat</option>
            <option value="high-performance" <?php echo $datos[$a4] == "high-performance" ? 'selected' : ''; ?>>Alt rendiment</option>
            <option value="secure" <?php echo $datos[$a4] == "secure" ? 'selected' : ''; ?>>Segur</option>
            <option value="balanced" <?php echo $datos[$a4] == "balanced" ? 'selected' : ''; ?>>Balancejat</option>
        </select><br><br>

        Copia de seguretat:
        <select name="<?php echo $a5; ?>">
            <option value="NULL" <?php echo $datos[$a5] == "NULL" ? 'selected' : ''; ?>>No</option>
            <option value="NOT NULL" <?php echo $datos[$a5] == "NOT NULL" ? 'selected' : ''; ?>>Sí</option>
        </select><br><br>

        Periode retenció:
        <select name="<?php echo $a5; ?>">
            <option value="7" <?php echo $datos[$a5] == "7" ? 'selected' : ''; ?>>1 semana</option>
            <option value="14" <?php echo $datos[$a5] == "14" ? 'selected' : ''; ?>>2 semana</option>
            <option value="30" <?php echo $datos[$a5] == "30" ? 'selected' : ''; ?>>1 mes</option>
        </select><br><br>

        Motor base de dades:
        <select name="<?php echo $a7; ?>">
            <option value="MariaDB" <?php echo $datos[$a7] == "MariaDB" ? 'selected' : ''; ?>>MariaDB</option>
            <option value="MySQL" <?php echo $datos[$a7] == "MySQL" ? 'selected' : ''; ?>>MySQL</option>
            <option value="PostgreSQL" <?php echo $datos[$a7] == "PostgreSQL" ? 'selected' : ''; ?>>PostgreSQL</option>
            <option value="SQLITE" <?php echo $datos[$a7] == "SQLITE" ? 'selected' : ''; ?>>SQLITE</option>
        </select><br><br>

        Subxarxa:
        <select name="<?php echo $a8; ?>">
            <option value="1" <?php echo $datos[$a8] == 1 ? 'selected' : ''; ?>>Subxarxa 1</option>
            <option value="2" <?php echo $datos[$a8] == 2 ? 'selected' : ''; ?>>Subxarxa 2</option>
            <option value="3" <?php echo $datos[$a8] == 3 ? 'selected' : ''; ?>>Subxarxa 3</option>
        </select><br><br>

        Configuració:
        <select name="<?php echo $a9; ?>">
            <option value="2" <?php echo $datos[$a9] == 2 ? 'selected' : ''; ?>>Bàsica</option>
            <option value="1" <?php echo $datos[$a9] == 1 ? 'selected' : ''; ?>>Avançada</option>
            <option value="3" <?php echo $datos[$a9] == 3 ? 'selected' : ''; ?>>Completa</option>
        </select><br><br>

        Grup de seguretat:
        <select name="<?php echo $a10; ?>">
            <option value="1" <?php echo $datos[$a10] == 1 ? 'selected' : ''; ?>>WebServerGroup</option>
            <option value="2" <?php echo $datos[$a10] == 2 ? 'selected' : ''; ?>>DBGroup</option>
            <option value="3" <?php echo $datos[$a10] == 3 ? 'selected' : ''; ?>>DNSGroup</option>
            <option value="4" <?php echo $datos[$a10] == 4 ? 'selected' : ''; ?>>PingGroup</option>
        </select><br><br>

        Emmagatzament:
        <select name="<?php echo $a11; ?>">
            <option value="2" <?php echo $datos[$a11] == 2 ? 'selected' : ''; ?>>GP1</option>
            <option value="1" <?php echo $datos[$a11] == 1 ? 'selected' : ''; ?>>GP2</option>
            <option value="3" <?php echo $datos[$a11] == 3 ? 'selected' : ''; ?>>GP3</option>
            <option value="4" <?php echo $datos[$a11] == 4 ? 'selected' : ''; ?>>IO1</option>
        </select><br><br>

    <input type="submit" value="MODIFICAR">
    </form>
</body>