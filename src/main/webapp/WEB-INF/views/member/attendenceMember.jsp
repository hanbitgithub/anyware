<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />  
<jsp:useBean id="currTime" class="java.util.Date" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
<style>
#at-area{
	height: 150px;
	margin: auto;
}
#tb{
	width: 1000px;
	align:center;
	text-align: center;
	font-size: 19px;
}
.calender{
	height:500px;
}
.fc .fc-col-header-cell-cushion {
  display: inline-block;
  padding: 2px 4px;
}
.event-icon {
  width: 24px;
}
.fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
.fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */
</style>
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
   <!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>
	
	
	 <div class="content">
	 	  <b style="font-size: 18px;">${loginUser.name}님의 근태조회</b> 
	 	  <hr>
          <br>
          <div id="at-area">
          	<table id="tb" align="center">
          		<tr>
          		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
          			<th width="200px" style="font-size:22px; height:50px"><c:out value="${now}"/></th>
          			<th width="150px">출근시간</th>
          			<th width="150px">퇴근시간</th>
          			<th width="50px"></th>
          			<th width="200px">이번주 누적</th>
          			<th width="200px">이번달 누적</th>
          		</tr>
          		<tr>
          			<fmt:formatDate value="${currTime}" pattern="HH:mm:ss" var="currTime" />
          			<td id="WhatTimeIsItNow" style="font-size:22px;"><c:out value="${currTime}"/></td>
          			<td>09:00</td>
          			<td>18:00</td>
          			<td></td>
          			<td>10h 54m 40s</td>
          			<td>37h 5m 20s</td>
          		</tr>
      
          	</table>
          </div>
          <hr>
            <div class="calender">
                <div id='calendar'></div>
            </div>
            
            
           <script>

		      document.addEventListener('DOMContentLoaded', function() {
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(
		        		calendarEl,
		        		{
		        	
                         headerToolbar: {
                             left: 'prev,next today',
                             center: 'title',
                             right: 'dayGridMonth,timeGridWeek,timeGridDay'
                         },	
                         editable: true,
                         selectable: true,
                         businessHours: true,
                         navLinks: true, // can click day/week names to navigate views
                         selectable: true,
                         selectMirror: true,
                         droppable: true,
                         drop: function (arg) {
                             // is the "remove after drop" checkbox checked?
                             if (document.getElementById('drop-remove').checked) {
                                 // if so, remove the element from the "Draggable Events" list
                                 arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                             }
                         },
                       
                         events: function(info, successCallback, failureCallback) { 
                             $.ajax({
                                     url: 'attendenceList.me',
                                     data:{
                                    	 memberNo: ${loginUser.memberNo}
                                     },
                                     type: 'POST',
                                     success: function(param) {   
                                     var events = [];                     
                                     $.each(param, function(index, data){
                                         events.push({
                                        	 title : '출근 '+data.commuteIn,
                                             start : data.commuteDate,
                                             end: data.commuteDate
                                         
                                             })
                                         }) 
                                         
                                     $.each(param, function(index, data){
                                         events.push({
                                        	 title : '퇴근 '+data.commuteOut,
                                             start : data.commuteDate,
                                             end: data.commuteDate
                                         
                                             })
                                         })     
                                       

                                         
                                         
                                         successCallback(events);
                                     
                                     
                                        console.log(param);
                                    
                                    
                                     }
                                 }) 
                         },

		        	
		        	
		        
		        });
		        calendar.render();
		      });
		
		    </script>
          
            
          <script type="text/javascript">
			$(document).ready(function(){
				var timeBoard = document.getElementById("WhatTimeIsItNow");

			    function getTime() {
			        var d = new Date();
			        var hur = d.getHours();
			        var min = d.getMinutes();
			        var sec = d.getSeconds();

			        var time = (hur < 10 ? "0" + hur  : hur) + ":" + (min < 10 ? "0" + min  : min) + ":" + (sec < 10 ? "0" + sec  : sec);

			        timeBoard.innerHTML = time;
			    }

			    setInterval(getTime, 1000);
			
			})
		</script>
		            
            
            
            
            
            
            
            
            
	 </div>
</body>
</html>