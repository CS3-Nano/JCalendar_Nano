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
<%if(session.getAttribute("user")==null){
	request.getSession().setAttribute("currntpg", "event.jsp");
	response.sendRedirect("login.jsp");	
	}
	%>

<form action="Event" method="post" name="regform">
	<br />Start Year:<input type="number" name="stYear" required />
    <br />Start Month:<input type="number" name="stMonth" required/>
    <br />Start Day:<input type="number" name="stDay" required/>
    <br />Start timeHr:<input type="number" name="stHr" required />
    <br />Start timeMin:<input type="number" name="stMin" required/>
    <hr/>
    <br />End Year:<input type="number" name="endYear" required/>
    <br />End Month:<input type="number" name="endMonth" required/>
    <br />End Day:<input type="number" name="endDay" required/>
    <br />End timeHr:<input type="number" name="endHr" required/>
    <br />End timeMin:<input type="number" name="endMin" required/>
    <hr/>
    
	<br />Description :<input type="text" name="evntDesc"/>
	<br />Recurrent :<input type="number" name="eventRec"/>
	<br />Priority :<input type="number" name="priority"/>
	<br />Privecy Status :<input type="number" name="prvcyStat"/>
	
	<br /><input type="submit" id="submitbtn"/>
</form>
</body>
</html>