<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>

</head>
<body>
<form action="Register" method="post" name="regform">
	<br />First Name:<input type="text" name="userFName" id="userFName"/>
	<br />Lname:<input type="text" name="userLName"/>
	<br />Email:<input type="text" name="userEmail"/>
	<br />Contact:<input type="text" name="userContact"/>
	<br />User name:<input type="text" name="username"/>
	<br />pasword :<input type="text" name="passwrd"/>
	<br />retyp pasword :<input type="text" name="pswrdretyp"/>
	<span id="errhint"></span>
	<br /><input type="submit" id="submitbtn"/>
</form>

</body>
</html>