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


        <label>
            <input type="checkbox" id="backupCheckbox" name="<?php echo $a6; ?>" value="1"
                onchange="toggleRetentionPeriod()">
            Copia de seguretat
        </label><br><br>

        <div id="periodeRetencioCS" style="display: none;">
            Període retenció:
            <select name="<?php echo $a5; ?>" required>
                <option value="7">1 setmana</option>
                <option value="14">2 setmanes</option>
                <option value="30">1 mes</option>
            </select>
        </div><br><br>




        <?php
        // Suponiendo que este es el valor actual de la configuración que el usuario ha elegido previamente
        $configSeleccionada = $datos[$a4] ?? '';  // Se obtiene el valor de la configuración actual
        $arr3 = ['db.t3.micro', 'db.t3.small', 'db.t3.medium', 'db.m5.large'];
        $arr4 = ['2', '3', '4', '2'];
        $arr5 = ['1', '2', '4', '8'];
        $arr6 = ['2,085', '5,00', '5,000', '10'];

        // Separamos las partes del valor seleccionado (si está definido)
        $valorSeleccionadoArray = explode('|', $configSeleccionada);
        ?>

        Configuració
        <select name="config" required>
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



        <input type="submit" value="MODIFICAR">
    </form>
</body>