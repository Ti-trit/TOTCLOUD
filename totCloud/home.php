<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="estils/home.css">
    <title>Home</title>
</head>
<?php
session_start(); // Asegúrate de llamar session_start() para acceder a las variables de sesión

// Comprobar si hay un mensaje de logout
if (isset($_SESSION['logout_message'])) {
    // Mostrar el mensaje en pantalla
    echo '<div class="alert alert-success" role="alert">' . htmlspecialchars($_SESSION['logout_message']) . '</div>';
    
    // Eliminar el mensaje después de mostrarlo para que no persista
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
            
                <div class="saas_content">
                    <a href="./database.html">DataBase</a>
                </div>
            </php>
            <div class="saas_content">
                <a href="./buckets.html">Buckets</a>
            </div>
        </div>
    </section>
    <section>
        <h2>PaaS</h2>
        <div class="paas">
            <div class="paas_content">
                <a href="./server.html">Server</a>
            </div>
        </div>
    </section>