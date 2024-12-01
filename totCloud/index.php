<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <link rel = "stylesheet" type = "text/css" href="estilos/style.css">
</head>
<body>
    <div class="wrapper">
        <h1> WELCOME TO TOTCLOUD'S PORTAL </h1>
    <form action="LogIn.php" method="POST">
        <div class="dbl-field">
            <div class="field">
                <label for="">Email</label>
                <input name ="emailField" type="text" placeholder="Enter your email" required>
            </div>
           
            <div class=" "field>
                <label for="">Password</label>
               <input name ="passwordField" type="password" placeholder="Enter your password" required>     
               
            </div>
            <input name ="submitButton" class ="btn" type ="submit" value ="LOG IN" >

        </div>

    </form>
</div>
   </header> 
</body>    
</html>