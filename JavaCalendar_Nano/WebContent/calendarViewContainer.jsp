<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="jQuery/jquery-1.11.1.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('#calenderViewContainerDiv').load('calendarView.jsp');	//load calendarView.jsp into div calenderViewContainerDiv
});
</script>
<body>
	<div id="calenderViewContainerDiv">
	
	</div>
</body>
</html>