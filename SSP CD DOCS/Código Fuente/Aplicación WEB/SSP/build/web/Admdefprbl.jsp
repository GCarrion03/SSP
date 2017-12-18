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
        <% request.setCharacterEncoding("UTF-8"); %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="peticioajax.js"></script>
        <title>Administración definición problema</title>
    </head>
    <body>
    <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
    <%if(request.getParameter("btn_insertar")!=null)
        {
         if(request.getParameter("cmd_defecto")==null)
         {
            beanprincipal.cambiadatosadmin("Insertcatprbl",request.getParameter("txt_anadir"));
         }
         if(request.getParameter("cmb_niv1")==null && request.getParameter("cmd_defecto")!=null)
         {
            beanprincipal.cambiadatosadmin("Insertfallo",request.getParameter("cmb_categoria"),request.getParameter("txt_anadir"));
         }
         if(request.getParameter("cmb_niv2")==null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
         {
            beanprincipal.cambiadatosadmin("InsertN1",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("txt_anadir"));
         }
         if(request.getParameter("cmb_pos")==null && request.getParameter("cmb_niv2")!=null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
         {
            beanprincipal.cambiadatosadmin("InsertN2",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("txt_anadir"));
         }
         if(request.getParameter("cmb_pos")!=null && request.getParameter("cmb_niv2")!=null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
         {
            beanprincipal.cambiadatosadmin("Insertpos",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("cmb_niv2"),request.getParameter("txt_anadir"));
         }
    }if(request.getParameter("btn_eliminar")!=null)
        {%>
        <%if(request.getParameter("cmd_defecto")==null)
         {
            beanprincipal.cambiadatosadmin("eliminarcatprbl",request.getParameter("cmb_categoria"));
         }
        if(request.getParameter("cmb_niv1")==null && request.getParameter("cmd_defecto")!=null)
         {
            beanprincipal.cambiadatosadmin("Eliminarfallo",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"));
            %>
        <%
         }
        if(request.getParameter("cmb_niv2")==null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
        {
            beanprincipal.cambiadatosadmin("EliminarN1",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"));
        }
        if(request.getParameter("cmb_pos")==null && request.getParameter("cmb_niv2")!=null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
         {
            beanprincipal.cambiadatosadmin("EliminarN2",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("cmb_niv2"));
         }
        if(request.getParameter("cmb_pos")!=null && request.getParameter("cmb_niv2")!=null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
         {
            beanprincipal.cambiadatosadmin("Eliminarpos",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("cmb_niv2"),request.getParameter("cmb_pos"));
         }
    }if(request.getParameter("btn_modificar")!=null)
        {%>
        <%if(request.getParameter("cmd_defecto")==null)
         {
            beanprincipal.cambiadatosadmin("modificarcatprbl",request.getParameter("cmb_categoria"),request.getParameter("txt_anadir"));
         }
        if(request.getParameter("cmb_niv1")==null && request.getParameter("cmd_defecto")!=null)
         {
                beanprincipal.cambiadatosadmin("Modificarfallo",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("txt_anadir"));
                }
        if(request.getParameter("cmb_niv2")==null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
        {
            beanprincipal.cambiadatosadmin("ModificarN1",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("txt_anadir"));
        }
        if(request.getParameter("cmb_pos")==null && request.getParameter("cmb_niv2")!=null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
        {
            beanprincipal.cambiadatosadmin("ModificarN2",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("cmb_niv2"),request.getParameter("txt_anadir"));
        }
        if(request.getParameter("cmb_pos")!=null && request.getParameter("cmb_niv2")!=null && request.getParameter("cmd_defecto")!=null && request.getParameter("cmb_niv1")!=null)
         {
            beanprincipal.cambiadatosadmin("Modificarpos",request.getParameter("cmb_categoria"),request.getParameter("cmd_defecto"),request.getParameter("cmb_niv1"),request.getParameter("cmb_niv2"),request.getParameter("cmb_pos"),request.getParameter("txt_anadir"));
         }
    }
    %>
    <form name="formdoc"  method="post">
<fieldset class="fieldset">
                <legend>Informacion problema:</legend>
                <table width="100%"> 
                  <tr> <td width="100%"> <table width="100%" border="1">
                  <tr>
                    <td width="201">Categoria:</td>
                    <td width="246">Defecto:</td>
                    <td width="214">Nivel 1:</td>
                    <td width="297">Nivel 2:</td>
                    <td width="229">Posición</td>
                  </tr>
                  <tr>
                    <td><select name="cmb_categoria" id="cmb_categoria" style="width:100%" onChange = "javascript:cargarCombo('compcomboMant.jsp', 'cmb_categoria','div_cmbdefecto','cmd_defecto','DEVOLVER_FALLA')" size="20">
                      <option selected>Seleccione una categoria</option>
                      <%=beanprincipal.devprbl()%>
                    </select></td>
                    <td><div id="div_cmbdefecto">
                      <select name="cmb_defecto" id="cmb_defecto" style="width:100%" size="20" disabled>
                      </select>
                    </div></td>
                    <td> <div id="div_cmbniv1">
              <select name="cmb_dpn8" id="cmb_dpn8" style="width:100%" onchange="carga_usr()" size="20" disabled>
              </select>
            </div>  </td>
                    <td><div id="div_cmbniv2">
                      <select name="cmb_niv2" id="cmb_niv2" style="width:100%" size="20" disabled>
                          
                      </select>
                    </div></td>
                    <td><div id="div_cmbpos">
                      <select name="cmb_pos" id="cmb_pos" style="width:100%" size="20" disabled>
                          
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
                      <input type="text" name="txt_anadir" id="txt_anadir" style="width:100%" onKeyUp="JavaScript:this.value=this.value.toUpperCase()";
">
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
