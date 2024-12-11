<?php
include "../llista.php";
include "../connexio.php";
include "../atributsClasses/instancia_bucket.php";

class LlistaBucket extends Llista {
    public function __construct($conn) {
        parent::__construct($conn, "instancia_bucket",2);   //2 = columna que contiene PK  
    }
}

$l1 = "<a href='/php/TOTCLOUD/totcloud/instancia_bucket/modifica_bucket.php?$pk={id}'>Modificar</a>";
$l2 = "<a href='/php/TOTCLOUD/totcloud/instancia_bucket/delete_bucket.php?$pk={id}'>Eliminar</a>";
$l3 = "<a href='/php/TOTCLOUD/totcloud/instancia_bucket/alta_bucket.php'>Agregar nuevo registro</a>";

$table = new LlistaBucket($conn);
$table->showTable($l1,$l2,$l3);
