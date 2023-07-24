{include file="./header.tpl"}

<div class="row justify-content-md-center">
  <div class="col-11">
    <div class="p-md-3 m-md-3 container bg-light">
      <h3 class="text-center m-md-3 p-md-3"> Modificar Usuario </h3>
      <form action="{$base_url}updateUsuario" method="post">
        <div class="row mb-3">
          <label class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
            <input type="text" class="form-control" id="email" name="email" value="{$usuario->Email}" required>
          </div>
        </div>
        <div class="row mb-3">
          <label class="col-sm-2 col-form-label">Rol</label>
          <div class="col-sm-10">
            <input type="number" class="form-control" id="rol" name="rol" value="{$usuario->Rol}" required>
          </div>
        </div>
        <input type="number" name="Id_usuarios" id="Id_usuarios" hidden required value="{$usuario->Id_usuarios}">
        {if $error}
          <div class="container alert alert-danger" role="alert">
              {$error}
          </div>
        {/if}
        <button type="submit" class="btn btn-primary">Modificar</button>
      </form>
    </div>
  </div>
</div>

{include file="./footer.tpl"}