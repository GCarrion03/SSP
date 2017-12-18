<%-- 
    Document   : consultaind
    Created on : 07-02-2010, 09:01:17 AM
    Author     : Guz
--%>

<%@page import="javazoom.upload.UploadFile"%>
<%@page import="java.util.Hashtable"%>
<%@page import="javazoom.upload.MultipartFormDataRequest"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<jsp:useBean id="beandespliegue" class="SSP_CAPAS.GMPresentacion" scope="page" >
        </jsp:useBean>
<%if (beandespliegue.EJECUTARSPDEVSTR("EXISTE_REDX",request.getParameter("iddoc")).compareTo("0")!=0)
                        {
                            response.sendRedirect("ConsultaRX.jsp?var="+request.getParameter("var")+"&iddoc="+request.getParameter("iddoc"));
                        }%>
<%if (request.getParameter("btn_verdig")!=null)
            {
                 String sFichero = "C:/DIGITALIZADOS/"+request.getParameter("iddoc")+".pdf";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".TIF";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".pdf";
                 File fichero = new File(sFichero);
                 if (fichero.exists())
                 response.sendRedirect("despliegapdf.jsp?var="+request.getParameter("iddoc"));
                 else {%>
                 <script language = "JavaScript">
                            alert("El Documento aun no ha sido escaneado");
                 </script>
<%}
            }
%>
 <%--if(request.getParameter("btn_anexfm")!= null)
		{
			beandespliegue.insertadicfmea(request.getParameter("iddoc"));
		}--%>
            <script language = "JavaScript">
				function ValidarREDX()
				{
							if(document.getElementById('t_doc').value==3)
                                    window.open('CMBRRX.jsp?iddoc=<%=request.getParameter("iddoc")%>&var=<%=request.getParameter("var")%>','','') ;
									//top=200,left=200,width=600,height=100
				 }
            </script>
            <script language = "JavaScript">
				function abrirdoc()
				{
                                    open('Amaadic.jsp?iddoc=<%=request.getParameter("iddoc")%>','','top=200,left=200,width=600,height=100') ;
				 }
				 function abrirdocFM()
				{
                                    open('FMEAadic.jsp?iddoc=<%=request.getParameter("iddoc")%>','','top=200,left=200,width=600,height=100') ;
				 }
            </script>
<html>
    <head>
        
        <% request.setCharacterEncoding("UTF-8"); %>
         <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
         <script type="text/javascript" src="peticioajax.js"></script>
         <script type="text/javascript" src="referencias.js"></script>
         <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
         <script type="text/javascript">
            // width to resize large images to
            var maxWidth=320;      // height to resize large images to
            var maxHeight=200;      // valid file types
            var fileTypes=["bmp","gif","png","jpg","jpeg"];      // the id of the preview image tag
            var outImage="previewField";      // what to display when the image is not valid
            var defaultPic="spacer.gif";      /***** DO NOT EDIT BELOW *****/
            function preview(what){
            var source=what.value;
            var ext=source.substring(source.lastIndexOf(".")+1,source.length).toLowerCase();
            for (var i=0; i<fileTypes.length; i++){
                if (fileTypes[i]==ext){
                    break;
                }
            }
            globalPic=new Image();
            if (i<fileTypes.length){
                //Obtenemos los datos de la imagen de firefox
                try{
                    globalPic.src=what.files[0].getAsDataURL();
                }
                catch(err){
                    globalPic.src=source;
                }
            }else {
                globalPic.src=defaultPic;
                alert("ESTA NO ES UNA IMAGEN VALIDA por favor escoge una imagen de tipo:nn"+fileTypes.join(", "));
            }
            setTimeout("applyChanges()",200);
        }
        var globalPic;
        function applyChanges(){
            var field=document.getElementById(outImage);
            var x=parseInt(globalPic.width);
            var y=parseInt(globalPic.height);
            if (x>maxWidth) {
                y*=maxWidth/x;
                x=maxWidth;
            }
            if (y>maxHeight) {
                x*=maxHeight/y;
                y=maxHeight;
            }
            field.style.display=(x<1 || y<1)?"none":"";
            field.src=globalPic.src;
            field.width=x;
            field.height=y;
        }      // End -->
		</script>
	     <link href="Estilos carpeta/estilo fieldset.css" rel="stylesheet" type="text/css">
		 <script type="text/javascript">
                    var band=0;
                    var band1=0;
		    var band2=0;
                    function habilitar()
                        {
                            <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"btn_Modificar").compareTo("0")==0)
                                {%>
                            if (band==0)
                                {
                                    document.formdoc.btn_Modificar.style.borderStyle="inset";
                                    document.formdoc.btn_Modificar.style.backgroundColor= "#666666";
                                    band=1;
                                    //unlock('coddoc');
                                    unlock('t_doc');
                                    unlock('cmb_dpn');
                                    unlock('cmb_escalonamiento');
                                    unlock('f_apertura');
                                    //unlock('cmb_ptoap');
                                    //unlock('cmb_iniciador');
                            unhide('calendario');
                            unlock('txt_turno');
                            unlock('cmb_ponderacion');
                            unlock('cod_modelo');
                            unlock('txt_VIN');
                            unlock('txtlote');
                            unlock('txt_Area');
                            unlock('txt_lg');
                            unlock('LET');
                            unlock('cmb_personal');
                            unlock('cmb_corresp');
                            unlock('txt_detalle');
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
							if(document.getElementById('cmb_sts').value=='Δ')
							{
								habilitarpaso2();
							}
							if(document.getElementById('cmb_sts').value=='Ω')
							{
								habilitarseg();
								habilitarcierre();
							}		
							if(document.getElementById('cmb_sts').value=='Φ')
							{
								habilitaranul();
							}
                                                        if(document.getElementById('cmb_sts').value=='Ω')
							{
								habilitarseg();
								habilitarcierre();
							}
                                                        if(document.getElementById('cmb_sts').value=='Ο')
							{
								habilitarseg();
								habilitarcierre();
							}
                            }
                            else{
                               document.formdoc.btn_Modificar.style.borderStyle="outset";
                               document.formdoc.btn_Modificar.style.backgroundColor="#CCCCCC";
                               band=0;
			    lock('coddoc');
                            lock('t_doc');
                            lock('cmb_dpn');
                            lock('cmb_escalonamiento');
                            lock('cmb_ptoap');
                            lock('cmb_iniciador');
                            unhide('calendario');
                            lock('txt_turno');
                            lock('cmb_ponderacion');
                            //lock('cmb_plataforma');
                            lock('cod_modelo');
                            lock('txt_VIN');
                            lock('txtlote');
                            lock('txt_Area');
                            lock('txt_lg');
                            lock('LET');
                            lock('cmb_personal');
                            lock('cmb_corresp');
                            lock('txt_detalle');
                            /*
                            lock('cmb_categoria');
                            lock('cmb_defecto');
                            lock('cmb_niv1');
                            lock('cmb_niv2');
                            lock('cmb_pos');
                            lock('txt_detalle');*/
			    lock('cmb_sts');
                            <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"defprbls").compareTo("0")!=0)
                                        {%>
                                            deshabilitardefprbl();
                                        <%}%>
                            deshabilitartodosts();
                               }
                            <%} else { %>
                                if (band==0)
                                {
                                    document.formdoc.btn_Modificar.style.borderStyle="inset";
                                    document.formdoc.btn_Modificar.style.backgroundColor= "#666666";
                                    band=1;
                                 unlock('txt_lg');
                                 unlock('LET');
                                 unlock('cmb_personal');
                                } else{
                               document.formdoc.btn_Modificar.style.borderStyle="outset";
                               document.formdoc.btn_Modificar.style.backgroundColor="#CCCCCC";
                               band=0;
                                lock('txt_lg');
                                lock('LET');
                                lock('cmb_personal');
                                }
                                <%}%>
                        }
function cambioseg()
{
    deshabilitartodosts();
			document.getElementById('hdn_status').value=document.getElementById('cmb_sts').value;
                        if(document.getElementById('cmb_sts').value=='Χ'){
								deshabilitartodosts()
			            }
						if(document.getElementById('cmb_sts').value=='Δ'){
								habilitarpaso2();
                         }
						if(document.formdoc.cmb_sts.value=='Ω'){
								habilitarseg();
								habilitarcierre();
                         }
                          if(document.getElementById('cmb_sts').value=='Ο')
							{
								habilitarseg();
								habilitarcierre();
							}
						if(document.formdoc.cmb_sts.value=='Φ'){
                                                                
								habilitaranul();
                                                                }
                                                //alert(document.getElementById('cmb_sts').value);
						}
						function deshabilitartodosts()
						{
  						        deshabilitarpaso2();
							deshabilitarseg();
							deshabilitarcierre();
							deshabilitaranul();
						}
                                                function habilitartodosts()
						{
  						        habilitarpaso2();
							habilitarseg();
							habilitarcierre();
							habilitaranul();
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
                                         lock('txt_ncasos');
                                         lock('txt_facilitador');
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
						}
                                                function deshabilitardefprbl()
						{
								lock('cmb_categoria');
								lock('cmd_defecto');
                                                                lock('cmb_niv1');
   								lock('cmb_niv2');
                                                                lock('cmb_pos');
						}
						function habilitarpaso2()
						{
								unlock('txt_aconten');
								unlock('txt_lote');
								unlock('txt_fecha');
   								unhide('calendariocon');
						}
						function habilitarseg()
						{
								unlock('txt_adefini');
								unlock('txt_lote2');
								unlock('txt_fecha2');
								unhide('calendariodef');
						}
						function habilitarcierre()
						{
								unlock('txt_origen');
								unlock('cmb_5m');
						}
						function habilitaranul()
						{
								unlock('txt_motivoa');
						}
						function deshabilitarpaso2()
						{
								lock('txt_aconten');
								lock('txt_lote');
								lock('txt_fecha');
								hide('calendariocon');
						}
						function deshabilitarseg()
						{
								lock('txt_adefini');
								lock('txt_lote2');
								lock('txt_fecha2');
								hide('calendariodef');
						}
						function deshabilitarcierre()
						{
								lock('txt_origen');
								lock('cmb_5m');
						}
						function deshabilitaranul()
						{
								lock('txt_motivoa');
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
        <jsp:useBean id="upBean" scope="request" class="javazoom.upload.UploadBean" >
            <%--<jsp:setProperty name="upBean" property="folderstore" value="C:/SSP/build/web/SSPFOTOS" />--%>
            <jsp:setProperty name="upBean" property="folderstore" value="C:/glassfishv3/glassfish/domains/domain1/applications/SSP/SSPFOTOS"/>
            <jsp:setProperty name="upBean" property="overwrite" value="true" />
        </jsp:useBean>
       
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
             if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"btn_Modificar").compareTo("0")==0)
               {
                 if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"defprbls").compareTo("0")!=0)
                    {
                     if(beandespliegue.actualizarprobadmin(request.getParameter("iddoc"),mrequest.getParameter("f_apertura"),mrequest.getParameter("t_doc"),mrequest.getParameter("cmb_dpn"),mrequest.getParameter("cmb_escalonamiento"),mrequest.getParameter("txt_turno"),mrequest.getParameter("cmb_ponderacion"),mrequest.getParameter("cod_modelo"),mrequest.getParameter("txt_VIN"),mrequest.getParameter("txtlote"),mrequest.getParameter("txt_lg"),mrequest.getParameter("LET"),mrequest.getParameter("cmb_personal"),mrequest.getParameter("cmb_corresp"),mrequest.getParameter("txt_Area"),mrequest.getParameter("hdn_status"),mrequest.getParameter("txt_aconten"),mrequest.getParameter("txt_lote"),mrequest.getParameter("txt_fecha"),mrequest.getParameter("txt_adefini"),mrequest.getParameter("txt_lote2"),mrequest.getParameter("txt_fecha2"),mrequest.getParameter("txt_origen"),mrequest.getParameter("cmb_5m"),mrequest.getParameter("txt_motivoa"),mrequest.getParameter("cmb_categoria"),mrequest.getParameter("cmd_defecto"),mrequest.getParameter("cmb_niv1"),mrequest.getParameter("cmb_niv2"),mrequest.getParameter("cmb_pos"),mrequest.getParameter("txt_detalle"),request.getParameter("var")))
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
                 }else{
                 if(beandespliegue.actualizarprobprod(request.getParameter("iddoc"),mrequest.getParameter("txt_lg"),mrequest.getParameter("LET"),mrequest.getParameter("cmb_personal"),request.getParameter("var")))
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
                         <script language="JavaScript">
                           alert('<%=request.getParameter("iddoc")%> - <%= mrequest.getParameter("cmb_stsFM")%> - <%= mrequest.getParameter("txt_fp2FMEAS")%> - <%=mrequest.getParameter("txt_fsegFMEAS")%> - <%=mrequest.getParameter("txt_fCFMEAS")%> - <%=mrequest.getParameter("txt_HElementos")%>')
                           </script>
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
<%beandespliegue.OBTENERREGISTROSPRBL("CONSULTAR_PROBLEMAPRINCIPAL",request.getParameter("iddoc"));%>

        <title>Documento <%=request.getParameter("iddoc")%></title>
        <style type="text/css">
<!--
.style2 {
	color: #FF0000;
}
.style3 {
	color: #FFFF00;
}
.style4 {
	color: #00FF00;
}
.style5 {
	color: #006600;
}
.style6 {
	color: #666666;
}
.style7 {color: #000000}
-->
        </style>
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
        	<input type="button" name="btn_anexfm" id="btn_anexfm" value="Anexar PFMEA" onClick="abrirdocFM()" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC">
        </td>
        <% } %>
        </tr>
        </table>
        </form>
        <form name="formdoc"  method="post" onSubmit="JavaScript:habilitarforsubmt()" ENCTYPE="multipart/form-data">
          <table width="100%" border="0"><tr><td width="8%" scope="row" align="center">
                      <table width="100%" border="0">
            <tr>
              <td width="8%" scope="row"><input type="button" name="btn_Modificar" id="btn_Modificar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC" value="Modificar" onClick="JavaScript:habilitar()"></td>
              <td width="8%" scope="row" align="center"><input type="submit" name="btn_Guardar" id="btn_Guardar" value="Guardar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC"></td>
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
              <td width="6%" scope="row"><input type="button" name="btn_Cerrar" id="btn_Cerrar" value="Cerrar" onClick="JavaScript:window.close();" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC"></td>
              <td width="12%" scope="row"></td>
              <td width="66%" align="right">
              <table width="100%" border="7" height="2">
                   <tr>
                  <th width="30%" scope="row"><h2 align="center"><%=beandespliegue.registrosbasedocp.getString(3)%></h2></th>
                  <td width="9%" align="center" bordercolor="#D4D0C8"><H2 id="tlt_estatus"><%=beandespliegue.registrosbasedocp.getString(46)%></H2>
                  <td width="61%"> <h2 align="center"><%=request.getParameter("iddoc")%>
                        <input type="hidden" name="id_usr" id="id_usr" value="<%=request.getParameter("var")%>" size="30" readonly>
                  </h2></td>
                </tr>
              </table>
              <script language="JavaScript">
                ccolor('<%=beandespliegue.registrosbasedocp.getString(46)%>','tlt_estatus')
              </script>
             </td>
            </tr>
          </table></td>
            </tr>
        </table>
        <table width="100%"> <tr> <td>
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
                    <td width="15%" align="left">Tipo de documento: </td>
                    <td width="35%" align="center"><select name="t_doc" id="t_doc" style="width:100%" onChange="ValidarREDX()" disabled>
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(2)%>><%=beandespliegue.registrosbasedocp.getString(3)%></option>
                        <%if (beandespliegue.EJECUTARSPDEVSTR("OBTENER_PERMISO",request.getParameter("var"),"defprbls").compareTo("0")!=0){%>
                        <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVUELVE_TDOCMODIF","P", beandespliegue.registrosbasedocp.getString(2))%>
                        <%}%>
                    </select></td>
                  </tr>
                  <tr>
                    <td align="left" scope="row">Categoría DPN:</td>
                    <td align="center"><select name="cmb_dpn" id="cmb_dpn" disabled style="width:100%;">
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(4)%>><%=beandespliegue.registrosbasedocp.getString(5)%></option>
                        <%=beandespliegue.OBT_COMBO("MOSTRAR_BPDMODIF",beandespliegue.registrosbasedocp.getString(4))%>
                    </select></td>
                    <td align="left">Escalonamiento: </td>
                    <td align="center"><select name="cmb_escalonamiento" id="cmb_escalonamiento" style="width:100%" disabled>
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(6)%>><%=beandespliegue.registrosbasedocp.getString(7)%></option>
                        <%=beandespliegue.OBT_COMBO("MOSTRAR_ESCALONAMIENTO_MODIF",beandespliegue.registrosbasedocp.getString(6))%>
                    </select></td>
                  </tr>
              </table>
              </fieldset>
              </td><td width="50%"> <fieldset class="fieldset">
                <legend>Información punto de apertura:</legend>
                <table width="100%" border="0" align="center" bordercolor="#990000">
                  <tr>
                    <td width="17%" align="left" scope="row"><label>Punto de apertura: <br>
                    </label></td>
              <td colspan="4" align="left"><select name="cmb_dpn" id="cmb_ptoap" style="width:100%" onChange="carga_usr()" disabled>
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(8)%>><%=beandespliegue.registrosbasedocp.getString(9)%></option>
                        <%=beandespliegue.OBT_COMBO("DEVUELVEPTOAP_MODIF",beandespliegue.registrosbasedocp.getString(8))%>
                      </select>
                    <%--
                <input type="text" name="txt_puntoapert" id="txt_puntoapert" size="60" value="<%=beandespliegue.devuelve_dept(request.getParameter("var"))%>">--%></td>
                  </tr>
                  <tr>
                    <td align="left">Iniciado por:</td>
                    <td colspan="4"><div id="div_iniciador">
                      <select name="cmb_iniciador" id="cmb_iniciador" style="width:100%" disabled>
                          <option selected value=<%=beandespliegue.registrosbasedocp.getString(10)%>><%=beandespliegue.registrosbasedocp.getString(11)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("MOSTRAR_INICIADOR_MODIF",beandespliegue.registrosbasedocp.getString(8),beandespliegue.registrosbasedocp.getString(10))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left"> Fecha de apertura documento: </td>
                    <td><input type="text"  name="f_apertura" id="f_apertura" value="<%=beandespliegue.registrosbasedocp.getString(12)%>" style="width:100%" disabled/></td>
<td width="5%"><a href="javascript:NewCal('f_apertura','ddmmyyyy',true,24)" id="calendario" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
				<td width="26%">Dias transcurridos: </td>
				<td width="22%"><input name="txt_diastrans" type="text" value="<%=beandespliegue.registrosbasedocp.getString(13)%>" disabled width="50%"></td>
                  </tr>
                  <tr>
                    <td>Fecha de ultima asignacion:</td>
                    
                    <td width="30%" scope="row"><input type="text" name="f_apertura2" id="f_apertura2" value="<%=beandespliegue.registrosbasedocp.getString(47)%>"    style="width:100%" disabled/></td>
                    <td></td>
                        <td width="26%">Dias transcurridos: </td>
                    <td width="22%"><input name="txt_diastrans2" type="text" value="<%=beandespliegue.registrosbasedocp.getString(48)%>" disabled width="50%"></td>
                  </tr>
                  <tr>
                    <td align="left">Turno:</td>
                    <td><select name="txt_turno" id="txt_turno" style="width:25%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(14)%>"><%=beandespliegue.registrosbasedocp.getString(15)%></option>
                        <%=beandespliegue.OBT_COMBO("MOSTRAR_TURNO_MODIF",beandespliegue.registrosbasedocp.getString(14))%>
                    </select>
                    </td>
                      <td>&nbsp;</td>
					  <td>Criticidad:</td>
                      <td><select name="cmb_ponderacion" id="cmb_ponderacion" style="width:100%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(16)%>"><%=beandespliegue.registrosbasedocp.getString(17)%></option>
                        <%=beandespliegue.OBT_COMBO("OBTENER_CRITICIDAD_MODIF",beandespliegue.registrosbasedocp.getString(16))%>
                      </select></td>
                  </tr>
                  
                </table>
              </fieldset></td></tr></table>
             <table width="100%" border="0"> 
            <tr>
              <td width="50%"><fieldset class="fieldset">
                <legend>Información del vehículo:</legend>
                <table width="100%" height="100%">
                  <tr>
                    <td width="50%"><div align="center">Plataforma:</div></td>
                  <td width="50%"><select name="cmb_plataforma" id="cmb_plataforma" style="width:100%" onChange = "javascript:cargarCombo('compcombolg.jsp', 'cmb_plataforma','div_cmbmod','cod_modelo','MOSTRAR_MODELO')" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(18)%>"><%=beandespliegue.registrosbasedocp.getString(19)%></option>
                        <%=beandespliegue.OBT_COMBO("MOSTRAR_PLATAFORMA_MODIF",beandespliegue.registrosbasedocp.getString(18))%>
                    </select></td>
                  </tr>
                  <tr>
                    <td align="center"><div align="center">Modelo:</div></td>
                <td align="center"><div id="div_cmbmod">
                          <select name="cod_modelo" id="cod_modelo" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(20)%>"><%=beandespliegue.registrosbasedocp.getString(21)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("MOSTRAR_MODELO_MODIF",beandespliegue.registrosbasedocp.getString(18),beandespliegue.registrosbasedocp.getString(20))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center"><div align="center">P.V.I.:</div></td>
                    <td align="center"><input type="text" name="txt_VIN" id="txt_VIN" value="<%=beandespliegue.registrosbasedocp.getString(22)%>" style="width:100%" disabled></td>
                  </tr>
                  <tr>
                    <td><div align="center">Lote:</div></td>
                    <td><div align="center">
                      <input type="text" name="txtlote" id="txtlote" value="<%=beandespliegue.registrosbasedocp.getString(23)%>" style="width:100%" disabled>
                    </div></td>
                  </tr>
                </table>
              </fieldset></td>
              <td width="36%"><fieldset class="fieldset">
                <legend>Información responsable:</legend>
            <table border="0" align="center" width="100%">
                  <tr>
                    <td width="30%"  align="left" scope="row"><label> Area:</label></td>
                    <td align="center" width="70%"><div align="center">
                      <select name="txt_Area" id="txt_Area"  onChange = "javascript:ejecutarresp()" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(24)%>"><%=beandespliegue.registrosbasedocp.getString(25)%></option>
                          <%=beandespliegue.OBT_COMBO("MOSTRAR_AREA_MODIF",beandespliegue.registrosbasedocp.getString(24))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left" scope="row">LG:</td>
                    <td align="center"><div id="div_combolg">
                      <select name="txt_lg" id="txt_lg" style="width:100%" onChange="javascript:ejecutarprs()" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(26)%>"><%=beandespliegue.registrosbasedocp.getString(27)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("BUSCAR_GRUPOS_MODIF",beandespliegue.registrosbasedocp.getString(24),beandespliegue.registrosbasedocp.getString(26))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left" scope="row">ET:</td>
                    <td align="center"><div id="div_comboet">
                      <select name="LET" id="LET" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(28)%>"><%=beandespliegue.registrosbasedocp.getString(29)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("BUSCAR_EQUIPOS_MODIF",beandespliegue.registrosbasedocp.getString(24),beandespliegue.registrosbasedocp.getString(26),beandespliegue.registrosbasedocp.getString(28))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left">Nombre:</td>
                    <td align="center"><div id="div_perres">
                      <select name="cmb_personal" id="cmb_personal" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(30)%>"><%=beandespliegue.registrosbasedocp.getString(31)%></option>
                              <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("BUSCAR_PERSONAL_MODIF",beandespliegue.registrosbasedocp.getString(24),beandespliegue.registrosbasedocp.getString(26),beandespliegue.registrosbasedocp.getString(30))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left">Corresponsal Calidad:</td>
                    <td>
                      <select name="cmb_corresp" id="cmb_corresp" style="width:100%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(32)%>"><%=beandespliegue.registrosbasedocp.getString(33)%></option>
                        <%=beandespliegue.OBT_COMBO("DEVUELVE_CORRESPONSALES_MODIF",beandespliegue.registrosbasedocp.getString(32))%>
                      </select>                    </td>
                  </tr>
                </table>
              </fieldset></td>
            </tr>
            </table>
            <table width="100%" border="0"> 
            <tr>
              <td width="49%"><fieldset class="fieldset">
                <legend>Informacion problema:</legend>
            <table width="93%" border="0" align="center" bordercolor="#990000">
        <tr align="center">
                    <td width="11%">Categoria:</td>
                    <td width="89%" align="right">
                        <select name="cmb_categoria" id="cmb_categoria" style="width:100%" onChange = "javascript:cargarCombo('compcomboAct.jsp', 'cmb_categoria','div_cmbdefecto','cmd_defecto','DEVOLVER_FALLA')" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(34)%>"><%=beandespliegue.registrosbasedocp.getString(35)%></option>
                        <%=beandespliegue.OBT_COMBO("DEVOLVERC_FALLAMODIF",beandespliegue.registrosbasedocp.getString(34))%>
                        </select>
                    </td>
                </tr>
                  <tr>
                    <td align="center">Defecto:</td>
                    <td align="right"><div id="div_cmbdefecto">
                      <select name="cmd_defecto" id="cmd_defecto" style="width:100%"  onChange = "javascript:cargarComboN1('compcomboAct.jsp', 'cmd_defecto', 'cmb_categoria','div_cmbniv1', 'cmb_niv1','DEVOLVER_N1')" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(36)%>"><%=beandespliegue.registrosbasedocp.getString(37)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_FALLAMODIF",beandespliegue.registrosbasedocp.getString(34),beandespliegue.registrosbasedocp.getString(36))%>
                      </select>
                    </div></td>
                  <tr>
                    <td align="center">Nivel 1:</td>
                    <td align="right"><div id="div_cmbniv1">
                      <select name="cmb_niv1" id="cmb_niv1" style="width:100%" onChange = "ejecutardepsMOD()" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(38)%>"><%=beandespliegue.registrosbasedocp.getString(39)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_N1MODIF",beandespliegue.registrosbasedocp.getString(34),beandespliegue.registrosbasedocp.getString(36),beandespliegue.registrosbasedocp.getString(38))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Nivel 2:</td>
                    <td align="right"><div id="div_cmbniv2">
                      <select name="cmb_niv2" id="cmb_niv2" style="width:100%"  onChange = "cargarcslt('compcomboAct.jsp', 'cmb_niv2','cmb_niv1','cmd_defecto','cmb_categoria','div_cmbpos', 'cmb_pos','DEVOLVER_POST')" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(40)%>"><%=beandespliegue.registrosbasedocp.getString(41)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_N2MODIF",beandespliegue.registrosbasedocp.getString(34),beandespliegue.registrosbasedocp.getString(36),beandespliegue.registrosbasedocp.getString(38),beandespliegue.registrosbasedocp.getString(40))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Posicion:</td>
                    <td align="right"><div id="div_cmbpos">
                      <select name="cmb_pos" id="cmb_pos" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(42)%>"><%=beandespliegue.registrosbasedocp.getString(43)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVOLVER_POSMODIF",beandespliegue.registrosbasedocp.getString(34),beandespliegue.registrosbasedocp.getString(36),beandespliegue.registrosbasedocp.getString(38),beandespliegue.registrosbasedocp.getString(40),beandespliegue.registrosbasedocp.getString(42))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Comentario:</td>
                    <td align="left"><input type="text" name="txt_detalle" id="txt_detalle" style="text-transform: uppercase;width:95%" value="<%=beandespliegue.registrosbasedocp.getString(44)%>"  disabled></td>
                  </tr>
              </table>
              </fieldset></td>
              <td width="51%"><fieldset class="fieldset">
        		<legend>Cargar Imagen:</legend>
              <table border="0" style="width:100%" >
                  
                    <tr>
                      <td width="30%">Cambiar la fotografía:
                        <INPUT NAME="imageField" id="imageField" TYPE="file" onChange="preview(this)"></td>
			
<td width="50%" colspan="2">
<img alt="La imagen se verá aqui" id="previewField" width="320" height="200"  style="border: black;border-style: outset;border-width: medium" src="SSPFOTOS/P<%=request.getParameter("iddoc")%>.jpeg?rand=<%=Math.random()%>"/></td>
</table>
</fieldset></td>
            </tr>
            </table>
            <script language="JavaScript">
//              document.getElementById('cmb_sts').getElementsByTagName('option')[1].style.color= '#00FF00';
              </script>
            <fieldset class="fieldset">
                <legend>Estatus del problema:</legend>
<table width="93%" border="0" align="center">
<tr>
                        <td width="100%"><div align="center">
                          <table width="100%" border="0">
                            <tr>
                              <td width="6%" rowspan="2" ><p>
                                <select style="height:50px;background-color:#CCCCCC;font-size:38px;"  id="cmb_sts" name="cmb_sts" onChange="JavaScript:cambioseg();" disabled>
                                  <option selected style="color:<%=beandespliegue.registrosbasedocp.getString(59)%>" value="<%=beandespliegue.registrosbasedocp.getString(46)%>"><%=beandespliegue.registrosbasedocp.getString(46)%></option>
                                  <%=beandespliegue.OBT_COLCOMBO("MOSTRAR_STSMODIF",beandespliegue.registrosbasedocp.getString(46))%>
                                </select>
                              </p>
                                <p>
                                  <input type="hidden" name="hdn_status" id="hdn_status" value="<%=beandespliegue.registrosbasedocp.getString(46)%>">
                              </p></td>
                          <td width="38%"><fieldset class="fieldset">
                	      <legend>Accion de contención:</legend>
                                <table border="0">
                          <tr>
                            <td width="78" align="center">Resumen de la acción de contención:</td>
                            <td colspan="3"><p>
                              <label>
                              <textarea name="txt_aconten" id="txt_aconten" cols="45" rows="5" style="width:100%"><%=beandespliegue.registrosbasedocp.getString(49)%></textarea>
                              </label>
                              </p>
                            </td>
                      </tr>
                          <tr>
                            <td scope="row">Lote Impl.:</td>
                            <td width="144"><input type="text" name="txt_lote" id="txt_lote" style="width:95%" value="<%=beandespliegue.registrosbasedocp.getString(50)%>" disabled></td>
                            <td width="79">Fecha  Impl.:</td>
                            <td width="144"><input type="text" name="txt_fecha" id="txt_fecha" style="width:80%" value="<%=beandespliegue.registrosbasedocp.getString(51)%>" disabled><a href="javascript:NewCal('txt_fecha','ddmmyyyy',true,24)" id="calendariocon" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                      </tr>
                    </table>
                        </fieldset>            </td>
                              <td width="56%" rowspan="2"><fieldset class="fieldset">
                            <legend>Detalle de la solución definitiva:</legend>
                        <table width="100%" border="0">
                          <tr>
                            <td align="center" width="25%">Resumen de la solucion definitiva:</td>
                            <td colspan="3"><p>
                              <label>
                              <textarea name="txt_adefini" id="txt_adefini" cols="45" rows="5"><%=beandespliegue.registrosbasedocp.getString(52)%></textarea>
                              </label>
                            </p>
                            </td>
                          </tr>
                          <tr>
                            <td scope="row">Lote punto de corte:</td>
                            <td width="25%"><input type="text" name="txt_lote2" id="txt_lote2" style="width:95%" value="<%=beandespliegue.registrosbasedocp.getString(53)%>" disabled></td>
                            <td width="20%">Fecha  punto de corte:</td>
                            <td width="30%"><input type="text" name="txt_fecha2" id="txt_fecha2" style="width:80%" value="<%=beandespliegue.registrosbasedocp.getString(54)%>" disabled><a href="javascript:NewCal('txt_fecha2','ddmmyyyy',true,24)" id="calendariodef" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                          <tr>
                            <td scope="row">Resumen de la causa raiz:</td>
                            <td><input type="text" name="txt_origen" id="txt_origen" style="width:95%" value="<%=beandespliegue.registrosbasedocp.getString(55)%>" disabled></td>
                            <td>Causa 5M:</td>
                      <td>
            <select name="cmb_5m" id="cmb_5m" style="width:80%" disabled>
                                    <option selected value=<%=beandespliegue.registrosbasedocp.getString(56)%>><%=beandespliegue.registrosbasedocp.getString(57)%></option>
                                    <%=beandespliegue.OBT_COMBO("DEVUELVE_5M",beandespliegue.registrosbasedocp.getString(56))%>
                        </select></td>
                          </tr>
                        </table>
                        </fieldset></td>
                            </tr>
                            <tr>
                              <td>
                              <fieldset class="fieldset">
                			<legend>Información de la causa raíz:</legend>
                        <table width="100%" border="0">
                          <tr>
                            <td width="22%" scope="row">Motivo Anulación:</td>
                            <td width="78%"><input type="text" name="txt_motivoa" id="txt_motivoa" style="width:100%" value="<%=beandespliegue.registrosbasedocp.getString(58)%>" disabled></td>
                          </tr>
                        </table>     
                        </fieldset> </td>
                            </tr>
                          </table>
                        </div></td>
          </tr>
                      <tr>
                        <td>  
                        </td>    
                      </tr>
            </table>
            </fieldset>
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
                    <td width="100%" align="center" scope="row"><div id="CollapsiblePanel1" class="CollapsiblePanel">
                      <div class="CollapsiblePanelTab" ta tabindex="0">Click para expandir</div>
                      <div class="CollapsiblePanelContent">
                        <textarea name="txt_historico" cols="100%" rows="10" disabled><%=beandespliegue.registrosbasedocp.getString(45)%></textarea>
                      </div>
                    </div>                    </td>
                  </tr>
                    <tr>
                    <td width="40%">                    </td>
                  </tr>
                </table>
              </fieldset>              </td>
            </tr>
          </table>
    </form>
        <script type="text/javascript">
<!--
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1", {contentIsOpen:false});
//-->
        </script>
</body>
</html>