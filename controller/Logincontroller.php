<?php 
require_once "model/Loginmodel.php";
require_once "view/Loginview.php";
require_once "Helpers/AuthHelper.php"; 


class LoginController {
    private $model; 
    private $view; 
    private $authHelper;
    

    function __construct() {
        $this->model = new LoginModel();
        $this->view = new LoginView(); 
        $this->authHelper = new AuthHelper();
    }
    
    function ShowRegister(){
        if($this->authHelper->loggedIn()) {
            header("Location: ".BASE_URL."home"); 
        }
        $this->view->MostrarRegistro();
    }
    
    function ShowLogin(){
        if($this->authHelper->loggedIn()) {
            header("Location: ".BASE_URL."home"); 
        }
        $this->view->MostrarLogin();
    }

    function register() {
        if (isset($_POST['email']) && isset($_POST['pass'])) {
            var_dump('hola');
            $user = $_POST['email'];
            $userPassword = password_hash($_POST['pass'], PASSWORD_BCRYPT);
            
            $userEmail = $this->model->getUser($user); //obtengo el email si es que hay

            if(!$userEmail) {
                $this->model->insertUsuario($user, $userPassword);
                $this->verifyLogin();
            } else {
                $error = "Usuario existente";
                $this->view->MostrarRegistro($error);
            }
        }
    }

    function verifyLogin(){
        
        if(!empty($_POST['email']) && !empty($_POST['pass'])) {
            var_dump('hola');
            $email = $_POST['email'];
            $password = $_POST['pass'];

            $user = $this->model->getUser($email);

            if($user && password_verify($password, $user->Password)) {
                if(session_status() === PHP_SESSION_NONE) session_start();  
                $_SESSION['Email'] = $email;
                $_SESSION['Rol'] = $user->Rol;
                $_SESSION['Id_usuarios'] = $user->Id_usuarios;
                $this->view->MostrarInicio();
            } else {
                $this->view->MostrarLogin("Acceso denegado");
            }
        }
    }

    function logout(){
        if($this->authHelper->loggedIn()) {
            session_destroy();
        }
        $this->view->MostrarLogin("Deslogueado");
    }

    function showUsuarios() {
        $this->authHelper->checkLoggedIn();
        if($this->authHelper->getRole() == 2) {
            $usuarios = $this->model->getUsuarios();
            $this->view->showUsuarios(true, $usuarios);
        } else {
            header("Location: ".BASE_URL."home");
        }
    }

    function eliminarUsuario($id) {
        $this->model->eliminarUsuario($id);
        $this->showUsuarios();
    }

    function modificarUsuario($id) {
        $usuario = $this->model->getUserById($id);
        if ($usuario) {
            $this->authHelper->checkLoggedIn();
            $this->view->formularioUsuario($usuario);
        }
    }

    function updateUsuario() {
    if (isset($_POST['email']) && isset($_POST['rol']) && $_POST['rol'] > 0  && $_POST['rol'] < 3) {
        $this->model->updateUsuario($_POST['Id_usuarios'], $_POST['email'], $_POST['rol']);
        $this->showUsuarios();
        } else {
            $error = 'Parámetros mal ingresados';
            $this->view->modificarUsuario($this->model->getUserById($_POST['Id_usuarios']), $error);
        }
    }
}
