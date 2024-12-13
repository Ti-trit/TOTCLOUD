<html>

<head>
    <?php
    include "../atributsClasses/instancia_bd.php";
    include "../header.php";
    ?>
    <title>CREAR BASE DE DADES</title>
    <link rel="stylesheet" type="text/css" href="../estils/new.css">
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
    <section>
        <a href="home.php">
            <h2>Base de dades</h2>
        </a>
        <div class="subtitulo">
            <div>
                Aqui pots crear les bases de dades amb els atributs corresponents
            </div>
        </div>
    </section>
    <form action="insert_bd.php" method="GET">

        Nom master
        <input name="nomMaster" required><br><br>

        Nom base de dades
        <input name="nomBD" required><br><br>

        Motor base de dades
        <?php
        require "../connexio.php";
        $sql = "SELECT tipusMotor FROM MOTOR_BD";
        $result = $conn->query($sql);
        ?>
        <select name="motor_tipus" id="motor" required>
            <?php
            // Iterar sobre los resultados de la consulta
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo '<option value="' . htmlspecialchars($row['tipusMotor']) . '">' . htmlspecialchars($row['tipusMotor']) . '</option>';
                }
            }
            ?>
        </select><br><br>

        Versio:
        <?php
        require "../connexio.php";
        $sql = "SELECT tipusMotor, nomVersio FROM versio";
        $stmt = $conn->prepare($sql);
        // $stmt->bind_param("s", $motor); // Vinculamos el motor a la consulta
        $stmt->execute();
        $result = $stmt->get_result();
        $versiones = array();
        ?>
        <select name="versio" id="versioMotor" required>
            <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    // Concatenamos tipusMotor y nomVersio para mostrar como "nomMotor versio"
                    $version = htmlspecialchars($row['tipusMotor']) . " " . htmlspecialchars($row['nomVersio']);
                    // Almacenamos cada opción en el array versions[]
                    $versions[] = $version;
                }
            }

            // Devolver las opciones en el formato HTML
            foreach ($versions as $version) {
                echo '<option value="' . htmlspecialchars($version) . '">' . htmlspecialchars($version) . '</option>';
            }
            ?>
        </select><br><br>

        Grup de paràmetres
        <select name="GParametreBD" id="" required>

            <option value=" default.oracle-ee-19"> default.oracle-ee-19</option>
            <option value="default.sqlserver-se-15">default.sqlserver-se-15</option>
            <option value="default.GETgres14">default.GETgres14</option>
            <option value="default.GETgres13">default.GETgres13</option>
            <option value="default.mysql8.0">default.mysql8.0</option>
            <option value="default.mysql5.7">default.mysql5.7</option>
            <option value="default.mariadb10.5">default.mariadb10.5</option>
        </select>


        </select><br><br>

        <label>
            <input type="checkbox" id="backupCheckbox" name="<?php echo $a6; ?>" value="1"
                onchange="toggleRetentionPeriod()">
            Copia de seguretat
        </label><br><br>

        <div id="retentionPeriod" style="display: none;">
            Període retenció
            <select name="periodeRetencio" required>
                <option value="7">1 setmana</option>
                <option value="14">2 setmanes</option>
                <option value="30">1 mes</option>
            </select>
        </div><br><br>


        Subxarxa<br><br>

        <!-- <select name="<?//php echo $a8; ?>">
    <option value="1">Subxarxa 1</option>
    <option value="2">Subxarxa 2</option>
    <option value="3">Subxarxa 3</option>
</select><br><br> -->
        nom
        <input name="nomSUBX" required><br><br>

        descripcio
        <input name="descripcioSUBX" required><br><br>
        id VPC
        <input name="idVPC" required><br><br>
        Nom regió:
        <?php
        include "../connexio.php";
        include "../funcions.php";
        include "../atributsClasses/instancia_bucket.php";
        //include "../header.php";
        
        $db = new Database($conn);
        $query = "SELECT $a3 FROM regio WHERE disponible = 1";
        $result = $db->consultar($query);
        $array = array();

        while ($reg = mysqli_fetch_assoc($result)) {
            $array[] = $reg[$a3];
        }
        ?>
        <select name="nomRegSUBX" required>
            <?php
            foreach ($array as $region) {
                echo "<option value='$region'>$region</option>";
            }
            ?>
        </select><br><br>

        Configuració

        <select name="config" required>
            <?php
            // $query = "SELECT numCPU, RAM, xarxa, nom FROM configuracio";
            //$result = $db->consultar($query);
            $arr3 = ['db.t3.micro', 'db.t3.small', 'db.t3.medium', 'db.m5.large'];
            $arr4 = ['2', '3', '4', '2'];
            $arr5 = ['1', '2', '4', '8'];
            $arr6 = ['2,085', '5,00', '5,000', '10'];

            for ($i = 0; $i < count($arr3); $i++) {
                echo "<option value='{$arr3[$i]}|{$arr4[$i]}|{$arr5[$i]}|{$arr6[$i]}'>
            Nom: {$arr3[$i]} | vCPUs: {$arr4[$i]} |  GiB RAM: {$arr5[$i]} | Network: {$arr6[$i]}
          </option>";
            }
            ?>
        </select><br><br>

        IP <input name="IP" required> </select><br><br>

        Grup de seguretat <br><br>
        Nom:
        <input name="nomGS" required><br><br>
        Descripcio:
        <input name="descripcioGS"><br><br>
        Source:
        <select name="source" required>
            <?php
            $query = "SELECT source FROM source";
            $result = $db->consultar($query);
            $arr7 = array();

            while ($reg = mysqli_fetch_assoc($result)) {
                $arr7[] = $reg["source"];
            }

            for ($i = 0; $i < count($arr7); $i++) {
                echo "<option value='{$arr7[$i]}'>
            {$arr7[$i]}
          </option>";
            }
            ?>
        </select><br><br>
        Protocol
        <?php


        $query = "SELECT Protocol FROM protocol";
        $result = $db->consultar($query);
        $arr8 = array();

        while ($reg = mysqli_fetch_assoc($result)) {
            $arr8[] = $reg["Protocol"];
        } ?>

        <select name="protocol" required>
            <?php
            for ($i = 0; $i < count($arr8); $i++) {
                echo "<option value='{$arr8[$i]}'>
            {$arr8[$i]}
          </option>";
            }
            ?>
        </select><br><br>

        Emmagatzament

        <select name="tipusEmg" required>
            <option value="GP1 (General Purpose SSD)">GP1 (General Purpose SSD)</option>
            <option value="GP2 (General Purpose SSD)">GP2 (General Purpose SSD)</option>
            <option value="GP3 (General Purpose SSD">GP3 (General Purpose SSD)</option>
            <option value="IO1 (Provisioned IOPS SSD)">IO1 (Provisioned IOPS SSD)</option>
        </select><br><br>

        Memoria assignada (GiB)
        <input name="MemoriaEMG" required><br><br>


        <input type="submit" value="AFEGIR">
    </form>
</body>

</html>