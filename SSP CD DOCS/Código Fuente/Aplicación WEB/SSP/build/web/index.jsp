<%-- 
    Document   : index
    Created on : 04-28-2010, 08:26:49 AM
    Author     : Guz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <script type="text/javascript">
	var band=0;
                    function habilitar()
                        {
                            if (band==0)
                                {
                                    //document.form1.btn_mostrar.style.background= "url(images/Chevrolet-logosel.gif) no-repeat top";
                                    document.form1.btn_mostrar.style.borderStyle="inset";
                                    document.form1.btn_mostrar.style.backgroundColor= "#666666";
									band=1;
                                    unhide('th_pass');
								}
								else
								{
								document.form1.btn_mostrar.style.borderStyle="outset";
                                document.form1.btn_mostrar.style.backgroundColor="#CCCCCC";
                                   // document.form1.btn_mostrar.style.background= "url(images/Chevrolet-logo.gif) no-repeat top";
				   				band=0;
                                    hide('th_pass');
								}
						}
	</script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script type="text/javascript" src="referencias.js"></script>
        <title>Software de Solución de Problemas</title>
        <link rel="shortcut icon" href="images/favicon.ico?var="<%=Math.random()%>>
    <style type="text/css"></style>
            <style type="text/css">
/* pushes the page to the full capacity of the viewing area */
html {height:100%;}
body {
	height:100%;
	margin:0;
	padding:0;
}
/* prepares the background image to full capacity of the viewing area */
#bg {position:fixed; top:0; left:0; width:100%; height:100%;}
/* places the content ontop of the background image */
#content {position:fixed; top:0; left:0; width:100%; height:100%; z-index:1;}
            .style1 {font-family: Arial, Helvetica, sans-serif}
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
    </head>
    <body bgcolor="#E5E5E5">
         <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="page">
          </jsp:useBean>
    <% String s_pant;
			if(request.getParameter("btn_consultas") != null)
			{%>
				 <script LANGUAGE="JavaScript">
                        var w=window.open("Inicial.jsp?var=0","SSP", 'fullscreen=yes,scrollbars=0')
                        //,scrollbars=auto
                        w.focus();
                    </script>
                    <%
			}
            if(request.getParameter("CACCESO") != "" && request.getParameter("CACCESO") != null)
            {                
                s_pant="";
                s_pant=mibean4.EJECUTARSPDEVSTR("OBTENER_USUARIO",request.getParameter("CACCESO")); %>
                <%
                if (s_pant.compareTo("0")==0)
                    {
                %>    
                <script LANGUAGE="JavaScript">
                        MENSAJE("Usuario no encontrado")
                </script>
              <%
                }
                else{
                    //response.sendRedirect("http://124.14.96.50:38163/SSP/Cinco_pasos.jsp?var="+s_pant);
                   %>
                   <script LANGUAGE="JavaScript">
                        var w=window.open("Inicial.jsp?var=<%=s_pant%>","SSP", 'fullscreen=yes,scrollbars=0')
                        //,scrollbars=auto
                        w.focus();
                    </script>
                   <%//response.sendRedirect("Inicial.jsp?var="+s_pant);
                    }
            }%>
        <%--onload="document.form1.CACCESO.focus()"--%>
        <form name="form1" method="post" action="">
        <div id="bg"><%--img src="images\GMTemplates1024x768d.jpg" width="100%" height="100%" alt=""--%></div>
        <div id="content">
            <h1 align="center">&nbsp;</h1>
            <h1 align="center">&nbsp;</h1>
            <h1 align="center" class="style1">¡Bienvenido!</h1>
            <p align="center" class="style1">Soporte Ext: 4431</p>
            <table width="500" height="184" border="6" align="center" >
<tr>
			            <td width="50%" height="83" align="center" class="style1" style="border:none">
       <input name="btn_consultas" type="submit" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 12pt; FONT-FAMILY: Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #CCCCCC" id="btn_consultas" value="Usuario Consulta" width="100%" > 
       <%-- <input name="btn_consultas" type="submit" class="style1" id="btn_consultas" style=" background:url(images/Chevrolet-logo.gif) no-repeat top;width:200px;height:80px;border:none " value="Usuario Consulta" width="100%" >            --%>
       </td>
<td width="50%" class="style1" align="center" style="border:none"><label>
            <input type="button" name="btn_mostrar" id="btn_mostrar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 12pt; FONT-FAMILY: Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #CCCCCC" value="Usuario Especial" onClick="JavaScript:habilitar()">
<%--            <input type="button" name="btn_mostrar" id="btn_mostrar" style=" background:url(images/Chevrolet-logo.gif) no-repeat top;width:200px;height:80px;border:none " value="Usuario Especial" onClick="JavaScript:habilitar()" width="200">--%>
        </label></td>
            </tr>
            <tr>
            <th class="style1" scope="row" style="border:none">
            <label></label><p>&nbsp;</p>          </th>
                       <th align="left" class="style1" id="th_pass" style="visibility:hidden"  scope="row">
                       <fieldset class="fieldset">
                <legend>Clave de acceso:</legend>
                <table align="center">
                <tr>
                <td>
                       <input type="password" name="CACCESO" id="CACCESO" style="width:100" >                </td>
                </tr>
                <tr>
                <td align="center">
                           <input name="Ingusr" type="submit" value="Ingresar" style="font:Arial, Helvetica, sans-serif">                </td>
                </tr>
                </table>
                       </fieldset>                       </th>
            </tr>
            <tr>            </tr>
            <tr>            </tr>
        </table>
<p align="right">
			<strong><img src="images/LOGO_GM" alt="logogm" width="131" height="66" style="position:absolute;top:5%;right:2%">ver 0.90 </strong></p>
        </div>
    </form>
</body>
</html>