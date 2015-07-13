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
    var $allEvents;
    
    $(document).ready(function(){
        /*$("#monthSelectorBtn").click(function(){
            alert("1");
        });*/     
        loadAllEvents();    //load all events into json object
    
        setTodayforCurrentDate();
        
        setDaysOfMonth($currentYear,$currentMonth);
        
        hideAllViews();
        
        $("#monthSelectorBtn").click(function(){
            showMonthViewOnly();
            $currentDay=1;  //set month to 1/beginig on ech view selection click
            populateMonthTable();
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
    
    function loadAllEvents(){
        $.ajax({

        url : "GetAllEventServlet",
        dataType : 'json',
        error : function() {

            alert("Error Occured");
        },
        success : function(data) {
            $allEvents=data;
            /*              
            $.each($allEvents,function(index))
            var receivedData = [];
            
            $.each(data.jsonArray, function(index) {
                $.each(data.jsonArray[index], function(key, value) {
                    var point = [];

                        point.push(key);
                        point.push(value);
                        receivedData.push(point);

                    }); 
            });
            */
        }
        });
    }
    
    function setTodayforCurrentDate(){
        var $today=new Date();
        $currentYear=$today.getFullYear();
        $currentMonth=$today.getUTCMonth()+1; //getUTCMonth() returns 0-11 (Jan=0,feb=1,...)
        $currentDay=$today.getUTCDate();
    }
    
    function setDaysOfMonth(year,month){
        var dObj=new Date(year,month,0);
        $numOfDaysOfCurrentMonth=dObj.getDate();
    }
    
    function hideAllViews(){
        $("#monthViewDiv").hide();
        $("#weekViewDiv").hide();
        $("#dayViewDiv").hide();
    }
    
    function showMonthViewOnly(){
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth);
        $("#monthViewDiv").show();
        $("#weekViewDiv").hide();
        $("#dayViewDiv").hide();
    }
    
    function showWeekViewOnly(){
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth);
        $("#monthViewDiv").hide();
        $("#weekViewDiv").show();
        $("#dayViewDiv").hide();
    }
    
    function showDayViewOnly(){
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth);
        $("#monthViewDiv").hide();
        $("#weekViewDiv").hide();
        $("#dayViewDiv").show();
    }
    
    function gotoLastMonth(){
        if($currentMonth===1){
            $currentYear--;
            $currentMonth=12;
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
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth);
        /*
        $("#monthCalendarTable tr").each(function() {

            $('td', this).each(function () {
                var ar=$(this).attr('id');
                
                $.each($allEvents,function(index,evnt){
                    //console.log(evnt.endCal);
                    //console.log("=========")
                    
                    if(evnt.startCal.dayOfMonth===$currentDay&&evnt.startCal.month+1===$currentMonth&&evnt.startCal.Year===$currentYear){
                        $(this).append(evnt.evntDesc);
                    }
                }); 
                
                console.log($(this).attr('id'));
                console.log("===============================");
    
                var value = $(this).find(":input").val();
                var values = 100 - value + ', ' + value;
                var ids;
                
                if (value > 0) {
                    $(this).append(htmlPre + values + htmlPost);
                }
                
             })

        });
        */
        //================
        $('#monthCalendarTable tr').each(function () {
          $('td', this).each(function () {
            //var tdElem=this;
            //console.log($(tdElem).attr('id'));

            var tdElem=this;
              
            $(tdElem).empty();  //clear table cell
              
            //console.log(tdElem);
            //var ar = $(this).attr('id');
            $.each($allEvents, function (index, evnt) {
              //console.log(evnt.endCal);
              //console.log(this);
              //console.log(evnt);
              //console.log(tdElem);
              //console.log(evnt.startCal.dayOfMonth);
              //console.log(evnt.startCal.month + 1);
              //console.log($currentMonth);
              //console.log(evnt.startCal.year);
              //console.log($currentYear);             
                
              if (evnt.startCal.dayOfMonth == $(tdElem).attr('id') && evnt.startCal.month + 1 == $currentMonth && evnt.startCal.year == $currentYear) {
                //$(this).append(evnt.evntDesc);
                //console.log("==============");
                //$(tdElem).empty();
                //$(tdElem).append(evnt.evntDesc);
                var $evntDivTag=$("<div class=evntDivTag>"+evnt.evntDesc.toString()+"</div>");
                $(tdElem).html($evntDivTag);
 
                $($evntDivTag).hover(function(){
                    //var tdCoordinates=$(tdElem).position();
                    //popUpEventInfo(tdElem,evnt,/*tdCoordinates,*/$(tdElem).position().left,$(tdElem).position().top);
                    //console.log("mousein")
                    //$(".eventPopupDiv").show();
                    popUpEventInfo($evntDivTag,evnt,/*tdCoordinates,*/$(tdElem).position().left,$(tdElem).position().top);
                },function(){
                    //console.log("mouseout");
                    //popUpEventHide(tdElem);
                    $(".eventPopupDiv").hide();
                });
                
              }else{
                  //$(tdElem).append(evnt.evntDesc);
                  //$(tdElem).empty();
                  //$(tdElem).append("");
              }
      
            });

          })
        });
        
        //================
    }
    
    function popUpEventInfo(elem,event,/*coordinates*/xPos,yPos){
        var $popupDiv=$('<div class="eventPopupDiv">'+
                        '<label class="popDivHeader">Event Start at: </label>'+event.evntStart+'<br/>'+
                        '<label class="popDivHeader">Event End at: </label>'+event.evntEnd+'<br/>'+
                        '<label class="popDivHeader">Event Description: </label>'+event.evntDesc+'<br/>'+
                        '</div>');
        //alert("boom"+" "+event.evntDesc+";xPos="+xPos+";yPos="+yPos/*+coordinates.left*/);
        $($popupDiv).css({"top":yPos-10,"left":xPos+135});
        //$(elem).html($popupDiv);
        $(elem).append($popupDiv);
        //$(elem).show();
    }
    
    function popUpEventHide(elem){
        //$(".eventPopupDiv").remove();
        $(".eventPopupDiv").hide();
    }
    
    function gotoLastWeek(){
        /*
        if($currentMonth===1){
            $currentYear--;
            $currentMonth=12;
        }else{
            $currentMonth--;
        } 
        setDaysOfMonth($currentYear,$currentMonth);
        populateMonthTable();
        if(($currentDay-7)!<2){
            
        }
        */
    }
    
    function gotoNextWeek(){
        /*
            @Start
                set current day to 1
                declare another var weekEndDay=currentDay+7 *this is the boundary between these 2 vars can find
                all event for this week
                save currentDay=to weekEndDay
            @Second step
                set currentDay= to weekEndDay(means currentDay+7)
                set weekEndDay=currentDay+7 *this is the boundary between these 2 vars can find
                all event for this 2nd week
            @ goes on until currentDay=28 or weekEndDay=35
                when hits any above set month/year forward and day to 1
                perform same task
        */     
    }
    
</script>
</head>
<body>   
	<div id="viewSelecterDiv">
		<input id="monthSelectorBtn" value="Month" type="button">
		<input id="weekSelectorBtn" value="Week" type="button">
		<input id="daySelectorBtn" value="Day" type="button"> 
	</div>
    <div id="viewPanelDiv">
        <div id="monthViewDiv" class="viewDiv">
        <div class="navigationDiv">            
            <input id="btnLastMonth" value="Last" type="button">
            <h class="YearMonthDateHeaderText"></h>
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
                <td id="15"></td>
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
        <div class="navigationDiv">            
            <input id="btnLastMonth" value="Last" type="button" id="btnMonthLast">
            <h class="YearMonthDateHeaderText"></h>
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
        <div class="navigationDiv">            
            <input id="btnLastMonth" value="Last" type="button">
            <h class="YearMonthDateHeaderText"></h>
            <input id="btnNextMonth" value="Next" type="button">
        </div>
        <div id="dayCalendar">
        </div>
    </div> 
    </div>
</body>
</html>