<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.Calendar"%>
<%@page import="beans.Event"%>
<%@page import="dbmanager.EventMngr"%>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
hello there<br />
<% User user=(User)session.getAttribute("user"); 
	request.getSession().setAttribute("currntpg", "home.jsp");
	response.getWriter().print("<b>Welcome to java calender ");
	response.getWriter().print(user.getUserFName()+" "+user.getUserLName()+"<b/>");

%>
	<table>
        <tr>
            <th>Event ID</th>
            <th>Event start</th>
            <th>Event end</th>
            <th>Description</th>
            <th>Owner</th>
            <th>recurrent</th>
            <th>Privecy</th>
            <th>Priority</th>
        </tr>
     <%	EventMngr.readEvents();
     for (Event event : EventMngr.events) {%>
    	 <tr>
    	 	<td><%=event.getEvntID() %></td>
    	 	<td><%=event.getStart().get(Calendar.YEAR)+" "+(event.getStart().get(Calendar.MONTH)+1)+" "
					+event.getStart().get(Calendar.DATE)+" "+event.getStart().get(Calendar.HOUR_OF_DAY)+":"
					+event.getStart().get(Calendar.MINUTE) %></td>
    	 	<td><%=event.getEndCal().get(Calendar.YEAR)+" "+(event.getEndCal().get(Calendar.MONTH)+1)+" "
					+event.getEndCal().get(Calendar.DATE)+" "+event.getEndCal().get(Calendar.HOUR_OF_DAY)+":"
					+event.getEndCal().get(Calendar.MINUTE) %></td>
    	 	<td><%=event.getEvntDesc() %></td>
    	 	<td><%=event.getEvntOwner() %></td>
    	 	<td><%=event.isEventRec() %></td>
    	 	<td><%=event.isPrvcyStat() %></td>
    	 	<td><%=event.getPriority()%></td>
    	  </tr>
    <% }%> 
     
   
    </table>
</body>
</html>