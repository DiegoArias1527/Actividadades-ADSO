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

        case "GetId":
        $datos=$productos->get_productos_x_id($body["id_Producto"]);
        echo json_encode($datos);
        break;

        case "Insert":
            $datos=$productos->insert_productos(
                $body["id_Producto"],
                $body["Nom_Producto"],
                $body["Precio_Producto"],
                $body["Desc_Producto"],
                $body["Id_Categoria"],
                $body["Id_Proveedor"]
            );
            echo "Correcto";
        break;

        case "Update":
            $datos=$productos->update_productos(
                $body["id_Producto"],
                $body["Nom_Producto"],
                $body["Precio_Producto"],
                $body["Desc_Producto"],
                $body["Id_Categoria"],
                $body["Id_Proveedor"]
            );
            echo "Upadate Correcto";
        break;
    }
?>