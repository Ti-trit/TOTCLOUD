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
    <link rel="stylesheet" type="text/css" href="../home.css">
    <title>Home Servidor</title>
</head>

<body>
    <section>
        <h2>Servidors</h2>
        <div class="saas">
            <div>
                Pots crear i consultar els teus servidors disponibles
            </div>
            <div class="services">
                <div class="saas_content">
                    <a href="alta_servidor.php">CREAR SERVIDOR</a>
                </div>
                <div class="paas_content">
                    <a href="#" id="consultarServidor">CONSULTAR SERVIDORS</a>
                </div>
            </div>
        </div>
    </section>
    <script>
        const numRows = <?php echo $numRows; ?>;
        const consultarLink = document.getElementById("consultarServidor");

        consultarLink.addEventListener("click", function (event) {
            if (numRows > 0) {
                window.location.href = "llista_servidor.php";
            } else {
                alert("Encara no tens cap servidor creat.");
                event.preventDefault();
            }
        });
    </script>
</body>

</html>