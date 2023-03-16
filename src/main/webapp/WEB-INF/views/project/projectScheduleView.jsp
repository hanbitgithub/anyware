<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .side-area{
        border: 1px solid red;
        width: 300px;
    }
</style>
</head>
<body>

    <!-- 사이드 바  -->
    <jsp:include page="../common/sidebar.jsp"></jsp:include>
    <!-- 스케줄 메뉴바 -->
    <jsp:include page="../common/listmenu.jsp"></jsp:include>

    <div class="content">
        <div class="title">일정 관리</div>

        <div class="side-area">

        </div>

        <div class="calendar-area">

        </div>
    </div>

</body>
</html>