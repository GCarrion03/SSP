<%-- 
    Document   : filtrosreportes
    Created on : 05-25-2010, 09:21:09 AM
    Author     : Guz
--%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="net.sf.jasperreports.engine.JRExporterParameter"%>
<%@page import="net.sf.jasperreports.engine.export.JRXlsExporter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="net.sf.jasperreports.engine.JasperFillManager"%>
<%@page import="net.sf.jasperreports.engine.JasperExportManager"%>
<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="net.sf.jasperreports.engine.JREmptyDataSource"%>
<%@page import="net.sf.jasperreports.engine.JRException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperPrint"%>
<%@page import="net.sf.jasperreports.view.JasperViewer"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.jasperreports.engine.JasperManager"%>
<%@page import="net.sf.jasperreports.engine.JasperReport"%>
<%@page import="net.sf.jasperreports.engine.design.JasperDesign"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
		<%     if (request.getParameter("btn_RPPS")!=null)
				{
					response.sendRedirect("REPORTEADORSSP.jsp?tipo_d=2");
				}
				if (request.getParameter("btn_RBC")!=null)
				{
					response.sendRedirect("REPORTEADORSSPBC.jsp?tipo_d=1");
				}
				if (request.getParameter("btn_REDX")!=null)
				{
					response.sendRedirect("REPORTEADORSSPREDX.jsp?tipo_d=3");
				}
                                if (request.getParameter("btn_RYC")!=null)
				{
					response.sendRedirect("REPORTEADORSSPYC.jsp?tipo_d=5");
				}
				if (request.getParameter("btn_RDIG")!=null)
				{
					response.sendRedirect("Repdocsexist.jsp");
				}
				if (request.getParameter("btn_RFMEAS")!=null)
				{
					response.sendRedirect("REPORTEADORSSPFMEA.jsp?tipo_d=4");
				}
		%>
        <script language="javascript" type="text/javascript" src="datetimepicker.js">

//Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
//Script featured on JavaScript Kit (http://www.javascriptkit.com)
//For this script, visit http://www.javascriptkit.com
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Filtros de reporte</title>
    <style type="text/css">
</style>
    </head>
<body style="background-color: transparent">
<form name="form1" method="post" action="">
        <h1 align="center">&nbsp;</h1>
        <h2 align="center">Seleccione la herramienta de la cual requiere Reportes:</h2>
<h1 align="center">
<table>
<tr>
<td>
        <table>
          <tr>
          <td>
          <input type="submit" name="btn_RBC" id="btn_RBC" value="Tarjeta Azul" style="width:100%">
          </td>
          </tr>
          <tr><td>
          <input type="submit" name="btn_RPPS" id="btn_RPPS" value="Cinco Pasos" style="width:100%">
          </td>
          </tr>
          <tr>
          <td>
          <input type="submit" name="btn_REDX" id="btn_REDX" value="RED-X" style="width:100%">
          </td>
          </tr>
          <tr>
          <td>
          <input type="submit" name="btn_RYC" id="btn_RYC" value="Tarjeta Amarilla" style="width:100%">
          </td>
          </tr>
          <tr>
          <td>
          <input type="submit" name="btn_RFMEAS" id="btn_RFMEAS" value="FMEAS REACTIVOS" style="width:100%">
          </td>
          </tr>
  </table>
  </td>
<td><input type="submit" name="btn_RDIG" id="btn_RDIG" value="CANTIDAD DIGITALIZADOS" style="width:100%"></td>
</tr>
  </table>
  </h1>
</form>
</body>
</html>