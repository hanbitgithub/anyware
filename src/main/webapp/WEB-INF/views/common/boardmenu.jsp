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
	#chat-area li a:hover{
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
        <span style="font-weight: 600; font-size: 19px;">게시판</span><br><br>
		<a class="btn btn-primary" href="enrollForm.bo"style="font-size: 13px; font-weight:600; width: 100px;">게시글 작성</a>
		<br><br>
        <div id="chat-area">
			<span style="font-weight: 600; font-size: 15px;" >전사게시판</span><br>
	        <ul>
	            <li><a href="nlist.bo">공지사항</a></li>
	            <li><a href="list.bo">자유게시판</a></li>

	        </ul>
			<br>
			<span style="font-weight: 600; font-size: 15px;" >전사게시판</span><br>
			<ul>
            <c:choose>
	           <c:when test="${ loginUser.deptName == '인사부' }">
	               <li><a href="alist.bo">인사팀게시판</a></li>
	            </c:when>
	           <c:when test="${ loginUser.deptName == '총무부' }">
	               <li><a href="">총무팀게시판</a></li>
	            </c:when>
	           <c:when test="${ loginUser.deptName == '디자인부' }">
	               <li><a href="">디자인팀게시판</a></li>
	            </c:when>
	            <c:when test="${ loginUser.deptName == '개발부' }">
	               <li><a href="">개발팀게시판</a></li>
	            </c:when> 
            </c:choose>
	        </ul>
			

        </div>

    </div>
	
</body>
</html>