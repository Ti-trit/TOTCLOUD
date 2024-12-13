<?php
include "../connexio.php";
include "../atributsClasses/instancia_bd.php";
include "../header.php";
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instancia BD</title>
    <link rel="stylesheet" href="../home.css">
</head>

<body>
    <?php
    // Consulta principal
    $consulta = "SELECT  i.$pk, i.nomBD,i.nomMaster,i.tipusMotor, i.grupParametresBD, 
             i.periodeRetencioCS AS periodeRetencio, s.nomSubXarxa, s.descripcio, s.nomReg, 
             s.idVPC, e.tipus, e.emgAssignat  from instancia_bd i JOIN subxarxa s ON s.idSubXar = i.idSubXar
             join emmagatzamatge e on e.idEmmg = i.idEmmg";

    $resultat = mysqli_query($conn, $consulta);

    // Encabezados personalizados
    $columns = [
        "Nom BD",
        "Nom Master",
        "Motor BD",
        "Paràmetres BD",
        "Copia Seguretat (dies)",
        "nomSubxarxa",
        "descripcioSubxarxa",
        "Regio",
        "idVPC",
        "tipus Emmagatzematge",
        "Memoria assignada",
       
    ];

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
        // Mostrar las columnas específicas
        echo "<TD>" . $reg['nomBD'] . "</TD>";
        echo "<TD>" . $reg['nomMaster'] . "</TD>";
        echo "<TD>" . $reg['tipusMotor'] . "</TD>";
        echo "<TD>" . $reg['grupParametresBD'] . "</TD>";
        echo "<TD>" . $reg['periodeRetencio'] . "</TD>";
        echo "<TD>" . $reg['nomSubXarxa'] . "</TD>";
        echo "<TD>" . $reg['descripcio'] . "</TD>";
        echo "<TD>" . $reg['nomReg'] . "</TD>";
        echo "<TD>" . $reg['idVPC'] . "</TD>";
        echo "<TD>" . $reg['tipus'] . "</TD>";
        echo "<TD>" . $reg['emgAssignat'] . "</TD>";

        // Generar URLs de modificación y eliminación
        $k = $reg[$pk];
        $modifyUrl = "<a class='modify-link' href='modifica_bd.php?$pk=$k'>
                    <span class='modify'>&#9999;</span>
                    </a>";
        $deleteUrl = "<a class='delete-link' href='delete_bd.php?$pk=$k'>
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