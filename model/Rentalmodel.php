<?php

class RentalModel{
    
    private $db; 

    function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tp;charset=utf8', 'root', '');
    }

    function GetRental(){
        $query = $this->db->prepare('SELECT * FROM alojamiento JOIN ciudad ON (alojamiento.id_ciudad=ciudad.Ciudad_id) ');
        $query->execute(); 
        $rent = $query->fetchAll(PDO::FETCH_OBJ);
        return $rent;   
    }
    
    function GetById($id){
        $query = $this->db->prepare('SELECT * FROM alojamiento JOIN ciudad ON (alojamiento.id_ciudad=ciudad.Ciudad_id) Where alojamiento.Id=?');
        $query->execute(array($id)); 
        $rent = $query->fetch(PDO::FETCH_OBJ);
        return $rent;   
    }

    function getAlojamiento($id){
        $sentencia = $this->db->prepare("SELECT * FROM alojamiento WHERE Id = ?"); 
        $sentencia->execute(array($id));
        $alojamiento = $sentencia->fetch(PDO::FETCH_OBJ);
        return $alojamiento;
    }

    function GetCategorias(){
        $query = $this->db->prepare('SELECT DISTINCT Tipo FROM alojamiento JOIN ciudad ON (alojamiento.id_ciudad=ciudad.Ciudad_id) ');
        $query->execute();
        $ciudad = $query->fetchAll(PDO::FETCH_OBJ);
        return $ciudad;
    }

    function CategoryFilterTipo($tipo){
        $query = $this->db->prepare('SELECT * FROM alojamiento Where Tipo=?');
        $query->execute(array($tipo));
        $category = $query->fetchAll(PDO::FETCH_OBJ); 
        return $category; 
    }

    function CategoryFilterCiudad($ciudad){ 
        //$query = $this->db->prepare('SELECT * FROM alojamiento JOIN ciudad ON (alojamiento.id_ciudad=ciudad.Ciudad_id) Where ciudad=?');
        $query = $this->db->prepare("SELECT alojamiento.Id, alojamiento.Titulo, alojamiento.Descripcion, alojamiento.Contacto, alojamiento.Tipo, alojamiento.Id_ciudad as ciudad  FROM alojamiento INNER JOIN ciudad ON alojamiento.Id_ciudad = ciudad.Ciudad_id WHERE Id_ciudad=?");
        $query->execute(array($ciudad));
        $category = $query->fetchAll(PDO::FETCH_OBJ); 
        return $category; 
    }
    
    function insertRental($titulo, $descripcion, $contacto, $tipo, $ciudad){
        $sentencia = $this->db->prepare('INSERT INTO alojamiento(Titulo, Descripcion, Contacto, Tipo, id_ciudad) VALUES(?, ?, ?, ?, ?)');
        $sentencia->execute(array($titulo, $descripcion, $contacto, $tipo, $ciudad));
    }

    function eliminarAlojamiento($id){
        $sentencia = $this->db->prepare("DELETE FROM alojamiento WHERE Id=?");
        $sentencia->execute(array($id));
    }

    function actualizarAlojamiento($titulo, $descripcion, $contacto, $tipo, $ciudad, $id){
       $sentencia = $this->db->prepare("UPDATE alojamiento SET Titulo = ? , Descripcion = ?, Contacto = ?, Tipo = ? , id_ciudad = ?  WHERE Id = ?");
       $sentencia->execute(array($titulo, $descripcion, $contacto, $tipo, $ciudad, $id));
    }
    
    

}

