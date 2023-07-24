<?php
require_once "libs/smarty-3.1.39/libs/Smarty.class.php";

class CityView{
    private $smarty;
    
    function __construct() {
        $this->smarty = new Smarty();
    }

    function showFormCity($logueado, $rol){
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('Rol' , $rol);
        $this->smarty->display('template/showFormCity.tpl');
    }
    function modificarCiudad($ciudad, $rol, $logueado ){
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('Rol' , $rol);
        $this->smarty->assign('ciudad', $ciudad);
        $this->smarty->display('template/actualizarCiudad.tpl');
    }
    
}