<html>

<body>
    <?php 
    include "../connexio.php"; 
    include "../atributsClasses/instancia_servidor.php";
    $select = "Select * from instancia_servidor";
    $consulta = mysqli_query($conn,$select);
    $k = "";
    if (!empty($_GET[$pk])){
        $k = $_GET[$pk];
    }
    ?>
Modificar servidor
    <form action="update_servidor.php">
    <input type = "hidden" name = <?php echo $pk; ?> value = <?php echo $k; ?>>
    Nom servidor:<input name="<?php echo $a1; ?>"><br>
    Data de creació:<input name="<?php echo $a2; ?>"><br>
    Infraestructura:<input name="<?php echo $a3; ?>"><br>
    Subxarxa:<input name="<?php echo $a4; ?>"><br>
    Configuració:<input name="<?php echo $a5; ?>"><br>
    Grup de seguretat:<input name="<?php echo $a6; ?>"><br>
    Emmagatzament:<input name="<?php echo $a7; ?>"><br>
    Clau de sessió:<input name="<?php echo $a8; ?>"><br>
    AMI:<input name="<?php echo $a9; ?>"><br>
    <input type="submit" value="Modificar">
    </form>
</body>