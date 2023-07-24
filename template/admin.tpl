{include file="./header.tpl"}

<div class="formulario-admin bg-primary text-light">
    <h2>Crear Alquiler</h2>

    <form action="insertarRental" method="post">
        <div class="mb-3">
            <label class="form-label">Titulo</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="titulo"
                required>
        </div>
        <div class="mb-3">
            <label class="form-label">Descripcion</label>
            <input type="text" class="form-control" id="exampleInputPassword1" name="descripcion">
        </div>
        <div class="mb-3 ">
            <label class="form-label">Contacto</label>
            <input type="number" class="form-control" id="exampleCheck1" name="contacto">
        </div>
        <div class="mb-3 ">
            <label class="form-label">Tipo</label>
            <input type="text" class="form-control" id="exampleCheck1" name="tipo">
        </div>
        <div class="mb-3 ">
            <select class="form-select select-admin" name="ciudad" >
                {foreach from=$categorias item=$categoria }
                    <option name="{$categoria->Ciudad_id}" value="{$categoria->Ciudad_id}">{$categoria->ciudad}</option>
                {/foreach}

            </select>
        </div>
        <input type="submit" class="btn btn-light" value="Guardar">
    </form>
</div>

{include file="./footer.tpl"}