<?php
    header('Content-Type: application/json');

    require_once("../config/conexion.php");
    require_once("../models/Productos.php");
    $productos = new Productos();
    $body = json_decode(file_get_contents("php://input"), true);

    switch ($_GET["op"]) {

        case "GetAll":
            $datos=$productos->get_productos();
            echo json_encode($datos);
        break;

        case "Update":
            $datos=$productos->update_producto(
                $body["id_Producto"],
                $body["nom_Producto"],
                $body["precio_Producto"],
                $body["cantidad_Producto"],
                $body["fecha_Vencimiento"]
            );

            echo "Upadate Correcto";
        break;

        case "Delete":
                $datos=$productos->delete_producto($body["id_Producto"]);
                echo "Delete Correcto";
        break;

        case "Insert":
            $datos=$productos->insert_producto(
                $body["id_Producto"],
                $body["nom_Producto"],
                $body["precio_Producto"],
                $body["cantidad_Producto"],
                $body["fecha_Vencimiento"],
                $body["id_Distribuidor"]
            );
            echo "Insert Correcto";
        break;


    
    }
?>