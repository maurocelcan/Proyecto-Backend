<?php

require_once 'libs/Router.php';
require_once './controller/ApiComentarioController.php';

$router = new Router(); 

$router->addRoute('comentarios/rental/:ID', 'GET', 'ApiComentarioController', 'getComentarios'); //id rental
//$router->addRoute('comentarios/rental/:ID', 'GET', 'ApiComentarioController', 'getComentario');
$router->addRoute('comentarios/:ID', 'DELETE', 'ApiComentarioController', 'eliminarComentario'); //id comentario
$router->addRoute('comentarios/rental/:ID', 'POST', 'ApiComentarioController', 'insertarComentario'); //id rental

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);