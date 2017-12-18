<%-- 
    Document   : VISUALIZAR
    Created on : 24/09/2010, 11:05:34 AM
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
    if (request.getParameter("btn_lista")!=null)
        {
        String tipo_doc="",turno="",escalonamiento="",plataforma="",punto_apertura="",ponderacion="",area="",lider_grupo="",archivojrxml="",cadsql="";
        /*String[] items = request.getParameterValues("t_doc");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    tipo_doc+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        tipo_doc=tipo_doc+",";                    }
                }*/
    tipo_doc=request.getParameter("tipo_d");
    String[] items = request.getParameterValues("txt_turno");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    turno+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        turno=turno+",";
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
    items = request.getParameterValues("cmb_ptoap");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    punto_apertura+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        punto_apertura=punto_apertura+",";
                    }
                }
    items = request.getParameterValues("cmb_ponderacion");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    ponderacion+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        ponderacion=ponderacion+",";
                    }
                }
    items = request.getParameterValues("txt_Area");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    area+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        area=area+",";
                    }
                }
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("reportes/ReportejasperFMEAS.jrxml"));
    JRDesignQuery query = new JRDesignQuery();
    //query.setText("select * from historico_problema");
    query.setText("{ call DBO.REPORTELISTFMEA('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"')}");
    //query.setText("{ call DBO.REP_LISTA_PLANTA('"+tipo_doc+"','4','5')}");
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
      response.setHeader("Content-Disposition","attachment;filename=REPORTE.xls\";");
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
//response.reset();
if (request.getParameter("btn_reporte")!=null)
    {%>
    <%
    String tipo_doc="",turno="",escalonamiento="",plataforma="",punto_apertura="",ponderacion="",area="",lider_grupo="",archivojrxml="",cadsql="";
    /*String[] items = request.getParameterValues("t_doc");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    tipo_doc+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        tipo_doc=tipo_doc+",";                    }
                }*/
    tipo_doc=request.getParameter("tipo_d");
    String[] items = request.getParameterValues("txt_turno");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    turno+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        turno=turno+",";
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
    items = request.getParameterValues("cmb_ptoap");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    punto_apertura+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        punto_apertura=punto_apertura+",";
                    }
                }
    items = request.getParameterValues("cmb_ponderacion");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    ponderacion+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        ponderacion=ponderacion+",";
                    }
                }
    items = request.getParameterValues("txt_Area");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    area+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        area=area+",";
                    }
                }
    if (request.getParameter("cmb_treport").compareTo("1")==0 ){
        archivojrxml="reportes/RESUMEN_PLANTAFMEA.jrxml";
        cadsql="{ call DBO.REPORTEFMEAAREA ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"') }";
    }
    String Cadenarpttop10="{ call DBO.REPORTELISTATOP10FMEA('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"' )}";
    JasperReport jasperReport;
    JasperReport jasperReporttop;
    JasperPrint jasperPrint;
    JasperPrint jasperPrinttop;
    JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("reportes/RESUMEN_PLANTAFMEA.jrxml"));
    JasperDesign jasperDesigntop = JRXmlLoader.load(getServletContext().getRealPath("reportes/ReportejasperTOP10.jrxml"));
    //JasperDesign jasperDesign = JRXmlLoader.load("C:/Users/Guz/Documents/NetBeansProjects/JASPER/build/web/RESUMEN_PLANTA.jrxml");
    JRDesignQuery query = new JRDesignQuery();
    JRDesignQuery querytop = new JRDesignQuery();
    //query.setText("select * from historico_problema");
    query.setText(cadsql);
    querytop.setText(Cadenarpttop10);
    //query.setText("{ call DBO.TEST2 ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+escalonamiento+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"','"+lider_grupo+"') }");
    //query.setText("{ call DBO.REP_CONTEO_DOCUMENTOS_PLANTA ('"+tipo_doc+"','4','5','"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"')}");
    jasperDesign.setQuery(query);
    jasperDesigntop.setQuery(querytop);
      jasperReport = JasperCompileManager.compileReport(jasperDesign);
      jasperReporttop = JasperCompileManager.compileReport(jasperDesigntop);
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
        jasperPrinttop = JasperFillManager.fillReport(jasperReporttop, new HashMap(), ic_con);
        ic_con.close();

        /*response.setHeader("Cache-Control","no-cache");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        response.reset();*/
        out.clear();
        response.setHeader("Expires", "0");
        response.setHeader("Cache-Control","must-revalidate, post-check=0, pre-check=0");
        response.setHeader("Pragma", "public");
        response.setContentType("text/html");
        response.getOutputStream().print("<BODY class=\"generalbodycolor\"  bgproperties=\"fixed\" style=\"background-color: transparent;position:absolute\">");
        response.getOutputStream().print("<h1 align=\"center\">&nbsp;</h1>");
        response.getOutputStream().print("</BODY>");
        JRExporter exporter = null;
         JRExporter exportertop = null;

        ServletOutputStream servletoutstr = response.getOutputStream();
        exporter = new JRHtmlExporter();
        exportertop = new JRHtmlExporter();
        //servletoutstr.println("<BODY class=\"generalbodycolor\"  bgproperties=\"fixed\" style=\"background-color: transparent;position:absolute\">");
        //servletoutstr.println("<h1 align=\"center\">&nbsp;</h1>");
        //servletoutstr.println("</BODY>");
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, servletoutstr);
        exportertop.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrinttop);
        exportertop.setParameter(JRExporterParameter.OUTPUT_STREAM, servletoutstr);
        Map imagesMap = new HashMap();
        request.getSession().setAttribute("IMAGES_MAP", imagesMap);
        //exporter.setParameter(JRHtmlExporterParameter.IMAGES_MAP, imagesMap);
        //exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI, "image.jsp?image=");
        try
        {
                exporter.exportReport();
                //exportertop.exportReport();
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