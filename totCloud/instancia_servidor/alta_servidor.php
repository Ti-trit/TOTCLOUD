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

        $query = "SELECT nomReg FROM regio WHERE disponible = 1";
        $result = $db->consultar($query);
        $array = array();

        while ($reg = mysqli_fetch_assoc($result)) {
            $array[] = $reg['nomReg'];
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
    <link rel="stylesheet" type="text/css" href="../estils/new.css">
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
    <form action="insert_servidor.php" method="POST">

        Nom servidor
        <input name="nomServidor" required><br><br>

     

        Subxarxa<br><br>


    nom 
    <input name="nomSUBXS" required><br><br >

    descripcio 
    <input name="descripcioSUBXS" required><br><br >
    id VPC 
    <input name="idVPCS" required><br><br>
    Nom regió 
   

         <select name="nomRegSUBXS" required>
            <?php
            foreach ($array as $region) {
                echo "<option value='$region'>$region</option>";
            }
            ?>
         </select><br><br> 

        
        Configuració:
        <select name="configS" required>
            <?php
              $arr3 = ['db.t3.micro', 'db.t3.small','db.t3.medium','db.m5.large'];
              $arr4 =['2','3', '4', '2'];
              $arr5 = ['1', '2', '4', '8'];
              $arr6 = ['3,00$', '5,00$','5,00$', '10,00$'];
            for ($i = 0; $i < count($arr3); $i++) {
                echo "<option value='{$arr3[$i]}|{$arr4[$i]}|{$arr5[$i]}|{$arr6[$i]}'>
                        Nom: {$arr3[$i]} | Nº CPU: {$arr4[$i]} | RAM: {$arr5[$i]} | PreuPerHora: {$arr6[$i]}
                      </option>";
            }
            ?>
        </select><br><br>


        IP
        <input name="IPS"><br><br>

        Grup de seguretat<br><br>


        Nom
        <input name="nomGSS" required><br><br>
        Descripcio:
        <input name="descripcioGSS"><br><br>
        Source:
        <select name="sourceS"required>
            <?php
            for ($i = 0; $i < count($arr7); $i++) {
                echo "<option value='{$arr7[$i]}'>
                        {$arr7[$i]}
                      </option>";
            }
            ?>
        </select><br><br>
        Protocol
        <select name="protocolS"required>
            <?php
            for ($i = 0; $i < count($arr8); $i++) {
                echo "<option value='{$arr8[$i]}'>
                        {$arr8[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        Emmagatzematge <br><br>
        Memoria assignada (GiB)
            <input name="MemoriaEMGS" required><br><br>

         Emmagatzament
            
            <select name="tipusEmgS" required>
                <option value="GP1 (General Purpose SSD)">GP1 (General Purpose SSD)</option>
                <option value="GP2 (General Purpose SSD)">GP2 (General Purpose SSD)</option>
                <option value="GP3 (General Purpose SSD">GP3 (General Purpose SSD)</option>
                <option value="IO1 (Provisioned IOPS SSD)">IO1 (Provisioned IOPS SSD)</option>
            </select><br><br>

        Clau de sessió <br><br>
        Nom fitxer
        <input name="nomFitxer"required><br><br>
        Tipus clau:
        <select name="tipusClau"required>
            <?php
            for ($i = 0; $i < count($arr10); $i++) {
                echo "<option value='{$arr10[$i]}'>
                        {$arr10[$i]}
                      </option>";
            }
            ?>
        </select><br><br>

        
        Nom clau
        <input name="nomClau"required><br><br>

        AMI
        <select name="AMI"required>
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