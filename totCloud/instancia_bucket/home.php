<?php
include "../connexio.php";
include "../funcions.php";

$db = new Database($conn);

$query = "SELECT * FROM instancia_bucket";
$numRows = $db->contarFilas($query);

$db->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="home.css">
    <title>Home Bucket</title>
</head>

<body>
    <section>
        <h2>Buckets</h2>
        <div class="buckets">
            <div>
                Pots crear i consultar els teus buckets disponibles
            </div>
            <div class="manteniment_buckets">
                <div class="crear_bucket">
                    <a href="./alta_bucket.php/">CREAR BUCKET</a>
                </div>
                <div class="consultar_buckets">
                    <a href="#" id="consultarBucket">CONSULTAR BUCKETS</a>
                </div>
            </div>
        </div>
    </section>
    <script>
        const numRows = <?php echo $numRows; ?>;
        const consultarServidorLink = document.getElementById("consultarBucket");

        consultarServidorLink.addEventListener("click", function (event) {
            if (numRows > 0) {
                window.location.href = "./llista_bucket.php/";
            } else {
                alert("Encara no tens cap bucket creat.");
                event.preventDefault();
            }
        });
    </script>
</body>

</html>