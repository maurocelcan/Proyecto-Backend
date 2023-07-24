<?php

require_once './view/Loginview.php';

class AuthHelper{

    function checkLoggedIn(){ //chequea si esta logueado
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(!isset($_SESSION['Email'])) {
            header("Location: ".BASE_URL);
        }
    }

    function getRole() {
        if(session_status() === PHP_SESSION_NONE) session_start(); //si no esta iniciada la sesion la inicia
        if(isset($_SESSION['Email'])) {
            return $_SESSION['Rol']; //obtengo el rol
        } else {
            return 0;
        }
    }

    function loggedIn(){ 
        if(session_status() === PHP_SESSION_NONE) session_start();
        return $this->getRole() > 0;
    }  
  
    function getUserID(){
        if(session_status() === PHP_SESSION_NONE) session_start();
        if(isset($_SESSION['Id_usuarios'])){
            return  $_SESSION['Id_usuarios'];
        } else {
            return null;
        }
    }
}