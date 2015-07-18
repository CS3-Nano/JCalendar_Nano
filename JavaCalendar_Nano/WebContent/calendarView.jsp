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
    
        var $toDay=new Date();
        setCurrentDate($toDay);
        
        setDaysOfMonth($currentYear,$currentMonth);
        
        hideAllViews();
        
        $("#monthSelectorBtn").click(function(){
            showMonthViewOnly();
            $currentDay=0;  //set month to 0/beginig on ech view selection click
            populateMonthTable();
        });

        $("#weekSelectorBtn").click(function(){
            showWeekViewOnly();
            $currentDay=0;
            populateWeekTable();
        });

        $("#daySelectorBtn").click(function(){
            showDayViewOnly();
            $currentDay=0;
            populateDayTable();
        });
        
        $("#btnLastMonth").click(function(){
            gotoLastMonth();
            populateMonthTable();
        });
        
        $("#btnNextMonth").click(function(){
            gotoNextMonth();
            populateMonthTable();
        });
        
        $("#btnLastWeek").click(function(){
            gotoLastWeek();
            populateWeekTable();
        });
        
        $("#btnNextWeek").click(function(){
            gotoNextWeek();
            populateWeekTable();
        });
        
        $("#btnLastDay").click(function(){
            gotoLastDay();
            populateDayTable();
        });
        
        $("#btnNextDay").click(function(){
            gotoNextDay();
            populateDayTable();
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
    
    function setCurrentDate($today){
        //var $today=new Date();
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
        $currentDay=0;
        //populateMonthTable();
    }
    
    function gotoNextMonth(){
        if($currentMonth===12){
            $currentYear++;
            $currentMonth=1;
        }else{
            $currentMonth++;
        }
        setDaysOfMonth($currentYear,$currentMonth);
        $currentDay=0;
        //populateMonthTable();
    }
    
    function populateMonthTable(){
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth);
        
        var monthFirstDayAt= (new Date($currentYear,$currentMonth-1,1)).getDay();//get this month's 1 at which day(0-sunday,1-monday,..,6-sat)
        var headerArray=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]; 
        
        var curr=monthFirstDayAt;
        $('#monthCalendarTable tr').each(function () {
          $('th', this).each(function () {
              if(curr===6){
                  $(this).html(headerArray[curr]);
                  curr=0;
              }else{
                  $(this).html(headerArray[curr]);
                  curr=curr+1;
              }
          });
        });
        
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
              
            var dayNum=$(tdElem).attr('id');
              
            if(dayNum<=$numOfDaysOfCurrentMonth){
                var monthCalDayLabel=$('<label class="monthTableDayLbl">'+dayNum+'</label>');
                $(tdElem).html(monthCalDayLabel);
                $(tdElem).show();
            }else{
                $(tdElem).hide();
            }
            
            //console.log(tdElem);
            //var ar = $(this).attr('id');
            $.each($allEvents, function (index, evnt) {
                /*
              //console.log(evnt.endCal);
              //console.log(this);
              //console.log(evnt);
              //console.log(tdElem);
              //console.log(evnt.startCal.dayOfMonth);
              //console.log(evnt.startCal.month + 1);
              //console.log($currentMonth);
              //console.log(evnt.startCal.year);
              //console.log($currentYear);             
                */ 
                
              if (evnt.startCal.dayOfMonth == $(tdElem).attr('id') && evnt.startCal.month + 1 == $currentMonth && evnt.startCal.year == $currentYear) {
                  /*
                //$(this).append(evnt.evntDesc);
                //console.log("==============");
                //$(tdElem).empty();
                //$(tdElem).append(evnt.evntDesc);
                */
                var $evntDivTag=$("<div class=evntDivTag>"+evnt.evntDesc.toString()+"</div>");
                /*var $evntDivTag=$("<div class=evntDivTag>"+evnt.evntDesc.toString()+"<label class='monthTableDayLbl'>"+dayNum+"</label>"+"</div>");*/ 
                //var $dayLabel=$("<label class='monthTableDayLbl'>"+dayNum+"</label>");
                  
                $(tdElem).append($evntDivTag);  //.html
                //$(tdElem).append($dayLabel);
                  
                $($evntDivTag).hover(function(){
                    /*
                    //var tdCoordinates=$(tdElem).position();
                    //popUpEventInfo(tdElem,evnt,tdCoordinates,$(tdElem).position().left,$(tdElem).position().top);
                    //console.log("mousein");
                    //$(".eventPopupDiv").show();
                    */
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
        if($currentDay-7<0){
            gotoLastMonth();
            if($numOfDaysOfCurrentMonth>28){
                $currentDay=28;
            }else{
                $currentDay=21;
            }
        }else{
            $currentDay=$currentDay-7;
        }
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
        
        if($currentDay<28&&$currentDay+7<$numOfDaysOfCurrentMonth){
            $currentDay=$currentDay+7;
        }
        else{
            gotoNextMonth();
        }
    }
    
    function populateWeekTable(){
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth+"-"+($currentDay+1));
        //add table header
        var myHeader='<tr>'+
                        '<th></th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,1)+'</th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,2)+'</th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,3)+'</th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,4)+'</th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,5)+'</th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,6)+'</th>'+
                        '<th>'+weekTableHeaderCreater($currentDay,7)+'</th>'+
                    '</tr>';
         $("#weekCalendarTable").html(myHeader);
        
        //add rows for 7 days
        for(var i=0;i<25;i++){
            var myRow = '<tr>'+
                            '<td id="hourseCell">'+i+':00h</td>'+
                            '<td id="'+($currentDay+1)+'-'+i+'"></td>'+
                            '<td id="'+($currentDay+2)+'-'+i+'"></td>'+
                            '<td id="'+($currentDay+3)+'-'+i+'"></td>'+
                            '<td id="'+($currentDay+4)+'-'+i+'"></td>'+
                            '<td id="'+($currentDay+5)+'-'+i+'"></td>'+
                            '<td id="'+($currentDay+6)+'-'+i+'"></td>'+
                            '<td id="'+($currentDay+7)+'-'+i+'"></td>'+
                        '</tr>';
            $("#weekCalendarTable tr:last").after(myRow); 
        }
        //============================================================================================             
        
        $('#weekCalendarTable tr').each(function () {
          $($('td').not("#hourseCell"), this).each(function () {
            var tdElem=this;

            $(tdElem).empty();  //clear table cell 
            //=============
              //var cellKey=$(tdElem).attr('id');
              //var cellKeyDayPart=$(tdElem).attr('id').substr($(tdElem).attr('id').indexOf("-")+1);
              //var cellKeySplitArray=$(tdElem).attr('id').split("-");
              //console.log("cellKeyPart="+cellKeyDayPart+";numOfDays="+$numOfDaysOfCurrentMonth);
              //console.log("split[0]="+cellKeySplitArray[0]+";split[1]"+cellKeySplitArray[1]);
              //console.log($(tdElem).attr('id'));
            /*if(cellKeyDayPart<=$numOfDaysOfCurrentMonth){
                //var monthCalDayLabel=$('<label class="monthTableDayLbl">'+dayNum+'</label>');
                //$(tdElem).html(monthCalDayLabel);
                //console.log("cellKeyPart="+cellKeyDayPart+";$numOfDays="+$numOfDaysOfCurrentMonth);
                $(tdElem).show();
            }else{
                $(tdElem).hide();
            }*/
              //console.log("cell");
            //=============  
              
            $.each($allEvents, function (index, evnt) {  

              if ((evnt.startCal.dayOfMonth.toString()+"-"+evnt.startCal.hourOfDay.toString()) == $(tdElem).attr('id') && evnt.startCal.month + 1 == $currentMonth && evnt.startCal.year == $currentYear) {

                var $evntDivTag=$("<div class=evntDivTag>"+evnt.evntDesc.toString()+"</div>");
                $(tdElem).append($evntDivTag);

                $($evntDivTag).hover(function(){

                    popUpEventInfo($evntDivTag,evnt,$(tdElem).position().left,$(tdElem).position().top);
                },function(){                   
                    $(".eventPopupDiv").hide();
                });

              }else{                 
              }

            });

          })
        });
        
        //==============================================================================================
    }
    
    function weekTableHeaderCreater($cDay,$add){
        var headerText="";
        if(($cDay+$add)<=$numOfDaysOfCurrentMonth){
            headerText=$currentMonth.toString()+"-"+($cDay+$add).toString();
        }
        return headerText;
    }
    
    function gotoLastDay(){
        if($currentDay==0){
            gotoLastMonth();
            $currentDay=$numOfDaysOfCurrentMonth-1;
        }else{
            $currentDay=$currentDay-1;
        }
    }
    
    function gotoNextDay(){
        if(($currentDay+1)==$numOfDaysOfCurrentMonth){
            gotoNextMonth();
        }else{
            $currentDay=$currentDay+1;
        }
    }
    
    function populateDayTable(){
        //============================================================================================
        $(".YearMonthDateHeaderText").text($currentYear+"-"+$currentMonth+"-"+($currentDay+1));
        //add table header
        var myHeader='<tr>'+
                        '<th>Hour</th>'+
                        '<th> Day:'+weekTableHeaderCreater($currentDay,1)+'</th>'+
                    '</tr>';
         $("#dayCalendarTable").html(myHeader);
        
        //add rows for 7 days
        for(var i=0;i<25;i++){
            var myRow = '<tr>'+
                            '<td id="dayTblhourseCell">'+i+':00h</td>'+
                            '<td id="'+i+'"></td>'+
                        '</tr>';
            $("#dayCalendarTable tr:last").after(myRow); 
        }
        //============================================================================================
        
        //============================================================================================
         $('#dayCalendarTable tr').each(function () {
          $($('td').not("#dayTblhourseCell"), this).each(function () {
            var tdElem=this;
              
            $(tdElem).empty();  //clear table cell
            /*  
            var dayNum=$(tdElem).attr('id');
              
            if(dayNum<=$numOfDaysOfCurrentMonth){
                var monthCalDayLabel=$('<label class="monthTableDayLbl">'+dayNum+'</label>');
                $(tdElem).html(monthCalDayLabel);
                $(tdElem).show();
            }else{
                $(tdElem).hide();
            }
            */
            $.each($allEvents, function (index, evnt) {              
                
              if (evnt.startCal.hourOfDay == $(tdElem).attr('id') && evnt.startCal.dayOfMonth==$currentDay+1 && evnt.startCal.month + 1 == $currentMonth && evnt.startCal.year == $currentYear) {
                  
                var $evntDivTag=$("<div class=evntDivTag>"+evnt.evntDesc.toString()+"</div>");               
                  
                $(tdElem).append($evntDivTag);  //.html
                  
                $($evntDivTag).hover(function(){
                    
                    popUpEventInfo($evntDivTag,evnt,$(tdElem).position().left,$(tdElem).position().top);
                },function(){                   
                    $(".eventPopupDiv").hide();
                });
                
              }else{
                  
              }
      
            });

          })
        });
        //============================================================================================
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
                <input id="btnLastWeek" value="Last" type="button">
                <h class="YearMonthDateHeaderText"></h>
                <input id="btnNextWeek" value="Next" type="button">
            </div>
            <table id="weekCalendarTable">
                <!--
                <tr>
                    <th id="columnHeader"></th>
                    <th id="columnHeader1"></th>
                    <th id="columnHeader2"></th>
                    <th id="columnHeader3"></th>
                    <th id="columnHeader4"></th>
                    <th id="columnHeader5"></th>
                    <th id="columnHeader6"></th>
                    <th id="columnHeader7"></th>
                </tr>
                -->
            </table>
        </div>
        <div id="dayViewDiv" class="viewDiv">
            <div class="navigationDiv">            
                <input id="btnLastDay" value="Last" type="button">
                <h class="YearMonthDateHeaderText"></h>
                <input id="btnNextDay" value="Next" type="button">
            </div>
            <table id="dayCalendarTable">
            </table>
        </div> 
    </div>
</body>
</html>