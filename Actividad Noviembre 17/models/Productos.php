<?php
class Productos extends Conectar{

    public function get_productos(){
        $conectar = parent :: conexion();
        parent:: set_names();
        $sql="SELECT productos.*, distribuidor.*
        FROM productos
        INNER JOIN distribuidor ON productos.id_Distribuidor = distribuidor.id_Distribuidor;";
        $sql=$conectar->prepare($sql);
        $sql->execute();

        return $resultado=$sql->fetchAll();

        $productosJson = array();
        foreach ($resultado as $productos) {
        $id_Distribuidor = $productos['id_Distribuidor'];

        $productosJson = array(
            'id_Productos' => $productos['id_Producto'],
            'nom_Producto' => $productos['nom_Producto'],
            'precio_Producto' => $productos['precio_Producto'],
            'cantidad_Producto' => $productos['cantidad_Producto'],
            'fecha_Vencimiento' => $productos['fecha_Vencimiento'],
        );

        $distribuidorJson = array(
            'id_Distribuidor' => $productos['id_Distribuidor'],
            'nom_Distribuidor' => $productos['nom_Distribuidor'],
            'tel_Distribuidor' => $productos['tel_Distribuidor'],
            'direccion_Distribuidor' => $productos['direccion_Distribuidor'],
            'nit_Distribuidor' => $productos['nit_Distribuidor'],
        );

        $productosJson['distribuidor'] = $distribuidorJson;

        $productosJson[$id_Distribuidor][] = $productosJson;
    }
        return $productosJson;

    }


    public function update_producto($id_Producto, $nom_Producto, $precio_Producto, $cantidad_Producto, $fecha_Vencimiento) {
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "UPDATE productos SET
                nom_Producto = ?,
                precio_Producto = ?,
                cantidad_Producto = ?,
                fecha_Vencimiento = ?
                WHERE
                id_Producto = ?";
    
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $nom_Producto);
        $sql->bindValue(2, $precio_Producto);
        $sql->bindValue(3, $cantidad_Producto);
        $sql->bindValue(4, $fecha_Vencimiento);
        $sql->bindValue(5, $id_Producto);
    
        $sql->execute();
        return $resultado = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function delete_producto($id_Producto){
        $conectar = parent::Conexion();
        parent::set_names();
        $sql = "DELETE FROM productos WHERE id_Producto = ?";
        
        $sql=$conectar->prepare($sql);
        $sql->bindValue(1, $id_Producto);
        $sql->execute();
        return $resultado = $sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insert_producto($id_Producto, $nom_Producto, $precio_Producto, $cantidad_Producto, $fecha_Vencimiento, $id_Distribuidor){
        $conectar= parent::Conexion();
        parent::set_names();
        $sql="INSERT INTO productos (id_Producto, nom_Producto, precio_Producto, cantidad_Producto, fecha_Vencimiento, id_Distribuidor) VALUES (?, ?, ?, ?, ?, ?);";
        $sql=$conectar->prepare($sql);
        $sql->bindValue(1, $id_Producto);
        $sql->bindValue(2, $nom_Producto);
        $sql->bindValue(3, $precio_Producto);
        $sql->bindValue(4, $cantidad_Producto);
        $sql->bindValue(5, $fecha_Vencimiento);
        $sql->bindValue(6, $id_Distribuidor);
        $sql->execute();
        return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
    }

}
?>