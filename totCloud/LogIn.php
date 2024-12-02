<?php

require "connexio.php";
    session_start();

    

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Obtener datos del formulario
    $email = $_POST["emailField"];
    $password = $_POST["passwordField"];
    // Consulta SQL para obtener la contraseña más reciente
    $stmt = $conn->prepare("SELECT h.constrasenyaHash
    FROM persona p
    JOIN personal pl ON p.idPersona = pl.idPersonalCloud
    JOIN HISTORIAL_CONTRASENYA h ON pl.idPersonalCloud = h.IdPersona
    WHERE p.correuAcces = ?
    ORDER BY h.dataCreacio DESC
    LIMIT 1");
    
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
   // $login_err = "";
    if ($datos = $result->fetch_object()) {
        if (password_verify($password, $datos->constrasenyaHash)) {

            $_SESSION["loggedin"]=true;
            $_SESSION["correo"]=$email;
            
            header("Location: home.php");

        } else {
         //  $login_err = "ACCESS DENIED";
           $_SESSION["status"]= "ACCES DENIED";
           header("Location: index.php");
           exit();
        }
    } 
    else {
        $_SESSION["status"]= "INVALID USERNAME OR PASSWORD";
        header("Location: index.php");
        exit();
    }
   
   
}
?>
