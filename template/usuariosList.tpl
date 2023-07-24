{include file="./header.tpl"}

<div class="row justify-content-md-center">
    <div class="col-11">

        <div class="container text-center">
            <h2 class="text-center m-md-3 p-md-3">Usuarios</h2>
        </div>
        <div class="row border p-1">
            <div class="row">
                <div class="col-3">
                    <h5> Id Usuario </h5>
                </div>
                <div class="col-3">
                    <h5> Email </h5>
                </div>
                <div class="col-3">
                    <h5> Rol </h5>
                </div>
            </div>
            <div class="accordion accordion-flush p-md-2 m-md-3">
                {foreach from=$usuarios item=$usuario}
                    <div class="row">   
                        <div class="row p-md-1 m-md-1"> 
                            <div class="col-3"> {$usuario->Id_usuarios} </div>
                            <div class="col-3"> {$usuario->Email} </div>
                            <div class="col-3"> {$usuario->Rol} </div>
                            <div class="col-3">
                                <a class="btn btn-outline-primary btn-sm float-right" href="{$base_url}modificarUsuario/{$usuario->Id_usuarios}">Modificar</a>
                                <a class="btn btn-outline-warning btn-sm float-right" href="{$base_url}eliminarUsuario/{$usuario->Id_usuarios}">Eliminar</a>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>

{include file="./footer.tpl"}