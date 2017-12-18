<%-- 
    Document   : Reporte1
    Created on : 05-20-2010, 09:51:13 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
    
<!--
.style1 {color: #FF0000}
-->
        </style>
        <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="page" >
        </jsp:useBean>
</head>
<body style="z-index: 3" style="background-color: transparent;">
    <table>
        <tr valign="top">
            <td>
                <%=beanprincipal.EXISTEN_DOCS("dev_exst")%>
            </td>
            <td>
                <%=beanprincipal.EXISTEN_ELECS("dev_exst")%>
            </td>
        </tr>
    </table>
</body>
</html>
