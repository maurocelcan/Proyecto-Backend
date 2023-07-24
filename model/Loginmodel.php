<?php

class LoginModel{
    private $db; 

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tp;charset=utf8', 'root', '');
    }

    function getUser($email) {
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE Email = ?');
        $query->execute([$email]);
        $email = $query->fetch(PDO::FETCH_OBJ);
        return $email;
    }

    function insertUsuario($email, $pass){
        $sentencia = $this->db->prepare('INSERT INTO usuarios(Email, Password, Rol) VALUES(?, ?, 1)');
        $sentencia->execute(array($email, $pass)); 
    }

    function getUsuarios(){
        $sentencia = $this->db->prepare("SELECT * FROM usuarios"); 
        $sentencia->execute();
        $usuarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
        return $usuarios;
    }

    function loginVerify($email){
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE Email = ?');
        $query->execute(array($email));
        $user = $query->fetch(PDO::FETCH_OBJ);
        return $user; 
    }

    function eliminarUsuario($id) {
        $sentencia = $this->db->prepare("DELETE FROM usuarios WHERE Id_usuarios = ?");
        $sentencia->execute(array($id));
    }

    function getUserById($id){
        $query = $this->db->prepare('SELECT * FROM usuarios WHERE Id_usuarios = ?');
        $query->execute([$id]);
        return $query->fetch(PDO::FETCH_OBJ);
    }

    function updateUsuario($id, $email, $rol) {
        $sentencia = $this->db->prepare("UPDATE usuarios SET Email = ? , Rol = ? WHERE Id_usuarios = ?");
        $sentencia->execute(array($email, $rol, $id));
    }
    
}