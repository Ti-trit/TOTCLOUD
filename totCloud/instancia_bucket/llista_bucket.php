<?php
include "../connexio.php";
include "../atributsClasses/instancia_bucket.php";
include "../header.php";
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instancia Bucket</title>
    <link rel="stylesheet" href="../home.css">
</head>

<body>
    <?php
    // Consulta principal
    $consulta = "SELECT i.$pk, i.$a1 AS NomBucket, i.$a2 AS PeriodeBloqueig, 
             i.$a3 AS Regio FROM instancia_bucket i";

    $resultat = mysqli_query($conn, $consulta);

    // Encabezados personalizados
    $columns = ["Nom bucket", "Període bloqueig (dies)", "Regió"];

    // Construir la tabla HTML
    echo "<TABLE border='1'>";
    echo "<TR>";

    // Encabezados de columna
    foreach ($columns as $col) {
        echo "<TD>" . $col . "</TD>";
    }
    echo "<TD>Modificar</TD>";
    echo "<TD>Eliminar</TD>";
    echo "</TR>";

    // Filas de datos
    while ($reg = mysqli_fetch_assoc($resultat)) {
        echo "<TR>";
        // Mostrar columnas específicas
        echo "<TD>" . $reg['NomBucket'] . "</TD>";
        echo "<TD>" . $reg['PeriodeBloqueig'] . "</TD>";
        echo "<TD>" . $reg['Regio'] . "</TD>";

        // Generar URLs de modificación y eliminación
        $k = $reg[$pk];
        $modifyUrl = "<a class='modify-link' href='modifica_bucket.php?$pk=$k'>
                    <span class='modify'>&#9999;</span>
                    </a>";
        $deleteUrl = "<a class='delete-link' href='delete_bucket.php?$pk=$k'>
                    <span class='delete'>&#10060;</span>
                    </a>";
        echo "<TD>$modifyUrl</TD>";
        echo "<TD>$deleteUrl</TD>";
        echo "</TR>";
    }
    echo "</TABLE>";
    ?>
</body>

</html>