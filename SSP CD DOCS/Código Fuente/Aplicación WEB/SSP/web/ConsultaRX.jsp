<%-- 
    Document   : ConsultaRX
    Created on : 27/10/2010, 10:42:12 AM
    Author     : Guz
--%>

<%@page import="java.io.File"%>
<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="beandespliegue" class="SSP_CAPAS.GMPresentacion" scope="page" >
        </jsp:useBean>
	     <link href="Estilos carpeta/estilo fieldset.css" rel="stylesheet" type="text/css">
<jsp:useBean id="upBean" scope="request" class="javazoom.upload.UploadBean" >
            <%--<jsp:setProperty name="upBean" property="folderstore" value="C:/SSP/build/web/SSPFOTOS" />--%>
            <jsp:setProperty name="upBean" property="folderstore" value="C:/glassfishv3/glassfish/domains/domain1/applications/SSP/SSPFOTOS"/>
            <jsp:setProperty name="upBean" property="overwrite" value="true" />
        </jsp:useBean>
        <%if (request.getParameter("btn_verdig")!=null)
            {
                String sFichero = "C:/DIGITALIZADOS/"+request.getParameter("iddoc")+".pdf";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".TIF";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".pdf";
                 File fichero = new File(sFichero);
                 if (fichero.exists())
                 response.sendRedirect("despliegapdf.jsp?var="+request.getParameter("iddoc"));
                 else { 
             %>

                 <script language = "JavaScript">
                            alert("El Documento aun no ha sido escaneado");
                 </script>
<%}
            }
%>
<script language = "JavaScript">
				function abrirdoc()
				{
                                    open('Amaadic.jsp?iddoc=<%=request.getParameter("iddoc")%>','','top=200,left=200,width=600,height=100') ;
				 }
                                 function abrirdocFM()
				{
                                    open('FMEAadic.jsp?iddoc=<%=request.getParameter("iddoc")%>','','top=200,left=200,width=600,height=120') ;
				 }
            </script>
             <%
		if (MultipartFormDataRequest.isMultipartFormData(request))
                    {
      //response.sendRedirect("despliegapdf.jsp?var="+request.getParameter("iddoc"));
                    MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request, null, 100 * 1024 * 1024, MultipartFormDataRequest.COSPARSER, "UTF-8");
                    if(mrequest.getParameter("btn_Guardar")!= null)
                    {
                    //    out.println("<BR>");
                    /* Uses MultipartFormDataRequest to parse the HTTP request.*/
                    String todo = null;
                    if (mrequest != null)
                    {
                        Hashtable files = mrequest.getFiles();
                           if ( (files != null) && (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("imageField");
                    file.setFileName("P"+request.getParameter("iddoc")+".jpeg");
                    //if (file != null) out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "imageField");
                }
                else
                {
                  //out.println("<li>No uploaded files");
                }
	     }
                 if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"defprbls").compareTo("0")!=0)
                    {
					String[] integrantes = mrequest.getParameterValues("cmb_equipo");
						beandespliegue.cambiadatosadmin("ELIMINAR_EQUIPORX",request.getParameter("iddoc"));
                        if(beandespliegue.insertarequipoRX(request.getParameter("iddoc"),integrantes)){%>
                                       <script language="javascript">
				         alert('Equipo guardado exitosamente');
				       </script>
                        <%}
                  if(beandespliegue.actualizarRXadmin(request.getParameter("iddoc"),mrequest.getParameter("f_apertura"),mrequest.getParameter("cmb_area"),mrequest.getParameter("txt_lider"),mrequest.getParameter("hdn_status"),mrequest.getParameter("txt_fecha2"),mrequest.getParameter("txt_anul"),mrequest.getParameter("cmb_categoria"),mrequest.getParameter("cmd_defecto"),mrequest.getParameter("cmb_niv1"),mrequest.getParameter("cmb_niv2"),mrequest.getParameter("cmb_pos"),mrequest.getParameter("txt_detalle"),request.getParameter("var")))
                    {%>
                    <script language="JavaScript">
                        alert('Documento Principal modificado correctamente')
                        
                    </script>
                    <%}
                     else {%>
                        <script language="JavaScript">
                            alert('Error llene todos los campos correctamente')
                            alert('<%=mrequest.getParameter("hdn_status")%>')
                            alert('<%=request.getParameter("iddoc")%>      <%=mrequest.getParameter("f_apertura")%>      <%=mrequest.getParameter("cmb_area")%>      <%=mrequest.getParameter("txt_lider")%>      <%=mrequest.getParameter("hdn_status")%>      <%=mrequest.getParameter("txt_fecha2")%>      <%=mrequest.getParameter("txt_anul")%>      <%=mrequest.getParameter("cmb_categoria")%>      <%=mrequest.getParameter("cmd_defecto")%>      <%=mrequest.getParameter("cmb_niv1")%>      <%=mrequest.getParameter("cmb_niv2")%>      <%=mrequest.getParameter("cmb_pos")%>      <%=mrequest.getParameter("txt_detalle")%>      <%=request.getParameter("var")%>')
                            <%//System.out.println(request.getParameter("iddoc")+      mrequest.getParameter("f_apertura")+      mrequest.getParameter("cmb_area")      +mrequest.getParameter("txt_lider")+      mrequest.getParameter("hdn_status")      +mrequest.getParameter("txt_fecha2")      +mrequest.getParameter("txt_anul")      +mrequest.getParameter("cmb_categoria")      +mrequest.getParameter("cmd_defecto")      +mrequest.getParameter("cmb_niv1")      +mrequest.getParameter("cmb_niv2")      +mrequest.getParameter("cmb_pos")      +mrequest.getParameter("txt_detalle")      +request.getParameter("var") );%>
                        </script>
                         <%
                        }
                     }else{
                 if(beandespliegue.actualizarprob(request.getParameter("iddoc"),mrequest.getParameter("f_apertura"),mrequest.getParameter("t_doc"),mrequest.getParameter("cmb_dpn"),mrequest.getParameter("cmb_escalonamiento"),mrequest.getParameter("txt_turno"),mrequest.getParameter("cmb_ponderacion"),mrequest.getParameter("cod_modelo"),mrequest.getParameter("txt_VIN"),mrequest.getParameter("txtlote"),mrequest.getParameter("txt_lg"),mrequest.getParameter("LET"),mrequest.getParameter("cmb_personal"),mrequest.getParameter("cmb_corresp"),mrequest.getParameter("txt_Area"),mrequest.getParameter("hdn_status"),mrequest.getParameter("txt_aconten"),mrequest.getParameter("txt_lote"),mrequest.getParameter("txt_fecha"),mrequest.getParameter("txt_adefini"),mrequest.getParameter("txt_lote2"),mrequest.getParameter("txt_fecha2"),mrequest.getParameter("txt_origen"),mrequest.getParameter("cmb_5m"),mrequest.getParameter("txt_motivoa"),request.getParameter("var")))
                    {%>
                    <script language="JavaScript">
                        alert('Documento Principal modificado correctamente')
                    </script>
                    <%}
                     else {%>
                        <script language="JavaScript">
                            alert('Error llene todos los campos correctamente')
                            alert('<%=mrequest.getParameter("hdn_status")%>')
                            alert('<%=request.getParameter("iddoc")%>!--------------!<%=mrequest.getParameter("f_apertura")%>!--------------!<%=mrequest.getParameter("t_doc")%>!--------------!<%=mrequest.getParameter("cmb_dpn")%>!--------------!<%=mrequest.getParameter("cmb_escalonamiento")%>!--------------!<%=mrequest.getParameter("txt_turno")%>!--------------!<%=mrequest.getParameter("cmb_ponderacion")%>!--------------!<%=mrequest.getParameter("cod_modelo")%>!--------------!<%=mrequest.getParameter("txt_VIN")%>!--------------!<%=mrequest.getParameter("txtlote")%>!--------------!<%=mrequest.getParameter("txt_lg")%>!--------------!<%=mrequest.getParameter("LET")%>!--------------!<%=mrequest.getParameter("cmb_personal")%>!--------------!<%=mrequest.getParameter("cmb_corresp")%>!--------------!<%=mrequest.getParameter("txt_Area")%>!--------------!<%=mrequest.getParameter("hdn_status")%>!--------------!<%=mrequest.getParameter("txt_aconten")%>!--------------!<%=mrequest.getParameter("txt_lote")%>!--------------!<%=mrequest.getParameter("txt_fecha")%>!--------------!<%=mrequest.getParameter("txt_adefini")%>!--------------!<%=mrequest.getParameter("txt_lote2")%>!--------------!<%=mrequest.getParameter("txt_fecha2")%>!--------------!<%=mrequest.getParameter("txt_origen")%>!--------------!<%=mrequest.getParameter("cmb_5m")%>!--------------!<%=mrequest.getParameter("txt_motivoa")%>!--------------!<%=mrequest.getParameter("var")%>!')
                        </script>
                         <%
                        }
                 }
                }
                     if (mrequest.getParameter("btn_GuardarFM")!=null)
                        {%>
                           <% if (beandespliegue.ActualizarFMEA(request.getParameter("iddoc"), mrequest.getParameter("cmb_stsFM"), mrequest.getParameter("txt_fp2FMEAS"),mrequest.getParameter("txt_fsegFMEAS"),mrequest.getParameter("txt_fCFMEAS"),mrequest.getParameter("txt_HElementos"),mrequest.getParameter("txt_rpni"),mrequest.getParameter("txt_rpnf"),mrequest.getParameter("txt_ncasos"),mrequest.getParameter("txt_facilitador")))
                             {%>
                                  <script language="JavaScript">
                                        alert('FMEA Guardado correctamente')
                                  </script>
                            <%}
                        }
                    %>

        <%if (mrequest.getParameter("btn_Guardarama")!=null)
            {
                if (beandespliegue.ActualizarAma(request.getParameter("iddoc"), mrequest.getParameter("cmb_stsam"), mrequest.getParameter("cmb_responsable"),mrequest.getParameter("cmb_prsresp"),mrequest.getParameter("txt_fechaama")))
                    {%>
                    <script language="JavaScript">
                        alert('Tarjeta Amarilla Guardada correctamente')
                     </script>
                    <%}
            }
               }
		%>
        
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <script type="text/javascript" src="peticioajax.js"></script>
         <script type="text/javascript" src="referencias.js"></script>
          <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
   <%beandespliegue.OBTENERREGISTROSPRBL("CONSULTAR_REDX",request.getParameter("iddoc"));%>
          <script type="text/javascript">
                    var band=0;
                    var band1=0;
					var band2=0;
                    function habilitar()
                        {
                            if (band==0)
                                {
                                    document.formdoc.btn_Modificar.style.borderStyle="inset";
                                    document.formdoc.btn_Modificar.style.backgroundColor= "#666666";
                                    band=1;
                                    //unlock('t_doc');
                                    unlock('f_apertura');
                                    unhide('calendario');
                                    unlock('txt_lider');
                            /*
                            unlock('cmb_categoria');
                            unlock('cmb_defecto');
                            unlock('cmb_niv1');
                            unlock('cmb_niv2');
                            unlock('cmb_pos');
                            unlock('txt_detalle');*/
         					unlock('cmb_sts');
                            <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"defprbls").compareTo("0")!=0)
                                        {%>
                                            habilitardefprbl();
                                        <%}%>
                                                        if(document.getElementById('cmb_sts').value=='Ο')
							{
								habilitarcierreRX();
							}
                            }
                            else{
                               document.formdoc.btn_Modificar.style.borderStyle="outset";
                               document.formdoc.btn_Modificar.style.backgroundColor="#CCCCCC";
                               band=0;
                                    //lock('t_doc');
                                    lock('f_apertura');
                                    hide('calendario');
                                    lock('txt_lider');
									<%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"defprbls").compareTo("0")!=0)
                                        {%>
                                            deshabilitardefprbl();
                                        <%}%>
                            }
                    }
function cambioseg()
{
    deshabilitartodostsRX();
			document.getElementById('hdn_status').value=document.getElementById('cmb_sts').value;
                        if(document.getElementById('cmb_sts').value=='Χ'){
								deshabilitartodostsRX();
			            }
                          if(document.getElementById('cmb_sts').value=='Ο')
							{
								habilitarcierreRX();
							}
						if(document.formdoc.cmb_sts.value=='Φ'){                                    
								habilitaranulRX();
                                                                }
                                                //alert(document.getElementById('cmb_sts').value);
						}
						function deshabilitartodostsRX()
						{
							deshabilitarcierreRX();
							deshabilitaranulRX();
						}
                                                function habilitartodosts()
						{
							habilitarcierreRX();
							habilitaranulRX();
						}
                                                function habilitarforsubmt()
                                                {
                                                    habilitartodosts();
                                                    <%if (beandespliegue.EJECUTARSPDEVSTR("EXST_AMARILLA",request.getParameter("iddoc")).compareTo("0")!=0) {%>
                                                    unlock('txt_fechaama');
                                                    <%}%>
                                                    <%if (beandespliegue.EJECUTARSPDEVSTR("EXST_FMEAS",request.getParameter("iddoc")).compareTo("0")!=0) {%>
                                                    habilitarcierreFM();
                                                    habilitarsegFM();
                                                    habilitarp2FM();
                                                    unlock('txt_ncasos');
                                                    unlock('txt_facilitador');
                                                    <%}%>
													seltds();
                                                }
               function seltds()
	{
	var select1 = document.getElementById('cmb_equipo'); 
	var values = new Array(); 
 	for(var i=0; i < select1.options.length; i++){ 
    select1.options[i].selected = true;
} 
}
function insertOptionBefore()
		{
                    var elSel = document.getElementById('cmb_equipo');
                    var elOptNew = document.createElement('option');
                    elOptNew.text = document.formdoc.txtmiembroREDX.value;
                    elOptNew.value = document.formdoc.txtmiembroREDX.value;
            try {
      elSel.add(elOptNew); // standards compliant; doesn't work in IE
    }
    catch(ex) {
      elSel.add(elOptNew); // IE only
    }
}
	function removeOptionSelected()
{
  var elSel = document.getElementById('cmb_equipo');
  var i;
  for (i = elSel.length - 1; i>=0; i--) {
    if (elSel.options[i].selected) {
      elSel.remove(i);
    }
  }
}
			   function cambiosegama()
                {
                    if(document.getElementById('cmb_stsam').value=='Χ'){
                    	lock('txt_fechaama');
                        hide('calendariodefama');
		    }
		    		if(document.getElementById('cmb_stsam').value=='Ο'){
                        unlock('txt_fechaama');
                        unhide('calendariodefama');
                    }
                }
				function habilitarama()
				{
				if (band1==0)
                                {
                                    band1=1;
                                    document.formdoc.btn_dsblqama.style.borderStyle="inset";
                                    document.formdoc.btn_dsblqama.style.backgroundColor= "#666666";
                                    unlock('cmb_stsam');
                                    unlock('cmb_responsable');
                                    unlock('cmb_prsresp');
                                    if (document.formdoc.cmb_stsam.value=='Ο')
                                      {
                                         unlock('txt_fechaama');
                                         unhide('calendariodefama');
                                      }
				 }
				 else
				 {
                                    band1=0;
                                    document.formdoc.btn_dsblqama.style.borderStyle="outset";
                                    document.formdoc.btn_dsblqama.style.backgroundColor="#CCCCCC";
                                    lock('cmb_stsam');
                                    lock('cmb_responsable');
                                    lock('cmb_prsresp');
                                    lock('txt_fechaama');
                                    hide('calendariodefama');
				 }
				}
				function habilitarcierreFM()
				{
					 unlock('txt_fCFMEAS');
                     unhide('calendariofCFMEAS');
					 unlock('txt_HElementos');
				}
				function habilitarsegFM()
				{
				 unlock('txt_fsegFMEAS');
                 unhide('calendariofsegFMEAS');
				 unlock('txt_rpnf');
				 }
				 function habilitarp2FM()
				{
				 unlock('txt_fp2FMEAS');
                 unhide('calendariofp2FMEAS');
				 unlock('txt_rpni');
				 }
				function habilitarFMEAS()
				{
				if (band2==0)
                                {
                                    band2=1;
                                    document.formdoc.btn_dsblqFM.style.borderStyle="inset";
                                    document.formdoc.btn_dsblqFM.style.backgroundColor= "#666666";
                                    unlock('cmb_stsFM');
                                    unlock('txt_ncasos');
                                    unlock('txt_facilitador');
                                if (document.formdoc.cmb_stsFM.value=='Ο')
                                      {
                                         habilitarcierreFM();
                                      }
				if (document.formdoc.cmb_stsFM.value=='Ω')
                                      {
                                         habilitarsegFM();
                                      }
									  
				if (document.formdoc.cmb_stsFM.value=='Δ')
                                      {
                                         habilitarp2FM();
                                      }
				 }
				 else
				 {
                                    band2=0;
									lock('cmb_stsFM');
                                    document.formdoc.btn_dsblqFM.style.borderStyle="outset";
                                    document.formdoc.btn_dsblqFM.style.backgroundColor="#CCCCCC";                 
								    lockCFMEAS();
								 	lockSFMEAS();
								 	lockPFMEAS();
				 }
				 }
				 function lockCFMEAS()
				 {
				 	lock('txt_fCFMEAS');
                    hide('calendariofCFMEAS');
   				    lock('txt_HElementos');
				 }
				 function lockSFMEAS()
				 {
						lock('txt_fsegFMEAS');
                        hide('calendariofsegFMEAS');
						lock('txt_rpnf');
				 }
				 function lockPFMEAS()
				 {
					    lock('txt_fp2FMEAS');
                        hide('calendariofp2FMEAS');
						lock('txt_rpni');
				 }
				
				function locktdsFM(){
										 lock('txt_fCFMEAS');
                                         hide('calendariofCFMEAS');
					 lock('txt_HElementos');
                                         lock('txt_fsegFMEAS');
                                         hide('calendariofsegFMEAS');
                                         lock('txt_fsegFMEAS');
                                         hide('calendariofsegFMEAS');
                                         lock('txt_fp2FMEAS');
                                         hide('calendariofp2FMEAS');
					 lock('txt_rpni');
					 lock('txt_rpnf');
                                         lock('txt_ncasos');
                                         lock('txt_facilitador');
				
				}
				 function cambiosegFM()
                	{
						locktdsFM();
                    	 if (document.formdoc.cmb_stsFM.value=='Ο')
                                      {
                                         habilitarcierreFM();
                                      }
									  if (document.formdoc.cmb_stsFM.value=='Ω')
                                      {
                                         habilitarsegFM();
                                      }
									  
									  if (document.formdoc.cmb_stsFM.value=='Δ')
                                      {
                                         habilitarp2FM();
                                      }
                }
                                function habilitardefprbl()
						{
								unlock('cmb_categoria');
								unlock('cmd_defecto');
                                                                unlock('cmb_niv1');
   								unlock('cmb_niv2');
                                                                unlock('cmb_pos');
																unlock('txt_detalle');
																
						}
                                                function deshabilitardefprbl()
						{
								lock('cmb_categoria');
								lock('cmd_defecto');
                                                                lock('cmb_niv1');
   								lock('cmb_niv2');
                                                                lock('cmb_pos');
																lock('txt_detalle');
																
						}
						function habilitarcierreRX()
						{
								unlock('txt_fecha2');
								unhide('calendariodef');
						}
						function habilitaranulRX()
						{
								unlock('txt_anul');
						}
						function deshabilitarcierreRX()
						{
								lock('txt_fecha2');
								hide('calendariodef');
						}
						function deshabilitaranulRX()
						{
								lock('txt_anul');
						}

    </script>
<script language="JavaScript">
                 function ccolor(vdep,ctrlaff){
                 if (vdep=='Χ')
                    document.getElementById(ctrlaff).style.color = '#FF0000';
		if (vdep=='Δ')
                    document.getElementById(ctrlaff).style.color = '#FFFF00';
		if (vdep=='Ω')
                    document.getElementById(ctrlaff).style.color = '#00FF00';
		if (vdep=='Ο')
                    document.getElementById(ctrlaff).style.color = '#006600';
		if (vdep=='Φ')
                    document.getElementById(ctrlaff).style.color = '#666666';
                    }
             </script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Documento <%=request.getParameter("iddoc")%></title>
        <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css">
    </head>
    <body>
    <form name="formdespl" method="post">
        <table> <tr> <td>
        
        <input type="submit" name="btn_verdig" id="btn_verdig" value="Ver Digitalizado" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC">
        </td>
		<%if (beandespliegue.EJECUTARSPDEVSTR("EXST_AMARILLA",request.getParameter("iddoc")).compareTo("0")==0) { %>
        <td>
        	<input type="button" name="btn_anexyc" id="btn_anexyc" value="Anexar Amarilla" onClick="abrirdoc()" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC">
        </td>
        <% } %>
        <%if (beandespliegue.EJECUTARSPDEVSTR("EXST_FMEAS",request.getParameter("iddoc")).compareTo("0")==0) { %>
        <td>
        	<input type="button" name="btn_anexfm" id="btn_anexfm" value="Anexar PFMEA" onClick="abrirdocFM()" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC">        </td>
        <% } %>
        </tr>
        </table>
    </form>
    <form name="formdoc"  method="post" onSubmit="JavaScript:habilitarforsubmt()" ENCTYPE="multipart/form-data">
    <table width="100%" border="0"><tr><td width="8%" scope="row" align="center">
      <tr>
          <td>
       <table width="100%" border="0">
            <tr>
              <td width="8%" scope="row"><input type="button" name="btn_Modificar" id="btn_Modificar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC" value="Modificar" onClick="JavaScript:habilitar()"></td>
              <td width="8%" scope="row" align="center"><input type="submit" name="btn_Guardar" id="btn_Guardar" value="Guardar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC">
              <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"mstr_btnmodif").compareTo("0")!=0)
                                {%>
              <script type="text/javascript">
                                    hide('btn_Modificar');
                                    hide('btn_Guardar');
                                    <%if (beandespliegue.EJECUTARSPDEVSTR("EXST_AMARILLA",request.getParameter("iddoc")).compareTo("0")==0) { %>
								    hide('btn_anexyc');
                                    <% } %>
									<%if (beandespliegue.EJECUTARSPDEVSTR("EXST_FMEAS",request.getParameter("iddoc")).compareTo("0")==0) { %>
									    hide('btn_anexfm');
                                    <% } %>
                                </script>
                                <%}%>
              </td>
              
              <td width="6%" scope="row"><input type="button" name="btn_Cerrar" id="btn_Cerrar" value="Cerrar" onClick="JavaScript:window.close();" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC"></td>
              <td width="12%" scope="row"></td>
              <td width="66%" align="right">
              <table width="100%" border="7" height="2">
                   <tr>
                  <th width="30%" scope="row"> <h2 align="center"><%=beandespliegue.registrosbasedocp.getString(3)%></h2></th>
                  <td width="9%" align="center" bordercolor="#D4D0C8"><H2 id="tlt_estatus"><%=beandespliegue.registrosbasedocp.getString(24)%></H2>
                  <td width="61%"> <h2 align="center"><%=request.getParameter("iddoc")%>
                        <input type="hidden" name="id_usr" id="id_usr" value="<%=request.getParameter("var")%>" size="30" readonly>
                  </h2>
                  
                  </td>
                </tr>
              </table>
              <script language="JavaScript">
                		ccolor('<%=beandespliegue.registrosbasedocp.getString(24)%>','tlt_estatus')
             	 </script>
             </td>
            </tr>
          </table>
           </td>
         </tr>
    </table>
    
          <table width="100%" border="0" >
            <tr>
              <td width="50%"><fieldset class="fieldset">
                <legend>Información Registro:</legend>
                <table width="100%" border="0"  bordercolor="#990000">
                  <tr>
                    <td width="15%" align="left" scope="row"><label>Codigo: </label></td>
                    <td width="35%" align="center"><div id="div_ndoc">
                      <input type="text" name="coddoc" id="coddoc" value=<%=request.getParameter("iddoc")%> style="width:100%" disabled>
                      </div>                    </td>
                    <td width="15%" align="left">Tipo de documento:</td>
                    <td width="35%" align="center"><input name="cmb_ptoap" id="cmb_ptoap" type="hidden" value="24"><select name="t_doc" id="t_doc" style="width:100%" disabled>
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(2)%>><%=beandespliegue.registrosbasedocp.getString(3)%></option>
                        <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVUELVE_TDOCMODIF","P", beandespliegue.registrosbasedocp.getString(2))%>
                    </select></td>
                  </tr>
              </table>
              </fieldset>
              </td><td width="50%"> <fieldset class="fieldset">
                <legend>Información punto de apertura:</legend>
                <table width="100%" border="0" align="center" bordercolor="#990000">
                  <tr>
                    <td align="left">Iniciado por:</td>
                    <td colspan="4"><div id="div_iniciador">
                      <select name="cmb_iniciador" id="cmb_iniciador" style="width:100%" disabled>
                          <option selected value=<%=beandespliegue.registrosbasedocp.getString(6)%>><%=beandespliegue.registrosbasedocp.getString(7)%></option>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left"> Fecha de apertura documento: </td>
                    <td><input type="text"  name="f_apertura" id="f_apertura" value="<%=beandespliegue.registrosbasedocp.getString(8)%>" style="width:100%" disabled/></td>
<td width="5%"><a href="javascript:NewCal('f_apertura','ddmmyyyy',true,24)" id="calendario" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
				<td width="26%">Dias transcurridos: </td>
				<td width="22%"><input name="txt_diastrans" type="text" value="<%=beandespliegue.registrosbasedocp.getString(9)%>" disabled width="50%"></td>
                  </tr>
                </table>
    </fieldset></td></tr></table>
              <table width="100%">
<tr>
                	<td width="602">
              <fieldset class="fieldset">
                <legend>Equipo Red-X:</legend>
              <table width="594">
              <tr>
              	<td width="611">
                	<table width="86%" border="0" align="center" bordercolor="#990000">
                    <tr>
            <td>Área:</td>
            <td><select name="cmb_area" id="cmb_area" style="width:100%">
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(4)%>><%=beandespliegue.registrosbasedocp.getString(5)%></option>
                      		<%=beandespliegue.OBT_COMBO("MOSTRAR_AREA_MODIF",beandespliegue.registrosbasedocp.getString(4))%>
                      </select></td>
            </tr>
            <tr>
            <TD width="128" align="left" scope="row">Lider de equipo:</TD>
            <td align="left">
            <input type="text"  name="txt_lider" id="txt_lider" value="<%=beandespliegue.registrosbasedocp.getString(26)%>" style="width:100%" disabled/>   </td>
            </tr>
            <TR>
            <TD align="left">Miembro del equipo:</TD>
            <TD><div id="div_iniciador">
              <input type="text" name="txtmiembroREDX" id="txtmiembroREDX" style="width:80%" onChange="unlock('cmb_plataforma')" onKeyUp="JavaScript:this.value=this.value.toUpperCase()">
              <input type="button" name="btn_anadirmerx" id="btn_anadirmerx" value="Anadir" onClick="JavaScript:insertOptionBefore()">
            </div></TD>
            </TR>
            <tr>
            <TD align="left">Equipo:</TD>
            <td width="502">
            <select name="cmb_equipo" size="5" multiple id="cmb_equipo" style="width:80%">
                <%=beandespliegue.OBT_COMBO("DEV_EQRX", request.getParameter("iddoc"))%>
            </select>
              <input type="button" name="btn_quitar" id="btn_quitar" value="Quitar" onClick="removeOptionSelected()"></td>
            </tr>

        </table>
        
                </td>
              </tr>
              </table>
              </fieldset>
    </td>
<td width="600"><fieldset class="fieldset">
                <legend>Información del vehículo:</legend>
                <table width="100%" height="100%">
                  <tr>
                    <td width="50%"><div align="center">Plataforma:</div></td>
                  <td width="50%"><select name="cmb_plataforma" id="cmb_plataforma" style="width:100%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(10)%>"><%=beandespliegue.registrosbasedocp.getString(11)%></option>
                        <%=beandespliegue.OBT_COMBO("MOSTRAR_PLATAFORMA_MODIF",beandespliegue.registrosbasedocp.getString(10))%>
                    </select></td>
                  </tr>
                </table>
              </fieldset><fieldset class="fieldset">
                <legend>Informacion problema:</legend>
            <table width="93%" border="0" align="center" bordercolor="#990000">
        <tr align="center">
                    <td width="11%">Categoria:</td>
                    <td width="89%" align="right">
                        <select name="cmb_categoria" id="cmb_categoria" style="width:100%" onChange = "javascript:cargarCombo('compcomboAct.jsp', 'cmb_categoria','div_cmbdefecto','cmd_defecto','DEVOLVER_FALLA')" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(12)%>"><%=beandespliegue.registrosbasedocp.getString(13)%></option>
                        <%=beandespliegue.OBT_COMBO("DEVOLVERC_FALLAMODIF",beandespliegue.registrosbasedocp.getString(12))%>
                        </select>
                    </td>
              </tr>
                  <tr>
                    <td align="center">Defecto:</td>
                    <td align="right"><div id="div_cmbdefecto">
                      <select name="cmd_defecto" id="cmd_defecto" style="width:100%"  onChange = "javascript:cargarComboN1('compcomboAct.jsp', 'cmd_defecto', 'cmb_categoria','div_cmbniv1', 'cmb_niv1','DEVOLVER_N1')" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(14)%>"><%=beandespliegue.registrosbasedocp.getString(15)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_FALLAMODIF",beandespliegue.registrosbasedocp.getString(12),beandespliegue.registrosbasedocp.getString(14))%>
                      </select>
                    </div></td>
                  <tr>
                    <td align="center">Nivel 1:</td>
                    <td align="right"><div id="div_cmbniv1">
                      <select name="cmb_niv1" id="cmb_niv1" style="width:100%" onChange = "ejecutardepsMOD()" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(16)%>"><%=beandespliegue.registrosbasedocp.getString(17)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_N1MODIF",beandespliegue.registrosbasedocp.getString(12),beandespliegue.registrosbasedocp.getString(14),beandespliegue.registrosbasedocp.getString(16))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Nivel 2:</td>
                    <td align="right"><div id="div_cmbniv2">
                      <select name="cmb_niv2" id="cmb_niv2" style="width:100%"  onChange = "cargarcslt('compcomboAct.jsp', 'cmb_niv2','cmb_niv1','cmd_defecto','cmb_categoria','div_cmbpos', 'cmb_pos','DEVOLVER_POST')" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(18)%>"><%=beandespliegue.registrosbasedocp.getString(19)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_N2MODIF",beandespliegue.registrosbasedocp.getString(12),beandespliegue.registrosbasedocp.getString(14),beandespliegue.registrosbasedocp.getString(16),beandespliegue.registrosbasedocp.getString(18))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Posicion:</td>
                    <td align="right"><div id="div_cmbpos">
                      <select name="cmb_pos" id="cmb_pos" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(20)%>"><%=beandespliegue.registrosbasedocp.getString(21)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_POSMODIF",beandespliegue.registrosbasedocp.getString(12),beandespliegue.registrosbasedocp.getString(14),beandespliegue.registrosbasedocp.getString(16),beandespliegue.registrosbasedocp.getString(18),beandespliegue.registrosbasedocp.getString(20))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Comentario:</td>
                    <td align="left"><input type="text" name="txt_detalle" id="txt_detalle" style="text-transform: uppercase;width:95%" value="<%=beandespliegue.registrosbasedocp.getString(22)%>"  disabled></td>
                  </tr>
              </table>
              </fieldset>
    </td>
    </tr>
    <tr>
    <td>
    <fieldset class="fieldset">
        		<legend>Cargar Imagen:</legend>
              <table border="0" style="width:100%" >

                    <tr>
                      <td width="30%">Cambiar la fotografía:
                        <INPUT NAME="imageField" id="imageField" TYPE="file" onChange="preview(this)"></td>

<td width="50%" colspan="2">
<img alt="La imagen se verá aqui" id="previewField" width="320" height="200"  style="border: black;border-style: outset;border-width: medium" src="SSPFOTOS/P<%=request.getParameter("iddoc")%>.jpeg?rand=<%=Math.random()%>"/></td>
</table>
</fieldset>
    </td>
    <td>
<fieldset class="fieldset">
        		<legend>Estatus del problema:</legend>
                <table height="213" style="width:100%">
                <tr>
                <td>
    	<select style="height:50px;background-color:#CCCCCC;font-size:38px;"  id="cmb_sts" name="cmb_sts" onChange="JavaScript:cambioseg();" disabled>
      <option selected style="color:<%=beandespliegue.registrosbasedocp.getString(27)%>" value="<%=beandespliegue.registrosbasedocp.getString(24)%>"><%=beandespliegue.registrosbasedocp.getString(24)%></option>
      <%=beandespliegue.OBT_COLCOMBOSTS("MOSTRAR_STS_TDOCS","3",beandespliegue.registrosbasedocp.getString(24))%>
    </select> <input type="hidden" name="hdn_status" id="hdn_status" value="<%=beandespliegue.registrosbasedocp.getString(24)%>">
    </td>
    <td>
    	<fieldset class="fieldset">
        		<legend>Cierre del RED-X:</legend>
        <table width="100%"><tr>
    	    <td width="26%">Fecha de cierre:</td><td width="74%"><input type="text" name="txt_fecha2" id="txt_fecha2" style="width:80%" value="<%=beandespliegue.registrosbasedocp.getString(25)%>" disabled><a href="javascript:NewCal('txt_fecha2','ddmmyyyy',true,24)" id="calendariodef" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td></tr></table></fieldset>
            <fieldset class="fieldset">
        		<legend>Anulación del RED-X:</legend>
        <table width="100%"><tr>
    	    <td width="26%">Motivo anulación:</td><td width="74%">
            <input id="txt_anul" name="txt_anul" type="text"  style="width:100%" disabled>
            </td></tr></table></fieldset>
    </td>
    </tr>
    </table>
    </fieldset>
    </td>
    </tr>
</table>
<%if (beandespliegue.EJECUTARSPDEVSTR("EXST_AMARILLA",request.getParameter("iddoc")).compareTo("0")!=0) {%>
              <%=beandespliegue.MostrarT_ama(request.getParameter("iddoc"))%>
          <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"mstr_btnmodif").compareTo("0")!=0){%>
              <script type="text/javascript">
                 hide('btn_Guardarama');
                 hide('btn_dsblqama');
              </script>
            <%}
              }%>
              <%if (beandespliegue.EJECUTARSPDEVSTR("EXST_FMEAS",request.getParameter("iddoc")).compareTo("0")!=0) {%>
              <%=beandespliegue.MostrarFMEAS(request.getParameter("iddoc"))%>
          <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"mstr_btnmodif").compareTo("0")!=0){%>
              <script type="text/javascript">
                 hide('btn_dsblqFM');
                 hide('btn_GuardarFM');
              </script>
            <%}
              }%>
            <table width="100%" border="0">
               <tr>
                  <td width="22%" scope="row">

                  </td>
              </tr>
    </table>

                <fieldset class="fieldset">
                <legend>Histórico del problema:</legend>
                <table width="100%" border="0" align="center">
                  <tr>
                    <td width="100%" align="center" scope="row">
                      <div id="CollapsiblePanel1" class="CollapsiblePanel">
                        <div class="CollapsiblePanelTab" tabindex="0">Click para expandir</div>
                        <div class="CollapsiblePanelContent">
                          <textarea name="txt_historico" cols="100%" rows="10" disabled><%=beandespliegue.registrosbasedocp.getString(23)%></textarea>
                        </div>
                      </div>
                    </td>
                  </tr>
                    <tr>
                    <td width="40%">                    </td>
                  </tr>
                </table>
              </fieldset>
                <script type="text/javascript">
<!--
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1", {contentIsOpen:false});
//-->
                </script>
  </form>
  </body>
</html>
