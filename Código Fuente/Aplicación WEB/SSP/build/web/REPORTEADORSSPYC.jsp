<%-- 
    Document   : REPORTEADORSSP
    Created on : 04/10/2010, 08:55:39 AM
    Author     : Guz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="Estilos carpeta/estilo fieldset.css" rel="stylesheet" type="text/css">
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="page" >
        </jsp:useBean>
        <script type="text/javascript" src="peticioajax.js"></script>
    	<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
        <script type="text/javascript" src="referencias.js"></script>
        <script type="text/javascript">
            function fechapred()
            {
                if (document.getElementById('rangofch').value=='1')
                    {
                        setfecha('01/01/<%=beanprincipal.getanio()%>','<%=beanprincipal.Strfechahoy()%>');
                    }
                if (document.getElementById('rangofch').value=='2')
                    {
                        setfecha('01/<%=beanprincipal.getmes()%>/<%=beanprincipal.getanio()%>','<%=beanprincipal.Strfechahoy()%>');
                    }
                if (document.getElementById('rangofch').value=='3')
                    {
                        setfecha('<%=beanprincipal.Strfechahoy()%>','<%=beanprincipal.Strfechahoy()%>');
                    }
                if (document.getElementById('rangofch').value=='4')
                    {
                        unlock('txt_fini');
                        unlock('txt_ffin');
                    }
            }
            function setfecha(fecha1,fecha2)
            {
                document.getElementById('txt_fini').value=fecha1;
                document.getElementById('txt_ffin').value=fecha2;
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Reporteador</title>
    <style type="text/css">
<!--
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
}
-->
</style></head>
    <body style="background-color: transparent;position:absolute">
	<%
        if (request.getParameter("btn_reporte")!=null)
           {
             String listavars="";
             /*String[] items = request.getParameterValues("t_doc");
                for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
                    listavars+=""+items[loopIndex];
                    out.println(items[loopIndex] + "<BR>");
                }
             response.sendRedirect("test.jsp");*/
              //response.sendRedirect("VISUALIZAR_REPORTE_PLANTA.jsp?fini="+request.getParameter("txt_fini")+"&T_DOC=2&ffin="+request.getParameter("txt_ffin"));
           }
        if (request.getParameter("btn_exportar")!=null)
        {
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    JasperDesign jasperDesign = JRXmlLoader.load(getServletContext().getRealPath("reportes/Reportejasper.jrxml"));
    JRDesignQuery query = new JRDesignQuery();
    //query.setText("select * from historico_problema");
    query.setText("{ call DBO.REP_LISTA_PLANTA('2','4','5')}");
    //query.setText("{ call DBO.REP_LISTA_PLANTA('"+request.getParameter("T_DOC")+"','4','5')}");
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
    }%>
    <form name="formdoc"  method="post" action="VISUALIZAR_AMARILLA.jsp?tipo_d=<%=request.getParameter("tipo_d")%>">
    <table width="100%"> <tr> <th>Generador de reportes</th> </tr>
    <tr> <td>
          <table width="100%" border="0">
            <tr>
              <td width="50%"><fieldset class="fieldset">
                <legend>Información registro:</legend>
                <table width="100%" border="0"  bordercolor="#990000">
                  <tr>
                  	<td>Rango de fechas</td>
                    <td><select name="rangofch" size="5" onchange="Javascript:fechapred()">
                      <option selected value="1" >AÑO EN CURSO</option>
                      <option value="2">MES EN CURSO</option>
                      <option value="3">HOY</option>
                      <option value="4">PERSONALIZADO</option>
                    </select>                    </td>
				<td align="left">Criticidad: </td>
                    <td align="left"><select name="cmb_ponderacion" size="3" multiple id="cmb_ponderacion" style="width:100%;z-index:5">
                      <option selected value="<%=beanprincipal.devuelve_commakey("OBTENER_CRITICIDAD()")%>">Todos</option>
                      <%=beanprincipal.obtponderacion()%>
                    </select></td>
                  </tr>
                    
                    <tr>
                    
                    <td width="15%" align="left" scope="row">Fecha Inicio: </td>
                    <td width="35%" align="center"><input id="txt_fini" name="txt_fini" type="text" size="25" value="01/01/<%=beanprincipal.getanio()%>">
                    <a name="cal_fini" id="cal_fini" href="javascript:NewCal('txt_fini','ddmmyyyy',false,12)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                    <td width="15%" align="left">Fecha Fin:</td>
                    <td width="35%" align="center"><input id="txt_ffin" name="txt_ffin" type="text" size="25" value="<%=beanprincipal.Strfechahoy()%>">
                    <a href="javascript:NewCal('txt_ffin','ddmmyyyy',false,12)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                  </tr>
              </table>
              </fieldset>
              </td><td width="50%"> <fieldset class="fieldset">
                <legend>Información del vehículo:</legend>
            <table width="100%" height="100%" >
                  <tr>
                    <td width="50%" height="131"><div align="center">Plataforma:</div></td>
                  <td width="50%"><select name="cmb_plataforma" size="5" multiple id="cmb_plataforma" style="width:100%">
		          <option selected value="<%=beanprincipal.devuelve_commakey("MOSTRAR_PLATAFORMA()")%>">Todos</option>
                    <%=beanprincipal.obtplataforma()%>
                  </select></td>
                  </tr>
                </table>
              </fieldset>
              
              </td></tr></table>
             <table width="100%" border="0"> 
            <tr>
        <td><fieldset class="fieldset">
              <legend>Datos Tarjeta Amarilla:</legend>
              <table width="93%" border="0" align="center" bordercolor="#990000">
        <tr align="center">
        <td>
        Estacion de verificacion:
        </td>
        <td><select name="evs" size="5" multiple id="evs">
	          <option selected value="<%=beanprincipal.devuelve_commakey("DEVUELVEPTOAP()")%>">Todos</option>
                <%=beanprincipal.devuelve_dept()%>
        </select>        </td>
        <td>Nombre L.E.T. de E.V.:</td>
        <td><select name="cmb_corresp" size="5" id="cmb_corresp">
        <option selected value="<%=beanprincipal.devuelve_commakey("DEVUELVE_CORRESPONSALES()")%>">Todos</option>
                        <%=beanprincipal.devuelve_corresponsales()%>
        </select>        </td>
        </tr>
              </table>
                  </fieldset> </td>
              <td width="36%">
              <fieldset class="fieldset">
              <legend>Tipo de Reporte:</legend>
            <table width="93%" height="96" border="0" align="center" bordercolor="#990000">
<tr align="center">
                  <td width="11%" height="92"><select name="cmb_treport2" size="5">
                    <option selected value="1">ESTACIONES DE VERIFICACIÓN</option>
                    <option value="2">LETS CALIDAD</option>
                  </select></td>
              </tr>
              </table>
                </fieldset> 
              </td>
            </tr>
            </table>
            <table width="100%" border="0"> 
            <tr>
              <td width="51%">                     </td>
              </tr>
            </table>
            </td>
        </tr>
        <tr>
        <td align="center">
        <table width="100%">
        <tr align="center">
        <td>
        <input name="btn_reporteYC" type="submit" value="Generar Reporte" style="width:300px">
        </td>
        <td>
        <input name="btn_lista" type="submit" value="Generar Detalle Documentos" style="width:300px">
        </td>
        </tr>
        </table>
        </td>
        </tr>
    </table>
    </form>
</body>
</html>