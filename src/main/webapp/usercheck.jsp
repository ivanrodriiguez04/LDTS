<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	boolean sesionIniciada=false;
	String resultado="";
	
	try {  //AQUI VA EL CONTROL DE SESION
		String acceso = session.getAttribute("attributo1").toString();
	 	if (acceso.equals("1")){
	 		resultado = "<div style='color: darkred; font-weight: bold;'>Sesion iniciada</div>";
	 	};
	} catch (Exception e) {
 		resultado = "<div style='color: darkred; font-weight: bold;'>Ninguna sesion se ha iniciado</div>";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="common/general.css">
</head>
<body>
<h1>Session Checker</h1>
<%=resultado %>
<div id="contenedor1"></div>
</body>
</html>