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
        <span style="font-weight: 600; font-size: 19px;">메신저</span><br><br>
        <div id="chat-area">
		
	        <ul>
	            <li><a href="personal.ch">개인 메신저</a></li> <br>
	            <li><a href="group.ch">그룹 메신저</a></li> <br>
	            <li><a href="address.ch">주소록</a></li> <br>
	        </ul>

        </div>

    </div>
	
</body>
</html>