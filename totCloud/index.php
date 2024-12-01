<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="estils/style2.css">

    <title>Login | Ludiflex</title>
</head>
<body>

    
<div class="wrapper">
    <img src="./images/logo.jpg" alt="img">
    <div class="login-box">

        <div class="login-header">
            <header>Login</header>
        </div>

        <!-- Formulari -->
        <form action="LogIn.php" method="POST">
            <div class="input-box">
                <input type="text" class="input-field" name="emailField" placeholder="Email" autocomplete="off" required>
            </div>
            <div class="input-box">
                <input type="password" class="input-field" name="passwordField" placeholder="Password" autocomplete="off" required>
            </div>
            <div class="input-submit">
                <input type="submit" name="submitButton" class="submit-btn" id="submit" value = "Sign In"> </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>