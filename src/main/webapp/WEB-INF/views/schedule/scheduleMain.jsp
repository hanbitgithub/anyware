<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullcalendar CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js'></script>

<style>
/*컨텐트 영역*/
.content{
    border:1px solid rgb(129, 129, 252);
    width: 80%;
    margin-left: 200px;
    margin-top: 50px;
    position:relative;
}

.main-left { border:1px solid rgb(129, 129, 252);width:25%; height:700px;}
.main-right { border:1px solid rgb(129, 129, 252); width:75%; height:700px; position:absolute; right:0px; top:0px;}
.main-left-1 {border:1px solid pink; height: 50px; width: 300px; margin:auto; }
.main-right-1 {border:1px solid pink; height: 35px; width:250px; position:absolute; right:20px;}
.main-left-2 {border:1px solid pink; height: 350px;}
.calendar {border:1px solid lightpink; height:300px; width:300px; margin:auto; margin-top:22px;}
.mycalendar{border:1px solid pink; width: 300px; position:absolute; left:10px;  }
.mycalendar>span {font-weight:600;}

/* 캘린더 부분 */
.main-right-2 { border:1px solid rgb(129, 129, 252);height:95%; width:100%; position:absolute; top:35px; padding:20px; }
#calendar {height:600px;}
/* 캘린더 상단 */
/* 화살표 왼 */
.fc .fc-button .fc-icon {color:black;}
.fc .fc-button .fc-icon:hover {color:white;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:last-child) {border:none; background-color:transparent;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:last-child):hover {background-color: rgb(255, 205, 214);}
/* 화살표 오 */
.fc-icon-chevron-right:before {color:black;}
.fc-icon-chevron-right:before:hover {color:white;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:first-child) {border:none; background-color:transparent;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:first-child):hover {background-color: rgb(255, 205, 214);}
/* today버튼 */
.fc-direction-ltr .fc-toolbar>*>:not(:first-child) {color:black; font-weight: 700;}
.fc-direction-ltr .fc-toolbar>*>:not(:first-child) {border:none; background-color:transparent;}
.fc-direction-ltr .fc-toolbar>*>:not(:first-child):hover {background-color: rgb(255, 205, 214); color:white;}
/* month, week, day버튼 */
.fc-direction-ltr .fc-button-group>.fc-button:not(:last-child) {color:black; font-weight: 700;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:first-child) {color:black; font-weight: 700;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:first-child):hover {background-color: rgb(255, 205, 214); color:white;}
.fc-direction-ltr .fc-button-group>.fc-button:not(:last-child):hover {background-color: rgb(255, 205, 214); color:white;}

input[type="checkbox"] { width: 15px;
						height: 15px;
						border-radius: 25%;
						border: 1px solid black;
						appearance: none;
						cursor: pointer;
						/* transition: background 0.2s; */
					}
			
input[type="checkbox"]:checked { background: #5e90e7; border: none;}

					


</style>
</head>
<body>

	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 스케줄 메뉴바 -->
	<jsp:include page="../common/schedulemenu.jsp"></jsp:include>
	
	<!-- 내용 -->
	<div class="content">

        <div class="main-left">
            <div class="main-left-1">
                <button class="btn btn-primary" style="font-size: 15px; width: 300px; height:40px;">+ 일정 추가</button>
            </div>
            <div class="main-left-2">
                <div class="calendar">
                </div>
            </div>
            <div class="mycalendar">
				<img src="resources/images/arrow_right.png" alt="" width="20px;" height="20px;">
				<span>&nbsp;&nbsp;내&nbsp;&nbsp;캘린더</span>
				<div>
					<input type="checkbox" name="" value="">
					


				</div>

				



            </div>
        </div>

        <div class="main-right">
            <div class="main-right-1">
                <form class="d-flex" role="search">
                    <input class="form-control form-control-sm me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search" style="width:200px;">
                    <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                </form>
            </div>
			<div class="main-right-2">
            	<div id='calendar'></div>
			</div>
        </div>
    </div>

	

	<!-- fullcalendar script -->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
	
			var calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay'
				},
				initialDate: '2023-01-12',
				navLinks: true, // can click day/week names to navigate views
				selectable: true,
				selectMirror: true,
				select: function(arg) {
					var title = prompt('Event Title:');
					if (title) {
					calendar.addEvent({
						title: title,
						start: arg.start,
						end: arg.end,
						allDay: arg.allDay
					})
					}
					calendar.unselect()
				},
				eventClick: function(arg) {
					if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
					}
				},
				// initialDate: '2023-01-12', // 처음 보여주는 캘린더 화면의 날짜
				editable: true,
				selectable: true,
				businessHours: true,
				dayMaxEvents: true, // 일정이 너무 많으면 more
				events: [
					{
						title: 'All Day Event',
						start: '2023-03-03',
						color:'rgb(255, 190, 200)'      
					},
					{
						title: 'Long Event',
						start: '2023-03-07',
						end: '2023-03-10',
						color:'rgb(255, 55, 55)'
					},
					{
						groupId: 999,
						title: 'Repeating Event',
						start: '2023-03-09T16:00:00',
						color:'rgb(255, 55, 55)',
						color:'rgb(255, 55, 55)'
					},
					{
						groupId: 999,
						title: 'Repeating Event',
						start: '2023-03-16T16:00:00',
						color:'rgb(255, 179, 37)'
					},
					{
						title: 'Conference',
						start: '2023-03-11',
						end: '2023-03-13',
						color:'rgb(50, 50, 50)'
					},
					{
						title: 'Meeting',
						start: '2023-03-12T10:30:00',
						end: '2023-03-12T12:30:00',
						color:'rgb(39, 174, 96)'
					},
					{
						title: 'Lunch',
						start: '2023-03-12T12:00:00',
						color:'rgb(39, 174, 96)'
					},
					{
						title: 'Meeting',
						start: '2023-03-12T14:30:00',
						color:'rgb(50, 50, 50)'
					},
					{
						title: 'Happy Hour',
						start: '2023-03-12T17:30:00',
						color:'rgb(39, 174, 96)'
					},
					{
						title: 'Dinner',
						start: '2023-03-12T20:00:00',
						color:'rgb(39, 174, 96)'
					},
					{
						title: 'Birthday Party',
						start: '2023-03-13T07:00:00',
						color:'rgb(129, 129, 252)'
					},
					{
						title: 'Click for Google',
						url: 'http://google.com/',
						start: '2023-03-28',
						color:' rgb(253, 253, 67)'
					}
				]
			});
	
			calendar.render();
		});
	</script>
	


</body>
</html>