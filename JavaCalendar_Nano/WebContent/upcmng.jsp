<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.Calendar"%>
<%@page import="beans.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.User"%>
<%@page import="service.EventService"%>
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
	request.getSession().setAttribute("currntpg", "home.jsp");
	response.sendRedirect("login.jsp");	
	}else{%>
<%
	EventService es=new EventService();
	User usr=new User(1, null, null, null, null);
	
	ArrayList<Event> upcm=es.getUpcmEvnts((User)session.getAttribute("user"));
	int i=0;
	%><b>Up Comming Events<br /></b><%
	for (Event event : upcm) {
		i++;
		System.out.println(event.getEvntID()+" "+i);%>
		<%=event.getStart().get(Calendar.YEAR)+" "+(event.getStart().get(Calendar.MONTH)+1)+" "
				+event.getStart().get(Calendar.DATE)+" "+event.getStart().get(Calendar.HOUR_OF_DAY)+":"
				+event.getStart().get(Calendar.MINUTE) %>:<%=event.getEvntDesc() %><br />
				
		<% 
		if(i==5) 
			break;
	}
	}	//end of else
%>
</body>
</html>