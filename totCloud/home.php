<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="estils/home.css">
    <title>Home</title>
</head>
<?php
session_start(); 
include "connexio.php";

// Mostrar el mensaje de logout si existe
if (isset($_SESSION['logout_message'])) {
    echo '<div class="alert alert-success" role="alert">' . htmlspecialchars($_SESSION['logout_message']) . '</div>';
    unset($_SESSION['logout_message']);
}
?>

<body>
    <header>
        <nav class="navbar">
            <ul>
                <li class="brand"><strong>TotCloud</strong></li>
                <li class="logout">
                    <a href="LogOut.php">
                        <span class="icon-user">&#128100;</span> Log Out
                    </a>
                </li>
            </ul>
        </nav>
        <div class="header">
            <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit aspernatur, voluptatum eos sit, quasi omnis accusamus repudiandae aliquid fugiat laborum quod voluptate est, cupiditate sint et totam vel quis consectetur.</div>
            <img src="./images/sass.png" alt="">
        </div>
    </header>
    <section>
        <h2>SaaS</h2>
        <div class="saas">
            <?php
            // Definir los servicios
            $services = [
                'DATABASE' => "./instancia_bd/",
                'CLOUD STORAGE' => "./instancia_bucket/",
            ];

            // Consultar y mostrar servicios disponibles
            foreach ($services as $category => $link) {
                $stmt = $conn->prepare("SELECT s.disponible FROM SERVEI s WHERE s.categoria = ?");
                $stmt->bind_param("s", $category);
                $stmt->execute();
                $resultado = $stmt->get_result();
                $datos = $resultado->fetch_object();

                if ($datos && $datos->disponible == 1) {
                    echo '<div class="saas_content"><a href="' . htmlspecialchars($link) . '">' . htmlspecialchars($category) . '</a></div>';
                }
            }
            ?>
        </div>
    </section>
    <section>
        <h2>PaaS</h2>
        <div class="paas">
            <div class="paas_content">
                <a href="./instancia_servidor/">Server</a>
            </div>
        </div>
    </section>
</body>
</html>
