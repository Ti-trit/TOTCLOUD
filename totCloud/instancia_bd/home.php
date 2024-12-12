<?php
include "../connexio.php";
include "../funcions.php";
include "../header.php";

$db = new Database($conn);

$query = "SELECT * FROM instancia_bd";
$numRows = $db->contarFilas($query);

$db->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/php/TOTCLOUD/totcloud/home.css">
    <title>Home BD</title>
</head>

<body>
    <section>
        <h2>Base de dades</h2>
        <div class="bd">
            <div>
                Pots crear i consultar les teves bases de dades disponibles
            </div>
            <div class="manteniment_bd">
                <div class="crear_bd">
                    <a href="alta_bd.php">CREAR BASE DE DADES</a>
                </div>
                <div class="consultar_bd">
                    <a href="#" id="consultarBD">CONSULTAR BASES DE DADES</a>
                </div>
            </div>
        </div>
    </section>
    <script>
        const numRows = <?php echo $numRows; ?>;
        const consultaLink = document.getElementById("consultarBD");

        consultaLink.addEventListener("click", function (event) {
            if (numRows > 0) {
                window.location.href = "llista_bd.php";
            } else {
                alert("Encara no tens cap base de dades creada.");
                event.preventDefault();
            }
        });
    </script>
</body>

</html>