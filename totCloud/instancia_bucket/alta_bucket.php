<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <title>CREAR BUCKET</title> -->
</head>

<body>
    <h2>Crear bucket</h2>
<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bucket.php";
//include "../header.php";

$db = new Database($conn);
$query = "SELECT $a3 FROM regio WHERE disponible = 1";
$result = $db->consultar($query);
$array = array();

while ($reg = mysqli_fetch_assoc($result)) {
    $array[] = $reg[$a3];
}
?>
    <form action="insert_bucket.php" method="POST">

        Nom bucket:
        <input name="<?php echo $a1; ?>"><br><br>

        Periode bloqueig:
        <select name="<?php echo $a2; ?>">
            <option value="NULL">Sense</option>
            <option value="30">30 dies</option>
            <option value="90">90 dies</option>
            <option value="365">1 any</option>
        </select><br><br>

        Nom regió:
        <select name="<?php echo $a3; ?>">
            <?php
            foreach ($array as $region) {
                echo "<option value='$region'>$region</option>";
            }
            ?>
        </select><br><br>

        <input type="submit" value="AFEGIR">
    </form>
</body>

</html>
