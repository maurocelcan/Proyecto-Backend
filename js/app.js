"use strict"

//constantes url
const API_URL = "api/comentarios/rental";
const API_URL_DELETE = document.location.href.split("ShowDetails")[0] + "api/comentarios"; //localhost/TP/ + api/comentarios
const URL_SPLITED = document.location.href.split("ShowDetails")[0] + API_URL; //localhost/TP/ + api/comentarios/rental

const ID_RENTAL = document.querySelector('#rental').getAttribute('data-alojamiento');
const ROLUSER = document.querySelector("#rol").getAttribute("data-rol");

if (ROLUSER > 0 ) { //solo asigno el evento submit al boton Comentar si hay alguien logueado
    document.querySelector('#form').addEventListener('submit', agregarComentario);
}

let app = new Vue({
    el: "#app", //contenedor donde uso vue en el tpl
    data : {
        comentarios: [],
        Rol: ROLUSER
    }  
})

async function getComentarios(){
    try {
        let response = await fetch(`${URL_SPLITED}/${ID_RENTAL}`); //localhost/TP/api/comentarios/rental/id_rental
        if(response.status == 200) { //si hay comentarios para que vue renderize
            let comentarios = await response.json();
            app.comentarios = comentarios;  
        } else {
            if (response.status == 204) {
                app.comentarios = ""; //si no hay cometarios para mostrar le paso a vue ""
            }
        }        
    } catch (e){ 
        console.log(e);
    }   
}

async function agregarComentario(e) {   
    e.preventDefault();

    let id_usuario = document.getElementById('id_user').getAttribute('data-id_user'); //esta en el tpl de seccionComentario
    let puntaje = document.querySelector('#puntaje').value;
    let comentario = document.querySelector('#comentario').value;

    let nuevoComentario = {
        puntaje: puntaje,
        comentario: comentario,
        id_user: id_usuario,
        id_alojamiento: ID_RENTAL 
    }

    console.log(nuevoComentario);
    console.log(`${URL_SPLITED}/${ID_RENTAL}`);

    try {
        let res = await fetch(`${URL_SPLITED}/${ID_RENTAL}`, {
            "method": "POST",
            "headers": { "Content-type": "application/json" },
            "body": JSON.stringify(nuevoComentario),
        })
        if (res.status == 200 ){
            window.location.reload();
        }
    } catch (error) {
        console.log(error);
    }
}


async function eliminarComentario(id_comentario){
    try {
        let response = await fetch (`${API_URL_DELETE}/${id_comentario}`,{ //localhost/TP/api/comentarios/id_comentario
            "method" : "DELETE"
        });
        if (response.status == 200){
            await getComentarios();
        }
    } catch(e){
        console.log(e);
    }
}

document.addEventListener('DOMContentLoaded', async() =>{
    await getComentarios();
    //Una vez que esta la pagina totalente cargada-->Que ya paso por el VUE
    
    if (ROLUSER == 2) { //si soy admin puedo ver los botones de eliminar entonces les asigno el evento click
        let botones = document.querySelectorAll("#app button");

        for (const boton of botones){
            boton.addEventListener("click", async ()=>{
                const id_comentario = boton.id;
                await eliminarComentario(id_comentario);        
            })
        }
    }  
    
    })

