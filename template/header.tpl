<!DOCTYPE html>
<html lang="en">
<head>
    <base href="{BASE_URL}"/>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- development version, includes helpful console warnings -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
    <title>Inmobiliaria</title>
</head>
<body>
<!--<nav class="navbar navbar-expand-md navbar-light border-3 bg-light  border-bottom border-primary">
        <div class="container-fluid">
           
            <a href="{BASE_URL}" class="navbar-brand">AlquileresArgentina</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                 <span class="navbar-toggler-icon"></span>
            </button>
            <div id="MenuNavegacion navbarNav" class="collapse navbar-collapse" >
                <ul class="navbar-nav ms-3">
                    <li class="nav-item"><a href="{BASE_URL}" class="nav-link">Inicio</a></li>
                    <li class="nav-item"><a href="{BASE_URL}" class="nav-link">Catálogo</a></li>
                    {if $Rol == 2 && $logueado}
                        <li class="nav-item "><a href="{BASE_URL}usuarios" class="nav-link">Usuarios</a></li>
                    {/if}
                    {if !$logueado}
                        <li class="nav-item"><a href="{BASE_URL}ShowLogin" class="nav-link">Ingreso</a></li>
                        <li class="nav-item"><a href="{BASE_URL}ShowRegister" class="nav-link">Registro</a></li>
                    {/if}
                    {if $logueado}
                        <li class="nav-item "><a href="{BASE_URL}logout" class="nav-link">Salir</a></li>
                    {/if}
                </ul>
            </div>
        </div>
</nav>-->

<nav class="navbar navbar-expand-md navbar-dark border-3 bg-dark  border-bottom border-warning">
  <div class="container-fluid">
    <h1><a href="{BASE_URL}" class="navbar-brand"><img src="./images/iconoF.png" style="height: 70px; width: 80px;">AlquilerPorDiaTandil</a></h1>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-3">
            <li class="nav-item"><a href="{BASE_URL}" class="nav-link">Inicio</a></li>
            <li class="nav-item"><a href="{BASE_URL}" class="nav-link">Catálogo</a></li>
            {if $Rol == 2 && $logueado}
                <li class="nav-item "><a href="{BASE_URL}usuarios" class="nav-link">Usuarios</a></li>
            {/if}
            {if !$logueado}
                <li class="nav-item"><a href="{BASE_URL}ShowLogin" class="nav-link">Ingreso</a></li>
                <li class="nav-item"><a href="{BASE_URL}ShowRegister" class="nav-link">Registro</a></li>
            {/if}
            {if $logueado}
                <li class="nav-item "><a href="{BASE_URL}logout" class="nav-link">Salir</a></li>
            {/if}
        </ul>
    </div>
  </div>
</nav>
