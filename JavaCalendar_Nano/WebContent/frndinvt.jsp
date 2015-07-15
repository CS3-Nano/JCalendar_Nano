<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="service.UsersService"%>
<%@page import="beans.PendingReq"%>
<%@page import="service.FreindService"%>
<%@page import="beans.User"%>
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
	request.getSession().setAttribute("currntpg", "frndinvt.jsp");
	response.sendRedirect("login.jsp");	
	}else{
	User usr=(User)session.getAttribute("user");
	%>
	
	<form action="frndinvt" method="post">
	<%	FreindService fs=new FreindService();
		if(fs.getMyFrndrqst(usr).isEmpty()){%> No friend requests
		<%	
		}else{%>
			you have some freinds requests
		<%	
		UsersService us=new UsersService();
		for (PendingReq pndgReq : fs.getMyFrndrqst(usr)) {
			User usrRq=us.getUserById(pndgReq.getUserID());%>
			<input type="checkbox" name="freindInv" value="<%=String.valueOf(pndgReq.getPendngID())%>"> <%=usrRq.getUserFName()%> <%=usrRq.getUserLName() %><br>
			<%System.out.println(usr.getUserFName()+" "+usr.getUserLName()+" "+usr.getUserID());
		}
	%>
	<input type="submit" value="Accept Invitations">
	</form>
	
	
	<%} }//end of else%>
</body>
</html>