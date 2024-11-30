<?php
if (!empty($_POST["submitButton"])) {
    // Conexión a la base de datos
    $conexion = new mysqli("localhost", "root", "", "PRACTICA2", "3306");
    $conexion->set_charset("utf8");

    // Obtener datos del formulario
    $email = $_POST["emailField"];
    $password = $_POST["passwordField"];
    // Consulta SQL para obtener la contraseña más reciente
    $stmt = $conexion->prepare("SELECT h.constrasenyaHash
    FROM persona p
    JOIN personal pl ON p.idPersona = pl.idPersonalCloud
    JOIN HISTORIAL_CONTRASENYA h ON pl.idPersonalCloud = h.IdPersona
    WHERE p.correuAcces = ?
    ORDER BY h.dataCreacio DESC
    LIMIT 1");
    
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($datos = $result->fetch_object()) {
        if (password_verify($password, $datos->constrasenyaHash)) {
            echo "WELCOME HOME";
            echo "bienvenida";
            header("Location: home.php");

        } else {
            echo '<div class="alert alert-danger">ACCESS DENIED</div>';
        }
    } else {
        echo '<div class="alert alert-danger">EMAIL NOT FOUND</div>';
    }
   
}
?>
