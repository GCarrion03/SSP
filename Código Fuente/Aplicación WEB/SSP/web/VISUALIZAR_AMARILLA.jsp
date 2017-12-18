<%-- 
    Document   : VISUALIZAR_AMARILLA
    Created on : 29/09/2010, 09:13:39 AM
    Author     : Guz
--%>

<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="net.sf.jasperreports.engine.xml.JRXmlLoader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.servlet.ServletOutputStream"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.*"%>
<%@page import="net.sf.jasperreports.engine.data.*"%>
<%@page import="net.sf.jasperreports.engine.export.*"%>
<%@page import="net.sf.jasperreports.engine.design.*"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="net.sf.jasperreports.view.*"%>
<%@page import="java.io.*"%>
<jsp:useBean id="beanrreporte" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
 <%
    if(request.getParameter("btn_lista")!=null)
    {
    String tipo_doc="",corresponsalcali="",plataforma="",punto_apertura="",ponderacion="",area="",lider_grupo="",archivojrxml="",cadsql="";
    tipo_doc=request.getParameter("tipo_d");
    String[] items = request.getParameterValues("cmb_ponderacion");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    ponderacion+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        ponderacion=ponderacion+",";
                    }
                }
    items = request.getParameterValues("cmb_plataforma");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    plataforma+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        plataforma=plataforma+",";
                    }
                }
    items = request.getParameterValues("evs");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    punto_apertura+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        punto_apertura=punto_apertura+",";
                    }
                }
    items = request.getParameterValues("cmb_corresp");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    corresponsalcali+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        corresponsalcali=corresponsalcali+",";
                    }
                }
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("reportes/REP_LISTA_PLANTA_AMA.jrxml"));
    JRDesignQuery query = new JRDesignQuery();
    //query.setText("select * from historico_problema");
    query.setText("{ call DBO.REPORTELISTAYC('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+ponderacion+"','"+plataforma+"','"+punto_apertura+"','"+corresponsalcali+"')}");
    System.out.println(query.getText());
    jasperDesign.setQuery(query);
    try
    {
      jasperReport = JasperCompileManager. compileReport(jasperDesign);
      DataSource ds;
      String is_error;
      Connection ic_con = null;
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
      byte[] data= xlsReport.toByteArray();
      //byte[] data=JasperExportManager.exportReportToPdf(jasperPrint);
      response.setContentType("application/vnd.ms-excel");
      response.setHeader("Content-Disposition","attachment;filename=REPORTEAMA.xls\";");
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
    }
%>
<%
response.reset();
if(request.getParameter("btn_reporteYC")!=null)
    {
    String tipo_doc="",corresponsalcali="",plataforma="",punto_apertura="",ponderacion="",area="",lider_grupo="",archivojrxml="",cadsql="";
    tipo_doc=request.getParameter("tipo_d");
    String[] items = request.getParameterValues("cmb_ponderacion");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    ponderacion+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        ponderacion=ponderacion+",";
                    }
                }
    items = request.getParameterValues("cmb_plataforma");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    plataforma+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        plataforma=plataforma+",";
                    }
                }
    items = request.getParameterValues("evs");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    punto_apertura+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        punto_apertura=punto_apertura+",";
                    }
                }
    items = request.getParameterValues("cmb_corresp");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    corresponsalcali+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        corresponsalcali=corresponsalcali+",";
                    }
                }
JasperReport jasperReport;
    JasperPrint jasperPrint;
    JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("reportes/RESUMEN_PLANTA_YC.jrxml"));
    //JasperDesign jasperDesign = JRXmlLoader.load("C:/Users/Guz/Documents/NetBeansProjects/JASPER/build/web/RESUMEN_PLANTA.jrxml");
    JRDesignQuery query = new JRDesignQuery();
    //query.setText("select * from historico_problema");
     if (request.getParameter("cmb_treport2").compareTo("1")==0 ){
        query.setText("{call DBO.REPORTEYCEV('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+ponderacion+"','"+plataforma+"','"+punto_apertura+"','"+corresponsalcali+"')}");
    }
    if (request.getParameter("cmb_treport2").compareTo("2")==0){
        query.setText("{call DBO.REPORTEYCLET('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+ponderacion+"','"+plataforma+"','"+punto_apertura+"','"+corresponsalcali+"')}");
        }
    jasperDesign.setQuery(query);
      jasperReport = JasperCompileManager. compileReport(jasperDesign);
      DataSource ds;
        String is_error;
        Connection ic_con = null;
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
        ic_con.close();
        response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        response.reset();
        response.setHeader("Expires", "0");
        response.setHeader("Cache-Control","must-revalidate, post-check=0, pre-check=0");
        response.setHeader("Pragma", "public");
        response.setContentType("text/html");
        JRExporter exporter = null;
        ServletOutputStream servletoutstr = response.getOutputStream();
        exporter = new JRHtmlExporter();
        servletoutstr.println("<BODY class=\"generalbodycolor\"  bgproperties=\"fixed\" style=\"background-color: transparent;position:absolute\">");
        servletoutstr.println("<form name=\"form2\" method=\"post\" action=\"\">");
        servletoutstr.println("<h1 align=\"center\">&nbsp;</h1>");
        servletoutstr.println("</form>");
        servletoutstr.println("</BODY>");
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletoutstr);
        Map imagesMap = new HashMap();
        request.getSession().setAttribute("IMAGES_MAP", imagesMap);
        //exporter.setParameter(JRHtmlExporterParameter.IMAGES_MAP, imagesMap);
        //exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "image.jsp?image=");
        try
        {
                exporter.exportReport();
        }
        catch (JRException e)
        {

        }
        finally
        {
                if (servletoutstr != null)
                {
                        try
                        {
                                 servletoutstr.flush();
                                 servletoutstr.close();
                        }
                        catch (IOException ex)
                        {
                        }
        }
        }
        }
  %>
