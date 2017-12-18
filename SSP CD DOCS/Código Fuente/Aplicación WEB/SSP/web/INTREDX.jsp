<%-- 
    Document   : INTREDX
    Created on : 07-01-2010, 07:56:35 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <script type="text/javascript" src="referencias.js"></script>
    <script type="text/javascript" src="peticioajax.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script language="javascript" >
	function seltds()
	{
	var select1 = document.getElementById('cmb_equipo'); 
	var values = new Array(); 
 	for(var i=0; i < select1.options.length; i++){ 
    select1.options[i].selected = true;
} 
}
	function insertOptionBefore()
		{
                    var elSel = document.getElementById('cmb_equipo');
                    var elOptNew = document.createElement('option');
                    elOptNew.text = document.formdoc.txtmiembroREDX.value;
                    elOptNew.value = document.formdoc.txtmiembroREDX.value;
            try {
      elSel.add(elOptNew); // standards compliant; doesn't work in IE
    }
    catch(ex) {
      elSel.add(elOptNew); // IE only
    }
}
	function removeOptionSelected()
{
  var elSel = document.getElementById('cmb_equipo');
  var i;
  for (i = elSel.length - 1; i>=0; i--) {
    if (elSel.options[i].selected) {
      elSel.remove(i);
    }
  }
}
	</script>
    <body style="background-color: transparent;">
    <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
        <h1 align="center">RED-X</h1> 
        <table width="100%" border="0" align="center">
  <tr>
    <td>
     <form name="formdoc"  method="post" action="reporteini.jsp?var=<%=request.getParameter("var")%>" ENCTYPE="multipart/form-data" onSubmit="JavaScript:seltds()">
        <fieldset class="fieldset">
        <legend>Información Registro:</legend>
        <table border="0" align="center" bordercolor="#990000">
          <tr>
            <TD width="52" align="left" scope="row"><label>Codigo: </label></TD>
            <td width="180" align="center">
             <div id="div_ndoc">
              <input type="text" name="coddoc" id="coddoc" size="30" READONLY>
             </div>
            <input type="hidden" name="id_usr" id="id_usr" value="<%=request.getParameter("var")%>" size="30" READONLY>            
            <input name="cmb_ptoap" id="cmb_ptoap" type="hidden" value="24"></td>
            <TD align="left">Iniciado por:</TD>
            <TD colspan="5">
                <%beanprincipal.SETUSRMEN("OBTENER_NOMBRE_USUARIO",request.getParameter("var"),"MENU");%>
                 <input type="hidden" name="id_usr" id="id_usr" value="<%=request.getParameter("var")%>" size="30">
                <input type="text" id="txt_iniciador" name="txt_iniciador" value="<%=beanprincipal.getNombre_usr()%>">
                <%--<select name="cmb_dpn2" id="cmb_dpn2" style="width:100%;z-index:5" onchange="carga_usr()"  disabled>
                <option selected>Seleccione un punto de apertura</option>
                <%=beanprincipal.devuelve_dept()%>
                </select>--%>
            </TD>
          </tr>
        </table>
        </fieldset>
      <table width="100%" border="0"> 
      <tr>
     	<td width="64%">  
      <fieldset class="fieldset">
        <legend>Información punto de apertura:</legend>
        <table width="100%" border="0" align="center" bordercolor="#990000">
          <tr>
            <TD align="left">Fecha de apertura:</TD>
            <td><%=beanprincipal.devolfch()%></td>
            </tr>
            <tr>
            <td>Área:</td>
            <td><select name="txt_Area" id="txt_Area"  style="width:100%">
                    <option selected></option>
                    <%=beanprincipal.devuelvptoa()%>
                  </select></td>
            </tr>
          <tr>
            <TD width="194" align="left" scope="row"><label>Lider de equipo:<br>
            </label></TD>
            <td align="left"><input type="text" name="txt_lider_equipo" id="txt_lider_equipo" style="width:100%">                </td>
            </tr>
            <TR>
            <TD align="left">Miembro del equipo:</TD>
            <TD><div id="div_iniciador">
              <input type="text" name="txtmiembroREDX" id="txtmiembroREDX" style="width:80%" onChange="unlock('cmb_plataforma')" onKeyUp="JavaScript:this.value=this.value.toUpperCase()">
              <input type="button" name="btn_anadirmerx" id="btn_anadirmerx" value="Anadir" onClick="JavaScript:insertOptionBefore()">
            </div></TD>
            </TR>
            <tr>
            <TD align="left">Equipo:</TD>
            <td width="438">
            <select name="cmb_equipo" size="5" multiple id="cmb_equipo" style="width:80%">
            </select>
              <input type="button" name="btn_quitar" id="btn_quitar" value="Quitar" onClick="removeOptionSelected()"></td>
            </tr>
            
        </table>
        </fieldset>          </td>
            <td width="36%">
            <fieldset class="fieldset">
        <legend>Información del vehículo:</legend>
            <table width="100%">
              <tr>
                <td width="30%"><div align="center">Plataforma:</div></td>
                <td width="65%"><select name="cmb_plataforma" id="cmb_plataforma" style="width:100%">
                    <option selected>Seleccione una plataforma</option>
                    <%=beanprincipal.obtplataforma()%>
                </select></td>
              </tr>
             
            </table>
            </fieldset> 
            <fieldset class="fieldset">
        		<legend>Informacion problema:</legend>
        		<table width="100%" border="0" align="center" bordercolor="#990000">
         		<tr align="center">
                <td width="11%">Categoria:</td>
            <td width="89%" align="right"><select name="cmb_categoria" id="cmb_categoria" style="width:100%" onChange = "javascript:cargarCombo('compcomboRX.jsp', 'cmb_categoria','div_cmbdefecto','cmd_defecto','DEVOLVER_FALLA')">
              <option selected>Seleccione una categoria</option>
              <%=beanprincipal.devprbl()%>
            </select></td>
            </tr>
            <tr>
            <td align="center">Defecto:</td>
            <td align="right"><div id="div_cmbdefecto"></div>   </td>
            <tr>
            <td align="center">Nivel 1:</td>
            <td align="right"> <div id="div_cmbniv1"></div>   </td>
          </tr>
          <tr>
            <td align="center">Nivel 2:</td>
            <td align="right"> <div id="div_cmbniv2"></div>  </td>
          </tr>
          <tr>
            <td align="center">Posicion:</td>
            <td align="right"><div id="div_cmbpos"></div> </td>
          </tr>
          <tr>
              <td align="center">Información</td>
	          <td align="left"><input type="text" name="txt_detalle" id="txt_detalle" style="width:100%"></td>
          </tr>
        </table>
        </fieldset>        </td>
        <TD>
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
                
                </TD>
        </tr>
	   </table>
       
       <fieldset class="fieldset">
        <legend>Almacenar documento:</legend>
        <table width="768" border="0" align="center">
          <tr>
            <TD width="398" align="center" scope="row"><input type="submit" name="btn_GuardarRX" id="btn_Guardar" value="Guardar">
            </TD>
            <td width="413" align="center"><input type="button" name="btn_cerrar" id="btn_cerrar" value="Cerrar" onClick="JavaScript:window.close()">
            <input type="hidden" id="txtrep" name="txtrep" value=0 readonly="true" style="width:60px"></td>
          </tr>
        </table>
       </fieldset>
             <%
              if(request.getParameter("btn_GuardarRedx")!= null)
                  {
                      String s_pant;
                      beanprincipal.setir_request(request);%>
        <script language = "JavaScript">
                           alert("OJALA <%=request.getParameter("coddoc")%>     <%=request.getParameter("f_apertura")%>     <%=request.getParameter("id_usr")%>     <%=request.getParameter("cmb_dpn")%>     <%=request.getParameter("txt_turno")%>     <%=request.getParameter("txt_Area")%>     <%=request.getParameter("txt_lg")%>     <%=request.getParameter("LET")%>     <%=request.getParameter("cmb_escalonamiento")%>     <%=request.getParameter("cmb_ponderacion")%>     <%=request.getParameter("cmb_plataforma")%>     <%=request.getParameter("cod_modelo")%>     <%=request.getParameter("cmb_categoria")%>     <%=request.getParameter("cmd_defecto")%>     <%=request.getParameter("cmb_niv1")%>     <%=request.getParameter("cmb_niv2")%>     <%=request.getParameter("cmb_pos")%>");
                      </script>
                  <%
                      //if(beanprincipal.insertarprob(request.getParameter("coddoc"),request.getParameter("f_apertura"),request.getParameter("id_usr"),request.getParameter("cmb_iniciador"),request.getParameter("cmb_dpn"),request.getParameter("txt_turno"),request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("LET"),request.getParameter("cmb_personal"),request.getParameter("cmb_corresp"),request.getParameter("cmb_escalonamiento"),request.getParameter("cmb_ponderacion"),request.getParameter("cmb_plataforma"),request.getParameter("cod_modelo"),request.getParameter("txt_VIN"),request.getParameter("txtlote"),request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("cmb_niv2"),request.getParameter("cmb_pos"),request.getParameter("txtrep"),request.getParameter("listaprb"),request.getParameter("t_doc")))
                          {
                      %>
    <script language = "JavaScript">
        alert("<%=request.getParameter("coddoc")%>   <%=request.getParameter("f_apertura")%>          <%=request.getParameter("id_usr")%>          <%=request.getParameter("cmb_dpn")%>          <%=request.getParameter("txt_turno")%>          <%=request.getParameter("txt_Area")%>          <%=request.getParameter("txt_lg")%>          <%=request.getParameter("LET")%>          <%=request.getParameter("cmb_escalonamiento")%>          <%=request.getParameter("cmb_ponderacion")%>          <%=request.getParameter("cmb_plataforma")%>          <%=request.getParameter("cod_modelo")%>          <%=request.getParameter("cmb_categoria")%>          <%=request.getParameter("cmd_defecto")%>          <%=request.getParameter("cmb_niv1")%>          <%=request.getParameter("cmb_niv2")%>          <%=request.getParameter("cmb_pos")%>          <%=request.getParameter("txtrep")%>          <%=request.getParameter("listaprb")%>          <%=request.getParameter("t_doc")%>");
    alert("El cinco pasos <%=request.getParameter("coddoc")%> fue ingresado satisfactoriamente.");
</script>
                      <%
                      }
                  }
              %>
    </form>    
    </td>
  </tr>
</table>  
</body>
</html>
