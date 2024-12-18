<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bucket.php";
include "../header.php";

// Inicializa la conexión a la base de datos
$db = new Database($conn);

// Verifica que se haya pasado un ID por GET
if (!isset($_GET[$pk]) || empty($_GET[$pk])) {
    die("Error: No se ha proporcionado un ID válido.");
}

$k = $_GET[$pk];

// Consulta para obtener los datos del servidor a modificar
$query = "SELECT * FROM instancia_bucket WHERE $pk = $k";
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
    <title>Modificar Bucket</title>
    <link rel="stylesheet" type="text/css" href="../estils/new.css">
</head>

<body>
    <section>
        <a href="home.php">
            <h2>Bucket</h2>
        </a>
        <div class="subtitulo">
            <div>
                Aquí pots canviar els valors modificables del bucket
            </div>
        </div>
    </section>
    <form action="update_bucket.php" method="GET">
        <input type="hidden" name="<?php echo $pk; ?>" value="<?php echo $datos[$pk]; ?>">

        Nom bucket:
        <input name="<?php echo $a1; ?>" value="<?php echo htmlspecialchars($datos[$a1]); ?>"><br><br>

        Periode bloqueig:
        <select name="<?php echo $a2; ?>">
            <option value="NULL" <?php echo $datos[$a2] == 0 ? 'selected' : ''; ?>>Sense</option>
            <option value="30" <?php echo $datos[$a2] == 30 ? 'selected' : ''; ?>>30 dies</option>
            <option value="90" <?php echo $datos[$a2] == 90 ? 'selected' : ''; ?>>90 dies</option>
            <option value="365" <?php echo $datos[$a2] == 365 ? 'selected' : ''; ?>>1 any</option>
        </select><br><br>

        <input type="submit" value="MODIFICAR" class="custom-button">
    </form>
</body>