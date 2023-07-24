<?php
require_once "model/Rentalmodel.php";
require_once "view/Rentalview.php";
require_once "Helpers/AuthHelper.php";
require_once "model/CityModel.php"; 
require_once "model/ComentarioModel.php"; 


class RentalController{
    private $model; 
    private $view;
    private $modelcity; 
    private $authHelper;
    private $comentarioModel;
  

    function __construct() {
        $this->model = new RentalModel();
        $this->view = new RentalView();
        $this->modelcity = new CityModel();
        $this->authHelper = new AuthHelper(); 
        $this->comentarioModel = new ComentarioModel();    
    }

    function ShowHome(){
        $rents = $this->model->GetRental();
        $categoria = $this->model->GetCategorias();
        $ciudades = $this->modelcity->GetCategoriasFK();        
        $this->view->MostrarInicio($rents, $categoria, $ciudades, $this->authHelper->loggedIn(), $this->authHelper->getRole());
    }

    function ShowDetails($id){
        $rent = $this->model->GetById($id);
        $this->view->MostrarDetalles($rent, $this->authHelper->loggedIn(), $this->authHelper->getRole(), $this->authHelper->getUserID());
    }

    function ShowCategory($category){
        $viviendas = $this->model->CategoryFilterTipo($category);
        $this->view->MostrarFiltrado($viviendas, $this->authHelper->loggedIn(), $this->authHelper->getRole());
    }

    function ShowCategoryCiudad($category){
        $model = $this->model->CategoryFilterCiudad($category);
        $this->view->MostrarFiltrado($model, $this->authHelper->loggedIn(), $this->authHelper->getRole());
    }

    function ShowAdmin(){
        $categorias = $this->modelcity->GetCategoriasFK();
        $this->view->MostrarAdmin($categorias, $this->authHelper->loggedIn(), $this->authHelper->getRole());
    }

    public function insertarRental(){
        $this->model->insertRental($_POST['titulo'], $_POST['descripcion'], $_POST['contacto'], $_POST['tipo'],$_POST['ciudad']);
        header("Location: ".BASE_URL."home");
    }

    function eliminarAlojamiento($id){
        $this->authHelper->checkLoggedIn();
        $comentarios = $this->comentarioModel->getComentariosPorRental($id);
        if (!$comentarios){
            $this->model->eliminarAlojamiento($id);
            header("Location: ".BASE_URL."home");
        } else {
            $error = "Para eliminar un alojamiento, primero se deben eliminar los comentarios.";
            $this->view->MostrarInicio($this->model->GetRental(), $this->model->GetCategorias(), $this->modelcity->GetCategoriasFK(), $this->authHelper->loggedIn(), $this->authHelper->getRole(), $error);
        }
    }

    function eliminarCategoria($id){
        $alojamientos = $this->model->CategoryFilterCiudad($id);

        if(sizeof($alojamientos) == 0) {
            $this->modelcity->eliminarCategoria($id);
            header("Location: ".BASE_URL."home");
        } else {
            $error = 'Error, no se puede eliminar la categoria';
            $rents = $this->model->GetRental();
            $categoria = $this->model->GetCategorias();
            $ciudades = $this->modelcity->GetCategoriasFK();
            $this->view->MostrarInicio($rents, $categoria, $ciudades, $this->authHelper->loggedIn(), $this->authHelper->getRole(), $error);
        }   
    }

    function modificarAlojamiento($id){
        $alojamiento = $this->model->getAlojamiento($id);
        if ($alojamiento) { //si es distinto de null
            $this->authHelper->checkLoggedIn();
            $this->view->modificarAlojamiento($alojamiento, $this->modelcity->GetCategoriasFK(), true, $this->authHelper->getRole()); //logueado es true xq ya estoy iniciado sesion para poder hacer eso
        }   
    }

    function actualizarAlojamiento(){
        if (isset($_POST['titulo'])
            && isset($_POST['descripcion']) 
            && isset($_POST['contacto'])
            && isset($_POST['tipo'])
            && isset($_POST['ciudad']) ) {
                $this->model->actualizarAlojamiento($_POST['titulo'], $_POST['descripcion'], $_POST['contacto'], $_POST['tipo'], $_POST['ciudad'], $_POST['id']);
                header("Location: ".BASE_URL."home"); 
            }
    }
}