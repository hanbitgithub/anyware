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
	    width: 160px;
	    font-size: 14px;
	    padding: 40px 20px;
	    border-right: 1px solid rgb(211, 210, 210);
	    font-family: 'Nanum Gothic', sans-serif;
	}
	.menu li{
	    margin-top: 5px;
	   
	}
	#project-area li a:hover{
	    color: gray;
	    cursor: pointer;
	    text-decoration: none;
	}
	a{
	  color: inherit;
	  text-decoration:none;
	}
	
	.addpj{
		width: 100px;
		margin-top: 10px;
		font-size: 13px;
	}

</style>
</head>
<body>
	 <div class="menu">
        <span style="font-weight: 600; font-size: 19px;">프로젝트</span>
        <a class="btn btn-primary addpj" href="">새로 만들기</a>
        <br><br>
        <div id="project-area">
	        <ul>
	            <li><a href="list.pj">전체 프로젝트</a></li> <br>
	            <li><a href="">참여한 프로젝트</a></li> <br>
	            <li><a href="">즐겨찾기</a></li> <br>
	        </ul>
        </div>
    </div>
	
</body>
</html>