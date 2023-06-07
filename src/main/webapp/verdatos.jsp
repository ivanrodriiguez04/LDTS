<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<%
/*
	Se crea um try catch donde se crea una variable que guarge la informacion del objeto session 
	con los metodos getAttribute y ToString 
	En el if si el valor de no es igual a 1 te manda a cerrar session para invalidarla,
	y en el catch se confirma que se te mande a cerrar session para invalidarla
*/
try {  //AQUI VA EL CONTROL DE SESION
	String acceso = session.getAttribute("attributo1").toString();
 	if (!acceso.equals("1")) response.sendRedirect("cerrarsesion.jsp");
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
//inicia las variables y la bd para poder trabajar
beanDB db = new beanDB();
boolean okdb = false;
String resultado = "";
//si se conecta a la bd te devuelve el valor true y si hay algun error dentro del codigo devuelva false y no se conecte
try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}

if (okdb) {
	String query="select concat('La Base de Datos dice que ahora es... ', now() )";
	String [][] tablares = null;
	try {
		tablares = db.resConsultaSelectA3(query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if (tablares != null) {
		
		resultado = "<table style=''>";
		for (int i=0; i<tablares.length;i++) { //g es una variable tipo grupo que va recorriendo la lista
			resultado += "<tr>";
			resultado += "<td>" + tablares[i][0] + "</td>";
			resultado += "<td>" + tablares[i][1] + "</td>";
			resultado += "<td>" + tablares[i][2] + "</td>";
			resultado += "</tr>";
		}
		resultado += "</table>";
		
	}
	db.desconectarBD();
}
else {
	resultado = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
}


%>
<html>
<head>

<link rel="stylesheet" href="common/general.css">

</head>
<body>
<h1><%=session.getAttribute("attributo2") %>: Estos son los datos datos</h1>
<hr/>
<p><a href="bienvenido.jsp">Página principal</a></p>
<p><a href="cerrarsesion.jsp">Salir</a></p>
<hr/>
<%=resultado %>
<div id="contenedor1">
</div>

</body></html>