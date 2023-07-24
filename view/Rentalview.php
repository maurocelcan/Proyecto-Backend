<?php
require_once "libs/smarty-3.1.39/libs/Smarty.class.php";
require_once "view/Loginview.php";

class RentalView{

    private $smarty;

    function __construct() {
        $this->smarty = new Smarty();    
    }

    function MostrarInicio($rental , $categorias, $ciudades, $logueado, $rol, $error = null) {   
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('rental', $rental);
        $this->smarty->assign('categorias', $categorias);
        $this->smarty->assign('ciudades', $ciudades);       
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('Rol' , $rol);
        $this->smarty->assign('error' , $error);
        $this->smarty->display('template/main.tpl');
    }


    function MostrarDetalles($detalle, $logueado, $rol, $id_user = null, $error = null){
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('detalle', $detalle);
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('Rol', $rol);
        $this->smarty->assign('Id_usuarios', $id_user);
        $this->smarty->assign('error', $error);
        $this->smarty->display('template/detalles.tpl');
    }


    function MostrarFiltrado($tipo, $logueado, $rol){
        $this->smarty->assign('base_url', BASE_URL); 
        $this->smarty->assign('tipos', $tipo);
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('Rol', $rol);
        $this->smarty->display('template/categorias.tpl');
    }


    function MostrarAdmin($categorias, $logueado, $rol){
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('categorias', $categorias);
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('Rol', $rol);
        $this->smarty->display('template/admin.tpl');
    } 

    function modificarAlojamiento($alojamiento, $categorias, $logueado, $rol){
        $this->smarty->assign('base_url', BASE_URL);
        $this->smarty->assign('logueado' , $logueado);
        $this->smarty->assign('categorias', $categorias);
        $this->smarty->assign('alojamiento', $alojamiento);
        $this->smarty->assign('Rol', $rol);
        $this->smarty->display('template/actualizarAlojamiento.tpl');
    }
}