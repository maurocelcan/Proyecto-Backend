{include file="./header.tpl" }

<div>
    <h2 class="display-2 text-primary " style="text-align: center;">Catalogo</h2>
    <hr style="width: 50%; margin: auto;">
    <div class="categorias row justify-content-md-center">
    {if $error}
        <div class="container alert alert-danger" role="alert">
            {$error}
        </div>
    {/if}
            <h2 class="text-center">Tipo</h2>
            {foreach from=$categorias item=$categoria }
                <a href="ShowCategory/{$categoria->Tipo}" class="btn btn-outline-primary btn-categoria">{$categoria->Tipo}</a>
            {/foreach}
            
            <h2 class="text-center">Ciudad</h2>
            {foreach from=$ciudades item=$ciudad}
                <a href="ShowCategoryCiudad/{$ciudad->Ciudad_id}" class="btn btn-outline-primary btn-categoria">{$ciudad->ciudad}</a>
                {if $logueado}
                    {if $Rol == 2}
                        <a class="btn btn-outline-danger" href="{BASE_URL}eliminarCategoria/{$ciudad->Ciudad_id}" >X</a>
                        <a class="btn btn-outline-danger" href="{BASE_URL}modificarCiudad/{$ciudad->Ciudad_id}" >M</a>    
                    {/if}                       
                {/if}
            {/foreach}
    </div>
    <div class="clasificados">
        {foreach from=$rental item=$rent}
        
            <div class="card text-white bg-dark mb-3 border cards" style="width: 18rem;">
                <img src="images/1.png" class="card-img-top">
                <div class="card-body">
                    <h5 class="card-title">{$rent->Titulo}</h5>
                    <p class="card-text">{$rent->Contacto}</p>
                    <a href="ShowDetails/{$rent->Id}" class="btn btn-warning">Ver Mas</a>
                </div>
            </div>
        {/foreach}
    </div>
</div>

{include file="./footer.tpl" }

