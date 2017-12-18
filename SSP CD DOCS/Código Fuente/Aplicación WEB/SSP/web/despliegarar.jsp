<%--
    Document   : despliegapdf
    Created on : 05-28-2010, 08:46:22 AM
    Author     : Guz
--%>

<%@ page language="java" pageEncoding="ISO-8859-1" import ="java.io.*" contentType="application/pdf;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<%
//InputStream in = new FileInputStream("C:/BPI-00438-01.pdf");
InputStream in = new FileInputStream("C:/Escalonamientos/"+request.getParameter("var")+".zip");
byte[] data = new byte[in.available()];
in.read(data);
//response.setContentType("application/pdf;");
response.setContentType("application/octet-stream;");
response.setHeader("Content-Disposition","attachment;filename="+request.getParameter("var")+".zip\";");
//response.setHeader("Content-Disposition","attachment;filename=\""+request.getParameter("var")+".pdf\";");
response.setContentLength(data.length);
javax.servlet.ServletOutputStream servletoutputstream = response.getOutputStream();
servletoutputstream.write(data);
servletoutputstream.flush();
servletoutputstream.close();

%>
 
<%--
InputStream in = new FileInputStream("C:/SUE-00001-01.TIF");
//InputStream in = new FileInputStream("C:/"+request.getParameter("var")+".TIF");
byte[] data = new byte[in.available()];
in.read(data);

response.setContentType("application/octet-stream"); // Aqui le dices que lo que viene es un OctectStream para que no abra ninguna aplicación
response.setHeader("Content-Disposition","attachment;filename=\""+request.getParameter("var")+".TIF\";");
response.setContentLength(data.length);
javax.servlet.ServletOutputStream servletoutputstream = response.getOutputStream();

servletoutputstream.write(data);
servletoutputstream.flush();
servletoutputstream.close();

--%>

</body>
</html>
