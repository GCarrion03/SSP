<%-- 
    Document   : consultaind
    Created on : 07-02-2010, 09:01:17 AM
    Author     : Guz
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>

<html>
    <head>
        <% request.setCharacterEncoding("UTF-8"); %>
         <script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
         <script type="text/javascript" src="peticioajax.js"></script>
         <script type="text/javascript" src="referencias.js"></script>
         <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"></script>
	     <link href="Estilos carpeta/estilo fieldset.css" rel="stylesheet" type="text/css">
		 <script type="text/javascript">
         		var band=0;
						function habilitar()
                        {
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
                            /*
                            unlock('cmb_categoria');
                            unlock('cmb_defecto');
                            unlock('cmb_niv1');
                            unlock('cmb_niv2');
                            unlock('cmb_pos');
                            unlock('txt_detalle');*/
         					unlock('cmb_sts');
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
                            }
                            else{
                               document.formdoc.btn_Modificar.style.borderStyle="outset";
                               document.formdoc.btn_Modificar.style.backgroundColor="#80ADDB";
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
                            /*
                            lock('cmb_categoria');
                            lock('cmb_defecto');
                            lock('cmb_niv1');
                            lock('cmb_niv2');
                            lock('cmb_pos');
                            lock('txt_detalle');*/
							lock('cmb_sts');
							deshabilitartodosts();
                               }
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
						if(document.formdoc.cmb_sts.value=='Φ'){
                                                                
								habilitaranul();
                                                                }
                                                alert(document.getElementById('cmb_sts').value);
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
         <jsp:useBean id="beandespliegue" class="SSP_CAPAS.GMPresentacion" scope="page" >
        </jsp:useBean> 
         <%
    if (request.getParameter("btn_verdig")!=null)
                 {
                 //String sFichero = "C:/"+request.getParameter("iddoc")+".TIF";
                 String sFichero = "C:/SUE-00001-01.TIF";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".TIF";
                 //String sFichero = "C:/"+beancslt.G_busqueda+".pdf";
                 File fichero = new File(sFichero);
                 if (fichero.exists())
                 response.sendRedirect("despliegapdf.jsp?var="+request.getParameter("iddoc"));
//                 response.sendRedirect("despliegapdf.jsp?var="+request.getParameter("iddoc"));
                 //response.sendRedirect("despliegapdf.jsp?var="+beancslt.G_busqueda);
                 else {%>
                 <script language = "JavaScript">
                            alert("El fichero no existe");
                 </script>
<%}
                    }
		%>

        <%if (request.getParameter("btn_Guardar")!=null)
                 {%>
                 <%if(beandespliegue.actualizarprob(request.getParameter("iddoc"),request.getParameter("f_apertura"),request.getParameter("t_doc"),request.getParameter("cmb_dpn"),request.getParameter("cmb_escalonamiento"),request.getParameter("txt_turno"),request.getParameter("cmb_ponderacion"),request.getParameter("cod_modelo"),request.getParameter("txt_VIN"),request.getParameter("txtlote"),request.getParameter("txt_lg"),request.getParameter("LET"),request.getParameter("cmb_personal"),request.getParameter("cmb_corresp"),request.getParameter("txt_Area"),request.getParameter("hdn_status"),request.getParameter("txt_aconten"),request.getParameter("txt_lote"),request.getParameter("txt_fecha"),request.getParameter("txt_adefini"),request.getParameter("txt_lote2"),request.getParameter("txt_fecha2"),request.getParameter("txt_origen"),request.getParameter("cmb_5m"),request.getParameter("txt_motivoa"),request.getParameter("var")))
             {
             %>
             <script language="JavaScript">
                        alert('Documento modificado correctamente')
                     </script>
                     <%
                     }
                     else
                     {%>
                     <script language="JavaScript">
                        alert('Error llene todos los campos correctamente')
                                       alert('<%=request.getParameter("iddoc")%>!--------------!<%=request.getParameter("f_apertura")%>!--------------!<%=request.getParameter("t_doc")%>!--------------!<%=request.getParameter("cmb_dpn")%>!--------------!<%=request.getParameter("cmb_escalonamiento")%>!--------------!<%=request.getParameter("txt_turno")%>!--------------!<%=request.getParameter("cmb_ponderacion")%>!--------------!<%=request.getParameter("cod_modelo")%>!--------------!<%=request.getParameter("txt_VIN")%>!--------------!<%=request.getParameter("txtlote")%>!--------------!<%=request.getParameter("txt_lg")%>!--------------!<%=request.getParameter("LET")%>!--------------!<%=request.getParameter("cmb_personal")%>!--------------!<%=request.getParameter("cmb_corresp")%>!--------------!<%=request.getParameter("txt_Area")%>')
                                       alert('<%=request.getParameter("hdn_status")%>')
                                       alert('<%=request.getParameter("iddoc")%>!--------------!<%=request.getParameter("f_apertura")%>!--------------!<%=request.getParameter("t_doc")%>!--------------!<%=request.getParameter("cmb_dpn")%>!--------------!<%=request.getParameter("cmb_escalonamiento")%>!--------------!<%=request.getParameter("txt_turno")%>!--------------!<%=request.getParameter("cmb_ponderacion")%>!--------------!<%=request.getParameter("cod_modelo")%>!--------------!<%=request.getParameter("txt_VIN")%>!--------------!<%=request.getParameter("txtlote")%>!--------------!<%=request.getParameter("txt_lg")%>!--------------!<%=request.getParameter("LET")%>!--------------!<%=request.getParameter("cmb_personal")%>!--------------!<%=request.getParameter("cmb_corresp")%>!--------------!<%=request.getParameter("txt_Area")%>!--------------!<%=request.getParameter("hdn_status")%>!--------------!<%=request.getParameter("txt_aconten")%>!--------------!<%=request.getParameter("txt_lote")%>!--------------!<%=request.getParameter("txt_fecha")%>!--------------!<%=request.getParameter("txt_adefini")%>!--------------!<%=request.getParameter("txt_lote2")%>!--------------!<%=request.getParameter("txt_fecha2")%>!--------------!<%=request.getParameter("txt_origen")%>!--------------!<%=request.getParameter("cmb_5m")%>!--------------!<%=request.getParameter("txt_motivoa")%>')
                     </script>
                     <%
                 }
                    }%>
<%beandespliegue.OBTENERREGISTROSPRBL("CONSULTAR_PROBLEMAPRINCIPAL",request.getParameter("iddoc"));%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <form name="formdoc"  method="post" action="" onSubmit="JavaScript:habilitartodosts()">
          <table width="100%" border="0"><tr><td width="8%" scope="row" align="center">
                      <table width="100%" border="0">
            <tr>
              <td width="8%" scope="row"><input type="button" name="btn_Modificar" id="btn_Modificar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC" value="Modificar" onClick="JavaScript:habilitar()"></td>
              <td width="8%" scope="row" align="center"><input type="submit" name="btn_Guardar" id="btn_Guardar" value="Guardar" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC"></td>
              <td width="6%" scope="row"><input type="button" name="btn_Cerrar" id="btn_Cerrar" value="Cerrar" onClick="JavaScript:window.close();" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC"></td>
              <td width="12%" scope="row"><input type="submit" name="btn_verdig" id="btn_verdig" value="Ver Digitalizado" style="BORDER: rgb(128,128,128) 2px outset; FONT-SIZE: 8pt; FONT-FAMILY: Verdana; BACKGROUND-COLOR: #CCCCCC"></td>
              <td width="66%" align="right">
               <table width="100%" border="7" height="2">
                   <tr>
                  <th width="30%" scope="row">&nbsp;</th>
                  <td width="9%" align="center" bordercolor="#333333"><H2 id="tlt_estatus"><%=beandespliegue.registrosbasedocp.getString(46)%></H2>
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
          <table width="104%" border="0" align="center">
            <tr>
              <td width="100%"><fieldset class="fieldset">
                <legend>Información Registro:</legend>
                <table width="93%" border="0" align="center" bordercolor="#990000">
                  <tr>
                    <td width="15%" align="left" scope="row"><label>Codigo: </label></td>
                    <td width="35%" align="center"><div id="div_ndoc">
                      <input type="text" name="coddoc" id="coddoc" value=<%=request.getParameter("iddoc")%> style="width:100%" disabled>
                      </div>                    </td>
                    <td width="15%" align="left">Tipo de documento: </td>
                    <td width="35%" align="center"><select name="t_doc" id="t_doc" style="width:100%" disabled>
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(2)%>><%=beandespliegue.registrosbasedocp.getString(3)%></option>
                        <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("DEVUELVE_TDOCMODIF","P", beandespliegue.registrosbasedocp.getString(2))%>
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
             <table width="100%" border="0"> 
            <tr>
              <td width="64%"><fieldset class="fieldset">
                <legend>Información punto de apertura:</legend>
                <table width="100%" border="0" align="center" bordercolor="#990000">
                  <tr>
                    <td width="30%" align="left" scope="row"><label>Punto de apertura: <br>
                    </label></td>
                    <td width="70%" align="left"><select name="cmb_dpn" id="cmb_ptoap" style="width:100%" onChange="carga_usr()" disabled>
                        <option selected value=<%=beandespliegue.registrosbasedocp.getString(8)%>><%=beandespliegue.registrosbasedocp.getString(9)%></option>
                        <%=beandespliegue.OBT_COMBO("DEVUELVEPTOAP_MODIF",beandespliegue.registrosbasedocp.getString(8))%>
                      </select>
                        <%--
                <input type="text" name="txt_puntoapert" id="txt_puntoapert" size="60" value="<%=beandespliegue.devuelve_dept(request.getParameter("var"))%>">--%></td>
                  </tr>
                  <tr>
                    <td align="left">Iniciado por:</td>
                    <td><div id="div_iniciador">
                      <select name="cmb_iniciador" id="cmb_iniciador" style="width:100%" disabled>
                          <option selected value=<%=beandespliegue.registrosbasedocp.getString(10)%>><%=beandespliegue.registrosbasedocp.getString(11)%></option>
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("MOSTRAR_INICIADOR_MODIF",beandespliegue.registrosbasedocp.getString(8),beandespliegue.registrosbasedocp.getString(10))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left"> Fecha de apertura documento: </td>
                    <td><table width="100%" border="0">
  <tr>
    <td width="41%" align="center" bgcolor="#FFFFFF"><input type="text"  name="f_apertura" id="f_apertura" value="<%=beandespliegue.registrosbasedocp.getString(12)%>" disabled/></td>
    <td width="11%"><a href="javascript:NewCal('f_apertura','ddmmyyyy',true,24)" id="calendario" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
    <td width="33%">Dias transcurridos: </td>
    <td width="15%"><input name="txt_diastrans" type="text" value="<%=beandespliegue.registrosbasedocp.getString(13)%>" disabled width="50%"></td>
  </tr>
</table></td>
                  </tr>
                  <tr>
                    <td>Fecha de ultima asignacion:</td>
                    <td><table width="100%" border="0">
                      <tr>
                        <th width="41%" scope="row"><input type="text" name="f_apertura2" id="f_apertura2" value="<%=beandespliegue.registrosbasedocp.getString(47)%>" disabled/></th>
                        <td width="11%">&nbsp;</td>
                        <td width="33%">Dias transcurridos: </td>
                        <td width="15%"><input name="txt_diastrans2" type="text" value="<%=beandespliegue.registrosbasedocp.getString(48)%>" disabled width="50%"></td>
                      </tr>
                    </table>
                    <label></label></td>
                  </tr>
                  <tr>
                    <td align="left">Turno:</td>
                    <td><select name="txt_turno" id="txt_turno" style="width:25%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(14)%>"><%=beandespliegue.registrosbasedocp.getString(15)%></option>
                        <%=beandespliegue.OBT_COMBO("MOSTRAR_TURNO_MODIF",beandespliegue.registrosbasedocp.getString(14))%>
                    </select></td>
                  </tr>
                  <tr>
                    <td align="left">Criticidad:</td>
                    <td><select name="cmb_ponderacion" id="cmb_ponderacion" style="width:25%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(16)%>"><%=beandespliegue.registrosbasedocp.getString(17)%></option>
                        <%=beandespliegue.OBT_COMBO("OBTENER_CRITICIDAD_MODIF",beandespliegue.registrosbasedocp.getString(16))%>
                    </select></td>
                  </tr>
                </table>
              </fieldset></td>
              <td width="36%"><fieldset class="fieldset">
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
                    <td align="center"><input type="text" name="txt_VIN" id="txt_VIN" value="<%=beandespliegue.registrosbasedocp.getString(22)%>" disabled></td>
                  </tr>
                  <tr>
                    <td><div align="center">Lote:</div></td>
                    <td><div align="center">
                      <input type="text" name="txtlote" id="txtlote" value="<%=beandespliegue.registrosbasedocp.getString(23)%>" disabled>
                    </div></td>
                  </tr>
                </table>
              </fieldset></td>
            </tr>
            </table>
            <table width="100%" border="0"> 
            <tr>
              <td width="49%"><fieldset class="fieldset">
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
                      <select name="txt_lg" id="txt_lg" style="width:100%" disabled>
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
                          <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("BUSCAR_EQUIPOS_MODIF",beandespliegue.registrosbasedocp.getString(26),beandespliegue.registrosbasedocp.getString(28))%>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="left">Nombre:</td>
                    <td align="center"><div id="div_perres">
                      <select name="cmb_personal" id="cmb_personal" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(30)%>"><%=beandespliegue.registrosbasedocp.getString(31)%></option>
                              <%=beandespliegue.OBT_COMBOSELECCIONADOSVD("BUSCAR_PERSONAL_MODIF",beandespliegue.registrosbasedocp.getString(28),beandespliegue.registrosbasedocp.getString(30))%>
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
              </fieldset>
              <td width="51%"><fieldset class="fieldset">
                <legend>Informacion problema:</legend>
            <table width="100%" border="0" align="center" bordercolor="#990000">
                  <tr align="center">
                    <td width="11%">Categoria:</td>
                    <td width="89%" align="right"><select name="cmb_categoria" id="cmb_categoria" style="width:100%" disabled>
                        <option selected value="<%=beandespliegue.registrosbasedocp.getString(34)%>"><%=beandespliegue.registrosbasedocp.getString(35)%></option>
                    </select></td>
                  </tr>
                  <tr>
                    <td align="center">Defecto:</td>
                    <td align="right"><div id="div_cmbdefecto">
                      <select name="cmb_defecto" id="cmb_defecto" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(36)%>"><%=beandespliegue.registrosbasedocp.getString(37)%></option>
                      </select>
                    </div></td>
                  <tr>
                    <td align="center">Nivel 1:</td>
                    <td align="right"><div id="div_cmbniv1">
                      <select name="cmb_niv1" id="cmb_niv1" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(38)%>"><%=beandespliegue.registrosbasedocp.getString(39)%></option>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Nivel 2:</td>
                    <td align="right"><div id="div_cmbniv2">
                      <select name="cmb_niv2" id="cmb_niv2" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(40)%>"><%=beandespliegue.registrosbasedocp.getString(41)%></option>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Posicion:</td>
                    <td align="right"><div id="div_cmbpos">
                      <select name="cmb_pos" id="cmb_pos" style="width:100%" disabled>
                          <option selected value="<%=beandespliegue.registrosbasedocp.getString(42)%>"><%=beandespliegue.registrosbasedocp.getString(43)%></option>
                      </select>
                    </div></td>
                  </tr>
                  <tr>
                    <td align="center">Comentario:</td>
                    <td align="left"><input type="text" name="txt_detalle" id="txt_detalle" size="100%" value="<%=beandespliegue.registrosbasedocp.getString(44)%>"  disabled></td>
                  </tr>
                </table>
              </fieldset></td>
            </tr>
            </table>
            <script language="JavaScript">
//              document.getElementById('cmb_sts').getElementsByTagName('option')[1].style.color= '#00FF00';
              </script>
            <fieldset class="fieldset">
                <legend>Estatus del problema:</legend>
<table width="100%" border="0" align="center">
                      <tr>
                        <td width="100%"><div align="center">
                          <table width="100%" border="0">
                            <tr>
                              <td width="5%" rowspan="2" ><p>
                                <select style="height:50px;background-color:#CCCCCC;font-size:38px;"  id="cmb_sts" name="cmb_sts" onChange="JavaScript:cambioseg();" disabled>
                                  <option selected style="color:<%=beandespliegue.registrosbasedocp.getString(59)%>" value="<%=beandespliegue.registrosbasedocp.getString(46)%>"><%=beandespliegue.registrosbasedocp.getString(46)%></option>
                                  <%=beandespliegue.OBT_COLCOMBO("MOSTRAR_STSMODIF",beandespliegue.registrosbasedocp.getString(46))%>
                                </select>
                              </p>
                                <p>
                                  <input type="hidden" name="hdn_status" id="hdn_status" value="<%=beandespliegue.registrosbasedocp.getString(46)%>">
                              </p></td>
                          <td width="40%"><fieldset class="fieldset">
                	      <legend>Accion de contención:</legend>
                                <table width="100%" border="0">
                          <tr>
                            <td align="center">Resumen de la acción de contención:</td>
                            <td colspan="3"><p>
                              <label>
                              <textarea name="txt_aconten" id="txt_aconten" cols="45" rows="5" ><%=beandespliegue.registrosbasedocp.getString(49)%></textarea>
                              </label>
                              </p>
                            </td>
                      </tr>
                          <tr>
                            <td width="22%" scope="row">Lote implementación:</td>
                            <td width="26%"><input type="text" name="txt_lote" id="txt_lote" style="width:95%" value="<%=beandespliegue.registrosbasedocp.getString(50)%>" disabled></td>
                            <td width="21%">Fecha  implementacion:</td>
                            <td width="31%"><input type="text" name="txt_fecha" id="txt_fecha" style="width:80%" value="<%=beandespliegue.registrosbasedocp.getString(51)%>" disabled><a href="javascript:NewCal('txt_fecha','ddmmyyyy',true,24)" id="calendariocon" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                      </tr>
                    </table>
                        </fieldset>            </td>
                              <td width="55%" rowspan="2"><fieldset class="fieldset">
                            <legend>Detalle de la solución definitiva:</legend>
                        <table width="100%" border="0">
                          <tr>
                            <td align="center">Resumen de la solucion definitiva:</td>
                            <td colspan="3"><p>
                              <label>
                              <textarea name="txt_adefini" id="txt_adefini" cols="45" rows="5"><%=beandespliegue.registrosbasedocp.getString(52)%></textarea>
                              </label>
                            </p>
                            </td>
                          </tr>
                          <tr>
                            <td width="22%" scope="row">Lote punto de corte:</td>
                            <td width="26%"><input type="text" name="txt_lote2" id="txt_lote2" style="width:95%" value="<%=beandespliegue.registrosbasedocp.getString(53)%>" disabled></td>
                            <td width="21%">Fecha  punto de corte:</td>
                            <td width="31%"><input type="text" name="txt_fecha2" id="txt_fecha2" style="width:80%" value="<%=beandespliegue.registrosbasedocp.getString(54)%>" disabled><a href="javascript:NewCal('txt_fecha2','ddmmyyyy',true,24)" id="calendariodef" style="visibility:hidden"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
                          <tr>
                            <td scope="row" width="22%">Resumen de la causa raiz:</td>
                            <td width="47%"><input type="text" name="txt_origen" id="txt_origen" style="width:95%" value="<%=beandespliegue.registrosbasedocp.getString(55)%>" disabled></td>
                            <td width="11%">Causa 5M:</td>
                      <td width="20%">
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
                            <td width="78%"><input type="text" name="txt_motivoa" id="txt_motivoa" style="width:100%" disabled></td>
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
            <table width="100%" border="0">
                          <tr>
                            <td width="22%" scope="row">
                             <fieldset class="fieldset">
                			<legend>Tarjeta Amarilla:</legend>
                            <table width="100%"><tr><td width="8%">
                        <select style="height:50px;background-color:#CCCCCC;font-size:38px;"  id="cmb_sts" name="cmb_sts" onChange="JavaScript:cambioseg();" disabled>
                                  <option selected style="color:<%=beandespliegue.registrosbasedocp.getString(59)%>" value="<%=beandespliegue.registrosbasedocp.getString(46)%>"><%=beandespliegue.registrosbasedocp.getString(46)%></option>
                                  <%=beandespliegue.OBT_COLCOMBO("MOSTRAR_STSMODIF",beandespliegue.registrosbasedocp.getString(46))%>
                              </select>
								</td>
                          <td width="92%">Tiempo de Vida:</td>
                          </tr>
                             </table>
                             </fieldset>
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