<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.Calendar"%>
<%@page import="beans.Event"%>
<%@page import="dbmanager.EventMngr"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>	
	
	<% if(request.getParameter("val")==null){
		response.sendRedirect("home.jsp");
	}else{
		int id=Integer.parseInt(request.getParameter("val"));
		Event evnt=EventMngr.getEvntByid(id);	
		request.getSession().setAttribute("oldEvnt", evnt);
		
	%>
	
	
	
	<form action="evnupdt" method="post" name="regform">
	<br />Start Year:<input type="number" name="stYear" required value="<%=evnt.getStart().get(Calendar.YEAR) %>"/>
    <br />Start Month:<input type="number" name="stMonth" required value="<%=evnt.getStart().get(Calendar.MONTH)+1 %>"/>
    <br />Start Day:<input type="number" name="stDay" required value="<%=evnt.getStart().get(Calendar.DATE) %>"/>
    <br />Start timeHr:<input type="number" name="stHr" required value="<%=evnt.getStart().get(Calendar.HOUR_OF_DAY) %>"/>
    <br />Start timeMin:<input type="number" name="stMin" required value="<%=evnt.getStart().get(Calendar.MINUTE) %>"/>
    <hr/>
    <br />End Year:<input type="number" name="endYear" required value="<%=evnt.getEndCal().get(Calendar.YEAR) %>"/>
    <br />End Month:<input type="number" name="endMonth" required value="<%=evnt.getEndCal().get(Calendar.MONTH)+1 %>"/>
    <br />End Day:<input type="number" name="endDay" required value="<%=evnt.getEndCal().get(Calendar.DATE) %>"/>
    <br />End timeHr:<input type="number" name="endHr" required value="<%=evnt.getEndCal().get(Calendar.HOUR_OF_DAY) %>"/>
    <br />End timeMin:<input type="number" name="endMin" required value="<%=evnt.getEndCal().get(Calendar.MINUTE) %>"/>
    <hr/>
    
	<br />Description :<input type="text" name="evntDesc" value="<%=evnt.getEvntDesc() %>"/>
	<br />Recurrent :<input type="number" name="eventRec" value="<%=(evnt.isEventRec())?1:0 %>"/>
	<br />Priority :<input type="number" name="priority" value="<%=evnt.getPriority() %>"/>
	<br />Privecy Status :<input type="number" name="prvcyStat" value="<%=(evnt.isPrvcyStat())?1:0 %>"/>
	
	<br /><input type="submit" name="optType" value="update"/>
	<input type="submit" name="optType" value="delete"/>
</form>

	<%} //end of else %>
</body>
</html>