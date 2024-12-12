<?php
include "../connexio.php";
include "../atributsClasses/instancia_servidor.php";

// Consulta principal
$consulta = "SELECT i.$pk, i.$a1 AS NomServidor, i.$a2 AS DataCreacio, s.nomSubxarxa AS Subxarxa, 
             c.nom AS Configuracio, gs.nom AS GrupSeguretat, e.tipus AS Emmagatzematge,
             cs.tipusClau AS Clau, a.descripcioAmi AS DAMI
             FROM instancia_servidor i
             JOIN subxarxa s ON i.idSubXar = s.idSubxar
             JOIN configuracio c ON i.idConfig = c.idConfig
             JOIN grup_seguretat gs ON i.idGS = gs.idGS
             JOIN emmagatzamatge e ON i.idEmmg = e.idEmmg
             JOIN clau_sessio cs ON i.idClauSessio = cs.idClauSessio
             JOIN AMI a ON i.idAMI = a.idAMI";
$resultat = mysqli_query($conn, $consulta);

// Encabezados personalizados
$columns = ["Nom Servidor", "Data creació", "Subxarxa", "Configuració", 
"Grup Seguretat", "Emmagatzament", "Clau sessió", "AMI"];

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
    $valorAMI = $reg['DAMI'];
    if (strlen($valorAMI) > 28) {
        $valorAMI = substr($valorAMI, 0, 28);
    }
    echo "<TR>";
    // Mostrar columnas específicas
    echo "<TD>" . $reg['NomServidor'] . "</TD>";
    echo "<TD>" . $reg['DataCreacio'] . "</TD>";
    echo "<TD>" . $reg['Subxarxa'] . "</TD>";
    echo "<TD>" . $reg['Configuracio'] . "</TD>";
    echo "<TD>" . $reg['GrupSeguretat'] . "</TD>";
    echo "<TD>" . $reg['Emmagatzematge'] . "</TD>";
    echo "<TD>" . $reg['Clau'] . "</TD>";
    echo "<TD>" . $valorAMI . "</TD>";

    // Generar URLs de modificación y eliminación
    $k = $reg[$pk];
    $modifyUrl = "<a href='/php/TOTCLOUD/totcloud/instancia_servidor/modifica_servidor.php?$pk=$k'>Modificar</a>";
    $deleteUrl = "<a href='/php/TOTCLOUD/totcloud/instancia_servidor/delete_servidor.php?$pk=$k'>Eliminar</a>";

    echo "<TD>$modifyUrl</TD>";
    echo "<TD>$deleteUrl</TD>";
    echo "</TR>";
}
echo "</TABLE>";
?>
