<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="beans.User"%>
<%@page import="service.FreindService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<% 	if(session.getAttribute("user")==null){
	request.getSession().setAttribute("currntpg", "frndrq.jsp");
	response.sendRedirect("login.jsp");	
	}else{
	User usr=(User)session.getAttribute("user");
	%>
	
	
	<form action="FrndRqst" method="post">
	<%FreindService fs=new FreindService();
	if(fs.getNonFrnds(usr).isEmpty()){%>
		No current friends
	<% }else{%>
		here is the current users in the system:<br/>
	<%
	
	for (User user : fs.getNonFrnds(usr)) {%>
		<input type="checkbox" name="freindRq" value="<%=String.valueOf(user.getUserID())%>"> <%=user.getUserFName()%> <%=user.getUserLName() %><br>
		<%//out.write(user.getUserFName()+" "+user.getUserLName()+"<br/>");		
	}
	%>
	<input type="submit" value="Send Request">
	</form>
	
	
	
	
	<%} } //end of else%>
</body>
</html>