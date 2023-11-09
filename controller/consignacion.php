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

        case "GetId":
        $datos=$consignacion->get_consignacion_x_id($body["id_Consignacion"]);
        echo json_encode($datos);
        break;

        case "Insert":
            $datos=$consignacion->insert_consignacion(
                $body["num_Cuenta"],
                $body["valor_Consignacion"],
                $body["fecha_Consignacion"],
                $body["id_Usuario"]
            );
            echo "Correcto";
        break;
    }
?>