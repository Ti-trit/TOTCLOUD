<html>

<body>
    <?php 
    include "../connexio.php"; 
    include "../atributsClasses/instancia_bucket.php";
    $select = "Select * from instancia_bucket";
    $consulta = mysqli_query($conn,$select);
    $k = "";
    if (!empty($_GET[$pk])){
        $k = $_GET[$pk];
    }
    ?>
Modificar Bucket
    <form action="update_bd.php">
    <input type = "hidden" name = <?php echo $pk; ?> value = <?php echo $k; ?>>
        Nom bucket:<input name="<?php echo $a1; ?>"><br>
        Periode bloqueig:<input name="<?php echo $a2; ?>"><br>
        Nom registre:<input name="<?php echo $a3; ?>"><br>
    <input type="submit" value="Modificar">
    </form>
</body>