<?php
include "../llista.php";
include "../connexio.php";
include "../atributsClasses/instancia_servidor.php"; 

class LlistaServidor extends Llista {
    public function __construct($conn) {
        parent::__construct($conn, "instancia_servidor",2);  
    }
}

$l1 = "<a href='/php/TOTCLOUD/totcloud/instancia_servidor/modifica_servidor.php?$pk={id}'>Modificar</a>";
$l2 = "<a href='/php/TOTCLOUD/totcloud/instancia_servidor/delete_servidor.php?$pk={id}'>Eliminar</a>";
$l3 = "<a href='/php/TOTCLOUD/totcloud/instancia_servidor/alta_servidor.php'>Agregar nuevo registro</a>";

$table = new LlistaServidor($conn);
$table->showTable($l1,$l2,$l3);
