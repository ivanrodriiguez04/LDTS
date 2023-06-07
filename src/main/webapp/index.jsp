<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/general.css">

<script type="text/javascript">
//Crea una funcion que guarde los datos del inicio de sesion y te recuerda que debes rellenar los campos 
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
//Crea una funcion para comprobar que los numeros introducidos esten dentro de rango de los numeros ASCII
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
//Crea una funcion
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 13 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		} else if (keycode == 13) {
			compruebayenvia();
		} else return true;
	} else {
		return true;
	}
}
</script>
</head>
<body>

	<h1>Iniciar Sesión en la App</h1>
	<form action="./LoginAuthenticator" method="post" name="iniciosesion"
		id="iniciosesion">
		<table style="text-align: left; border: none;">
			<tr>
				<td>
					<input type="hidden" name="varoculta" value="secreto" />Usuario:
				</td>
				<td>
					<input type="text" name="usuario" onkeypress="return compruebaalfan(this,event);" 
					maxlength="10" value="" class="inputgris" />
				</td>
			</tr>
			<tr>
				<td>Contraseña:</td>
				<td>
					<input type="password" name="pass" onkeypress="return compruebaalfan(this,event);" 
					maxlength="8" value="" class="inputgris" /
				></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: right;">
					<input type="button" name="send" value="Enviar" onclick="compruebayenvia();" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>