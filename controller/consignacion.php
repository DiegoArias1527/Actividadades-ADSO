<?php
    header('Content-Type: application/json');

    require_once("../config/conexion.php");
    require_once("../models/Consignacion.php");
    $consignacion = new Consignacion();
    $body = json_decode(file_get_contents("php://input"), true);

    switch ($_GET["op"]) {
        case "GetAll":
            $datos=$consignacion->get_consignacion();
            echo json_encode($datos);
        break;
    }
?>