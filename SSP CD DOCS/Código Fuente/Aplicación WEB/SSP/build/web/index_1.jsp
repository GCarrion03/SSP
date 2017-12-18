<%-- 
    Document   : index
    Created on : 17/09/2010, 01:13:15 PM
    Author     : Guz
--%>
<%@page import="net.sf.jasperreports.engine.design.JRDesignQuery"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <H1>LLENANDO REPORTE</H1>
        <%
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    JasperDesign jasperDesign = JRXmlLoader.load("C:/Users/Guz/Documents/NetBeansProjects/JASPER/build/web/Reportejasper.jrxml");
    JRDesignQuery query = new JRDesignQuery();
    //query.setText("select * from historico_problema");
    query.setText("{ call DBO.REP_LISTA_PLANTA('1','4','5')}");
    jasperDesign.setQuery(query);

    try
    {
      jasperReport = JasperCompileManager. compileReport(jasperDesign);
      DataSource ds;
        String is_error;
        Connection ic_con = null;
        CachedRowSetImpl lcrs_rowset;
        try
        {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("SQL_jdbc");
            ic_con=ds.getConnection();

        }
        catch (SQLException e)
        {
            is_error=e.getMessage();
        }
      jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(), ic_con);
      ByteArrayOutputStream xlsReport = new ByteArrayOutputStream();
      JRXlsExporter exporterXls = new JRXlsExporter ();
      exporterXls.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
      //exporterXls.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, "demo.xls");
      exporterXls.setParameter(JRExporterParameter.OUTPUT_STREAM, xlsReport);
      //exporterXls.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, "C:/jasperRepots/demo.xls");
      exporterXls.exportReport();
      JasperExportManager.exportReportToPdfFile(jasperPrint, "simple_report.pdf");
      byte[] data= xlsReport.toByteArray();
      //byte[] data=JasperExportManager.exportReportToPdf(jasperPrint);
      response.setContentType("application/vnd.ms-excel");
      response.setHeader("Content-Disposition","attachment;filename=demo.xls\";");
      //response.setHeader("Content-Disposition","attachment;filename=\""+request.getParameter("var")+".pdf\";");
      response.setContentLength(data.length);
      javax.servlet.ServletOutputStream servletoutputstream = response.getOutputStream();
      servletoutputstream.write(data);
      servletoutputstream.flush();
      servletoutputstream.close();
       ic_con.close();
    }
    catch (JRException e)
    {
      e.printStackTrace();
    }
    
%>
<H1>HECHO</H1>
    </head>
    <body>
    </body>
</html>
