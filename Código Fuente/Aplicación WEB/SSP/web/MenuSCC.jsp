<%-- 
    Document   : news
    Created on : 06-17-2010, 01:32:01 PM
    Author     : Guz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <!-- Begin Publishing Scripts of Flash Menu MENUCALIDAD -->
   <body style="background-color: transparent;position:absolute" allowTransparency="true" scroll=no>
   <jsp:useBean id="beanprincipal" class="SSP_CAPAS.GMPresentacion" scope="request" >
    </jsp:useBean>
   <TABLE width="100%"><TR><TD width="80%">
<div id="fm_placeholder_MENUCALIDAD" style="width: 80%; height: 34px" allowTransparency="true">
</div>
       </TD> <TD width="20%" align="right"><p><img src="images/LOGO_GM" alt="LOGO" width="111" height="52"></p>
           <%beanprincipal.SETUSRMEN("OBTENER_NOMBRE_USUARIO",request.getParameter("var"),"MENU");%>
           <p><%=beanprincipal.getNombre_usr()%></p></TD></TR></TABLE>
<script type="text/javascript" defer>//<![CDATA[
var fm_MENUCALIDAD = function() {
  function getPos() {
    var p=[0,0]; var e=document.getElementById('fm_placeholder_MENUCALIDAD');
    p[0]+=0; p[1]+=0; return p; }
    //do { p[0]+=e.offsetTop; p[1]+=e.offsetLeft; } while (e=e.offsetParent); return p; }
  function move() {
    var p=getPos(); var m=document.getElementById('fm_wrapper_MENUCALIDAD'); m.style.top=p[0]+'px'; m.style.left=p[1]+'px'; }
  var create = function() {
    var s; if (document.all && !window.opera) {
      s='<object id="fm_menu_MENUCALIDAD" width="904px" height="34px" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" '
        +'codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0">'
        +'<param name="quality" value="high" /><param name="scale" value="noscale" /><param name="salign" value="LT" />'
        +'<param name="movie" value="<%=beanprincipal.getNombre_menu()%>.swf'+document.location.search+'" /><param name="flashvars" value="callback=fm_MENUCALIDAD">'
        +'<param name="menu" value="false" /><param name="wmode" value="transparent" /></object>'; }
    else {
      s='<embed type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" '
        +'id="fm_menu_MENUCALIDAD" width="904px" height="34px" src="<%=beanprincipal.getNombre_menu()%>.swf'+document.location.search+' wmode="transparent" '
        +'flashvars="callback=fm_MENUCALIDAD" quality="high" scale="noscale" menu="false" salign="LT" />'; }
    var p=getPos(); var m=document.createElement('div'); m.id='fm_wrapper_MENUCALIDAD'; m.style.position='absolute';
    <%--m.style.zIndex='1';--%> m.allowTransparency='true'; m.style.top=p[0]+'px'; m.style.left=p[1]+'px'; m.innerHTML=s,m.bgColor='transparent';
    document.body.insertBefore(m, document.body.firstChild); setInterval(move, 500); }(); 
  return {
    expand: function() { 
      document.getElementById('fm_menu_MENUCALIDAD').style.height='124px'; },
    collapse: function() {
      document.getElementById('fm_menu_MENUCALIDAD').style.height='34px';
 }};}();//]]></script>
    
<!-- End Publishing Scripts of Flash Menu MENUCALIDAD -->
</body>
</html>