{literal}

    <h3  class="m-md-3 text-center">Comentarios</h3>            
    <div id="app" class="row">
        <div v-for="comentario in comentarios" class="col-4">
        <div class="card text-dark bg-light mb-3" >
                <div class="card-header">{{comentario.user}}</div>
                <div class="card-body">
                    <p class="card-text">{{comentario.comentario}}</p>
                    <h5 class="card-title">Puntuacion: {{comentario.puntaje }} </h5>
                    <div id="id_comentario" hidden>{{comentario.id_comentario}}</div>
                    <button v-if="Rol == 2" type="button" v-bind:id="comentario.id_comentario" class="btn btn-primary">Eliminar Comentario</button>
                </div>
            </div>
        </div>
    </div>
    
                
{/literal}