<?php
require_once "controller/Rentalcontroller.php";
require_once "controller/Logincontroller.php";
require_once "controller/CityController.php";

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home'; 
}

$rentalController = new RentalController();
$loginController = new LoginController(); 
$cityController = new CityController();

$params = explode('/', $action);

switch ($params[0]) {
    case 'home':  
        $rentalController->ShowHome();
        break;
    case 'ShowDetails':
        $rentalController->ShowDetails($params[1]); 
        break;
    case 'login':
        $loginController->verifyLogin();
        break;
    case 'ShowCategory':
        $rentalController->ShowCategory($params[1]); 
        break;
    case 'ShowAdmin':
        $rentalController->ShowAdmin(); 
        break;
    case 'insertarRental':
        $rentalController->insertarRental(); 
        break;
    case 'ShowCategoryCiudad':
        $rentalController->ShowCategoryCiudad($params[1]); 
        break;
    case 'ShowLogin':
        $loginController->ShowLogin(); 
        break;
    case 'eliminarAlojamiento':
        $rentalController->eliminarAlojamiento($params[1]);
        break;
    case 'logout':
        $loginController->logout();
    case 'eliminarCategoria':
        $rentalController->eliminarCategoria($params[1]);
        break;
    case 'agregarCiudad':
        $cityController->agregarCiudad();
        break;
    case 'showFormCity':
        $cityController->showFormCity();
        break;
    case 'modificarCiudad':
        $cityController->modificarCiudad($params[1]);
        break;
    case 'actualizarCiudad':
        $cityController->actualizarCiudad();
        break;
    case 'modificarAlojamiento':
        $rentalController->modificarAlojamiento($params[1]);
        break;
    case 'actualizarAlojamiento':
        $rentalController->actualizarAlojamiento();
        break;
    case 'ShowRegister':
        $loginController->ShowRegister();
        break; 
    case 'register': 
        $loginController->register();
        break;
    case 'usuarios':
        $loginController->showUsuarios();
        break;
    case 'modificarUsuario':
        $loginController->modificarUsuario($params[1]);
        break;
    case 'eliminarUsuario':
        $loginController->eliminarUsuario($params[1]);
        break;
    case 'updateUsuario':
        $loginController->updateUsuario();
        break;
    default:
      "Problemas en la redireccion";
        break;
}
