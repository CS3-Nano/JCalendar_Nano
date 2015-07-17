<?xml version="1.0" encoding="ISO-8859-1" ?>
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
	<div id="mymap"></div>
	<script type="text/javascript"
      	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvwBu9DvUEe9ECUTnso-Iaq4CYUXdLKzQ" onerror='alert("Connection dead");'>
    </script>
    <script>
        'use stricrt';
            document.addEventListener('DOMContentLoaded',drawMap);
        var map;
        var marker;
        var storeLco={ lat: 6.9270786, lng: 79.861243};
        function drawMap() {
            var mapOptions = {
              center: storeLco,	
              zoom: 14
            
            };
            map = new google.maps.Map(document.getElementById('mymap'),
                mapOptions);
            marker = new google.maps.Marker({
              position: { lat: 6.9270786, lng: 79.861243},
              map: map,
                draggable:true,
              title: 'event map'
        });
        var popupcontent='Event location';
        var infowindow = new google.maps.InfoWindow({
          content: popupcontent,
          maxWidth: 300
      });
        google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
      });
        document.getElementById("mymap").addEventListener("click", setVal);
        document.getElementById("mymap").addEventListener("mouseout", setVal);
        
        function setVal(){
        document.getElementById('lat').value = marker.getPosition().lat();       
        document.getElementById('lng').value = marker. getPosition().lng();
        document.getElementById('zoom').value =map.getZoom();
        }
        document.getElementById('lat').value = marker.getPosition().lat();       
        document.getElementById('lng').value = marker. getPosition().lng();
        document.getElementById('zoom').value =map.getZoom();
         }
    </script>
    	<%
	
	String id=request.getParameter("val");
	if(id==null){
		id="0";
	}
	int eventId=Integer.parseInt(id);
	%>
    <form action="map" method="post">
    <input type="hidden" name="eventId" value="<%=eventId %>" id="eventId" />
	<input type="hidden" name="lat" id="lat"  />
	<input type="hidden" name="lng" id="lng"  />
	<input type="hidden" name="zoom" id="zoom"/>
	<input type="submit" value="Set Location" onclick="popupUploadForm()"/>
	

	
	<script type="text/javascript">
		function closeSelf(){
  	  self.close();
  	  return true;
	}
</script>
</form>    
</body>
</html>