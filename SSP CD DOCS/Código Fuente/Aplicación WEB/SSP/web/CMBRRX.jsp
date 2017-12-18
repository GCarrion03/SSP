<%-- 
    Document   : CMBRRX
    Created on : 29/10/2010, 09:03:01 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beandespliegue" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
<%      if (request.getParameter("btn_Guardar")!=null){
		String[] integrantes = request.getParameterValues("cmb_equipo");
		beandespliegue.cambiadatosadmin("ELIMINAR_EQUIPORX",request.getParameter("iddoc"));
                        if(beandespliegue.insertarequipoRX(request.getParameter("iddoc"),integrantes)){%>
                                       <script language="javascript">
				         alert('Equipo guardado exitosamente');
				       </script>
                        <%}
                  if(beandespliegue.CAMBIOTDOCRX(request.getParameter("iddoc"),request.getParameter("f_apertura"),request.getParameter("txt_lider_equipo"),request.getParameter("var")))
                    {%>
                    <script language="JavaScript">
                        alert('Documento Principal modificado correctamente')
                        self.close();
                        window.opener.location.reload();
                    </script>
                    <%}
                     else {%>
                        <script language="JavaScript">
                            alert('Error llene todos los campos correctamente')
                        </script>
                         <%
                        }
                     }%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cambio a RED-X</title>
    </head>
    <body>
         <form name="formdoc"  method="post" onSubmit="JavaScript:seltds()">
        <fieldset class="fieldset">
        <legend>Datos requeridos para el paso hacia RED-X:</legend>
        <table width="100%" border="0" align="center" bordercolor="#990000">
          <tr>
            <TD align="left">Fecha de apertura:</TD>
            <td><%=beandespliegue.devolfch()%></td>
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
            <select name="cmb_equipo" size="5" multiple id="cmb_equipo" style="width:100%">
            </select>
              <input type="button" name="btn_quitar" id="btn_quitar" value="Quitar" onClick="removeOptionSelected()"></td>
            </tr>
            
        </table>
        </fieldset>
        <fieldset class="fieldset">
        <legend>Almacenar documento:</legend>
        <table width="768" border="0" align="center">
          <tr>
            <TD width="398" align="center" scope="row"><input type="submit" name="btn_Guardar" id="btn_Guardar" value="Guardar">
            </TD>
            <td width="413" align="center"><input type="button" name="btn_cerrar" id="btn_cerrar" value="Cerrar" onClick="JavaScript:window.close()">
            <input type="hidden" id="txtrep" name="txtrep" value=0 readonly="true" style="width:60px"></td>
          </tr>
        </table>
       </fieldset>
    </body>
</html>
