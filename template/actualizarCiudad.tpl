{include file="./header.tpl"}

<div class="formulario-admin bg-primary text-light">
    <h2>Modificar Ciudad</h2>

    <form action="actualizarCiudad" method="post">
        <div class="mb-3">
            <label class="form-label">Ciudad</label>
            <input type="text" class="form-control" placeholder="Ciudad" name="ciudad" value="{$ciudad->ciudad}" required>
            <input type="number" name="id" id="id" hidden  required value="{$ciudad->Ciudad_id}">  
        </div>
        <input type="submit" class="btn btn-light" value="Actualizar">
    </form>
</div>

{include file="./footer.tpl"}