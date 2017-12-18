<%-- 
    Document   : listareps
    Created on : 06-08-2010, 08:57:32 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="page" >
    </jsp:useBean>
            <%
//recogemos el parámetro
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("listaprb")){%>
<%=mibean4.AJX_CREALISTA(request.getParameter("Id"),request.getParameter("Id2"), request.getParameter("control"), request.getParameter("SProc"))%>
<%//cogemos valores de la bdd
}%>
    </body>
</html>