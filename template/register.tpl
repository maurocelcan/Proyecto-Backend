{include file="./header.tpl"}

<div class="formulario-admin bg-primary text-light">
    <h2>Registro</h2>

    <form action="register" method="post">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" required>
        </div>
        <div class="mb-3 ">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="pass" required>
        </div>
        {if $error}
            <div class="container alert alert-danger" role="alert">
                {$error}
            </div>
        {/if}
        <input type="submit" class="btn btn-light" value="Registrarse">
    </form>
</div>

{include file="./footer.tpl"}