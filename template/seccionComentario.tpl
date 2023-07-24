<div class="row justify-content-md-center container ">
    <div class="col-11">
        <div class="container p-md-2 m-md-3 bg-light">
            <div id="rol" data-rol="{$Rol}" hidden></div>
            {if $Rol > 0 }
                <form id="form" action="{$base_url}enviarComentario" method="post">
                    <div class="form-floating m-md-3">
                        <textarea id="comentario" class="form-control" style="height: 100px"></textarea>
                        <label>Comenta aquí </label>
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
            {include file="../Vue/comentarios.tpl"}
        </div>   
    </div>
</div>

<script src="../js/app.js"></script>