<?php

include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bd.php";
include "../header.php";

$db = new Database($conn);

// Verifica que se haya pasado un ID por GET
if (!isset($_GET[$pk]) || empty($_GET[$pk])) {
    die("Error: No se ha proporcionado un ID válido.");
}

$k = $_GET[$pk];

// Consulta para obtener los datos del servidor a modificar
$query = "SELECT * FROM instancia_bd WHERE idInstanciaBD = $k";
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
    <link rel="stylesheet" type="text/css" href="../estils/new.css">
    <script>
        function toggleRetentionPeriod() {
            const checkbox = document.getElementById('backupCheckbox');
            const retentionPeriod = document.getElementById('retentionPeriod');
            if (checkbox.checked) {
                retentionPeriod.style.display = 'block';
            } else {
                retentionPeriod.style.display = 'none';
            }
        }
    </script>
</head>

<body>
    <section>
        <a href="home.php">
            <h2>Base de dades</h2>
        </a>
        <div class="subtitulo">
            <div>
                Aquí pots canviar els valors modificables de les bases de dades
            </div>
        </div>
    </section>
    <form action="update_bd.php" method="GET">
        <input type="hidden" name=<?php echo $pk; ?> value=<?php echo $k; ?>>

        Nom master:
        <input name="nomMaster" value="<?php echo htmlspecialchars($datos[$a2]); ?>" requiered> <br><br>

        Nom base de dades:
        <input name="nomBD" value="<?php echo htmlspecialchars($datos[$a3]); ?>" required><br><br>

        Grup de paràmetres:
        <?php
        // Definir las opciones como un array
        $opciones = [
            "default.oracle-ee-19" => "default.oracle-ee-19",
            "default.sqlserver-se-15" => "default.sqlserver-se-15",
            "default.postgres14" => "Alt default.postgres14",
            "default.postgres13" => "default.postgres13",
            "default.mysql8.0" => "default.mysql8.0",
            "default.mysql5.7" => "default.mysql5.7",
            "default.mariadb10.5" => "default.mariadb10.5"
        ];

        // Obtener el valor seleccionado directamente
        $valorSeleccionado = $datos[$a4] ?? ''; // Default vacío si no está seteado
        ?>

        <!-- Crear el select con las opciones dinámicas -->
        <select name="GParametreBD" required>
            <?php
            foreach ($opciones as $value => $label) {
                $selected = ($value === $valorSeleccionado) ? 'selected' : '';
                echo "<option value=\"$value\" $selected>$label</option>";
            }
            ?>
        </select><br><br>



       
        <input type="submit" value="MODIFICAR">
    </form>
</body>

</html>