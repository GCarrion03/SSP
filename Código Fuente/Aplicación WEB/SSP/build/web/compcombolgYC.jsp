<%-- 
    Document   : combodependiente
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
        <script language = "JavaScript">
            alert("aaa<%=request.getParameter("control")%>");
        </script>
    <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="session" >
    </jsp:useBean>
            <%
//recogemos el parámetro
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_personal")){%>
<%=mibean4.AJX_PERSONAL(request.getParameter("Id"),request.getParameter("control"), request.getParameter("SProc"))%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("coddoc")){%>
<%=mibean4.AJX_CARGAID_DOC(request.getParameter("Id"),request.getParameter("Id2"),request.getParameter("Id3"), request.getParameter("control"), request.getParameter("SProc"))%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("txtrep")){%>
<%=mibean4.AJX_MUESTRA_TEXTO(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"))%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_pos")){%>
<%=mibean4.AJX_ET(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"btn_Guardar")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_niv2")){%>
<%=mibean4.AJX_NIVYC(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"div_cmbpos","cmb_pos","DEVOLVER_POS")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmb_niv1")){%>
<%=
mibean4.AJX_NIVSPYC(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"div_cmbniv2","cmb_niv2","DEVOLVER_N2")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("cmd_defecto")){%>
<%=
mibean4.AJX_NIVYC(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"div_cmbniv1","cmb_niv1","DEVOLVER_N1")%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("txt_lg")){%>
<%=
mibean4.AJX_LG(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"))%>
<%//cogemos valores de la bdd
}
if((request.getParameter("Id")!=null) && request.getParameter("control").equals("LET")){%>
<%=
mibean4.AJX_NIV(request.getParameter("Id"), request.getParameter("control"), request.getParameter("SProc"),"div_perres","cmb_personal","BUSCAR_PERSONAL")%>
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