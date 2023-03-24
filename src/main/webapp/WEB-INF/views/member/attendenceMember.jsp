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
#at-area *{
/* 	border:1px solid black; */
	padding: 2px;
}

#tb{
	width: 1000px;
	align:center;
	text-align: center;
	font-size: 19px;
	border-radius: 10px; /* 테두리의 둥근 모서리 크기를 지정합니다 */
 	border-collapse: separate; /* 테두리를 겹치지 않게 분리합니다 */
  	border-spacing: 0; /* 테두리 간격을 0으로 설정합니다 */

}

.fc .fc-col-header-cell-cushion {
  display: inline-block;
  padding: 2px 4px;
}
.event-icon {
  width: 24px;
}
 /*종일제목*/
  .fc-event-title.fc-sticky{
    
  }
   /*title 옆에 점*/
  .fc-daygrid-event-dot{
	
  }
  /*month/week/day*/
  .fc-button-active{
	border-color: #6188ea 		!important;
	background-color:#6188ea  	!important;
	color: #000 				!important;
	font-weight: bold 			!important;
  }
  
  .fc-event-title.fc-sticky{
    white-space: normal;
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
          	<table id="tb" align="center" >
          		<tr>
          		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now" />
          			<th width="200px" style="font-size:22px; height:50px; "><c:out value="${now}"/></th>
          			<th width="120px">출근시간</th>
          			<th width="120px">퇴근시간</th>
          			<th width="50px" style="border-right:1px solid #c9c9c9;"></th>
          			<th width="200px"style="border-right:1px solid #c9c9c9;">이번주 누적</th>
          			<th width="200px">이번달 누적</th>
          		</tr>
          		<tr style="font-size:23px">
          			<fmt:formatDate value="${currTime}" pattern="HH:mm:ss" var="currTime" />
          			<td id="WhatTimeIsItNow" style="font-size:25px;"><c:out value="${currTime}"/></td>
          			<td>${c.commuteIn }</td>
          			<td>${c.commuteOut }</td>
          			<td style="border-right:1px solid #c9c9c9;"></td>
          			<td style="border-right:1px solid #c9c9c9;">${weekly }</td>
          			<td>${month }</td>
          		</tr>
          	</table>
          	<br>
          	 <hr>
          </div>
      
            <div class="calender">
                <div id='calendar'></div>
            </div>
   
           <script>

		      document.addEventListener('DOMContentLoaded', function() {
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl,{  	
                         headerToolbar: {
                             left: 'prev,next today',
                             center: 'title',
                             right: 'dayGridMonth,timeGridWeek,timeGridDay'
                         },	

                         expandRows: true, // 화면에 맞게 높이 재설정
                         height: '900px', // calendar 높이 설정
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
                         eventClick: function(event) { //링크 새창열기
                 			if (event.event.url) {
                         event.jsEvent.preventDefault()
                         window.open(event.event.url, "_blank");
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
                                        	 title : '🧑‍💻출근 : '+data.commuteIn,
                                             start : data.commuteDate,
                                             end: data.commuteDate,
                                             color : "#ffffff00", 
                                             textColor : "#000000"
                                         
                                             })
                                         }) 
                                         
                                     $.each(param, function(index, data){
                                         events.push({
                                        	 title : '🙋‍♀️퇴근 : '+data.commuteOut,
                                             start : data.commuteDate,
                                             end: data.commuteDate,
                                             color : "#ffffff00",
                                             textColor : "#000000"
                                       
                                             })
                                         })  
                                         
                                       $.each(param, function(index, data){
                                         events.push({
                                        	 title : data.commuteStatus!='정상근무'? data.commuteStatus: "" ,
                                             start : data.commuteStatus!='정상근무'? data.commuteDate: "",
                                             end: data.commuteStatus!='정상근무'? data.commuteDate: "",
                                             color : "#f45454c4",
                                             textColor : "white",
                                             rendering : "background"
                                             })
                                         })     
   

                                         successCallback(events);
                                      //  console.log(param);

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