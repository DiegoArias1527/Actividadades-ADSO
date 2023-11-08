<?php
    class Usuarios extends Conenctar{
        public function get_usuarios(){
            $conectar= parent::Conexion();
            parent::set_names();
            $sql="SELECT * FROM usuarios";
            $sql=$conectar->prepare($sql);
            $sql->execute();
            return $resultado=$sql->fetchAll();
        }
    }
?>