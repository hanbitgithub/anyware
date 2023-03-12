<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        .content {
            border: 1px solid rgb(129, 129, 252);
            width: 80%;
            margin-left: 200px;
            margin-top: 50px;
            position: relative;
        }

        .main-left {
            border: 1px solid rgb(129, 129, 252);
            width: 25%;
            height: 700px;
        }

        .main-right {
            border: 1px solid rgb(129, 129, 252);
            width: 75%;
            height: 700px;
            position: absolute;
            right: 0px;
            top: 0px;
        }

        .main-left-1 {
            border: 1px solid pink;
            height: 5%;
            width: 90%;
            margin: auto;
        }

        .main-left-1 button {
            height: 100%;
            width: 100%;
            line-height: 20px;
        }


        .main-right-1 {
            border: 1px solid pink;
            height: 35px;
            width: 250px;
            position: absolute;
            right: 20px;
        }

        .main-left-2 {
            border: 1px solid pink;
            height: 280px;
            width: 90%;
            margin: auto;
            margin-top: 25px;
        }

        .calendar {
            border: 1px solid lightpink;
            height: 300px;
            width: 300px;
            margin: auto;
            margin-top: 22px;
        }

        .mycalendar {
            border: 1px solid pink;
            width: 90%;
            margin: auto;
            margin-top: 28px;
        }

        .mycalendar .mycalendarButton {
            position: absolute;
            left: 275px;
            font-weight: 600;
            font-size: 20px;
            background-color: transparent;
            color: black;
            border: none;
            line-height: 20px;
        }

        .mycalendar > span {
            font-weight: 600;
        }

        /* 내 캘린더 리스트 */
        #myCalendars input[type="checkbox"] {
            width: 17px;
            height: 17px;
            border-radius: 25%;
            border: 1px solid black;
            appearance: none;
            cursor: pointer;

            /* transition: background 0.2s; */
        }

        #myCalendars input[type="checkbox"]:checked {
            background-color: rgb(255, 55, 55);
            border: none;
        }

        #myCalendars {
            border: 1px solid pink;
            bottom: 265px;
            padding: 5px;
        }


        /* 캘린더 부분 */
        .main-right-2 {
            border: 1px solid rgb(129, 129, 252);
            height: 95%;
            width: 100%;
            position: absolute;
            top: 35px;
            padding: 20px;
        }

        #calendar {
            height: 600px;
        }

        /* 캘린더 상단 */
        /* 화살표 왼 */
        .fc .fc-button .fc-icon {
            color: black;
        }

        .fc .fc-button .fc-icon:hover {
            color: white;
        }

        .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child) {
            border: none;
            background-color: transparent;
        }

        .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child):hover {
            background-color: rgb(255, 205, 214);
        }

        /* 화살표 오 */
        .fc-icon-chevron-right:before {
            color: black;
        }

        .fc-icon-chevron-right:before:hover {
            color: white;
        }


        .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child) {
            border: none;
            background-color: transparent;
        }

        .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child):hover {
            background-color: rgb(255, 205, 214);
        }

        /* today버튼 */
        .fc-direction-ltr .fc-toolbar > * > :not(:first-child) {
            color: black;
            font-weight: 700;
        }

        .fc-direction-ltr .fc-toolbar > * > :not(:first-child) {
            border: none;
            background-color: transparent;
        }

        .fc-direction-ltr .fc-toolbar > * > :not(:first-child):hover {
            background-color: rgb(255, 205, 214);
            color: white;
        }

        /* month, week, day버튼 */
        .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child) {
            color: black;
            font-weight: 700;
        }

        .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child) {
            color: black;
            font-weight: 700;
        }

        .fc-direction-ltr .fc-button-group > .fc-button:not(:first-child):hover {
            background-color: rgb(255, 205, 214);
            color: white;
        }

        .fc-direction-ltr .fc-button-group > .fc-button:not(:last-child):hover {
            background-color: rgb(255, 205, 214);
            color: white;
        }

        /* 새 일정 등록 모달 */
        #calendarNo, #startDate, #startTime, #endDate, #endTime, #scTitle, #scContent {
            width: 100%;
        }

        #startTime, #endTime {
            height: 28px;
        }

        /* #modal-footer {} */


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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#scheduleSaveModal">+ 일정 추가
            </button>
        </div>
        <div class="main-left-2">
            <!-- <div class="calendar"></div> -->
        </div>
        <div class="mycalendar">
            &nbsp;<img src="resources/images/arrow_right.png" alt="" width="18px;" height="18px;">
            <span>&nbsp;&nbsp;내&nbsp;&nbsp;캘린더</span>
            <button type="button" class="mycalendarButton" data-toggle="modal" data-target="#myCalendarModal">+</button>
            <div id="myCalendars">
                <%--				<input type="checkbox"><span>프로젝트</span>--%>
                <%--				<button type="button">수정하기</button><br>--%>
            </div>

        </div>


    </div>

    <div class="main-right">
        <div class="main-right-1">
            <form class="d-flex" role="search">
                <input class="form-control form-control-sm me-2" type="search"
                       placeholder="검색어를 입력하세요" aria-label="Search" style="width: 200px;">
                <button class="btn" type="submit"
                        style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);">
                    <b>Search</b>
                </button>
            </form>
        </div>
        <div class="main-right-2">
            <div id='calendar'></div>
        </div>
    </div>
</div>

<!-- 새 일정 등록 모달 -->
<div class="modal" id="scheduleSaveModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal body -->
            <div class="modal-body">
                <span style="font-size:20px; font-weight:600;">일정추가</span>
                <br><br>

                <form action="">
                    <table style="width:100%; border-spacing: 10px; border-collapse: separate;">
                        <colgroup>
                            <col style="width: 20%;"/>
                            <col style="width: 35%;"/>
                            <col style="width: 25%;"/>
                            <col style="width: 20%;"/>
                        </colgroup>
                        <tr>
                            <th>캘린더</th>
                            <td colspan="3">
                                <select name="calendarNo" id="calendarNo">
                                    <option value="1">프로젝트</option>
                                    <option value="2">프로젝트1</option>
                                    <option value="3">프로젝트2</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>일정시작</th>
                            <td><input type="date" id="startDate" name="startDate"></td>
                            <td>
                                <select id="startTime" name="startTime">
                                    <option value="00:00">00:00</option>
                                    <option value="00:30">00:30</option>
                                    <option value="01:00">01:00</option>
                                    <option value="01:30">01:30</option>
                                    <option value="02:00">02:00</option>
                                    <option value="02:30">02:30</option>
                                    <option value="03:00">03:00</option>
                                    <option value="03:30">03:30</option>
                                    <option value="04:00">04:00</option>
                                    <option value="04:30">04:30</option>
                                    <option value="05:00">05:00</option>
                                    <option value="05:30">05:30</option>
                                    <option value="06:00">06:00</option>
                                    <option value="06:30">06:30</option>
                                    <option value="07:00">07:00</option>
                                    <option value="07:30">07:30</option>
                                    <option value="08:00">08:00</option>
                                    <option value="08:30">08:30</option>
                                    <option value="09:00">09:00</option>
                                    <option value="09:30">09:30</option>
                                    <option value="10:00">10:00</option>
                                    <option value="10:30">10:30</option>
                                    <option value="11:00">11:00</option>
                                    <option value="11:30">11:30</option>
                                    <option value="12:00">12:00</option>
                                    <option value="12:30">12:30</option>
                                    <option value="13:00">13:00</option>
                                    <option value="13:30">13:30</option>
                                    <option value="14:00">14:00</option>
                                    <option value="14:30">14:30</option>
                                    <option value="15:00">15:00</option>
                                    <option value="15:30">15:30</option>
                                    <option value="16:00">16:00</option>
                                    <option value="16:30">16:30</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="18:30">18:30</option>
                                    <option value="19:00">19:00</option>
                                    <option value="19:30">19:30</option>
                                    <option value="20:00">20:00</option>
                                    <option value="20:30">20:30</option>
                                    <option value="21:00">21:00</option>
                                    <option value="21:30">21:30</option>
                                    <option value="22:00">22:00</option>
                                    <option value="22:30">22:30</option>
                                    <option value="23:00">23:00</option>
                                    <option value="23:30">23:30</option>
                                    <option value="24:00">24:00</option>
                                </select>
                            </td>
                            <td id="alldayCheck" style="position:relative;">
                                <input type="checkbox" id="allday" name="allday" value="Y"
                                       style="width:17px; height:17px; margin-top:10px;">
                                <span style="position:absolute; top:6px; right:25px;">종일</span>
                            </td>
                        </tr>
                        <tr>
                            <th>일정종료</th>
                            <td><input type="date" id="endDate" name="endDate"></td>
                            <td>
                                <select id="endTime" name="endTime">
                                    <option value="00:00">00:00</option>
                                    <option value="00:30">00:30</option>
                                    <option value="01:00">01:00</option>
                                    <option value="01:30">01:30</option>
                                    <option value="02:00">02:00</option>
                                    <option value="02:30">02:30</option>
                                    <option value="03:00">03:00</option>
                                    <option value="03:30">03:30</option>
                                    <option value="04:00">04:00</option>
                                    <option value="04:30">04:30</option>
                                    <option value="05:00">05:00</option>
                                    <option value="05:30">05:30</option>
                                    <option value="06:00">06:00</option>
                                    <option value="06:30">06:30</option>
                                    <option value="07:00">07:00</option>
                                    <option value="07:30">07:30</option>
                                    <option value="08:00">08:00</option>
                                    <option value="08:30">08:30</option>
                                    <option value="09:00">09:00</option>
                                    <option value="09:30">09:30</option>
                                    <option value="10:00">10:00</option>
                                    <option value="10:30">10:30</option>
                                    <option value="11:00">11:00</option>
                                    <option value="11:30">11:30</option>
                                    <option value="12:00">12:00</option>
                                    <option value="12:30">12:30</option>
                                    <option value="13:00">13:00</option>
                                    <option value="13:30">13:30</option>
                                    <option value="14:00">14:00</option>
                                    <option value="14:30">14:30</option>
                                    <option value="15:00">15:00</option>
                                    <option value="15:30">15:30</option>
                                    <option value="16:00">16:00</option>
                                    <option value="16:30">16:30</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="18:30">18:30</option>
                                    <option value="19:00">19:00</option>
                                    <option value="19:30">19:30</option>
                                    <option value="20:00">20:00</option>
                                    <option value="20:30">20:30</option>
                                    <option value="21:00">21:00</option>
                                    <option value="21:30">21:30</option>
                                    <option value="22:00">22:00</option>
                                    <option value="22:30">22:30</option>
                                    <option value="23:00">23:00</option>
                                    <option value="23:30">23:30</option>
                                    <option value="24:00">24:00</option>
                                </select>

                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>일정제목</th>
                            <td colspan="3">
                                <input type="text" id="scTitle" name="scTitle" value="프로젝트 하는 날"/>
                            </td>
                        </tr>
                        <tr>
                            <th>일정내용</th>
                            <td colspan="3">
                                <textarea id="scContent" name="scContent" value="내용 적는 곳"
                                          style="width:100%;height:200px;resize: none;"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer" style="border:none;">
                <button type="button" class="btn btn-primary btn-sm" onClick="scheduleModalSave();">저장</button>
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
            </div>

        </div>
    </div>
</div>

<!-- 내 캘린더 추가 모달-->
<div class="modal" id="myCalendarModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body">
                <span style="font-size:20px; font-weight:600;">새 캘린더</span>
                <br><br>
                <form action="">
                    <table border="1" style="width:100%; border-spacing: 10px; border-collapse: separate;">
                        <colgroup>
                            <col style="width:30%;"/>
                            <col style="width:70%;"/>
                        </colgroup>
                        <tr>
                            <td>내 캘린더 이름</td>
                            <td><input type="text" id="myCalendar" name="myCalendar" value="제목" style="width:100%;">
                            </td>
                        </tr>
                        <tr>
                            <td>내 캘린더 색상</td>
                            <td>
                                <input type="radio" id="red" name="scColor" value="rgb(255, 55, 55)">
                                <input type="radio" id="pink" name="scColor" value="rgb(255, 190, 200)">
                                <input type="radio" id="orange" name="scColor" value="rgb(255, 179, 37)">
                            </td>
                        </tr>
                    </table>
                </form>

                <div class="modal-footer" style="border:none;">
                    <button type="button" class="btn btn-primary btn-sm" onClick="calendarModalSave();">저장</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- 내 캘린더 수정-->
<div class="modal" id="myCalendarModifyModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-body" id="myCalendarModify">
                <!-- ajax myCalendarModify 내용 -->
            </div>

        </div>
    </div>
</div>

<!-- 캘린더 api 드래그 모달-->
<div class="modal" id="gggggggggggggggggggggggggggg">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal body -->
            <div class="modal-body">
                <span style="font-size:20px; font-weight:600;">일정추가</span>
                <br><br>

                <form action="">
                    <table style="width:100%; border-spacing: 10px; border-collapse: separate;">
                        <colgroup>
                            <col style="width: 20%;"/>
                            <col style="width: 35%;"/>
                            <col style="width: 25%;"/>
                            <col style="width: 20%;"/>
                        </colgroup>
                        <tr>
                            <th>캘린더</th>
                            <td colspan="3">
                                <select name="calendarNo" id="calendarNo">
                                    <option value="1">프로젝트</option>
                                    <option value="2">프로젝트1</option>
                                    <option value="3">프로젝트2</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>일정시작</th>
                            <td><input type="date" id="argStartStr" name="argStartStr"></td>
                            <td>
                                <select id="startTime" name="startTime">
                                    <option value="00:00">00:00</option>
                                    <option value="00:30">00:30</option>
                                    <option value="01:00">01:00</option>
                                    <option value="01:30">01:30</option>
                                    <option value="02:00">02:00</option>
                                    <option value="02:30">02:30</option>
                                    <option value="03:00">03:00</option>
                                    <option value="03:30">03:30</option>
                                    <option value="04:00">04:00</option>
                                    <option value="04:30">04:30</option>
                                    <option value="05:00">05:00</option>
                                    <option value="05:30">05:30</option>
                                    <option value="06:00">06:00</option>
                                    <option value="06:30">06:30</option>
                                    <option value="07:00">07:00</option>
                                    <option value="07:30">07:30</option>
                                    <option value="08:00">08:00</option>
                                    <option value="08:30">08:30</option>
                                    <option value="09:00">09:00</option>
                                    <option value="09:30">09:30</option>
                                    <option value="10:00">10:00</option>
                                    <option value="10:30">10:30</option>
                                    <option value="11:00">11:00</option>
                                    <option value="11:30">11:30</option>
                                    <option value="12:00">12:00</option>
                                    <option value="12:30">12:30</option>
                                    <option value="13:00">13:00</option>
                                    <option value="13:30">13:30</option>
                                    <option value="14:00">14:00</option>
                                    <option value="14:30">14:30</option>
                                    <option value="15:00">15:00</option>
                                    <option value="15:30">15:30</option>
                                    <option value="16:00">16:00</option>
                                    <option value="16:30">16:30</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="18:30">18:30</option>
                                    <option value="19:00">19:00</option>
                                    <option value="19:30">19:30</option>
                                    <option value="20:00">20:00</option>
                                    <option value="20:30">20:30</option>
                                    <option value="21:00">21:00</option>
                                    <option value="21:30">21:30</option>
                                    <option value="22:00">22:00</option>
                                    <option value="22:30">22:30</option>
                                    <option value="23:00">23:00</option>
                                    <option value="23:30">23:30</option>
                                    <option value="24:00">24:00</option>
                                </select>
                            </td>
                            <td id="alldayCheck" style="position:relative;">
                                <input type="checkbox" id="allday" name="allday" value="Y"
                                       style="width:17px; height:17px; margin-top:10px;">
                                <span style="position:absolute; top:6px; right:25px;">종일</span>
                            </td>
                        </tr>
                        <tr>
                            <th>일정종료</th>
                            <td><input type="date" id="endDate" name="endDate"></td>
                            <td>
                                <select id="endTime" name="endTime">
                                    <option value="00:00">00:00</option>
                                    <option value="00:30">00:30</option>
                                    <option value="01:00">01:00</option>
                                    <option value="01:30">01:30</option>
                                    <option value="02:00">02:00</option>
                                    <option value="02:30">02:30</option>
                                    <option value="03:00">03:00</option>
                                    <option value="03:30">03:30</option>
                                    <option value="04:00">04:00</option>
                                    <option value="04:30">04:30</option>
                                    <option value="05:00">05:00</option>
                                    <option value="05:30">05:30</option>
                                    <option value="06:00">06:00</option>
                                    <option value="06:30">06:30</option>
                                    <option value="07:00">07:00</option>
                                    <option value="07:30">07:30</option>
                                    <option value="08:00">08:00</option>
                                    <option value="08:30">08:30</option>
                                    <option value="09:00">09:00</option>
                                    <option value="09:30">09:30</option>
                                    <option value="10:00">10:00</option>
                                    <option value="10:30">10:30</option>
                                    <option value="11:00">11:00</option>
                                    <option value="11:30">11:30</option>
                                    <option value="12:00">12:00</option>
                                    <option value="12:30">12:30</option>
                                    <option value="13:00">13:00</option>
                                    <option value="13:30">13:30</option>
                                    <option value="14:00">14:00</option>
                                    <option value="14:30">14:30</option>
                                    <option value="15:00">15:00</option>
                                    <option value="15:30">15:30</option>
                                    <option value="16:00">16:00</option>
                                    <option value="16:30">16:30</option>
                                    <option value="17:00">17:00</option>
                                    <option value="17:30">17:30</option>
                                    <option value="18:00">18:00</option>
                                    <option value="18:30">18:30</option>
                                    <option value="19:00">19:00</option>
                                    <option value="19:30">19:30</option>
                                    <option value="20:00">20:00</option>
                                    <option value="20:30">20:30</option>
                                    <option value="21:00">21:00</option>
                                    <option value="21:30">21:30</option>
                                    <option value="22:00">22:00</option>
                                    <option value="22:30">22:30</option>
                                    <option value="23:00">23:00</option>
                                    <option value="23:30">23:30</option>
                                    <option value="24:00">24:00</option>
                                </select>

                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>일정제목</th>
                            <td colspan="3">
                                <input type="text" id="scTitle" name="scTitle" value="프로젝트 하는 날"/>
                            </td>
                        </tr>
                        <tr>
                            <th>일정내용</th>
                            <td colspan="3">
                                <textarea id="scContent" name="scContent" value="내용 적는 곳"
                                          style="width:100%;height:200px;resize: none;"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="modal-footer" style="border:none;">
                <button type="button" class="btn btn-primary btn-sm" onClick="scheduleModalSave();">저장</button>
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
            </div>

        </div>
    </div>
</div>

<!-- fullcalendar script -->
<script>

    $(function () {
        calendarList();
    });

    document.addEventListener('DOMContentLoaded',function () {
        var calendarEl = document.getElementById('calendar');
        let html = '';

        var calendar = new FullCalendar.Calendar(
            calendarEl,
            {
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                initialDate: '2023-01-12',
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectMirror: true,
                select: function (arg) {
                    // var title = prompt('Event Title:');
                    // if (title) {
                    //     calendar.addEvent({
                    //         title: title,
                    //         start: arg.start,
                    //         end: arg.end,
                    //         allDay: arg.allDay
                    //     })
                    // }
                    // calendar.unselect()

                    insertModalOpen(arg);	//일자 클릭 시 모달 호출
                },
                eventClick: function (arg) {
                    if (confirm('Are you sure you want to delete this event?')) {
                        arg.event.remove()
                    }
                },
                // initialDate: '2023-01-12', // 처음 보여주는 캘린더 화면의 날짜
                editable: true,
                selectable: true,
                businessHours: true,
                dayMaxEvents: true, // 일정이 너무 많으면 more
                events: [{
                    title: 'All Day Event',
                    start: '2023-03-03',
                    color: 'rgb(255, 190, 200)'
                }, {
                    title: 'Long Event',
                    start: '2023-03-07',
                    end: '2023-03-10',
                    color: 'rgb(255, 55, 55)'
                }, {
                    groupId: 999,
                    title: 'Repeating Event',
                    start: '2023-03-09T16:00:00',
                    color: 'rgb(255, 55, 55)',
                    color: 'rgb(255, 55, 55)'
                }, {
                    groupId: 999,
                    title: 'Repeating Event',
                    start: '2023-03-16T16:00:00',
                    color: 'rgb(255, 179, 37)'
                }, {
                    title: 'Conference',
                    start: '2023-03-11',
                    end: '2023-03-13',
                    color: 'rgb(50, 50, 50)'
                }, {
                    title: 'Meeting',
                    start: '2023-03-12T10:30:00',
                    end: '2023-03-12T12:30:00',
                    color: 'rgb(39, 174, 96)'
                }, {
                    title: 'Lunch',
                    start: '2023-03-12T12:00:00',
                    color: 'rgb(39, 174, 96)'
                }, {
                    title: 'Meeting',
                    start: '2023-03-12T14:30:00',
                    color: 'rgb(50, 50, 50)'
                }, {
                    title: 'Happy Hour',
                    start: '2023-03-12T17:30:00',
                    color: 'rgb(39, 174, 96)'
                }, {
                    title: 'Dinner',
                    start: '2023-03-12T20:00:00',
                    color: 'rgb(39, 174, 96)'
                }, {
                    title: 'Birthday Party',
                    start: '2023-03-13T07:00:00',
                    color: 'rgb(129, 129, 252)'
                }, {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2023-03-28',
                    color: ' rgb(253, 253, 67)'
                }]
            });

        calendar.render();
    });


    // 새 일정 추가
    function scheduleModalSave() {
        let calendarNo = document.querySelector("#calendarNo").value
        let startDate = document.querySelector("#startDate").value
        let startTime = document.querySelector("#startTime").value
        let endDate = document.querySelector("#endDate").value
        let endTime = document.querySelector("#endTime").value
        let allday = document.querySelector("#allday").value
        let scTitle = document.querySelector("#scTitle").value
        let scContent = document.querySelector("#scContent").value

        if (scTitle.length == 0) {
            alert("제목을 입력해 주세요");
            return false;
        }
        if (scContent.length == 0) {
            alert("내용을 입력해 주세요");
            return false;
        }

        const reqData = {
            calendarNo: calendarNo,
            startDate: startDate,
            startTime: startTime,
            endDate: endDate,
            endTime: endTime,
            allday: allday,
            scTitle: scTitle,
            scContent: scContent
        }

        console.log(reqData);

        $.ajax({
            url: "scheduleModalSave.sc",
            data: reqData,
            success: function (resData) {
                console.log(resData)
                if (resData == 1) {
                    alert("새 일정을 등록 했습니다.");
                } else {
                    alert("새 일정등록 실패 했습니다.");
                }
            },
            error: function () {
                console.log("예약일정등록 실패");
            }

        })

    }

    // 내 캘린더 추가
    function calendarModalSave() {
        console.log("내 캘린더 추가")

        const scColor = $('input[name=scColor]:checked').val();
        const myCalendar = document.querySelector("#myCalendar").value

        if (scColor == undefined || scColor == null || scColor == '') {
            alert("color 선택해 주세요.")
            return false;
        }

        const reqData = {
            scColor: scColor,
            myCalendar: myCalendar
        }

        console.log(reqData);

        $.ajax({
            url: "calendarModalSave.sc",
            data: reqData,
            success: function (resData) {
                console.log(resData)
                if (resData == 1) {
                    alert("내 캘린더를 추가했습니다.");
                    $("#myCalendars").empty();
                    calendarList();
                } else {
                    alert("내 캘린더 등록을 실패했습니다.");
                }
            },
            error: function () {
                console.log("내 캘린더등록 실패");
            }

        })

    }

    // 내 캘린더 목록
    function calendarList() {
        console.log("calendarList")
        $.ajax({
            url: "calendarList.sc",
            data: {},
            success: function (resData) {
                console.log(resData)
                console.log(resData.length)
                let html = '';
                if (resData.length == 0) {
                    html += '<h3>목록없음</h3>';
                } else {
                    for (let i = 0; i < resData.length; i++) {
                        html += '<input type="checkbox"><span>' + resData[i].myCalendar + '</span>';
                        html += '<button type="button" data-toggle="modal" data-target="#myCalendarModifyModal" onclick="calendarModifyModal('+resData[i].calendarNo+');">수정하기</button><br/>';
                    }

                    $("#myCalendars").append(html);
                }
            },
            error: function () {
                console.log("내 캘린더목록");
            }
        });

    }

    // 내 캘린더 수정 모달 화면
    function calendarModifyModal(calendarNo) {
        $("#myCalendarModify").empty();

        let html = '';

        const reqData = {
            calendarNo : calendarNo
        }

        $.ajax({
            url: "selectCalendar.sc",
            data: reqData,
            success: function (resData) {

                console.log(resData)
                html += '<span style="font-size:20px; font-weight:600;">내 캘린더 수정</span>';
                html += '<br><br>';
                html += '<table border="1" style="width:100%; border-spacing: 10px; border-collapse: separate;">';
                html += '<colgroup>';
                html += '<col style="width:30%;"/>';
                html += '<col style="width:70%;"/>';
                html += '</colgroup>';
                html += '<tr>';
                html += '<td>내 캘린더 이름</td>';
                html += '<td><input type="text" id="myCalendarTitle" value="'+ resData.myCalendar +'" style="width:100%;">';
                html += '</td>';
                html += '</tr>';
                html += '<tr>';
                html += '<td>내 캘린더 색상</td>';
                html += '<td>';
                html += '<input type="radio" id="rgb(255, 55, 55)" name="myCalendarRadio" value="rgb(255, 55, 55)">';
                html += '<input type="radio" id="rgb(255, 190, 200)" name="myCalendarRadio" value="rgb(255, 190, 200)">';
                html += '<input type="radio" id="rgb(255, 179, 37)" name="myCalendarRadio" value="rgb(255, 179, 37)">';
                html += '</td>';
                html += '</tr>';
                html += '</table>';
                html += '<div class="modal-footer" style="border:none;">';
                html += '<button type="button" class="btn btn-primary btn-sm" onClick="calendarModalupdate('+calendarNo+');">수정</button>';
                html += '<button type="button" class="btn btn-primary btn-sm" onClick="calendarModalSave();">삭제</button>';
                html += '<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>';
                html += '</div>';

                $("#myCalendarModify").append(html);

                // 라디오버튼 값에따라 체크
                $(":radio[name='myCalendarRadio'][value='" + resData.scColor + "']").attr('checked', true);

            },
            error: function () {
                console.log("내 캘린더목록");
            }
        });
    }

    // 내 캘린더 수정
    function calendarModalupdate(calendarNo) {
        let title = document.querySelector("#myCalendarTitle").value;
        let myCalendarRadio = $("input[name='myCalendarRadio']:checked").val();

        console.log(calendarNo)
        console.log(title)
        console.log(myCalendarRadio)

        const reqData = {
            calendarNo : calendarNo,
            myCalendar : title,
            scColor : myCalendarRadio
        }

        console.log(reqData)

        $.ajax({
            url: "updateCalendar.sc",
            data: reqData,
            success: function (resData) {
                console.log(resData)
                if (resData == 1) {
                    alert("내 캘린더를 수정 했습니다.");
                    $("#myCalendars").empty();
                    calendarList();
                } else {
                    alert("수정실패");
                }
            },
            error: function () {
                console.log("내 캘린더목록");
            }
        });
    }

    // 캘린더 드래드 모달 오픈
    function insertModalOpen(arg) {
        console.log(arg)
        // $('.insertModal').modal({backdrop: 'static'});

        // 모달 버튼에 이벤트를 건다.
        $('#gggggggggggggggggggggggggggg').modal('show');



        console.log(arg.startStr)
        console.log(arg.endStr)

        let bir = document.getElementById("argStartStr");
        bir.value = arg.startStr;

    }




    // 모달 안의 취소 버튼에 이벤트를 건다.
    $('#closeModalBtn').on('click', function(){
        $('#modalBox').modal('hide');
    });
</script>


</body>
</html>