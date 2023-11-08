<?php
    class Consignacion extends Conenctar{
        public function get_consignacion(){
            $conectar= parent::Conexion();
            parent::set_names();
            $sql="SELECT * FROM consignacion";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll(PDO::FETCH_ASSOC);
        }

    }
?>