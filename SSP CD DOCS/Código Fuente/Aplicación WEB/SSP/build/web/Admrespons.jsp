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
         if(request.getParameter("txt_lg")==null)
         {
            beanprincipal.cambiadatosadmin("INSERTAREA",request.getParameter("txt_anadir"));
         }
         if(request.getParameter("LET")==null && request.getParameter("txt_lg")!=null)
         {
            beanprincipal.cambiadatosadmin("INSERTLG",request.getParameter("txt_Area"),request.getParameter("txt_anadir"));
            %>
        <script language="JavaScript">
            alert('<%=request.getParameter("txt_Area")%>');
            alert('<%=request.getParameter("txt_anadir")%>');
        </script>
        <%
         }
         if(request.getParameter("cmb_personal")==null && request.getParameter("txt_lg")!=null && request.getParameter("LET")!=null)
         {
            beanprincipal.cambiadatosadmin("INSERTLET",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("txt_anadir"));
         }
         if(request.getParameter("cmb_personal")!=null && request.getParameter("txt_lg")!=null && request.getParameter("LET")!=null)
         {
            beanprincipal.cambiadatosadmin("INSERTPRSRESP",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("LET"),request.getParameter("txt_anadir"));
         }
    }if(request.getParameter("btn_eliminar")!=null)
        {%>
        <%if(request.getParameter("txt_lg")==null)
         {
            beanprincipal.cambiadatosadmin("ELIMINARAREA",request.getParameter("txt_Area"));
         }
        if(request.getParameter("LET")==null && request.getParameter("txt_lg")!=null)
         {
            beanprincipal.cambiadatosadmin("ELIMINARLG",request.getParameter("txt_Area"),request.getParameter("txt_lg"));
            %>
        <%
         }
        if(request.getParameter("cmb_personal")==null && request.getParameter("txt_lg")!=null && request.getParameter("LET")!=null)
        {
            beanprincipal.cambiadatosadmin("ELIMINARLET",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("LET"));
        }
        if(request.getParameter("cmb_personal")!=null && request.getParameter("txt_lg")!=null && request.getParameter("LET")!=null)
         {
            beanprincipal.cambiadatosadmin("ELIMINARPRS",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("LET"),request.getParameter("cmb_personal"));
         }
    }if(request.getParameter("btn_modificar")!=null)
        {%>
        <%if(request.getParameter("txt_lg")==null)
         {
            beanprincipal.cambiadatosadmin("MODIFICARAREA",request.getParameter("txt_Area"),request.getParameter("txt_anadir"));
         }
        if(request.getParameter("LET")==null && request.getParameter("txt_lg")!=null)
         {
                beanprincipal.cambiadatosadmin("MODIFICARLG",request.getParameter("txt_Area"),request.getParameter("txt_lg"),request.getParameter("txt_anadir"));
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
                    <td width="201">Área:</td>
                    <td width="246">Líder de grupo:</td>
                    <td width="214">Equipo de trabajo:</td>
                    <td width="297">Responsable:</td>
                  </tr>
                  <tr>
                    <td><select name="txt_Area" id="txt_Area"  style="width:100%" onChange = "javascript:ejecutarrespMNT()" size="20">
                    <option selected>Seleccione un área</option>
                    <%=beanprincipal.devuelvptoa()%>
                  </select></td>
                    <td><div id="div_combolg">
                      <select name="cmb_defecto" id="cmb_defecto" style="width:100%" size="20" disabled>
                      </select>
                    </div></td>
                    <td> <div id="div_comboet">
              <select name="cmb_dpn8" id="cmb_dpn8" style="width:100%" onchange="carga_usr()" size="20" disabled>
              </select>
            </div>  </td>
                    <td><div id="div_perres">
                      <select name="cmb_personal" id="cmb_personal" style="width:100%" size="20" disabled>
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
