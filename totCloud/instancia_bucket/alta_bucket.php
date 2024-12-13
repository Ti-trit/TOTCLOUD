<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../estils/new.css">
    <title>CREAR BUCKET</title>
</head>
<?php
include "../connexio.php";
include "../funcions.php";
include "../atributsClasses/instancia_bucket.php";
include "../header.php";

$db = new Database($conn);
$query = "SELECT $a3 FROM regio WHERE disponible = 1";
$result = $db->consultar($query);
$array = array();

while ($reg = mysqli_fetch_assoc($result)) {
    $array[] = $reg[$a3];
}
?>

<body>
    <section>
        <a href="home.php">
            <h2>Bucket</h2>
        </a>
        <div class="subtitulo">
            <div>
                Aquí pots crear els buckets on emmagatzemar els arxius i carpetes
            </div>
        </div>
    </section>
    <form action="insert_bucket.php" method="GET">
        <label>Nom bucket</label><br>
        <input name="<?php echo $a1; ?>"><br><br>

        <label>Periode bloqueig</label><br>
        <select name="<?php echo $a2; ?>">
            <option value="NULL">Sense</option>
            <option value="30">30 dies</option>
            <option value="90">90 dies</option>
            <option value="365">1 any</option>
        </select><br><br>

        <label>Nom regió:</label><br>
        <select name="<?php echo $a3; ?>">
            <?php
            foreach ($array as $region) {
                echo "<option value='$region'>$region</option>";
            }
            ?>
        </select><br><br>

        <input type="submit" value="AFEGIR" class="custom-button">
    </form>
</body>

</html>