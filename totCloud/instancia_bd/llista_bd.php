<?php
include "../llista.php";
include "../connexio.php";
include "../atributsClasses/instancia_bd.php";

class LlistaBD extends Llista {
    public function __construct($conn) {
        parent::__construct($conn, "instancia_bd",0);  
    }
}

$l1 = "<a href='/php/TOTCLOUD/totcloud/instancia_bd/modifica_bd.php?$pk={id}'>Modificar</a>";
$l2 = "<a href='/php/TOTCLOUD/totcloud/instancia_bd/delete_bd.php?$pk={id}'>Eliminar</a>";
$l3 = "<a href='/php/TOTCLOUD/totcloud/instancia_bd/alta_bd.php'>Agregar nuevo registro</a>";

$table = new LlistaBD($conn);
$table->showTable($l1,$l2,$l3);
