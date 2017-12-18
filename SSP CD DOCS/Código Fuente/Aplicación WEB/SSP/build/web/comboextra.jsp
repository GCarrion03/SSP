<%-- 
    Document   : comboextra
    Created on : 06-07-2010, 01:34:00 PM
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
        <%=mibean4.AJX_ET(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"btn_hadic")%>
    </body>
</html>
