<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="beans.Event"%>
<%@page import="service.EventService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="beans.Map"%>
<%@page import="service.MapService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
	<style>
        #mymap{
            width: 400px;
            height: 400px;
        }
	</style>
</head>
<body>
<%	
		String id=request.getParameter("val");
		if(id==null){
			id="0";
		}
		int eventId=Integer.parseInt(id);
		MapService ms;
		try {
			ms = new MapService();
			Map map=ms.getMapbyEvntId(eventId);
			if(map!=null){
				EventService es=new EventService();
				Event evnt=es.getEventById(eventId);
				if(evnt==null){
					evnt=new Event(0, new GregorianCalendar(), new GregorianCalendar(), "Event Map", 0, false, 1, false);
				}
				System.out.println("in the map all done");
			%>
    
				<div id="mymap"></div>
			
	
	<script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvwBu9DvUEe9ECUTnso-Iaq4CYUXdLKzQ">
    </script>
            <script>
        'use stricrt';
            document.addEventListener('DOMContentLoaded',drawMap);
        var map;
        var marker;
        var storeLco={ lat:<%=map.getLat()%>, lng: <%=map.getLng()%>};
        function drawMap() {
            var mapOptions = {
              center: storeLco,	
              zoom: <%=map.getZoom()%>
            
            };
            map = new google.maps.Map(document.getElementById('mymap'),
                mapOptions);
            marker = new google.maps.Marker({
             
              position: { lat:<%=map.getLat()%>, lng: <%=map.getLng()%>},
              map: map,
                draggable:true,
              title: 'event map'
        });
        var popupcontent='<%=evnt.getEvntDesc()%>';
        var infowindow = new google.maps.InfoWindow({
          content: popupcontent,
          maxWidth: 300
      });
        google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      });

         }
        </script>
        <%}else{
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	%>
</body>
</html>