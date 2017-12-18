function MENSAJE(texto)
{
    alert(texto);
}
function unhide(a)
            {
            document.getElementById(a).style.visibility = "visible";
            }
function hide(a)
            {
            document.getElementById(a).style.visibility = "hidden";
            }
    function unlock(a)
            {
            document.getElementById(a).disabled = false;
            }
    function lock(a)
            {
            document.getElementById(a).disabled = true;
            }
    function compruebatxt(control,maximoCaracteres,controlaff){
        var elemento=document.getElementById(control);
        if(elemento.value.length < maximoCaracteres) {
            elemento.focus()
            alert("Por favor ingrese "+maximoCaracteres+" caracteres")
        }
        else {
            unlock(controlaff)
        }
    }
    function limita(elEvento,control,maximoCaracteres,controlaff,tipocar) {
        var elemento = document.getElementById(control);
        if (elEvento.keyCode==8) return true;
        if(elemento.value.length+1 == maximoCaracteres-1) {
            unlock(controlaff)
        }
        if(elemento.value.length >= maximoCaracteres) {
        alert("Ingrese solo "+maximoCaracteres+" caracteres")
        return false;
        }
    else {
        return permite(elEvento,tipocar);
    }
    }
    function permite(elEvento, permitidos) {
// Variables que definen los caracteres permitidos
    var numeros = "0123456789";
    var caracteres = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ";
    var numeros_caracteres = numeros + caracteres;
// Seleccionar los caracteres a partir del parámetro de la función
    switch(permitidos) {
    case 'num':
    permitidos = numeros;
    break;
    case 'car':
    permitidos = caracteres;
    break;
    case 'num_car':
    permitidos = numeros_caracteres;
    break;
    }
    // Obtener la tecla pulsada
    var evento = elEvento || window.event;
    var codigoCaracter = evento.charCode || evento.keyCode;
    var caracter = String.fromCharCode(codigoCaracter);
    // Comprobar si la tecla pulsada se encuentra en los caracteres permitidos
    return permitidos.indexOf(caracter) != -1;
    }

 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */