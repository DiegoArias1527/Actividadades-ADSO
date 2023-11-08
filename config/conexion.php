<?php
    class Conenctar{
        protected $dbh;

        protected function Conexion(){
            try {
                $conectar = $this->dbh = new PDO("mysql:host=localhost;dbname=postman_prueba","root","");
                return $conectar;
            } catch (Exception $e) {
                print "!Error BD¡: " . $e->getMessage() . "<br/r>";
                die();
            }
        }

        public function set_names(){
            return $this->dbh->query("SET NAMES 'utf8'");
        }

    }
?>