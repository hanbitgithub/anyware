<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	/*서브메뉴*/
	.menu{
	    position: fixed;
	    height: 100vh;
	    width: 170px;
	    font-size: 14px;
	    padding: 40px 20px;
	    border-right: 1px solid rgb(211, 210, 210);
	    font-family: 'Nanum Gothic', sans-serif;
	}
	.menu li{
	    margin-top: 5px;
	   
	}
	#list-area li a:hover{
	    color: gray;
	    cursor: pointer;
	    text-decoration: none;
	}
	a{
	  color: inherit;
	  text-decoration:none;
	}
	
</style>
</head>
<body>
	 <div class="menu">
        <span style="font-weight: 600; font-size: 19px;">프로젝트</span><br><br>
        
        <div id="list-area">
	        <ul>
	            <li><a href="detail.pj">LIST</a></li> <br>
	            <li><a href="participants.pj">인원 관리</a></li> <br>
	            <li><a href="">일정 관리</a></li> <br>
	        </ul>
        </div>

    </div>
	
</body>
</html>