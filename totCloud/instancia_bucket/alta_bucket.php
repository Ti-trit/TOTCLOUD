<html>
    <head>
        <?php
        include "../atributsClasses/instancia_bucket.php";
        ?>
        <title>CREAR BUCKET</title>
    </head>
    <body>
        <form action="insert_bucket.php" method="GET">
            <h2>Crear servidor</h2>

            Nom bucket:
            <input name="<?php echo $a1; ?>"><br><br>

            Periode bloqueig:
            <select name="<?php echo $a2; ?>">
                <option value="30">30 dies</option>
                <option value="90">90 dies</option>
                <option value="365">1 any</option>
            </select><br><br>

            Nom regió:
            <select name="<?php echo $a3; ?>">
                <option value="3">eu-west 1</option>
                <option value="4">eu-west 2</option>
                <option value="5">eu-west 3</option>
            </select><br><br>

            <input type="submit" value="AFEGIR">
        </form>
    </body>
</html>