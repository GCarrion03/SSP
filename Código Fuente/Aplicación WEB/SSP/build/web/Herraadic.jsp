<%-- 
    Document   : T_amarilla
    Created on : 05-14-2010, 10:49:30 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="page" >
    </jsp:useBean>
    <head>
        <script type="text/javascript" >
            function unhide1(a)
            {
            document.getElementById(a).style.visibility = "visible";
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Tarjeta Amarilla</title>
    <style type="text/css">
</style>
    <style type="text/css">
/* pushes the page to the full capacity of the viewing area */
html {height:100%;}
body {
	height:100%;
	margin:0;
	padding:0;
	background-color: #F1EFED;
}
    </style>
    </head>
    <body>
<form name="form1" method="post" >
<table id="Tama" width="762" border="0" align="center" style="visibility:hidden">
<tr>
            <th colspan="4" scope="row">Tarjeta amarilla</th>
          </tr>
          <tr>
            <td width="200" scope="row">Estacion de verificacion:</td>
            <td width="181">
              <select name="evs" id="evs">                   
              <option selected>Seleccione un punto de apertura</option>
                <%=mibean4.devuelve_dept()%>
              </select>                 </td>
            <td width="151">Nombre L.E.T. de E.V.</td>
            <td width="202">
            <select name="cmb_corresp" id="cmb_corresp">
              <option selected>Seleccione un corresponsal</option>
              <%=mibean4.devuelve_corresponsales()%>
            </select>          </td>
          </tr>
        </table>
        <table id="fmeas" align="center" width="762" style="visibility:hidden">
        	<tr>
            	<th colspan="2" align="center">
                PFMEA</th>
            </tr>
            <tr>
            	<td>Facilitador:
                </td>
                <td><input type="text" name="txt_facilitador" id="txt_facilitador" style="width:100%"></td></td>
                <tr>
                </tr>
                <td width="373">
                	Número de casos:</td>
                <td width="377"><input type="text" name="txt_casos" id="txt_casos" style="width:100%"></td>
          </tr>
        </table>
           <table width="200" align="center" border="0">
              <tr>
                  <th scope="row"><input type="submit" name="btn_guardar" id="btn_guardar" value="Guardar"></th>
                <td align="center">
                  <input type="button" name="btn_cerrar" id="btn_cerrar" value="Cerrar" onClick="Javascript:window.close()">       
                </td>
              </tr>
    </table>
    </form>
     <%if (request.getParameter("Taman").compareTo("1")==0) {%>
                    <script language="javascript">
                        unhide1 ('Tama');
                    </script>
                  <%}%>
     <%if (request.getParameter("fmeas").compareTo("1")==0) {%>
                    <script language="javascript">
                        unhide1 ('fmeas');
                    </script>
                  <%}%>
            <% boolean band=false;
            if (request.getParameter("btn_guardar")!=null && request.getParameter("Taman").compareTo("1")==0){
               %>   
                <%band=mibean4.insertadicamarilla(request.getParameter("iddoc"),request.getParameter("evs"),request.getParameter("cmb_corresp"));
                if (band){%>
                <script language="javascript">
                    alert("Guardado exitoso");
                    window.close();
                </script>
                <%}
                }
		band=false;
		if (request.getParameter("btn_guardar")!=null && request.getParameter("fmeas").compareTo("1")==0){
               %>   
               <%band=mibean4.insertadicfmea(request.getParameter("iddoc"),request.getParameter("txt_casos"),request.getParameter("txt_facilitador"));
                if (band){%>
                <script language="javascript">
                    alert("Guardado exitoso");
                    window.close();
                </script>
                <%}
                }

                %>
</body>
</html>