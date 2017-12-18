<%-- 
    Document   : Admdefprbl
    Created on : 19-ago-2010, 7:29:17
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <%request.setCharacterEncoding("UTF-8");%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="peticioajax.js"></script>
        <title>Administración definición problema</title>
    </head>
    <body>
    <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
    <%if(request.getParameter("btn_insertar")!=null)
        {
         if(request.getParameter("cmb_Modelo")==null)
         {
            beanprincipal.cambiadatosadmin("INSERTPLAT",request.getParameter("txt_anadir"));
         }
         if(request.getParameter("cmb_Plataforma")!=null && request.getParameter("cmb_Modelo")!=null)
         {
            beanprincipal.cambiadatosadmin("INSERTMOD",request.getParameter("cmb_Plataforma"),request.getParameter("txt_anadir"));
         }
	    }if(request.getParameter("btn_eliminar")!=null)
        {%>
        <%if(request.getParameter("cmb_Modelo")==null)
         {
            beanprincipal.cambiadatosadmin("ELIMINARPLAT",request.getParameter("cmb_Plataforma"));
         }
        if(request.getParameter("cmb_Plataforma")!=null && request.getParameter("cmb_Modelo")!=null)
         {
            beanprincipal.cambiadatosadmin("ELIMINARMOD",request.getParameter("cmb_Plataforma"),request.getParameter("cmb_Modelo"));
            %>
        <%
         }
    }if(request.getParameter("btn_modificar")!=null)
        {%>
        <%if(request.getParameter("cmb_Modelo")==null)
         {
            beanprincipal.cambiadatosadmin("MODIFICARPLAT",request.getParameter("cmb_Plataforma"),request.getParameter("txt_anadir"));
         }
        if(request.getParameter("cmb_Plataforma")!=null && request.getParameter("cmb_Modelo")!=null)
         {
                beanprincipal.cambiadatosadmin("MODIFICARMOD",request.getParameter("cmb_Plataforma"),request.getParameter("cmb_Modelo"),request.getParameter("txt_anadir"));
                }
        if(request.getParameter("cmb_personal")==null && request.getParameter("txt_lg")!=null && request.getParameter("LET")!=null)
        {
            beanprincipal.cambiadatosadmin("MODIFICARET",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("LET"),request.getParameter("txt_anadir"));
        }
        if(request.getParameter("cmb_personal")!=null && request.getParameter("txt_lg")!=null && request.getParameter("LET")!=null)
        {
            beanprincipal.cambiadatosadmin("MODIFICARPRSRESP",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("LET"),request.getParameter("cmb_personal"),request.getParameter("txt_anadir"));
        }
    }
    %>
    <form name="formdoc"  method="post">
<fieldset class="fieldset">
                <legend>Informacion Problema:</legend>
              <table width="100%"> 
                <tr> 
                    <td width="100%">
                        <table width="100%" border="1">
                  <tr>
                    <td width="201">Plataforma:</td>
                    <td width="246">Modelo:</td>
                  </tr>
                  <tr>
                    <td>
                    <select name="cmb_Plataforma" id="cmb_Plataforma"  style="width:100%" onChange = "javascript:cargarCombo('compcomboMant.jsp', 'cmb_Plataforma','div_combomod','cmb_Modelo','MOSTRAR_MODELO')" size="20">
                    	<option selected>Seleccione una plataforma</option>
	                    	<%=beanprincipal.obtplataforma()%>
	                </select></td>
                    <td><div id="div_combomod">
                      <select name="cmb_Modelo" id="cmb_Modelo" style="width:100%" size="20" disabled>
                      </select>
                    </div></td>
                  </tr>
                </table>
                </td>
                </tr>
                <tr>
                <td width="100%"><fieldset class="fieldset">
                <legend>Añadir registros:</legend>
                <table width="100%" border="0">
                  <tr>
                    <td width="50%"><label>
                      <input type="text" name="txt_anadir" id="txt_anadir" onKeyUp="JavaScript:this.value=this.value.toUpperCase()" style="text-transform: uppercase;width:100%">
                    </label></td>
                  <td width="5%"><label>
                      <input type="submit" name="btn_insertar" id="btn_insertar" value="Insertar">
                    </label></td><td width="5%"><input type="submit" name="btn_eliminar" id="btn_eliminar" value="Eliminar"></td>
                    <td width="5%"><input type="submit" name="btn_modificar" id="btn_modificar" value="Modificar"></td>
                    <td width="35%"></td>
                  </tr>
                </table>
                </fieldset></td>
                </tr></table>
    </fieldset>
    </form>
        
</body>
</html>
