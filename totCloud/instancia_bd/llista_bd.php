<?php
include "../connexio.php";
include "../atributsClasses/instancia_bd.php";

// Consulta principal
$consulta = "SELECT i.$pk, i.$a3 AS NomBD, i.$a2 AS NomMaster, i.$a4 AS ParametresBD, 
             i.$a5 AS CopiaSeguretat, i.$a7 AS MotorBD, s.nomSubxarxa AS Subxarxa, 
             c.nom AS Configuracio, gs.nom AS GrupSeguretat, e.tipus AS Emmagatzematge
             FROM instancia_bd i
             JOIN subxarxa s ON i.idSubXar = s.idSubxar
             JOIN configuracio c ON i.idConfig = c.idConfig
             JOIN grup_seguretat gs ON i.idGS = gs.idGS
             JOIN emmagatzamatge e ON i.idEmmg = e.idEmmg";
$resultat = mysqli_query($conn, $consulta);

// Encabezados personalizados
$columns = ["Nom BD", "Nom Master", "Paràmetres BD", "Copia Seguretat (dies)", "Motor BD", 
            "Subxarxa", "Configuració", "Grup Seguretat", "Emmagatzament"];

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
    echo "<TD>" . $reg['NomBD'] . "</TD>";
    echo "<TD>" . $reg['NomMaster'] . "</TD>";
    echo "<TD>" . $reg['ParametresBD'] . "</TD>";
    echo "<TD>" . ($reg['CopiaSeguretat'] ? $reg['CopiaSeguretat'] : "No") . "</TD>";
    echo "<TD>" . $reg['MotorBD'] . "</TD>";
    echo "<TD>" . $reg['Subxarxa'] . "</TD>";
    echo "<TD>" . $reg['Configuracio'] . "</TD>";
    echo "<TD>" . $reg['GrupSeguretat'] . "</TD>";
    echo "<TD>" . $reg['Emmagatzematge'] . "</TD>";

    // Generar URLs de modificación y eliminación
    $k = $reg[$pk];
    $modifyUrl = "<a href='/php/TOTCLOUD/totcloud/instancia_bd/modifica_bd.php?$pk=$k'>Modificar</a>";
    $deleteUrl = "<a href='/php/TOTCLOUD/totcloud/instancia_bd/delete_bd.php?$pk=$k'>Eliminar</a>";

    echo "<TD>$modifyUrl</TD>";
    echo "<TD>$deleteUrl</TD>";
    echo "</TR>";
}
echo "</TABLE>";
?>
