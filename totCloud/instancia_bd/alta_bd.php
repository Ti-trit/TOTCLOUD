<html>
    <head>
        <?php
        include "../atributsClasses/instancia_bd.php"; 
        ?>
        <title>CREAR BASE DE DADES</title>
<body>
    <form action="insert_bd.php">
    Crear base de dades<br>

        Nom master:
        <input name="<?php echo $a2; ?>"><br><br>

        Nom base de dades:
        <input name="<?php echo $a3; ?>"><br><br>

        Grup de paràmetres:
        <select name="<?php echo $a4; ?>">
            <option value="default">Per defecte</option>
            <option value="optimized">Optimitzat</option>
            <option value="high-performance">Alt rendiment</option>
            <option value="secure">Segur</option>
            <option value="balanced">Balancejat</option>
        </select><br><br>

        Copia de seguretat:
        <select name="<?php echo $a5; ?>">
            <option value="NULL">No</option>
            <option value="NOT NULL">Sí</option>
        </select><br><br>

        Periode retenció:
        <select name="<?php echo $a5; ?>">
            <option value="7">1 semana</option>
            <option value="14">2 semanes</option>
            <option value="30">1 mes</option>
        </select><br><br>

        Motor base de dades:
        <select name="<?php echo $a7; ?>">
            <option value="MariaDB">MariaDB</option>
            <option value="MySQL">MySQL</option>
            <option value="PostgreSQL">PostgreSQL</option>
            <option value="SQLITE">SQLITE</option>
        </select><br><br>

        Subxarxa:
        <select name="<?php echo $a8; ?>">
            <option value="1">Subxarxa 1</option>
            <option value="2">Subxarxa 2</option>
            <option value="3">Subxarxa 3</option>
        </select><br><br>

        Configuració:
        <select name="<?php echo $a9; ?>">
            <option value="2">Bàsica</option>
            <option value="1">Avançada</option>
            <option value="3">Completa</option>
        </select><br><br>

        Grup de seguretat:
        <select name="<?php echo $a10; ?>">
            <option value="1">WebServerGroup</option>
            <option value="2">DBGroup</option>
            <option value="3">DNSGroup</option>
            <option value="4">PingGroup</option>
        </select><br><br>

        Emmagatzament:
        <select name="<?php echo $a11; ?>">
            <option value="2">GP1</option>
            <option value="1">GP2</option>
            <option value="3">GP3</option>
            <option value="4">IO1</option>
        </select><br><br>

        <input type="submit" value="AFEGIR">
    </form>
</body>
</html>