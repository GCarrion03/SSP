<%-- 
    Document   : Compruebaexistedoc
    Created on : 18/11/2010, 01:40:32 PM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="page" >
        </jsp:useBean>
    </head>
    <body>
       <%
//recogemos el parámetro
                String registros;
                registros=mibean4.EJECUTARSPDEVSTR("EXISTE_DOC",request.getParameter("Id2"));
                if (registros.compareTo("0")==0)
                    {
                %>
                <script LANGUAGE="JavaScript">
                    alert("Documento no encontrado");
                    self.close();
                </script>
                <%
                }
                else{
                    //response.sendRedirect("http://124.14.96.50:38163/SSP/Cinco_pasos.jsp?var="+s_pant);
                    if (mibean4.EJECUTARSPDEVSTR("EXISTE_REDX",request.getParameter("Id2")).compareTo("0")!=0)
                        {
                        %>

                        <script LANGUAGE="JavaScript">
                            window.open('ConsultaRX.jsp?var=<%=request.getParameter("Id1")%>&iddoc=<%=request.getParameter("Id2")%>','SSP1', 'fullscreen=yes,scrollbars=yes');
                            self.close();
                            </script>
                        <%}
                    else{
			%>
                    <script LANGUAGE="JavaScript">
                        window.open('consultaind.jsp?var=<%=request.getParameter("Id1")%>&iddoc=<%=request.getParameter("Id2")%>','SSP1', 'fullscreen=yes,scrollbars=yes');
                        self.close();
            </script>
                    <%}
                }
		%>
    </body>
</html>
