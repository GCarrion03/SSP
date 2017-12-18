<%-- 
    Document   : YCind
    Created on : 06-21-2010, 10:13:46 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
       <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="application" >
    </jsp:useBean>
    <head>
         <script type="text/javascript" src="peticioajax.js"></script>
         <script type="text/javascript" src="referencias.js"></script>
     <script language = "JavaScript">
function alo(inform)
        {
             alert(inform.cmb_niv2.value);
        }
     function carga_usr()
     {
         document.formdoc.id_usr.value=document.formdoc.cmb_ptoap.value;
		 cargarCombo('compcombolg.jsp', 'cmb_ptoap','div_iniciador','cmb_iniciador','MOSTRAR_INICIADOR')
     }
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
    <body>
    <h1 align="center">Tarjeta Amarilla</h1>
    <table width="100%" border="0" align="center">
  <tr>
    <td>
     <form name="formdoc"  method="post" action="Inicial.jsp?var=1">
        <fieldset class="fieldset">
        <legend>Información Registro:</legend>
        <table width="85" border="0" align="center" bordercolor="#990000">
          <tr>
            <th width="114" align="left" scope="row"><label>Codigo: </label></th>
            <td colspan="3" align="center">
             <div id="div_ndoc">
              <input type="text" name="coddoc" id="coddoc" size="30" READONLY>
             </div>
             <input type="hidden" name="id_usr" id="id_usr" value="<%=request.getParameter("var")%>" size="30" READONLY>            </td>
            </tr>
        </table>
        </fieldset>
      <table width="100%" border="0"> 
      <tr>
     	<td width="64%">  
      <fieldset class="fieldset">
        <legend>Información punto de apertura:</legend>
        <table width="86%" border="0" align="center" bordercolor="#990000">
          <tr>
            <th width="154" align="left" scope="row"><label>Punto de apertura: <br>
                  <br>
            </label></th>
            <td align="left">
                <select name="cmb_dpn" id="cmb_ptoap" onchange="carga_usr()">
              <option selected>Seleccione un punto de apertura</option>
              <%=mibean4.devuelve_dept()%>
            </select>
            <%--
                <input type="text" name="txt_puntoapert" id="txt_puntoapert" size="60" value="<%=mibean4.devuelve_dept(request.getParameter("var"))%>">--%></td>
            </tr>
            <tr><th align="left">Iniciador:</th><td><div id="div_iniciador"></div></td></tr>
            <tr>
            <th align="left"> Fecha de apertura: </th>
            <td width="360"><%=mibean4.devolfch()%> </td>
            </tr>
            <tr>
            <th align="left">Turno:</th>
            <td><select name="txt_turno" id="txt_turno" style="visibility:hidden" onChange="unhide('cmb_ponderacion')">
              <option selected>Seleccione un turno</option>
              <%=mibean4.obtturno()%>
            </select></td></tr>
            <tr>
            <th align="left">Criticidad:</th>
            <td><select name="cmb_ponderacion" id="cmb_ponderacion" style="visibility:hidden" onChange="unhide('cmb_plataforma')">
              <option selected>Seleccione la criticidad del problema</option>
              <%=mibean4.obtponderacion()%>
            </select></td>
          </tr>
        </table>
        </fieldset>          </td>
            <td width="36%">
            <fieldset class="fieldset">
        <legend>Información del vehículo:</legend>
            <table height="100%">
              <tr>
                <td><div align="center">Plataforma:</div></td>
                <td><select name="cmb_plataforma" id="cmb_plataforma" style="visibility:hidden" onChange = "javascript:cargarCombo('compcombolg.jsp', 'cmb_plataforma','div_cmbmod','cod_modelo','MOSTRAR_MODELO')">
                    <option selected>Seleccione una plataforma</option>
                    <%=mibean4.obtplataforma()%>
                </select></td>
              </tr>
              <tr>
                <td width="121" align="center"><div align="center">Modelo:</div></td>
                <td width="155" align="center"><div id="div_cmbmod"></div></td>
              </tr>
              <tr>
                <td align="center"><div align="center">P.V.I.:</div></td>
                <td align="center"><input type="text" name="txt_VIN" id="txt_VIN" style="visibility:hidden" onKeyPress="return limita(event,'txt_VIN', 9,'txtlote')"></td>
              </tr>
              <tr>
                <td height="36"><div align="center">Lote:</div></td>
                <td><div align="center">
                  <input type="text" name="txtlote" id="txtlote" onKeyPress="return limita(event,'txtlote', 3,'txt_Area')" style="visibility:hidden">
                </div></td>
              </tr>
            </table>
            </fieldset>        </td>
        </tr>
	   </table>
       <table width="100%" border="0"> 
      	<tr>
     	<td width="49%">  
        <fieldset class="fieldset">
        <legend>Información responsable:</legend>
        <table border="0" align="center" bordercolor="#990000">
          <tr>
            <th height="39"  align="left" scope="row"><label>Estacion verificación responsable 1:</label></th>
            <td align="center">
                <div align="center">
                  <select name="txt_Area" id="txt_Area" style="visibility:hidden">
                    <option selected>Seleccione un Área</option>
                    <%=mibean4.devuelve_dept()%>
                  </select>
                </div></td>
              </tr>
          <tr>
            <th height="41" align="left" scope="row">LET E.V.:</th>
            <td align="center"><div id="div_combolg">
              <select name="cmb_corresp" id="cmb_corresp">
                <option selected>Seleccione un corresponsal</option>
                <%=mibean4.devuelve_corresponsales()%>
              </select>
            </div></td>
            </tr>
            </table>
        </fieldset>            </td>
            <td width="40%">
        <fieldset class="fieldset">
        		<legend>Informacion problema:</legend>
        		<table width="60%" border="0" align="center" bordercolor="#990000">
         		<tr align="center">          
                <td width="72">Categoria:</td>
            <td width="400" align="center"><select name="cmb_categoria" id="cmb_categoria" onChange = "javascript:cargarCombo('compcombolgYC.jsp', 'cmb_categoria','div_cmbdefecto','cmd_defecto','DEVOLVER_FALLA')">
              <option selected>Seleccione una categoria</option>
              <%=mibean4.devprbl()%>
            </select></td>
            </tr>
            <tr>
            <td align="center">Defecto:</td>
            <td align="center"><div id="div_cmbdefecto"></div>   </td>
            <tr>
            <td align="center">Nivel 1:</td>
            <td align="center"> <div id="div_cmbniv1"></div>   </td>
          </tr>
          <tr>
            <td align="center">Nivel 2:</td>
            <td align="center"> <div id="div_cmbniv2"></div>  </td>
          </tr>
          <tr>
            <td align="center">Posicion:</td>
            <td align="center"><div id="div_cmbpos"></div> </td>
          </tr>
          <tr>
              <td align="center">Información</td>
	          <td align="left"><input type="text" name="txt_detalle" id="txt_detalle" size="80%"></td>
          </tr>
        </table>
        </fieldset>        </td>
        </tr>
	   </table>
      <fieldset class="fieldset">
        <legend>Almacenar documento:</legend>
        <table width="768" border="0" align="center">
          <tr>
            <th width="398" align="center" scope="row"><input type="submit" name="btn_Guardar" id="btn_Guardar" value="Guardar"></th>
            <td width="413" align="center"><input type="button" name="btn_cerrar" id="btn_cerrar" value="Cerrar"></td>
          </tr>
        </table>
       </fieldset>
       </form>    
     <P align="RIGHT"><img src="images/LOGO_GM" alt="LOGO" width="111" height="52" /></P>
    </td>
  </tr>
</table>  
</body>
</html>
