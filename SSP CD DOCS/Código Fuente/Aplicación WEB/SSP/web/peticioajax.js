/*PETICIONES AJAX PARA COMBOS ANIDADOS*/
var peticion = false;
var  testPasado = false;
try {
  peticion = new XMLHttpRequest();
  } catch (trymicrosoft) {
  try {
  peticion = new ActiveXObject("Msxml2.XMLHTTP");
  } catch (othermicrosoft) {
  try {
  peticion = new ActiveXObject("Microsoft.XMLHTTP");
  } catch (failed) {
  peticion = false;
  }
  }
}
if (!peticion)
alert("ERROR AL INICIALIZAR!");
function cargarCombo (url, comboAnterior, element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior)
    var x = valordepende.value
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&control='+cmbaff+'&SProc='+sp+ '&random=' + Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}
function cargarComboN1 (url, comboAnterior,comboAnterior2, element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior)
    var valordepende2 = document.getElementById(comboAnterior2)
    var x = valordepende.value
    var y = valordepende2.value
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&Id2='+y+'&control='+cmbaff+'&SProc='+sp+ '&random=' + Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}
function cargarComboN2 (url, comboAnterior,comboAnterior2,comboAnterior3, element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior)
    var valordepende2 = document.getElementById(comboAnterior2)
    var valordepende3 = document.getElementById(comboAnterior3)
    var x = valordepende.value
    var y = valordepende2.value
    var z = valordepende3.value
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&Id2='+y+'&Id3='+z+'&control='+cmbaff+'&SProc='+sp+ '&random=' + Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}
function cargarcslt (url,CONTROLDEP1,CONTROLDEP2,CONTROLDEP3,CONTROLDEP4,element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(CONTROLDEP1)
    var valordepende2 = document.getElementById(CONTROLDEP2)
    var valordepende3 = document.getElementById(CONTROLDEP3)
    var valordepende4 = document.getElementById(CONTROLDEP4)
    var x = valordepende.value
    var y = valordepende2.value
    var z = valordepende3.value
    var w = valordepende4.value
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&Id2='+y+'&Id3='+z+'&Id4='+w+'&control='+cmbaff+'&SProc='+sp+'&random='+Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}
function cargarcsltfast (url,CONTROLDEP1,CONTROLDEP2,CONTROLDEP3,CONTROLDEP4,CONTROLDEP5,CONTROLDEP6,element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(CONTROLDEP1)
    var valordepende2 = document.getElementById(CONTROLDEP2)
    var valordepende3 = document.getElementById(CONTROLDEP3)
    var valordepende4 = document.getElementById(CONTROLDEP4)
    var valordepende5 = document.getElementById(CONTROLDEP5)
    var valordepende6 = document.getElementById(CONTROLDEP6)
    var x = valordepende.value
    var y = valordepende2.value
    var z = valordepende3.value
    var w = valordepende4.value
    var u = valordepende5.value
    var v = valordepende6.value
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&Id2='+y+'&Id3='+z+'&Id4='+w+'&Id5='+u+'&Id6='+v+'&control='+cmbaff+'&SProc='+sp+'&random='+Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}

function cargarlist (url,comboAnterior,comboAnterior2,element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(comboAnterior)
    var valordepende2 = document.getElementById(comboAnterior2)
    var x = valordepende.value
    var y = valordepende2.value
    
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&Id2='+y+'&control='+cmbaff+'&SProc='+sp+'&random='+Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}
function ejecutarresp(){
    cargarCombo('compcombolg.jsp', 'txt_Area','div_perres','cmb_personal','CARGA_RESPONS');
    setTimeout("cargarCombo('compcombolg.jsp','txt_Area','div_combolg','txt_lg','BUSCAR_GRUPOS')",500);
    //setTimeout("cargarCombo('compcombolg.jsp', 'txt_lg','div_comboet', 'LET','BUSCAR_EQUIPOS')",1000);
}
function ejecutardeps(){
    cargarComboN2('compcombolg.jsp', 'cmb_niv1','cmd_defecto','cmb_categoria','div_cmbniv2','cmb_niv2','DEVOLVER_N2T');
    setTimeout("cargarCombo ('comboextra.jsp','cmb_niv1', 'div_cmbpos','cmb_pos','DEVOLVER_POSI1')",2000);
    setTimeout("unlock('btn_Guardar')",3000);
}
function ejecutarprs(){
    cargarComboN1('compcombolg.jsp', 'txt_lg', 'txt_Area','div_perres', 'cmb_personal','BUSCAR_PERSONAL');
    setTimeout("cargarComboN1('compcombolg.jsp', 'txt_lg', 'txt_Area','div_comboet', 'LET','BUSCAR_EQUIPOS')",500);
}
function buscarreps()
{
    cargarComboN1('compcombolg.jsp', 'cmd_defecto', 'cmb_categoria','div_cmbniv1', 'cmb_niv1','DEVOLVER_N1');
    setTimeout("cargarlist ('listareps.jsp','cmd_defecto','cmb_plataforma','div_reps','listaprb','DEVUELVE_DEFINI')",1000);
    setTimeout("cargarclave('compcombolg.jsp','listaprb','txtrep','cmb_ptoap', 'div_ndoc','coddoc','DEVOLVER_ULTIMO')",6000);
}
function ejecutardepsMNT(){
    cargarComboN2('compcomboMant.jsp', 'cmb_niv1','cmd_defecto','cmb_categoria','div_cmbniv2','cmb_niv2','DEVOLVER_N2T');
    setTimeout("cargarComboN2('compcomboMant.jsp','cmb_niv1','cmd_defecto','cmb_categoria','div_cmbpos','cmb_pos','DEVOLVER_POSI1T')",2000);
   // setTimeout("cargarlist ('listareps.jsp','cmd_defecto', 'cmb_niv1','cmb_plataforma','div_reps','listaprb','DEVUELVE_DEFINI')",4000);
   // setTimeout("cargarclave('compcombolg.jsp','listaprb','txtrep','id_usr', 'div_ndoc','coddoc','DEVOLVER_ULTIMO')",6000);
}
function ejecutardepsMOD(){
    cargarComboN2('compcomboAct.jsp', 'cmb_niv1','cmd_defecto','cmb_categoria','div_cmbniv2','cmb_niv2','DEVOLVER_N2T');
    setTimeout("cargarComboN2('compcomboAct.jsp','cmb_niv1','cmd_defecto','cmb_categoria','div_cmbpos','cmb_pos','DEVOLVER_POSI1T')",2000);
   // setTimeout("cargarlist ('listareps.jsp','cmd_defecto', 'cmb_niv1','cmb_plataforma','div_reps','listaprb','DEVUELVE_DEFINI')",4000);
   // setTimeout("cargarclave('compcombolg.jsp','listaprb','txtrep','id_usr', 'div_ndoc','coddoc','DEVOLVER_ULTIMO')",6000);
}
function ejecutardepsMODRX(){
    cargarComboN2('compcomboRX.jsp', 'cmb_niv1','cmd_defecto','cmb_categoria','div_cmbniv2','cmb_niv2','DEVOLVER_N2T');
    setTimeout("cargarComboN2('compcomboRX.jsp','cmb_niv1','cmd_defecto','cmb_categoria','div_cmbpos','cmb_pos','DEVOLVER_POSI1T')",2000);
    setTimeout("cargarCombo('compcomboRX.jsp','cmb_ptoap', 'div_ndoc','coddoc','DEVOLVER_ULTIMORX')",6000);
}
function ejecutarrespMNT(){
    cargarCombo('compcomboMant.jsp', 'txt_Area','div_perres','cmb_personal','CARGA_RESPONS');
    setTimeout("cargarCombo('compcomboMant.jsp','txt_Area','div_combolg','txt_lg','BUSCAR_GRUPOS')",500);
}
function ejecutarprsMNT(){
    cargarComboN1('compcomboMant.jsp', 'txt_lg', 'txt_Area','div_perres', 'cmb_personal','BUSCAR_PERSONAL');
    setTimeout("cargarComboN1('compcomboMant.jsp', 'txt_lg', 'txt_Area','div_comboet', 'LET','BUSCAR_EQUIPOS')",500);
}
function ejecutardepsYC(){
    cargarCombo ('compcombolgYC.jsp', 'cmb_niv1','div_cmbniv2','cmb_niv2','DEVOLVER_N2');
    setTimeout("cargarCombo ('comboextra.jsp','cmb_niv1', 'div_cmbpos','cmb_pos','DEVOLVER_POSI1')",500);
    //setTimeout("cargarlist ('listareps.jsp','cmd_defecto', 'cmb_niv1','cmb_plataforma','div_reps','listaprb','DEVUELVE_DEFINI')",1500);
    setTimeout("cargarclave('compcombolgYC.jsp','listaprb','txtrep','id_usr', 'div_ndoc','coddoc','DEVOLVER_ULTIMO')",3000);

}
function cargarid_doc(){
    cargarCombo('compcombolg.jsp', 'listaprb','div_repetitividad', 'txtrep','DEVOLVER_REPETITIVIDAD');
    setTimeout("cargarclave('compcombolg.jsp','listaprb','txtrep','cmb_ptoap', 'div_ndoc','coddoc','DEVOLVER_ULTIMO')",500);
}
function cargarclave (url, lista,repetitividad,usuario, element_id,cmbaff,SProc) {
    //Obtenemos el contenido del div
    //donde se cargaran los resultados
    var element =  document.getElementById(element_id);
    //Obtenemos el valor seleccionado del combo anterior
    var valordepende = document.getElementById(lista)
    var valordepende2 = document.getElementById(repetitividad)
    var valordepende3 = document.getElementById(usuario)
    var x = valordepende.value
    var y = valordepende2.value
    var z = valordepende3.value
    var sp= SProc
    //construimos la url definitiva
    //pasando como parametro el valor seleccionado
    var fragment_url = url+'?Id='+x+'&Id2='+y+'&Id3='+z+'&control='+cmbaff+'&SProc='+sp+ '&random=' + Math.random();
    element.innerHTML = '<img src="images/loading.gif" />';
    //abrimos la url
    peticion.open("GET", fragment_url);
    peticion.onreadystatechange = function() {
        if (peticion.readyState == 4) {
	//escribimos la respuesta
	element.innerHTML = peticion.responseText;
        }
    }
   peticion.send(null);
}
