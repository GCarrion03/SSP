<%-- 
    Document   : reporteini
    Created on : 06-22-2010, 08:54:01 AM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte inicial</title>
    </head>
    <body style="background-color: transparent">
        <jsp:useBean id="mibean4" class="SSP_CAPAS.GMPresentacion" scope="request" >
            <% mibean4.setir_request(request);%>
        </jsp:useBean>
        <%@ page language="java" import="javazoom.upload.*,java.util.*" %>
        <jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
            <%--<jsp:setProperty name="upBean" property="folderstore" value="C:/SSP/build/web/SSPFOTOS" />--%>
            <jsp:setProperty name="upBean" property="folderstore" value="C:\glassfishv3\glassfish\domains\domain1\applications\SSP\SSPFOTOS"/>
        </jsp:useBean>
        <% if (MultipartFormDataRequest.isMultipartFormData(request))
                {
                    MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
                    if(mrequest.getParameter("btn_Guardar")!= null)
                    {
         /* Uses MultipartFormDataRequest to parse the HTTP request.*/
         String todo = null;
         if (mrequest != null)
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("imageField");
                    file.setFileName("P"+mrequest.getParameter("coddoc")+".jpeg");
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "imageField");
                }
                else
                {
                }
	     }
                               %>
                      <%--<script language = "JavaScript">
                           alert("OJALA <%=mrequest.getParameter("coddoc")%>-------------------------<%=mrequest.getParameter("f_apertura")%>-------------------------<%=mrequest.getParameter("id_usr")%>-------------------------<%=mrequest.getParameter("cmb_iniciador")%>-------------------------<%=mrequest.getParameter("cmb_dpn")%>-------------------------<%=mrequest.getParameter("txt_turno")%>-------------------------<%=mrequest.getParameter("txt_Area")%>-------------------------<%=mrequest.getParameter("txt_lg")%>-------------------------<%=mrequest.getParameter("LET")%>-------------------------<%=mrequest.getParameter("cmb_personal")%>-------------------------<%=mrequest.getParameter("cmb_corresp")%>-------------------------<%=mrequest.getParameter("cmb_escalonamiento")%>-------------------------<%=mrequest.getParameter("cmb_ponderacion")%>-------------------------<%=mrequest.getParameter("cmb_plataforma")%>-------------------------<%=mrequest.getParameter("cod_modelo")%>-------------------------<%=mrequest.getParameter("txt_VIN")%>-------------------------<%=mrequest.getParameter("txtlote")%>-------------------------<%=mrequest.getParameter("cmb_categoria")%>-------------------------<%=mrequest.getParameter("cmd_defecto")%>-------------------------<%=mrequest.getParameter("cmb_niv1")%>-------------------------<%=mrequest.getParameter("cmb_niv2")%>-------------------------<%=mrequest.getParameter("cmb_pos")%>-------------------------<%=mrequest.getParameter("txt_detalle")%>-------------------------<%=mrequest.getParameter("txtrep")%>-------------------------<%=mrequest.getParameter("listaprb")%>-------------------------<%=mrequest.getParameter("t_doc")%>-------------------------<%=mrequest.getParameter("f_apertura")%>)");
                      </script>--%>
                  <%
                      if(mibean4.insertarprob(mrequest.getParameter("coddoc"),mrequest.getParameter("f_apertura"),mrequest.getParameter("cmb_ptoap"),mrequest.getParameter("id_usr"),mrequest.getParameter("cmb_dpn"),mrequest.getParameter("txt_turno"),mrequest.getParameter("txt_Area"),mrequest.getParameter("txt_lg"),mrequest.getParameter("LET"),mrequest.getParameter("cmb_personal"),mrequest.getParameter("cmb_corresp"),mrequest.getParameter("cmb_escalonamiento"),mrequest.getParameter("cmb_ponderacion"),mrequest.getParameter("cmb_plataforma"),mrequest.getParameter("cod_modelo"),mrequest.getParameter("txt_VIN"),mrequest.getParameter("txtlote"),mrequest.getParameter("cmb_categoria"),mrequest.getParameter("cmd_defecto"),mrequest.getParameter("cmb_niv1"),mrequest.getParameter("cmb_niv2"),mrequest.getParameter("cmb_pos"),mrequest.getParameter("txt_detalle"),mrequest.getParameter("txtrep"),mrequest.getParameter("listaprb"),mrequest.getParameter("t_doc"),mrequest.getParameter("f_apertura")))
                          {
                      %>
    <script language = "JavaScript">
        alert("Documento Guardado exitosamente");
        <%--alert("<%=mrequest.getParameter("coddoc")%>   <%=mrequest.getParameter("f_apertura")%>          <%=mrequest.getParameter("id_usr")%>          <%=mrequest.getParameter("cmb_dpn")%>          <%=mrequest.getParameter("txt_turno")%>          <%=mrequest.getParameter("txt_Area")%>          <%=mrequest.getParameter("txt_lg")%>          <%=mrequest.getParameter("LET")%>          <%=mrequest.getParameter("cmb_escalonamiento")%>          <%=mrequest.getParameter("cmb_ponderacion")%>          <%=mrequest.getParameter("cmb_plataforma")%>          <%=mrequest.getParameter("cod_modelo")%>          <%=mrequest.getParameter("cmb_categoria")%>          <%=mrequest.getParameter("cmd_defecto")%>          <%=mrequest.getParameter("cmb_niv1")%>          <%=mrequest.getParameter("cmb_niv2")%>          <%=mrequest.getParameter("cmb_pos")%>          <%=mrequest.getParameter("txtrep")%>          <%=mrequest.getParameter("listaprb")%>          <%=mrequest.getParameter("t_doc")%>");
    alert("El cinco pasos <%=mrequest.getParameter("coddoc")%> fue ingresado satisfactoriamente.");--%>
</script>
                      <%
                      }
         }
                    if(mrequest.getParameter("btn_GuardarRX")!=null)
                        {
                        
                         String todo = null;
                        if (mrequest != null)
                            {
                            Hashtable files = mrequest.getFiles();
                                if ( (files != null) && (!files.isEmpty()) )
                            {
                                UploadFile file = (UploadFile) files.get("imageField");
                    file.setFileName("P"+mrequest.getParameter("coddoc")+".jpeg");
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "imageField");
                }
                else
                {
                }
	     }

  %>
                        <%String[] integrantes = mrequest.getParameterValues("cmb_equipo");
                        if(mibean4.insertarequipoRX(mrequest.getParameter("coddoc"),integrantes)){%>
                                       <script language="javascript">
				         alert('Equipo guardado exitosamente');
				       </script>
                        <%}%>
                            <%if(mibean4.insertarRX(mrequest.getParameter("coddoc"),mrequest.getParameter("txt_Area"),mrequest.getParameter("id_usr"),mrequest.getParameter("f_apertura"),mrequest.getParameter("txt_lider_equipo"),mrequest.getParameter("cmb_plataforma"),mrequest.getParameter("cmb_categoria"),mrequest.getParameter("cmd_defecto"),mrequest.getParameter("cmb_niv1"),mrequest.getParameter("cmb_niv2"),mrequest.getParameter("cmb_pos"),mrequest.getParameter("txt_detalle"))){
					  %>
                                          <script language="javascript">
					  alert('REDX guardado exitosamente');
					  </script>
                      <%}

                    }

					  
					 /* if(mrequest.getParameter("FMEAS")!=null)
					  {
					  if(mibean4.insertadicfmea(mrequest.getParameter("coddoc"))){
					  
                      }
					  }*/
                  }
              %>
</body>
</html>
