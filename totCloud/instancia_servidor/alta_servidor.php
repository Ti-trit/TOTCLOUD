<html>

<head>
    <?php
    include "../atributsClasses/instancia_servidor.php";
    include "../header.php";
    ?>
    <title>Crear Servidor</title>
</head>

<body>
    <form action="/php/TOTCLOUD/totcloud/instancia_servidor/insert_servidor.php" method="GET">
        <h2>Crear servidor</h2>

        Nom servidor:
        <input name="<?php echo $a1; ?>"><br><br>

        Data de creació:
        <input type="date" name="<?php echo $a2; ?>"><br><br>

        Subxarxa:
        <select name="<?php echo $a4; ?>">
            <option value="1">Subxarxa 1</option>
            <option value="2">Subxarxa 2</option>
            <option value="3">Subxarxa 3</option>
        </select><br><br>

        Configuració:
        <select name="<?php echo $a5; ?>">
            <option value="2">Bàsica</option>
            <option value="1">Avançada</option>
            <option value="3">Completa</option>
        </select><br><br>

        Grup de seguretat:
        <select name="<?php echo $a6; ?>">
            <option value="1">WebServerGroup</option>
            <option value="2">DBGroup</option>
            <option value="3">DNSGroup</option>
            <option value="4">PingGroup</option>
        </select><br><br>

        Emmagatzament:
        <select name="<?php echo $a7; ?>">
            <option value="2">GP1</option>
            <option value="1">GP2</option>
            <option value="3">GP3</option>
            <option value="4">IO1</option>
        </select><br><br>

        Clau de sessió:
        <select name="<?php echo $a8; ?>">
            <option value="1">RSA</option>
            <option value="2">ED25519</option>
        </select><br><br>

        AMI:
        <select name="<?php echo $a9; ?>">
            <option value="1">Amazon Linux 2 AMI</option>
            <option value="4">Amazon Linux 2 ARM</option>
            <option value="5">Ubuntu 18.04 LTS</option>
            <option value="2">Ubuntu 20.04 LTS</option>
            <option value="3">Windows Server 2019</option>
        </select><br><br>

        <input type="submit" value="AFEGIR">
    </form>
</body>

</html>