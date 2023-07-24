{include file="./header.tpl"}

<div class="formulario-admin bg-primary text-light">
    <h2>Actualizar Alquiler</h2>

    <form action="actualizarAlojamiento" method="post">
        <div class="mb-3">
            <label  class="form-label">Titulo</label>
            <input type="text" class="form-control" value="{$alojamiento->Titulo}" name="titulo" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Descripcion</label>
            <input type="text" class="form-control" value="{$alojamiento->Descripcion}" name="descripcion">
        </div>
        <div class="mb-3 ">
            <label class="form-label">Contacto</label>
            <input type="number" class="form-control" value="{$alojamiento->Contacto}" name="contacto">
        </div>
        <div class="mb-3 ">
            <label class="form-label">Tipo</label>
            <input type="text" class="form-control" value="{$alojamiento->Tipo}" name="tipo">
        </div>
        <div class="mb-3 ">
            <select class="form-select select-admin" name="ciudad">
                {foreach from=$categorias item=$categoria }
                    <option name="{$categoria->Ciudad_id}" value="{$categoria->Ciudad_id}">{$categoria->ciudad}</option>
                {/foreach}
            </select>
        </div>
        <input type="number" name="id" id="id" hidden required value="{$alojamiento->Id}">
        <input type="submit" class="btn btn-light" value="Actualizar">
    </form>
</div>

{include file="./footer.tpl"}