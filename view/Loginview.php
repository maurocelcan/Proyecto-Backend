<?php 
require_once "libs/smarty-3.1.39/libs/Smarty.class.php";

class LoginView {
    private $smarty;
    
    function __construct(){
        $this->smarty = new Smarty();
    }
    function MostrarLogin($error = null){
        $this->smarty->assign('base_url', BASE_URL);        
        $this->smarty->assign('logueado', false);
        $this->smarty->assign('Rol', 0);
        $this->smarty->assign('error', $error);
        $this->smarty->display('./template/login.tpl');
    }
    function MostrarRegistro($error = null){
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('logueado', false);
        $this->smarty->assign('Rol', 0);
        $this->smarty->assign('error', $error);
        $this->smarty->display('./template/register.tpl');
    }

    function showUsuarios($logueado, $usuarios) {
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('Rol', 2);
        $this->smarty->assign('logueado', true);
        $this->smarty->assign('usuarios', $usuarios);
        $this->smarty->display('./template/usuariosList.tpl');
    }

    function formularioUsuario($usuario, $error = null){
        $this->smarty->assign('base_url', BASE_URL); 
        $this->smarty->assign('logueado', true);
        $this->smarty->assign('Rol', 2);
        $this->smarty->assign('usuario', $usuario);
        $this->smarty->assign('error', $error);
        $this->smarty->display('template/formularioUsuario.tpl');
    }

    function MostrarInicio(){
        header("Location: ".BASE_URL."home"); 
    }
}