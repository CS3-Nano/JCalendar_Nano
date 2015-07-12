<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./CSS/eventViewStyleSheet.css">
<script type="text/javascript" src="jQuery/jquery-1.11.1.js"></script>
<script type="text/javascript">
    'use strict';
    
    var $currentYear,$currentMonth,$currentDay,$numOfDaysOfCurrentMonth;
    
    $(document).ready(function(){
        /*$("#monthSelectorBtn").click(function(){
            alert("1");
        });*/     
        
        var $today=new Date();
        $currentYear=$today.getFullYear();
        $currentMonth=$today.getUTCMonth()+1; //getUTCMonth() returns 0-11 (Jan=0,feb=1,...)
        $currentDay=$today.getUTCDate();
        
        setDaysOfMonth($currentYear,$currentMonth);
        
        hideAllViews();
        
        $("#monthSelectorBtn").click(function(){
            showMonthViewOnly();
        });

        $("#weekSelectorBtn").click(function(){
            showWeekViewOnly();
        });

        $("#daySelectorBtn").click(function(){
            showDayViewOnly();
        });
        
        $("#btnLastMonth").click(function(){
            gotoLastMonth();
        });
        
        $("#btnNextMonth").click(function(){
            gotoNextMonth();
        });
        
    });  
    
    function hideAllViews(){
        $("#monthViewDiv").hide();
        $("#weekViewDiv").hide();
        $("#dayViewDiv").hide();
    }
    
    function showMonthViewOnly(){
        $("#monthViewDiv").show();
        $("#weekViewDiv").hide();
        $("#dayViewDiv").hide();
    }
    
    function showWeekViewOnly(){
        $("#monthViewDiv").hide();
        $("#weekViewDiv").show();
        $("#dayViewDiv").hide();
    }
    
    function showDayViewOnly(){
        $("#monthViewDiv").hide();
        $("#weekViewDiv").hide();
        $("#dayViewDiv").show();
    }
    
    function gotoLastMonth(){
        if($currentMonth===1){
            $currentYear--;
            $currentMonth=11;
        }else{
            $currentMonth--;
        } 
        setDaysOfMonth($currentYear,$currentMonth);
        populateMonthTable();
    }
    
    function gotoNextMonth(){
        if($currentMonth===12){
            $currentYear++;
            $currentMonth=1;
        }else{
            $currentMonth++;
        }
        setDaysOfMonth($currentYear,$currentMonth);
        populateMonthTable();
    }
    
    function populateMonthTable(){
        $("#YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth);
        
        $.ajax({

            url : "GetAllEventServlet",
            dataType : 'json',
            error : function() {

                alert("Error Occured");
            },
            success : function(data) {
                /*var receivedData = [];

                $.each(data.jsonArray, function(index) {
                    $.each(data.jsonArray[index], function(key, value) {
                        var point = [];

                            point.push(key);
                            point.push(value);
                            receivedData.push(point);

                        }); 
                });*/

            }
        });
    }
    
    function setDaysOfMonth(year,month){
        var dObj=new Date(year,month,0);
        $numOfDaysOfCurrentMonth=dObj.getDate();
    }
    
</script>
</head>
<body>   
	<div id="viewSelecterDiv">
		<input id="monthSelectorBtn" value="Month" type="button">
		<input id="weekSelectorBtn" value="Week" type="button">
		<input id="daySelectorBtn" value="Day" type="button"> 
	</div>
    <div id="monthViewDiv" class="viewDiv">
        <div id="monthNavigationDiv">
            <h class="YearMonthDateHeaderText"></h>
            <input id="btnLastMonth" value="Last" type="button">
            <input id="btnNextMonth" value="Next" type="button">
        </div>
        <table id="monthCalendarTable">
            <tr>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
                <th>Sunday</th>
            </tr>            
            <tr>
                <td id="1"></td>
                <td id="2"></td>
                <td id="3"></td>
                <td id="4"></td>
                <td id="5"></td>
                <td id="6"></td>
                <td id="7"></td>
            </tr>
            <tr>
                <td id="8"></td>
                <td id="9"></td>
                <td id="10"></td>
                <td id="11"></td>
                <td id="12"></td>
                <td id="13"></td>
                <td id="14"></td>
            </tr>
            <tr>
                <td id="15"><div></div></td>
                <td id="16"></td>
                <td id="17"></td>
                <td id="18"></td>
                <td id="19"></td>
                <td id="20"></td>
                <td id="21"></td>
            </tr>
            <tr>
                <td id="22"></td>
                <td id="23"></td>
                <td id="24"></td>
                <td id="25"></td>
                <td id="26"></td>
                <td id="27"></td>
                <td id="28"></td>
            </tr>
            <tr>
                <td id="29"></td>
                <td id="30"></td>
                <td id="31"></td>
            </tr>          
        </table>
    </div>
    <div id="weekViewDiv" class="viewDiv">
        <div id="weekNavigationDiv">
            <h class="YearMonthDateHeaderText"></h>
            <input id="btnLastMonth" value="Last" type="button" id="btnMonthLast">
            <input id="btnNextMonth" value="Next" type="button" id="btnMonthNext">
        </div>
        <table id="weekCalendarTable">
            <tr>
                <th></th>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
                <th>Sunday</th>
            </tr>
        </table>
    </div>
    <div id="dayViewDiv" class="viewDiv">
        <div id="dayNavigationDiv">
            <h class="YearMonthDateHeaderText"></h>
            <input id="btnLastMonth" value="Last" type="button">
            <input id="btnNextMonth" value="Next" type="button">
        </div>
        <div id="dayCalendar">
        </div>
    </div>    
</body>
</html>