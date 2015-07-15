<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="beans.User"%>
<%@page import="beans.UsrCstmiz"%>
<%@page import="service.UsrCustmizService"%>
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
	request.getSession().setAttribute("currntpg", "custmize.jsp");
	response.sendRedirect("login.jsp");	
	}else{
	User usr=(User)session.getAttribute("user");
	UsrCustmizService ucs=new UsrCustmizService();
	UsrCstmiz cstm=ucs.getCustmByUser(usr);
	%>
	<h2>here is the customize colors of yours</h2>
	<div style="color:<%=cstm.getHighPClr()%>;">
	High pirority<br />
	</div>
	<div style="color:<%=cstm.getMediumPClr()%>;">
	Medium pirority<br />
	</div>
	<div style="color:<%=cstm.getLowPClr()%>;">
	Low pirority<br />
	</div>
	<div style="color:<%=cstm.getPrvtClr()%>;">
	Privecy pirority<br />
	</div>
	<div>
	Theme Name <%=cstm.getTheam() %> <br />
	</div>
	<div>
	<img src="img/<%=cstm.getAvatar() %>.jpg"/>
	</div>
	<%} //end of else %>
</body>
</html>