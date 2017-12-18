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
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_personal")){%>
<%=mibean4.AJX_ETMNT(request.getParameter("Id"),request.getParameter("control"), request.getParameter("SProc"),"cmb_corresp","20")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("SProc").equals("DEVOLVER_POST")){%>
<%--=mibean4.AJX_ET(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"txt_detalle")--%>
<%=mibean4.AJX_NIVMNTPOS(request.getParameter("Id"),request.getParameter("Id2"),request.getParameter("Id3"),request.getParameter("Id4"), request.getParameter("control"), request.getParameter("SProc"),"txt_detalle","btn_Guardar","1")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("SProc").equals("DEVOLVER_POSI1T")){%>
<%--=mibean4.AJX_ET(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"txt_detalle")--%>
<%=mibean4.AJX_NIVMNTPOS(request.getParameter("Id"),request.getParameter("Id2"),request.getParameter("Id3"), request.getParameter("control"), request.getParameter("SProc"),"1")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_niv2")){%>
<%=mibean4.AJX_NIVMNTN2(request.getParameter("Id"),request.getParameter("Id2"),request.getParameter("Id3"),request.getParameter("control"), request.getParameter("SProc"),"div_cmbpos","cmb_pos","DEVOLVER_POST","1","compcomboAct")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_niv1")){%>
<%=
mibean4.AJX_NIVSPMODN1(request.getParameter("Id"),request.getParameter("Id2"), request.getParameter("control"), request.getParameter("SProc"),"div_cmbniv2","cmb_niv2","DEVOLVER_N2","1")%>
        <%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmd_defecto")){%>
<%=
mibean4.AJX_NIVMNTFALLO(request.getParameter("Id"), request.getParameter("control"),"cmb_categoria", request.getParameter("SProc"),"div_cmbniv1","cmb_niv1","DEVOLVER_N1","1","compcomboAct")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("txt_lg")){
    %>
        <%=mibean4.AJX_LIDERG(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"1")%>
    <%}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("LET")){%>
<%=
mibean4.AJX_NIVMNT(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"div_perres","cmb_personal","BUSCAR_PERSONAL","20")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cod_modelo")){%>
<%=
mibean4.AJX_ET(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"txt_VIN")%>
<%//cogemos valores de la bdd
}
%>
    </body>
</html>