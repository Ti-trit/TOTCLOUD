<?php //require "connexio.php";
include "LogIn.php";
//session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="home.css">
    <title>Home</title>
</head>

<body>
    <header>
        <nav class="navbar">
            <ul>
                <li class="style1"><strong>TotCloud</strong></li>
                <li class="welcome-message">
                    Welcome, Admin <span class="style1"><?php echo $_SESSION["nomAdmin"]; ?></span>
                </li>
                <li class="logout">
                    <a href="LogOut.php">
                        <span class="icon-user">&#128100;</span> <strong>Log Out</strong>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="header">
            <div>
                <p>TotCloud offers cutting-edge <strong>Platform as a Service (PaaS)</strong> and <strong>Software as a
                        Service (SaaS)</strong> solutions.</p>
                <!-- <ul>
                    <li><strong>PaaS </strong> - Create and manage virtual environments similar to AWS EC2, enabling seamless application deployment and scalability.</li>
                    <li><strong>SaaS </strong> - Enjoy services like secure cloud storage (similar to AWS S3) and managed databases (similar to AWS RDS) to streamline your operations.</li>
                </ul> -->
                <p>Bring efficiency and scalability to your cloud experience.</p>
            </div>
            <img src="./images/logo.jpg" alt="TotCloud Logo">
        </div>
    </header>
    <section>
        <h2>SaaS</h2>
        <div class="saas">
            <div>
                Enjoy services like secure cloud storage (similar to AWS S3) and managed databases (similar to AWS RDS)
                to streamline your operations.
            </div>

            <div class="services">

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

        </div>
    </section>
    <section>
        <h2>PaaS</h2>
        <div class="paas">
            <div>
                Create and manage virtual environments similar to AWS EC2, enabling seamless application deployment and
                scalability. </div>

            <div class="services">
                <div class="paas_content">
                    <a href="./instancia_servidor/">SERVER</a>
                </div>
            </div>
        </div>
    </section>
</body>

</html>