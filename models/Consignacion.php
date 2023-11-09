<?php
class Consignacion extends Conectar{
    public function get_consignacion(){
        $conectar = parent :: conexion();
        parent:: set_names();
        $sql="SELECT * FROM consignacion";
        $sql=$conectar->prepare($sql);
        $sql->execute();
        return $resultado=$sql->fetchAll();
    }

    public function get_consignacion_x_id($id_Consignacion){
        $conectar= parent::Conexion();
        parent::set_names();
        $sql="SELECT * FROM consignacion WHERE id_Consignacion = ?";
        $sql=$conectar->prepare($sql);
        $sql->bindValue(1, $id_Consignacion);
        $sql->execute();
        return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
    }

    public function insert_consignacion($num_Cuenta,$valor_Consignacion,$fecha_Consignacion,$id_Usuario){
        $conectar= parent::Conexion();
        parent::set_names();
        $sql="INSERT INTO consignacion(num_Cuenta,valor_Consignacion,fecha_Consignacion,id_Usuario) VALUES (?, ?, ?, ?);";
        $sql=$conectar->prepare($sql);
        $sql->bindValue(1, $num_Cuenta);
        $sql->bindValue(2, $valor_Consignacion);
        $sql->bindValue(3, $fecha_Consignacion);
        $sql->bindValue(4, $id_Usuario);
        $sql->execute();
        return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
    }

}
?>