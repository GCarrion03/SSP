<%--
    Document   : Cinco_pasos
    Created on : 04-28-2010, 11:33:41 AM
    Author     : Guz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
    <head>
         <script type="text/javascript" src="peticioajax.js"></script>
         <script type="text/javascript" src="referencias.js"></script>
         <script type="text/javascript">
            // width to resize large images to
            var maxWidth=320;      // height to resize large images to
            var maxHeight=200;      // valid file types
            var fileTypes=["bmp","gif","png","jpg","jpeg"];      // the id of the preview image tag
            var outImage="previewField";      // what to display when the image is not valid
            var defaultPic="images/LOGO_GM.jpg";
            /***** DO NOT EDIT BELOW *****/
            function preview(what){
            var source=what.value;
            alert (what.value);
            var ext=source.substring(source.lastIndexOf(".")+1,source.length).toLowerCase();
            for (var i=0; i<fileTypes.length; i++){
                if (fileTypes[i]==ext){
                    break;
                }
            }
            globalPic=new Image();
            if (i<fileTypes.length){
                //Obtenemos los datos de la imagen de firefox
                try{
                    globalPic.src=what.files[0].getAsDataURL();
                }
                catch(err){
                    globalPic.src=source;
                }
            }else {
                globalPic.src=defaultPic;
                alert("ESTA NO ES UNA IMAGEN VALIDA por favor escoge una imagen de tipo:nn"+fileTypes.join(", "));
            }
            setTimeout("applyChanges()",200);
        }
        var globalPic;
        function applyChanges(){
            var field=document.getElementById(outImage);
            var x=parseInt(globalPic.width);
            var y=parseInt(globalPic.height);
            if (x>maxWidth) {
                y*=maxWidth/x;
                x=maxWidth;
            }
            if (y>maxHeight) {
                x*=maxHeight/y;
                y=maxHeight;
            }
            field.style.display=(x<1 || y<1)?"none":"";
            field.src=globalPic.src;
            field.width=x;
            field.height=y;
        }      // End -->
		</script>
         <style type="text/css">
/* pushes the page to the full capacity of the viewing area */
html {height:100%;}
body {height:100%; margin:0; padding:0;}
/* prepares the background image to full capacity of the viewing area */
#bg {position:fixed; top:0; left:0; width:100%; height:100%;}
/* places the content ontop of the background image */
#content {position:relative; z-index:1;}
</style>
<!--[if IE 6]>
<style type="text/css">
/* some css fixes for IE browsers */
html {overflow-y:hidden;}
body {overflow-y:auto;}
#bg {position:absolute; z-index:-1;}
#content {position:static;}
</style>
<![endif]-->
     <script language = "JavaScript">
function abrir(url,largo,altura) { 
open(url,'','top=200,left=400,width=200,height=300') ; 
} 
function alo(inform)
        {
             alert(inform.cmb_niv2.value);
        }
     <%--function carga_usr()
     {
         document.formdoc.id_usr.value=document.formdoc.cmb_ptoap.value;
         cargarCombo('compcombolg.jsp', 'cmb_ptoap','div_iniciador','cmb_iniciador','MOSTRAR_INICIADOR')
     }--%>
     function abrirdoc()
     {
         var urlda
         urlda="Herraadic.jsp"
     if (document.formdoc.coddoc.value!= "")
         {
     if ((document.formdoc.tam.checked))
         {
         urlda=urlda+"?Taman=1"
         }else
             {
                 urlda=urlda+"?Taman=0"
             }
         if ((document.formdoc.FMEAS.checked))
         {
         urlda=urlda+"&fmeas=1"
         }
         else
         {
             urlda=urlda+"&fmeas=0"
         }
         urlda=urlda+"&iddoc="+document.formdoc.coddoc.value;
         window.open(urlda,"Herramienta_adicional","")
         }else{
             alert("Llene los datos del documento principal primero");
         }
     }
    function submitform()
{
    document.forms["formdoc"].submit();
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Apertura documento</title>
        <link rel="shortcut icon" href="images/favicon.ico">
    <style type="text/css">
<!--
-->
    </style>
    <link href="Estilos carpeta/estilo fieldset.css" rel="stylesheet" type="text/css">
    <style type="text/css">
<!--
.style3 {font-size: 14%}
body,td,th {
	font-family: Times New Roman, Times, serif;
	font-size: 100%;
}
-->
    </style>
</head>
    <body style="background-color: transparent;position:absolute">
        <h2 align="center">Ingreso nuevo documento</h2>
    <table width="100%" border="0" align="center">
  <tr>
    <td>
        <form name="formdoc"  method="post" action="reporteini.jsp?var=<%=request.getParameter("var")%>" ENCTYPE="multipart/form-data">
        <table width="100%">
        <tr> <td width="50%">
        <fieldset class="fieldset">
        <legend>Información Registro:</legend>
        <table width="100%" border="0" align="center" bordercolor="#990000">
          <tr>
            <TD width="10%" align="left" scope="row"><label>Codigo: </label></TD>
            <td width="35%" align="center">
             <div id="div_ndoc">
              <input type="text" name="coddoc" id="coddoc" style="width:95%" READONLY>
             </div>
            <input type="hidden" name="id_usr" id="id_usr" value="<%=request.getParameter("var")%>" size="30">            </td>
            <td width="16%" align="left">Tipo de documento: </td>
            <td width="39%" align="center"><select name="t_doc" id="t_doc" onChange="unlock('cmb_dpn')"  style="width:100%" >
               <option selected>Seleccione</option>
               <%=beanprincipal.devdoc()%>
            </select></td>
          </tr>
          <tr>
            <TD align="left" scope="row">Categoría DPN:</TD>
            <td align="center"><select name="cmb_dpn" id="cmb_dpn" onChange="unlock('cmb_escalonamiento')" style="width:100%;z-index:5" disabled>
              <option selected>Seleccione DPN</option>
              <%=beanprincipal.catBPD()%>
            </select></td>
            <td align="left">Escalonamiento: </td>
            <td align="center"><select name="cmb_escalonamiento" id="cmb_escalonamiento" style="width:100%;z-index:5" onChange="unlock('cmb_ptoap')"  disabled>
              <option selected>Seleccione</option>
              <%=beanprincipal.obtescalonamiento()%>
            </select></td>
          </tr>
        </table>
        </fieldset>
        </td><td width="50%"><fieldset class="fieldset">
        <legend>Información punto de apertura:</legend>
        <table width="100%" border="0" align="center" bordercolor="#990000">
          <tr>
            <TD width="30%" align="left" scope="row"><label>Punto de apertura: <br>
            </label></TD>
            <td colspan="5" align="left">
                <select name="cmb_ptoap" id="cmb_ptoap" style="width:100%;z-index:5" onchange="JavaScript:unlock('txt_turno')"  disabled>
              <option selected>Seleccione un punto de apertura</option>
              <%=beanprincipal.devuelve_dept()%>
            </select>
            <%--
                <input type="text" name="txt_puntoapert" id="txt_puntoapert" size="60" value="<%=beanprincipal.devuelve_dept(request.getParameter("var"))%>">--%></td>
            </tr>
            <TR>
            <TD align="left">Iniciado por:</TD>
            <TD colspan="5">
                <%beanprincipal.SETUSRMEN("OBTENER_NOMBRE_USUARIO",request.getParameter("var"),"MENU");%>
                <input type="text" id="txt_iniciador" name="txt_iniciador" value="<%=beanprincipal.getNombre_usr()%>">
                <%--<select name="cmb_dpn2" id="cmb_dpn2" style="width:100%;z-index:5" onchange="carga_usr()"  disabled>
                <option selected>Seleccione un punto de apertura</option>
                <%=beanprincipal.devuelve_dept()%>
                </select>--%>
            </TD>
            </TR>
            <tr>
            <TD align="left"> Fecha de apertura: </TD>
            <td width="30%"><%=beanprincipal.devolfch()%> </td>
            <td width="6%">Turno:</td>
            <td width="15%"><select name="txt_turno" id="txt_turno" style="width:100%;z-index:5" onChange="unlock('cmb_ponderacion')"  disabled>
              <option selected>Turno</option>
              <%=beanprincipal.obtturno()%>
            </select></td>
            <td width="10%">Criticidad:</td>
            <td width="15%"><select name="cmb_ponderacion" id="cmb_ponderacion" style="width:100%;z-index:5" onChange="unlock('cmb_plataforma')"  disabled>
              <option selected></option>
              <%=beanprincipal.obtponderacion()%>
            </select></td>
            </tr>
        </table>
        </fieldset>          
        
        </td></tr></table>
      <table width="100%" border="0"> 
      <tr>
     	<td width="40%" ><fieldset class="fieldset">
        <legend>Información del vehículo:</legend>
            <table width="100%">
              <tr>
                <td width="15%"><div align="center">Plataforma:</div></td>
                <td width="85%">
                    <select name="cmb_plataforma" id="cmb_plataforma" style="width:100%" onChange = "javascript:cargarCombo('compcombolg.jsp', 'cmb_plataforma','div_cmbmod','cod_modelo','MOSTRAR_MODELO')" disabled >
                        <option selected>Seleccione una plataforma</option>
                        <%=beanprincipal.obtplataforma()%>
                    </select>
                </td>
              </tr>
              <tr>
                <td align="center"><div align="center">Modelo:</div></td>
                <td align="center"><div id="div_cmbmod">
                  <select name="cmb_dpn3" id="cmb_dpn3" style="width:100%"  disabled>
                    <option selected>Seleccione una plataforma</option>
                    <%=beanprincipal.devuelve_dept()%>
                  </select>
                </div></td>
              </tr>
              <tr>
                <td><div align="center">P.V.I.:</div></td>
                <td><input type="text" name="txt_VIN" id="txt_VIN" onKeyPress="return limita(event,'txt_VIN', 9,'txtlote','num_car')" style="width:95%" disabled></td>
              </tr>
              <tr>
                <td><div align="center">Lote:</div></td>
                <td>
                  <input type="text" name="txtlote" id="txtlote" onKeyPress="return limita(event,'txtlote',4,'txt_Area','num_car')" style="width:95%" disabled>
                </td>
                
              </tr>
              <tr>
              <td> <div></div>
                </td>
              </tr>
            </table>
            </fieldset>  
      </td>
            <td width="40%">
            <fieldset class="fieldset">
        <legend>Información responsable:</legend>
        <table width="95%" border="0" align="center">
          <tr>
            <TD width="32%" align="left" scope="row"><label> Area:</label></TD>
            <td align="center" width="68%">
                  <select name="txt_Area" id="txt_Area"  style="width:100%" onChange = "javascript:ejecutarresp()" disabled>
                    <option selected></option>
                    <%=beanprincipal.devuelvptoa()%>
                  </select>
                  </td>
              </tr>
          <tr>
            <TD align="left" scope="row">LG:</TD>
            <td align="center">
                <div id="div_combolg">
                    <select name="cmb_dpn4" id="cmb_dpn4" style="width:100%"  disabled>
                        <option selected></option>
                    </select>
                </div>
            </td>
            </tr>
          <tr>
            <TD align="left" scope="row">ET:</TD>
            <td align="center"><div id="div_comboet">
              <select name="cmb_dpn5" id="cmb_dpn5" style="width:100%"  disabled>
                <option selected></option>
              </select>
            </div></td>
            </tr>
            <tr>
            <TD align="left">Nombre:</TD>
            <td align="center"><div id="div_perres">
              <select name="cmb_dpn6" id="cmb_dpn6" style="width:100%"  disabled>
                <option selected></option>
              </select>
            </div></td>
            </tr>
            <tr>
            <TD align="left">Corresponsal Calidad:</TD>
            <td align="center"><select name="cmb_corresp" id="cmb_corresp" style="width:100%" onChange="unlock('cmb_categoria')" disabled>
              <option selected></option>
              <%=beanprincipal.devuelve_corresponsales()%>
            </select>            </td>
            </tr>
            </table>
        </fieldset>
            </td>
        </tr>
	   </table>
       <table width="100%" border="0"> 
      	<tr>
     	<td width="50%">  
<fieldset class="fieldset">
            <legend>Informacion problema:</legend>
                <table width="100%" border="0" align="center" bordercolor="#990000">
         	<tr align="center">          
                <td width="17%">Categoria:</td>
            <td width="83%" align="right"><select name="cmb_categoria" id="cmb_categoria" style="width:100%" onChange = "javascript:cargarCombo('compcombolg.jsp', 'cmb_categoria','div_cmbdefecto','cmd_defecto','DEVOLVER_FALLA')" disabled>
              <option selected>Seleccione una categoria</option>
              <%=beanprincipal.devprbl()%>
            </select></td>
            </tr>
            <tr>
            <td align="center">Defecto:</td>
            <td align="right"><div id="div_cmbdefecto">
              <select name="cmb_dpn7" id="cmb_dpn7" style="width:100%"   disabled>
                <option selected></option>
              </select>
            </div>   </td>
            <tr>
            <td align="center">Nivel 1:</td>
            <td align="right"> <div id="div_cmbniv1">
              <select name="cmb_dpn8" id="cmb_dpn8" style="width:100%" disabled>
                <option selected></option>
              </select>
            </div>   </td>
          </tr>
          <tr>
            <td align="center">Nivel 2:</td>
            <td align="right"> <div id="div_cmbniv2">
              <select name="cmb_dpn9" id="cmb_dpn9" style="width:100%" disabled>
                <option selected></option>
              </select>
            </div>  </td>
          </tr>
          <tr>
            <td align="center">Posicion:</td>
            <td align="right"><div id="div_cmbpos">
              <select name="cmb_dpn10" id="cmb_dpn10" style="width:100%" disabled>
                <option selected></option>
              </select>
            </div> </td>
          </tr>
          <tr>
              <td align="center">Comentario:</td>
	          <td align="left"><input type="text" style="text-transform: uppercase;width:95%" name="txt_detalle" id="txt_detalle"></td>
          </tr>
        </table>
        </fieldset>
            </td>
            <td width="30%">
<fieldset class="fieldset">
        		<legend>Cargar Imagen:</legend>
              <table border="0" style="width:100%" >
                  
                    <tr>
                      <td width="20%"><b>Archivo:</b></td>
                      <td width="30%"><INPUT NAME="imageField" id="imageField" TYPE="file"></td>
<%--			
<td width="30%"><INPUT NAME="imageField" id="imageField" TYPE="file" onChange="preview(this)"></td>
<td width="50%" colspan="2">
    <div>
        <img alt="La imagen se verá aqui" id="previewField" style="border: black;border-style: outset;border-width: medium" width="320" height="200"/>
    </div>
</td>--%>
</table>
</fieldset>
            </td>
            <td width="20%">
            <fieldset class="fieldset">
              <legend>Herramientas adicionales:</legend>
            <p align="left">  
            <label>
                  <input type="checkbox" name="FMEAS" id="FMEAS" value="1">
              FMEAS reactivos </label>
            </p>
            <p align="left">
              <label>
                <input type="checkbox" name="tam" id="tam" value="1">
                Tarjeta amarilla</label>
            </p>
            <p align="center">
              <input type="Button" name="btn_hadic" id="btn_hadic" value="Abrir" onClick="abrirdoc()">
            </p>
          </fieldset>
                      <label>Aperturas:</label>
                      <div id="div_repetitividad">
                          <input id="txtrep" name="txtrep" type="text" value=0 readonly="true" style="width:60px">
        </div></td>
        </tr>
	   </table>
      <fieldset class="fieldset">
        <legend>Problemas asociados:</legend>
        <table width="100%" border="0" align="center" bordercolor="#990000">
          <tr>
            <TD width="100%" height="112" colspan="4" align="center" scope="row">
              <div id="div_reps" style="overflow-x:scroll; width:100%;overflow: -moz-scrollbars-horizontal;">
                <textarea name="txt_historico" cols="100%" style="width:100%" rows="10" disabled>                                                                        </textarea>
            </div>
            <script language="JavaScript">
                    document.getElementById("div_reps").style.width=screen.width-screen.width*0.10;
                </script>
            </TD>
          </tr>
        </table>
       </fieldset>
      <fieldset class="fieldset">
        <legend>Almacenar documento:</legend>
        <table width="768" border="0" align="center">
          <tr>
              
            <TD width="398" align="center" scope="row"><input type="submit" name="btn_Guardar" id="btn_Guardar" value="Guardar" disabled>
            </TD>
            <td width="413" align="center"><input type="button" name="btn_cerrar" id="btn_cerrar" value="Cerrar" onClick="Javascript:window.location.href('reporteini.jsp')"></td>
          </tr>
        </table>
       </fieldset>
    </form>
    </td>
  </tr>
</table>  
</body>
</html>