{include file="./header.tpl"}

<div class="row justify-content-md-center container ">
    <div class="col-11">
        <div class="container p-md-5 m-md-3 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Detalles del alojamiento</h2>
                        <div class="d-grid mx-auto">
                            <ul>
                                <li><h4 id="rental" data-alojamiento="{$detalle->Id}" >{$detalle->Titulo}</h4></li>
                                <li><h4>{$detalle->Descripcion}</h4></li>
                                <li><h3>{$detalle->Contacto}</h3></li>
                                <li><h4>{$detalle->Tipo}</h4></li>
                                <li><h4>{$detalle->ciudad}</h4></li>
                            </ul>
                        </div>
                    </div>
                </div>
                {if $logueado} 
                    <a class="btn btn-warning" href="{BASE_URL}eliminarAlojamiento/{$detalle->Id}">Eliminar</a>
                    <a class="btn btn-danger" href="{BASE_URL}modificarAlojamiento/{$detalle->Id}">Modificar</a>     
                {/if}
                {if $error} 
                    <div class="alert alert-danger" role="alert">{$error}</div>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="row justify-content-md-center container ">
    <div class="col-11">
        <div class="container p-md-2 m-md-3 bg-light">
            <div id="rol" data-rol="{$Rol}" hidden></div>
            {if $Rol > 0 }
                <form id="form" action="{$base_url}enviarComentario" method="post">
                    <div class="m-md-3">
                        <label class="form-label">Comenta aquí: </label>
                        <textarea id="comentario" class="form-control" style="height: 100px"></textarea>
                        <label class="form-label mt-2">Puntaje: </label>
                        <div id="id_user" data-id_user="{$Id_usuarios}" class="input-group mt-2">
                            <select id="puntaje" class="form-select" id="puntaje" required>
                                <option selected value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                            <button  class="btn btn-outline-secondary bg-dark" type="submit">Comentar</button>
                        </div>
                    </div>
                </form>               
            {/if} 

            {include file="./Vue/comentarios.tpl"}

        </div>   
    </div>
</div>

<script src="./js/app.js"></script>

{include file="./footer.tpl"}
