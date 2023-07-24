    <footer class="footercustom">
        <div class="row">
            <div class="col-md-6">
                <h3>Mapa de sitio</h3>
                <ul class="nodecoration">
                    <li class="p-md-1">Inicio</li>
                    {if $logueado}   
                        {if $Rol == 2}
                            <li class="p-md-1"><a href="{BASE_URL}ShowAdmin" class="btn btn-outline-warning">Sumar Alojamiento</a></li>
                            <li class="p-md-1"><a href="{BASE_URL}showFormCity" class="btn btn-outline-warning">Sumar Ciudad</a></li>
                        {/if} 
                    {/if}
                </ul>
            </div>
            <div class="col-md-6">   
                <h3>Datos de contacto</h3>
                <ul class="nodecoration">
                    <li class="p-md-1">Telefono</li>
                    <li class="p-md-1">Email</li>
                    <li class="p-md-1">Instagram</li>
                </ul>
            </div>
        </div>
        <div class="container-fluid">
            <p class="text-center prueba">© Derechos Reservados | Mauro & Leon </p>

        </div>
    </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</body>
</html>