<?php 

session_start();
$_SESSION['logout_message'] = 'Has cerrado sesión correctamente.';

session_unset(); // eliminar las variables de sesión
session_destroy(); //destruyer la sesion
//redireccionar el usuario a la pagina inicial
header("Location: index.php");
exit;

?>
