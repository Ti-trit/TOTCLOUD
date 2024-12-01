<?php
include "../llista.php";
include "../connexio.php";
include "../atributsClasses/instancia_bucket.php"; 

class LlistaServidor extends Llista {
    public function __construct($conn) {
        parent::__construct($conn, "instancia_servidor");  
    }
}

$l1 = "<a href='modifica_servidor.php?$pk={id}'>Modificar</a>";
$l2 = "<a href='delete_servidor.php?$pk={id}'>Eliminar</a>";
$l3 = "<a href='alta_servidor.php'>Agregar nuevo registro</a>";

$table = new LlistaServidor($conn);
$table->showTable($l1,$l2,$l3);
