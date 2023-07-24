{include file="./header.tpl"}

<div class="row justify-content-md-center">
      
    <div class="container p-md-5 m-md-3 text-center bg-light">
            <h1 class="p-md-3 m-md-3">Log In</h1>
            <form class="text-center" action="login" method="post">
                <div class="d-grid gap-2 col-5 mx-auto">
                    <div class="p-md-1">
                        <input type="text" class="form-control" name="email" id="email" placeholder="Email" required>
                    </div>
                    <div class="p-md-1">
                        <input type="password" class="form-control" name="pass" id="pass" placeholder="Clave" required>
                    </div>
                    <div class="p-md-1">
                        <input type="submit" class="btn btn-primary" value="Entrar">
                    </div>
                </div>
            </form>     
            {if $error}
                <div class="container alert alert-danger" role="alert">
                    {$error}
                </div>
            {/if}
        </div>

</div>

{include file="./footer.tpl"}