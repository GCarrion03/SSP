<%-- 
    Document   : consultaprob
    Created on : 05-18-2010, 12:57:27 PM
    Author     : Guz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Estilos carpeta/estilo fieldset.css" rel="stylesheet" type="text/css">
        <style type="text/css">
<!--
-->
    </style> 
    <script language="javascript" type="text/javascript" src="datetimepicker.js">
//Date Time Picker script- by TengYong Ng of http://www.rainforestnet.com
//Script featured on JavaScript Kit (http://www.javascriptkit.com)
//For this script, visit http://www.javascriptkit.com
</script>
        <script language="javascript" type="text/javascript" src="referencias.js">
        </script>
    <script type="text/javascript" src="peticioajax.js"></script>
        <title>Consulta Documento</title>
         <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css">
    <style type="text/css">
<!--
-->
</style></head>
              <jsp:useBean id="beancslt" class="SSP_CAPAS.GMPresentacion" scope="session" >
                  <% beancslt.setir_request(request);
            %>
                      </jsp:useBean>
    <body style="background-color: transparent;">
        <% if (request.getParameter("btn_consulta")!=null)
		{
            //response.sendRedirect("despliegapdf.jsp?var="+request.getParameter("iddoc"));
		String registros;
                registros=beancslt.EJECUTARSPDEVSTR("EXISTE_DOC",request.getParameter("txt_cod_doc"));
                if (registros.compareTo("0")==0)
                    {
                %>
                <script LANGUAGE="JavaScript">
                MENSAJE("Documento no encontrado")
                </script>
                <%
                }
                else{
                    //response.sendRedirect("http://124.14.96.50:38163/SSP/Cinco_pasos.jsp?var="+s_pant);
                    if (beancslt.EJECUTARSPDEVSTR("EXISTE_REDX",request.getParameter("txt_cod_doc")).compareTo("0")!=0)
                        {%>
                        <script LANGUAGE="JavaScript">
                            window.open('ConsultaRX.jsp?var=<%=request.getParameter("var")%>&iddoc=<%=registros%>','SSP1', 'fullscreen=yes,scrollbars=yes');
                        </script>
                        <%}
                    else{
			%>
                    <script LANGUAGE="JavaScript">
                        window.open('consultaind.jsp?var=<%=request.getParameter("var")%>&iddoc=<%=registros%>','SSP1', 'fullscreen=yes,scrollbars=yes');
                    </script>
                    <%}
                }
		%>
                    <%
		}%>
              <p>
                <script language = "JavaScript">
            function alo(inform)
            {
                document.getElementById("ss").disabled=true;
            }
			function mostrar(formu)
			{
                            formu.lst_busca.length=0;
                            formu.lst_busca.options[formu.lst_busca.length]=new Option ("Código Documento: EVCA-1-1 FECHA: 2010-05-17 : HOLGURA","EVCA-1-1");
			}
                        function cargar(formu)
                        {
                            formu.txt_cod_doc.value=formu.lst_busca.options[formu.lst_busca.selectedIndex].value;
                        }
              function obt_cod()
                {
             document.form2.txt_cod_doc.value=document.form2.lst_consulta.value
                }
              </script>
              </p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
    <table width="100%" border="0" >
  	<tr>
    <td width="100%">
    <form name="form2" method="post" action="">
      
          <fieldset class="fieldset">
        <legend>Consultar documentos:</legend>
      <table width="100%" border="0">
        <tr>
          <td width="25%" >Codigo documento:</td>
          <td width="36%" align="center"><input type="text" name="txt_cod_doc" id="txt_cod_doc" onKeyUp="JavaScript:this.value=this.value.toUpperCase()">
            <input type="hidden" name="hdnusr" id="hdnusr" value="<%=request.getParameter("var")%>"></td>
          <td width="39%" align="center" colspan="2">
              <input type="button"  id="btn_consulta" value="Consultar" onClick="javascript:window.open('Compruebaexistedoc.jsp?Id1='+document.getElementById('hdnusr').value+'&Id2='+document.getElementById('txt_cod_doc').value);">
             
          </td>

          <%--<td align="center"><label></label>
            <input type="submit" name="btn_modificar" id="btn_modificar" value="Modificar" style="visibility:hidden">
            <%/*=beancslt.otorgaperpert(request.getParameter("var"),"btn_modificar")*/%></td>
          <td width="222" align="center"><input type="submit" name="btn_mostrardoc" id="btn_mostrardoc" value="Mostrar Documento Físico"></td>--%>
          </tr>
          </table>
          </fieldset>
                  <fieldset class="fieldset">
        <legend >Bùsqueda Ràpida:</legend>
        <table width="100%">
        <tr>
        <td width="5%">Punto de apertura:        </td>
        <td width="19%"> <select name="cmb_ptoap" id="cmb_ptoap" style="width:100%">
              <option selected value="%25">Todos</option>
                    <%=beancslt.devuelve_dept()%>
            </select>
        </td>
        <td width="7%">Area:        </td>
        <td width="17%"><select name="txt_Area" id="txt_Area"  style="width:100%">
                <option selected value="%25">Todos</option>
                    <%=beancslt.devuelvptoa()%>
                </select>
        </td>
        <td width="11%">Plataforma:</td>
        <td width="17%"><select name="cmb_plat2" id="cmb_plat2" style="width:100%">
          <option selected value="%25">Todos</option>
            <%=beancslt.obtplataforma()%>
          </select>
        </td>
        <td width="7%">Fallo:        </td>
        <td width="17%"><label>
          <select name="cmb_fallo" id="cmb_fallo" style="width:200px">
            <option selected value="%25">Todos</option>
            <%=beancslt.OBT_COMBO_SIMPLE("MOSTRAR_FALLA ")%>
          </select>
        </label>        </td>
        
        </tr>
        <tr>
        <td></td>
        <td></td>
        <td width="7%">
        Fecha Inicio:</td>
        <td width="17%">
        <input id="txt_fini" name="txt_fini" type="text" style="width:80%"><a href="javascript:NewCal('txt_fini','ddmmyyyy',false,12)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>        </td>
        <td width="11%">Fecha Fin:</td>
        <td width="17%"><input id="txt_ffin" name="txt_ffin" type="text" style="width:80%">
          <a href="javascript:NewCal('txt_ffin','ddmmyyyy',false,12)"><img src="images/cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>        </td>
          </tr>
          <tr>
          <td colspan="8" align="center"><label>
            <input type="button" name="BTN_BUSCAR" id="BTN_BUSCAR" value="BUSCAR" onClick="javascript:cargarcsltfast('compcombolg.jsp','cmb_plat2','txt_fini','txt_ffin','cmb_fallo','txt_Area','cmb_ptoap','div_cslt','lst_consulta','CSLT_FAST')">
          </label></td>
        </tr>
        <tr>
            <td colspan="8" align="center">
              <div id="div_cslt" style="overflow-x:scroll; width:100%;overflow: -moz-scrollbars-horizontal;">
                  <textarea name="txt_historico" cols="100%" style="width:100%" rows="10" disabled> </textarea>
              </div>
                <script language="JavaScript">
                    document.getElementById("div_cslt").style.width=screen.width-screen.width*0.10;
                </script>
            </td>
        </tr>
        <tr>
        <td colspan="8" align="center"><input type="Submit" name="btn_consulta" id="btn_consulta" value="Consultar" style="width:50%"></td>
        </tr>
        </table>
        </fieldset>
	  </form>
    </td>
  </tr>
</table>

</body>
</html>