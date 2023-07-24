<?php

class CityModel{
    private $db;
    
    
    function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tp;charset=utf8', 'root', '');
        
    }
    function actualizarCiudad($ciudad, $id){
        $sentencia = $this->db->prepare("UPDATE ciudad SET ciudad=? WHERE Ciudad_id = ? ");
        $sentencia->execute(array($ciudad, $id));
    }
    function getCategoria($id){
        $sentencia = $this->db->prepare("SELECT *  FROM ciudad WHERE Ciudad_id = ? ");
        $sentencia->execute(array($id));
        $ciudad = $sentencia->fetch(PDO::FETCH_OBJ);
        return $ciudad;
    }
    function GetCategoriasFK(){
        $query = $this->db->prepare('SELECT * FROM ciudad ORDER BY ciudad');
        $query->execute();
        $ciudad = $query->fetchAll(PDO::FETCH_OBJ);
        return $ciudad;
    }
    function eliminarCategoria($id){
        $sentencia = $this->db->prepare("DELETE FROM ciudad WHERE Ciudad_id=?");
        $sentencia->execute(array($id));
    }
    function agregarCiudad($ciudad){
        $sentencia = $this->db->prepare("INSERT INTO ciudad(ciudad) VALUES(?)");
        $sentencia->execute(array($ciudad));
    }

}