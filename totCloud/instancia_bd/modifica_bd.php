<html>

<body>
    <?php 
    include "../connexio.php"; 
    include "../atributsClasses/instancia_bd.php";
    $select = "Select * from instancia_bd";
    $consulta = mysqli_query($conn,$select);
    $k = "";
    if (!empty($_GET[$pk])){
        $k = $_GET[$pk];
    }
    ?>
Modificar BD
    <form action="update_bd.php">
    <input type = "hidden" name = <?php echo $pk; ?> value = <?php echo $k; ?>>
        Servei BD:<input name="<?php echo $a1; ?>"><br>
        Nom master:<input name="<?php echo $a2; ?>"><br>
        Nom base de dades:<input name="<?php echo $a3; ?>"><br>
        Grup de paràmetres:<input name="<?php echo $a4; ?>"><br>
        Copia de seguretat:<input name="<?php echo $a5; ?>"><br>
        Periode retenció:<input name="<?php echo $a6; ?>"><br>
        Motor base de dades:<input name="<?php echo $a7; ?>"><br>
        Subxarxa:<input name="<?php echo $a8; ?>"><br>
        Configuració:<input name="<?php echo $a9; ?>"><br>
        Grup de seguretat:<input name="<?php echo $a10; ?>"><br>
        Emmagatzament:<input name="<?php echo $a11; ?>"><br>
    <input type="submit" value="Modificar">
    </form>
</body>