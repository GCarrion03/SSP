<%-- 
    Document   : Inicial
    Created on : 05-19-2010, 10:21:18 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <title>SSP</title>
        <link rel="shortcut icon" href="images/favicon.ico">
        <style type="text/css">
/* pushes the page to the full capacity of the viewing area */
html {height:100%;}
body {
	height:100%;
	margin:0;
	padding:0;
        background-color: #cccccc;
}
/* prepares the background image to full capacity of the viewing area */
#bg {position:fixed; top:0; left:0; width:100%; height:100%;}
/* places the content ontop of the background image */
#content {position:fixed; top:0; left:0; width:100%; height:100%; z-index:1;}
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
        <script language="javascript">
            function unhide(a)
            {
            document.getElementById(a).style.visibility = "visible";
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Menú principal</title>
        <link rel="shortcut icon" href="images/favicon.ico">
        <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css">
    <style type="text/css">
<%--
body {
	background-image: url(images/fondoSCC.jpg);
	background-repeat: no-repeat;
}
        --%>
</style></head>
    <body scroll=no>
        <%--<div id="bg"><img src="images\fondoSCC.jpg" width="100%" height="100%" alt=""></div>--%>
        <div id="content">
        <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="request" >
            <% mibean4.setir_request(request);%>
        </jsp:useBean>
            <div>
                <iFRAME src="MenuSCC.jsp?var=<%=request.getParameter("var")%>" frameborder="0" height="15%" width="100%" allowTransparency="true" style="position:absolute;z-index: 5">
                    IFrame no encontrado por favor llame al administrador
                </iFRAME>
            </div>
            <div>
                    <iframe style=" position:absolute; top:10%;z-index: 4" src="reporteini.jsp?var=<%=request.getParameter("var")%>" frameborder="0" allowTransparency="true" name="central" width="100%" height="90%"></iframe>
            </div>
        </div>
    </body>
</html>