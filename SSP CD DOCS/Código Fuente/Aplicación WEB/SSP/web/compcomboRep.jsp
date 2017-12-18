
<%-- 
    Document   : compcomboMant
    Created on : 06-02-2010, 10:17:57 AM
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
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("txt_lg")){
    %>
        <%=mibean4.AJX_LIDERGREP(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"5")%>
    <%}
%>
    </body>
</html>