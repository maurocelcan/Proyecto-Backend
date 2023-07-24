<?php

require_once "./model/Rentalmodel.php";
require_once "./view/Apiview.php";
require_once "./model/Loginmodel.php";
require_once "./model/ComentarioModel.php";

class ApiComentarioController{
    protected $model; 
    protected $view;
    private $data; 
    private $loginModel;

    function __construct() {
        $this->model = new ComentarioModel();
        $this->view = new Apiview();
        $this->loginModel = new LoginModel();  
    }

    private function getBody(){
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString); 
    }

    //Trae comentarios de un producto especifico
    function getComentarios($params = null) {
        $id_rental = $params[":ID"];
        $comentarios = $this->model->getComentarios($id_rental);
        if ($comentarios) {
            $this->view->response($comentarios, 200);
        } else {
            $this->view->response("No hay comentarios para el alojamiento seleccionado con el id=$id_rental", 204); 
        }
    }

    function eliminarComentario($params = null) {
        $idComentario = $params[":ID"];
        $comentario = $this->model->getComentario($idComentario);
        if ($comentario) {
            $this->model->eliminarComentario($idComentario);
            $this->view->response("El comentario con el id=$idComentario fue borrado exitosamente", 200);
        } else {
            $this->view->response("El comentario con el id=$idComentario no existe", 404);
        }
    } 

    function insertarComentario() {
        $body = $this->getBody(); 
        $usuario = $this->loginModel->getUserById($body->id_user);      
        if($usuario && isset($body->comentario) &&  isset($body->puntaje) &&  isset($body->id_alojamiento)) {
            $id = $this->model->insertarComentario($body->comentario, $body->id_alojamiento, $body->puntaje, $body->id_user);
            if ($id != 0) {
                $this->view->response("El comentario se insertó con el id=$id", 200);
            } else {
                $this->view->response("El comentario no se pudo insertar", 500);
            } 
        } else {
            $this->view->response("No es posible insertar el comentario", 500);
        }
    }
}