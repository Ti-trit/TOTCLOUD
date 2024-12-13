<html>

<head>
    <?php
    include "../atributsClasses/instancia_servidor.php";
    include "../atributsClasses/clau_sessio.php";
    include "../atributsClasses/configuracio.php";
    include "../atributsClasses/emmagatzematge.php";
    include "../atributsClasses/grup_seguretat.php";
    include "../header.php";
    include "../connexio.php";
    include "../funcions.php";

    $db = new Database($conn);

    $query = "SELECT nomSubXarxa, idVPC, nomReg FROM subxarxa";
    $result = $db->consultar($query);
    $arr0 = array();
    $arr1 = array();
    $arr2 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr0[] = $reg["nomSubXarxa"];
        $arr1[] = $reg["idVPC"];
        $arr2[] = $reg["nomReg"];
    }

    $query = "SELECT numCPU, RAM, xarxa, nom FROM configuracio";
    $result = $db->consultar($query);
    $arr3 = array();
    $arr4 = array();
    $arr5 = array();
    $arr6 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr3[] = $reg["nom"];
        $arr4[] = $reg["numCPU"];
        $arr5[] = $reg["RAM"];
        $arr6[] = $reg["xarxa"];
    }

    $query = "SELECT source FROM source";
    $result = $db->consultar($query);
    $arr7 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr7[] = $reg["source"];
    }

    $query = "SELECT Protocol FROM protocol";
    $result = $db->consultar($query);
    $arr8 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr8[] = $reg["Protocol"];
    }

    $query = "SELECT tipus FROM emmagatzamatge";
    $result = $db->consultar($query);
    $arr9 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr9[] = $reg["tipus"];
    }

    $query = "SELECT tipus FROM tipus_clau";
    $result = $db->consultar($query);
    $arr10 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr10[] = $reg["tipus"];
    }

    $query = "SELECT descripcioAMI, arquitectura FROM AMI";
    $result = $db->consultar($query);
    $arr11 = array();
    $arr12 = array();

    while ($reg = mysqli_fetch_assoc($result)) {
        $arr11[] = $reg["descripcioAMI"];
        $arr12[] = $reg["arquitectura"];
    }
    ?>
    <title>Crear Servidor</title>
    <link rel="stylesheet" type="text/css" href="/php/TOTCLOUD/totcloud/estils/new.css">
</head>

<body>
    <section>
        <a href="home.php">
            <h2>Servidor</h2>
        </a>
        <div class="subtitulo">
            <div>
                Crear un servidor:
            </div>
        </div>
    </section>
    <form action="/php/TOTCLOUD/totcloud/instancia_servidor/insert_servidor.php" method="GET">

        Nom servidor:
        <input name="<?php echo $a1; ?>"><br><br>

        Data de creació:
        <input type="date" name="<?php echo $a2; ?>"><br><br>

        Subxarxa:
        <select name="<?php echo $a4; ?>">
            <?php
            for ($i = 0; $i < count($arr0); $i++) {
                echo "<option value='{$arr0[$i]}|{$arr1[$i]}|{$arr2[$i]}'>
                        Nom: {$arr0[$i]} | VPC: {$arr1[$i]} | Regió: {$arr2[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        Configuració:
        <select name="<?php echo $a5; ?>">
            <?php
            for ($i = 0; $i < count($arr3); $i++) {
                echo "<option value='{$arr3[$i]}|{$arr4[$i]}|{$arr5[$i]}|{$arr6[$i]}'>
                        Nom: {$arr3[$i]} | Nº CPU: {$arr4[$i]} | RAM: {$arr5[$i]} | Xarxa: {$arr6[$i]}
                      </option>";
            }
            ?>
        </select><br>
        IP:
        <input name="<?php echo $c6; ?>"><br><br>

        Grup de seguretat:
        Nom:
        <input name="<?php echo $e1; ?>"><br>
        Descripcio:
        <input name="<?php echo $e2; ?>"><br>
        Source:
        <select name="<?php echo $e7; ?>">
            <?php
            for ($i = 0; $i < count($arr7); $i++) {
                echo "<option value='{$arr7[$i]}'>
                        {$arr7[$i]}
                      </option>";
            }
            ?>
        </select><br>
        Protocol:
        <select name="<?php echo $e6; ?>">
            <?php
            for ($i = 0; $i < count($arr8); $i++) {
                echo "<option value='{$arr8[$i]}'>
                        {$arr8[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        Emmagatzematge:
        Quantitat:
        <input name="<?php echo $g2; ?>"> GiB<br>
        Tipus:
        <select name="<?php echo $g1; ?>">
            <?php
            for ($i = 0; $i < count($arr9); $i++) {
                echo "<option value='{$arr9[$i]}'>
                        {$arr9[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        Clau de sessió:
        Nom fitxer:
        <input name="<?php echo $j1; ?>"><br>
        Tipus clau:
        <select name="<?php echo $j2; ?>">
            <?php
            for ($i = 0; $i < count($arr10); $i++) {
                echo "<option value='{$arr10[$i]}'>
                        {$arr10[$i]}
                      </option>";
            }
            ?>
        </select><br>
        Nom clau:
        <input name="<?php echo $j3; ?>"><br><br>

        AMI:
        <select name="<?php echo $a9; ?>">
            <?php
            for ($i = 0; $i < count($arr11); $i++) {
                echo "<option value='{$arr11[$i]}|{$arr12[$i]}'>
                        Nom: {$arr11[$i]} | Arquitectura: {$arr12[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        <input type="submit" value="AFEGIR">
    </form>
</body>

</html>