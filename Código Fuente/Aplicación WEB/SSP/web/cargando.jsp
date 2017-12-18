<%-- 
    Document   : cargando.jsp
    Created on : 22/10/2010, 08:51:56 AM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
if(session.getAttribute("wait") != null){
session.removeAttribute("wait");
%>
<html>
<head><title>Generando...</title>
<meta http-equiv='Refresh' content='2'>
<style type="text/css">
.wait{
font-family: arial;
font-size: 13px;
color: #ff0000;
font-weight: bold;
}
</style>
</head>
<body>
<table align="center" valign="middle">
<tr>
<td class="wait">
Por favor espere, El reporte est&aacute; siendo generado...
<br></td>
</tr>
<tr>
<td><img src="images/cargando.gif" alt="cargando" width="300" height="250"></td>
</tr>
</table>
    <% %>
</body>
</html>
<%
}
else{
session.setAttribute("wait", new String());
%>
<%if (request.getParameter("btn_reporte")!=null)
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
    items = request.getParameterValues("cmb_escalonamiento");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    escalonamiento+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        escalonamiento=escalonamiento+",";
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
    items = request.getParameterValues("txt_lg");
    for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                   lider_grupo+=items[loopIndex];
                if (loopIndex<(items.length-1))
                    {
                        lider_grupo=lider_grupo+",";
                    }
                }
    if (request.getParameter("cmb_treport").compareTo("1")==0 ){
        archivojrxml="reportes/RESUMEN_PLANTA.jrxml";
        cadsql="{ call DBO.REPORTEPPSAREA ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+escalonamiento+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"','"+lider_grupo+"') }";
    }
    if (request.getParameter("cmb_treport").compareTo("2")==0){
        archivojrxml="reportes/RESUMEN_PLANTA.jrxml";
        cadsql="{ call DBO.REPORTEPPSLIDERG ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+escalonamiento+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"','"+lider_grupo+"') }";
        }
    if (request.getParameter("cmb_treport").compareTo("3")==0){
        archivojrxml="reportes/RESUMEN_PLANTA.jrxml";
        cadsql="{ call DBO.REPORTEPPSPTOAP ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+escalonamiento+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"','"+lider_grupo+"') }";
        }
    if (request.getParameter("cmb_treport").compareTo("4")==0){
        archivojrxml="reportes/RESUMEN_PLANTA.jrxml";
        cadsql="{ call DBO.REPORTEPPSCORR ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+escalonamiento+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"','"+lider_grupo+"') }";
        }
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("reportes/RESUMEN_PLANTA.jrxml"));
    //JasperDesign jasperDesign = JRXmlLoader.load("C:/Users/Guz/Documents/NetBeansProjects/JASPER/build/web/RESUMEN_PLANTA.jrxml");
    JRDesignQuery query = new JRDesignQuery();
    //query.setText("select * from historico_problema");
    query.setText(cadsql);
    //query.setText("{ call DBO.TEST2 ('"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"','"+tipo_doc+"','"+turno+"','"+escalonamiento+"','"+plataforma+"','"+punto_apertura+"','"+ponderacion+"','"+area+"','"+lider_grupo+"') }");
    //query.setText("{ call DBO.REP_CONTEO_DOCUMENTOS_PLANTA ('"+tipo_doc+"','4','5','"+request.getParameter("txt_fini")+"','"+request.getParameter("txt_ffin")+"')}");
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
        
        ServletOutputStream servletoutstr = response.getOutputStream();
        exporter = new JRHtmlExporter();
        //servletoutstr.println("<BODY class=\"generalbodycolor\"  bgproperties=\"fixed\" style=\"background-color: transparent;position:absolute\">");
        //servletoutstr.println("<h1 align=\"center\">&nbsp;</h1>");
        //servletoutstr.println("</BODY>");
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
  aaaaaaaaaaaaaa
<%}%>
