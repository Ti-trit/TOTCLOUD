<?php
include "../llista.php";
include "../connexio.php";

class LlistaBD extends Llista {
    public function __construct($conn) {
        parent::__construct($conn, "instancia_bd");  // Especifica la tabla "instancia_bd"
    }
}

$l1 = "<a href='modifica_bd.php?nick={id}'>Modificar</a>";
$l2 = "<a href='delete_bd.php?nick={id}'>Eliminar</a>";
$l3 = "<a href='alta_bd.php'>Agregar nuevo registro</a>";

$table = new LlistaBD($conn);
$table->showTable($l1,$l2,$l3);
