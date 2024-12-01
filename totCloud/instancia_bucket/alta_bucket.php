<html>
    <head>
        <?php
        include "../atributsClasses/instancia_bucket.php";
        ?>
    </head>
    <body>
        <form action="insert_bucket.php">
        Crear bucket<br>
            Nom bucket:<input name="<?php echo $a1; ?>"><br>
            Periode bloqueig:<input name="<?php echo $a2; ?>"><br>
            Nom regió:<input name="<?php echo $a3; ?>"><br>
            ID servei:<input name="<?php echo $a4; ?>"><br>
            <input type="submit" value="AFEGIR">
        </form>
    </body>
</html>