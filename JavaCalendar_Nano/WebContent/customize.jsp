<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" type="text/css" href="css/custm.css">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("user")==null){
	request.getSession().setAttribute("currntpg", "customize.jsp");
	response.sendRedirect("login.jsp");	
	}else{

	User user=(User)session.getAttribute("user");
	 %>
	Avatar         
    <form action="cstm" method="post" >
    <table>
        <tr>
            <th><img src="img/avtr/1.png" width="100px" height="100px"/></th>
            <th><img src="img/avtr/2.png" width="100px" height="100px"/></th>
            <th><img src="img/avtr/3.png" width="100px" height="100px"/></th>
            <th><img src="img/avtr/4.png" width="100px" height="100px"/></th>
            <th><img src="img/avtr/5.png" width="100px" height="100px"/></th>
            <th><img src="img/avtr/6.png" width="100px" height="100px"/></th>
            <th><img src="img/avtr/7.png" width="100px" height="100px"/></th>
        </tr>
        <tr>
            
            <td><input type="radio" name="avatar" value="img/avtr/1.png" checked  align="center"></td>
            <td><input type="radio" name="avatar" value="img/avtr/2.png" ></td>
            <td><input type="radio" name="avatar" value="img/avtr/3.png" ></td>
            <td><input type="radio" name="avatar" value="img/avtr/4.png" ></td>
            <td><input type="radio" name="avatar" value="img/avtr/5.png" ></td>
            <td><input type="radio" name="avatar" value="img/avtr/6.png" ></td>
            <td><input type="radio" name="avatar" value="img/avtr/7.png" ></td>
            
        </tr> 
    </table>
        <br /><span class='spanlevel'>High Priority Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </span>
        <select id="hghprclr"  name="HighPClr">
            <option class="option-h1"  value="1" checked></option>
            <option class="option-h2"  value="2"></option>
            <option class="option-h3"  value="3"></option>
            <option class="option-h4"  value="4"></option>
            <option class="option-h5"  value="5"></option>            
        </select>
        <br /><span class='spanlevel'>Medium Priority Color</span>
        <select id="mdmprty" name="MediumPClr">
            <option class="option-m1"  value="1" checked></option>
            <option class="option-m2"  value="2"></option>
            <option class="option-m3"  value="3"></option>
            <option class="option-m4"  value="4"></option>
            <option class="option-m5"  value="5"></option>            
        </select>
        <br /><span class='spanlevel'>Low Priority Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <select  id="lwprtyclr" name="LowPClr">
            <option class="option-l1"  value="1" checked></option>
            <option class="option-l2"  value="2"></option>
            <option class="option-l3"  value="3"></option>
            <option class="option-l4"  value="4"></option>
            <option class="option-l5"  value="5"></option>            
        </select>
        <br /><span class='spanlevel'>Private Event Color&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <select  id="prvtenvclr" name="prvtClr">
            <option class="option-h2"  value="1" checked></option>
            <option class="option-m1"  value="2"></option>
            <option class="option-m3"  value="3"></option>
            <option class="option-m4"  value="4"></option>
            <option class="option-l2"  value="5" ></option>            
        </select>
        <br />Themes
            <table>
        <tr>
            <th><img src="img/thm/1.png" width="100px" height="100px"/></th>
            <th><img src="img/thm/2.png" width="100px" height="100px"/></th>
            <th><img src="img/thm/3.png" width="100px" height="100px"/></th>
            
        </tr>
        <tr>
            
            <td><input type="radio" name="thm" value="1" checked  align="center"></td>
            <td><input type="radio" name="thm" value="2" ></td>
            <td><input type="radio" name="thm" value="3" ></td>  
            
        </tr> 
    </table>
        <input type="submit" value="save changes" />
    </form>
    
    <script>
        document.getElementById('hghprclr').onchange=function(){
            var e = document.getElementById("hghprclr");
            var strUser = e.options[e.selectedIndex];
           document.getElementById('hghprclr').className=strUser.className;
        }
        document.getElementById('lwprtyclr').onchange=function(){
            var e = document.getElementById("lwprtyclr");
            var strUser = e.options[e.selectedIndex];
           document.getElementById('lwprtyclr').className=strUser.className;
        }
        document.getElementById('mdmprty').onchange=function(){
            var e = document.getElementById("mdmprty");
            var strUser = e.options[e.selectedIndex];
           document.getElementById('mdmprty').className=strUser.className;
        }
        document.getElementById('prvtenvclr').onchange=function(){
            var e = document.getElementById("prvtenvclr");
            var strUser = e.options[e.selectedIndex];
           document.getElementById('prvtenvclr').className=strUser.className;
        }
    </script>
    <%} //end of else %>
</body>
</html>