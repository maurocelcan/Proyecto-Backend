{include file="./header.tpl"}

<div class="formulario-admin bg-primary text-light">
    <h2>Agregar Ciudad</h2>

    <form action="agregarCiudad" method="post">
        <div class="mb-3">
            <label class="form-label">Ciudad</label>
            <input type="text" class="form-control" placeholder="Ciudad" name="ciudad" required>
        </div>
        <input type="submit" class="btn btn-light" value="Agregar">
    </form>
</div>

{include file="./footer.tpl"}