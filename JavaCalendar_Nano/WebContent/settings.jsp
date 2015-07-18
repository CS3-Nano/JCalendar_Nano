<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<style >
div{
        	color: red;
        	border-color:maroon; 
  border-style:solid; 
  border-width:5px;  
        }
</style>
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("user")==null){
	request.getSession().setAttribute("currntpg", "settings.jsp");
	response.sendRedirect("login.jsp");	
	}else{

	User user=(User)session.getAttribute("user"); 


%>

    <div >
    <jsp:include page="customize.jsp" />
    </div>
    <div >
    <jsp:include page="frndrq.jsp" />
    </div>
     <div >
    <jsp:include page="frndinvt.jsp" />
    </div>
     
    <%} %>
</body>
</html>