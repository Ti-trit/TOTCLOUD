<html>
    <head>
        <?php
        include "../atributsClasses/instancia_bd.php"; 
        ?>
<body>
    <form action="insert_bd.php">
    Crear base de datos<br>
        Servei BD:<input name="<?php echo $a1; ?>"><br>
        Nom master:<input name="<?php echo $a2; ?>"><br>
        Nom base de dades:<input name="<?php echo $a3; ?>"><br>
        Grup de paràmetres:<input name="<?php echo $a4; ?>"><br>
        Copia de seguretat:<input name="<?php echo $a5; ?>"><br>
        Periode retenció:<input name="<?php echo $a6; ?>"><br>
        Motor base de dades:<input name="<?php echo $a7; ?>"><br>
        Subxarxa:<input name="<?php echo $a8; ?>"><br>
        Configuració:<input name="<?php echo $a9; ?>"><br>
        Grup de seguretat:<input name="<?php echo $a10; ?>"><br>
        Emmagatzament:<input name="<?php echo $a11; ?>"><br>
        <input type="submit" value="AFEGIR">
    </form>
</body>
</html>