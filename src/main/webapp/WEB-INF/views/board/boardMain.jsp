<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
.notice{
    background-color: rgb(247, 247, 247);
    width: 45%;
    height: 600px;
    flex:1;
    padding: 30px;
            
}
.board{
    background-color: rgb(247, 247, 247);
    width: 45%;;
    height: 600px;
    flex:1;
    padding: 30px;    
}
.ul{
    list-style:none;
    font-size: 15px;
    line-height: 50px;
}
.ul > li > a{
    color: black;
    
}
    </style>
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/boardmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	
	    <div class="notice" style="display: inline-block"> 
        <h3 align="center"><a href="list.bo">공지사항</a></h3>
        <ul class="ul">
            <li><a>공지사항</a></li>
            <li><a>공지사항</a></li>
            <li><a>공지사항</a></li>
            <li><a>공지사항</a></li>
            <li><a>공지사항</a></li>
        </ul>
    </div>

    &nbsp;&nbsp;&nbsp;

    <div class="board" style="display: inline-block">
        <h3 align="center"><a href="notice.bo">자유게시판</a></h3>
        <ul class="ul">
            <li><a>게시글</a></li>
            <li><a>게시글</a></li>
            <li><a>게시글</a></li>
            <li><a>게시글</a></li>
            <li><a>게시글</a></li>
        </ul>
        
	</div>
</body>
</html>