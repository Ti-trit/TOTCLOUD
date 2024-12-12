<?php
include "../connexio.php";
include "../funcions.php";
include "../header.php";

$db = new Database($conn);

$query = "SELECT * FROM instancia_servidor";
$numRows = $db->contarFilas($query);

$db->close();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/php/TOTCLOUD/totcloud/home.css">
    <title>Home Servidor</title>
</head>

<body>
    <section>
        <h2>Servidors</h2>
        <div class="servidors">
            <div>
                Pots crear i consultar els teus servidors disponibles
            </div>
            <div class="manteniment_servidors">
                <div class="crear_servidor">
                    <a href="./alta_servidor.php/">CREAR SERVIDOR</a>
                </div>
                <div class="consultar_servidor">
                    <a href="#" id="consultarServidor">CONSULTAR SERVIDORES</a>
                </div>
            </div>
        </div>
    </section>
    <script>
        const numRows = <?php echo $numRows; ?>;
        const consultarLink = document.getElementById("consultarServidor");

        consultarLink.addEventListener("click", function (event) {
            if (numRows > 0) {
                window.location.href = "./llista_servidor.php/";
            } else {
                alert("Encara no tens cap servidor creat.");
                event.preventDefault();
            }
        });
    </script>
</body>

</html>