{include file="./header.tpl"}

<div class="clasificados">
        {foreach from=$tipos item=$tipo }
        
            <div class="card text-white bg-primary mb-3" style="width: 18rem;">
                <img src="images/1.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">{$tipo->Titulo}</h5>
                    <p class="card-text">{$tipo->Contacto}</p>
                    <a href="ShowDetails/{$tipo->Id}" class="btn btn-primary">Ver Mas</a>
                </div>
            </div>
        {/foreach}
</div>

{include file="./footer.tpl"}

