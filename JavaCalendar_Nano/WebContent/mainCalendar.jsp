<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="classesPkg.Event"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./CSS/mainCalendarStyles.css">
<script type="text/javascript" src="./jQuery/jquery-1.11.1.js"></script>
    <script type="text/javascript">
        $("document").ready(function() {
        	//$("body").append("<p>The page just loaded!</p>");
            $("#btntttttt").click(function() {
                    $(".event").animate({width: 400}, 300)
                    .animate({height: 300}, 400)
                    .animate({left: 200}, 500)
                    .animate({top: "+=100", borderWidth: 10}, "slow")}); 
        });
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	This is mainCalendar.jsp<br/>
	get user id from session: "${usrID}"	<!-- used EL tag not scriplet tags -->
	
	<form action="MainCalendarServlet" method="post">
		<input  id="btn" type="submit" value="Show my events"/>
	</form>
	
	<%
		@SuppressWarnings("unchecked")
		ArrayList<Event> evList=(ArrayList<Event>)request.getAttribute("eventList");		
		if(evList!=null){
			String a=(String)request.getAttribute("cMonTest");
			//String b=(String)request.getAttribute("cYrTest");
			for(Event ev:evList){
				%>
					<div class="event" onClick="location.href='addEvent.jsp?eID=<%=ev.getId() %>';" >						
						<label class="eventAttributeLbl">Start:</label><%=ev.getStartDate() %><br>
						<label class="eventAttributeLbl">End:</label><%=ev.getEndDate() %><br>
						<label class="eventAttributeLbl">Description:</label><%=ev.getDescription() %><br>				
						<label class="eventAttributeLbl">Owner ID:</label><%=ev.getOwner() %>
					</div>
					<%=a %>||
				<%
			}
						
		}
		
		 
	%>
</body>
</html>