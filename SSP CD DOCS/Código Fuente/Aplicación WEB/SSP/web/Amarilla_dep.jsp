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
    <form name="form1" method="post">
        <h1 align="center">&nbsp;</h1>
    
<table id="Tama" width="762" border="0" align="center">
<tr>
            <th colspan="4" scope="row"><div align="center">Tarjeta amarilla</div></th>
          </tr>
          <tr>
          <th scope="row" align="left" colspan="2">
          Anexar al documento:
          </th>
          <td colspan="2"><input name="txt_doc" type="text" style="width:100%"></td>
          </tr>
<tr>
            <th width="200" scope="row">Estacion de verificacion:</th>
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
    <div align="center"></div>
    
            <p>
              <% boolean band=false;
            if (request.getParameter("btn_guardar")!=null) {
                band=mibean4.insertadicamarilla(request.getParameter("txt_doc"),request.getParameter("evs"),request.getParameter("cmb_corresp"));
                if (band){%>
                            <script language="javascript">
                    alert("Guardado exitoso");
                </script>
              
              <%}
              }%></p>
            <table width="200" border="0" align="center">
              <tr>
                <th scope="row"><input type="submit" name="btn_guardar" id="btn_guardar" value="Anexar"></th>
                <td align="center"><input type="button" name="btn_cerrar" id="btn_cerrar" value="Cerrar" onClick="Javascript:window.close()">
                </td>
              </tr>
            </table>
            <p>&nbsp;            </p>
</form>
</body>
</html>