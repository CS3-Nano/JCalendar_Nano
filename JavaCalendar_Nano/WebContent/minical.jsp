<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.ArrayList"%>
<%@page import="service.EventService"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<style >
	.event{
           background-color: aqua; 
        }
       table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            width
        }
</style>
<title>Insert title here</title>
</head>
<body>
<% 	if(session.getAttribute("user")==null){
	request.getSession().setAttribute("currntpg", "minical.jsp");
	response.sendRedirect("login.jsp");	
	}else{

	User user=(User)session.getAttribute("user"); 
	%>
	<table border="1" style="border: 1px solid black;">
		<tr>
  		  <th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th>
        </tr>
        <%
        GregorianCalendar cal=new GregorianCalendar();
        cal.set(Calendar.DATE, 1);
        int cnt=1;
		int dst=cal.get(Calendar.DAY_OF_WEEK);
		int mntend=31;
		EventService es=new EventService();
		ArrayList<Integer> evntdates=es.getEventofMonthDates(user, 2015, 7);
		for (int r = 1; r <= 6; r++)
        {
			out.write("<tr>");
            for(int c = 1; c <= 7; c++)
            {
            	if(r==1&& c>=dst){
            		if(evntdates.contains(cnt)){
            			System.out.print("\tevn"+cnt);
                		out.write("<td class='event'>"+cnt+"</td>");	
            		}else{
            		System.out.print("\t"+cnt);
            		out.write("<td>"+cnt+"</td>");
            		}
            		cnt++;
            	}else if(r==1){
            		System.out.print("\t  ,");
            		out.write("<td></td>");
            	}else if(cnt==mntend+1){
            		System.out.print("\t  ,");
            		out.write("<td></td>");
            		r=7;
            	}
            	else{
            		if(evntdates.contains(cnt)){
            			System.out.print("\tevn"+cnt);
                		out.write("<td class='event'>"+cnt+"</td>");	
            		}else{
            		System.out.print("\t"+cnt);
            		out.write("<td>"+cnt+"</td>");
            		}
            		cnt++;
            	}
            }
            System.out.println();
            out.write("</tr>");
        }
        %>
	</table>
	<%}	//end of else %>
</body>
</html>