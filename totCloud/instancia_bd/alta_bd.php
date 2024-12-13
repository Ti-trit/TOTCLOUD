<html>

<head>
    <?php
    include "../atributsClasses/instancia_bd.php";
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
    ?>
    <title>CREAR BASE DE DADES</title>
    <link rel="stylesheet" type="text/css" href="../home.css">
    <script>
        function toggleRetentionPeriod() {
            const checkbox = document.getElementById('backupCheckbox');
            const retentionPeriod = document.getElementById('retentionPeriod');
            if (checkbox.checked) {
                retentionPeriod.style.display = 'block';
            } else {
                retentionPeriod.style.display = 'none';
            }
        }
    </script>

<body>
    <h2>Crear base de dades</h2>
    <form action="insert_bd.php" method="GET">

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

        <label>
            <input type="checkbox" id="backupCheckbox" name="<?php echo $a6; ?>" value="1"
                onchange="toggleRetentionPeriod()">
            Copia de seguretat
        </label><br><br>

        <div id="retentionPeriod" style="display: none;">
            Període retenció:
            <select name="<?php echo $a5; ?>">
                <option value="7">1 setmana</option>
                <option value="14">2 setmanes</option>
                <option value="30">1 mes</option>
            </select>
        </div><br><br>

        Motor base de dades:
        <select name="<?php echo $a7; ?>">
            <option value="MariaDB">MariaDB</option>
            <option value="MySQL">MySQL</option>
            <option value="PostgreSQL">PostgreSQL</option>
            <option value="SQLITE">SQLITE</option>
        </select><br><br>

        Subxarxa:
        <select name="<?php echo $a8; ?>">
            <?php
            for ($i = 0; $i < count($arr0); $i++) {
                echo "<option value='{$arr0[$i]}|{$arr1[$i]}|{$arr2[$i]}'>
                        Nom: {$arr0[$i]} | VPC: {$arr1[$i]} | Regió: {$arr2[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        Configuració:
        <select name="<?php echo $a9; ?>">
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

        <input type="submit" value="AFEGIR">
    </form>
</body>

</html>