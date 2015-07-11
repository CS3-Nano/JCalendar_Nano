<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login Page</title>
</head>
<body>
<% String err=(String)session.getAttribute("loginerr"); 
	
%>
<form action="login" method="post">
	<br />UserName<input type="text" name="username"/>
	<br />password<input type="password" name="passwrd"/>
	<br /><input type="submit" value="login"/>
</form>

<%	if(err!=null){%>
	<P><b color="red"><%=err%></b><p>
	<%
	session.setAttribute("loginerr", null);
} %>
	<a href="register.jsp"><button>Register</button></a>

</p>
</body>
</html>