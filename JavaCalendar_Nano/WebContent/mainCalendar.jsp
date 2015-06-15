<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="classesPkg.Event"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	This is mainCalendar.jsp<br/>
	get user id from session: "${usrID}"	<!-- used EL tag not scriplet tags -->
	<form action="MainCalendarServlet" method="post">
		<input type="submit" value="Show my events"/>
	</form>	
	<%
		@SuppressWarnings("unchecked")
		ArrayList<Event> evList=(ArrayList<Event>)request.getAttribute("eventList");
		if(evList!=null){
			%>
				<table border="1px">
					<tr>
						<th>Event ID</th>
						<th>Start at</th>
						<th>End at</th>
						<th>Description</th>
						<th>Owner ID</th>
					</tr>
					<%
						for(Event ev:evList){
							%>
							<tr>
								<td><%=ev.getId() %></td>
								<td><%=ev.getStartDate() %></td>
								<td><%=ev.getEndDate() %></td>
								<td><%=ev.getDescription() %></td>
								<td><%=ev.getOwner() %></td>
							</tr>
							<%
						}
					%>
				</table>
			<%
		}else{
			%>
				list is empty!
			<%
		}
	%>
</body>
</html>