<html>

<body>
    <?php 
    include "../connexio.php"; 
    $select = "Select * from instancia_bd";
    $consulta = mysqli_query($conn,$select);
    $i = "";
    if (!empty($_GET['nick'])){
        $i = $_GET["nick"];
    }
    ?>
Modificar BD
    <form action="update_bd.php">
    <input type = "hidden" name = "nick" value = <?php echo $i; ?>>
    Contrasenya:<input name="password"><br>
    Nom:<input name="nom"><br>
    Llinatges:<input name="llinat"><br>
    Foto:<input name="foto"><br>
    Telefon:<input name="telf"><br>
    Mail:<input name="mail"><br>
    Domicili:<input name="domic"><br>
    Poblacio:<input name="pob"><br>
    Departament:<input name="dep"><br>
    <input type="submit" value="Modificar">
    </form>
</body>