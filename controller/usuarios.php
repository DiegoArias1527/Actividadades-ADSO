<?php
    require_once("../config/conexion.php");
    require_once("../models/Usuarios.php");
    $usuarios = new Usuarios();

    switch ($_GET["op"]) {
        case "GetAll":
            $datos=$usuarios->get_usuarios();
            echo json_encode($datos);
        break;
    }
?>