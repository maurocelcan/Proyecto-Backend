<?php

require_once './controller/ApiComentarioController.php';

class ComentarioModel {
    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tp;charset=utf8', 'root', '');
    }

    function eliminarComentario($id_comentario){ 
        $sentencia = $this->db->prepare("DELETE FROM comentarios WHERE id_comentario = ?");
        $sentencia->execute(array($id_comentario));
    }

    function getComentario($id_comentario) {
        $sentencia = $this->db->prepare( "SELECT * FROM comentarios WHERE id_comentario = ?");
        $sentencia->execute(array($id_comentario));
        $comentario = $sentencia->fetch(PDO::FETCH_OBJ);
        return $comentario;
    }

    function getComentariosPorRental($id_alojamiento) {
        $sentencia = $this->db->prepare( "SELECT * FROM comentarios WHERE id_alojamiento = ?");
        $sentencia->execute(array($id_alojamiento));
        $comentarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
        return $comentarios;
    }

    function insertarComentario($comentario, $id_alojamiento, $puntaje, $id_user) {
        $sentencia = $this->db->prepare("INSERT INTO comentarios(id_alojamiento, id_user, puntaje, comentario) VALUES(?, ?, ?, ?)");
        $sentencia->execute(array($id_alojamiento, $id_user,$puntaje, $comentario));
        return $this->db->lastInsertId();
    }

    function getComentarios($id_alojamiento) {
        $sentencia = $this->db->prepare("SELECT comentarios.id_comentario, comentarios.id_alojamiento, comentarios.id_user, comentarios.comentario, comentarios.puntaje, usuarios.Email as user
                                        FROM comentarios
                                        INNER JOIN usuarios ON comentarios.id_user = usuarios.Id_usuarios WHERE id_alojamiento = ?"); 
        $sentencia->execute(array($id_alojamiento));
        $comentarios = $sentencia->fetchAll(PDO::FETCH_OBJ);
        return $comentarios;
    }
}