<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="./CSS/loginCSS.css">
<title>Login</title>
</head>
<body>
	<div id="loginForm">
		<form action="LoginServlet" method="post">
			<table>
			<tr>
				<td>Username:</td><td><input type="text" name="usrname"/></td>
			</tr>
			<tr>
				<td>Password:</td><td><input type="password" name="pswrd"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Log In"/></td>
			</tr>
			</table>
		</form>	
	</div>
</body>
</html>