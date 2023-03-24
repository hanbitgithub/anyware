<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>   



.error{
	margin-left: 300px;
	margin-top:100px;
}
    </style>
</head>
<body id="body-pd">
    <jsp:include page="../common/sidebar.jsp"></jsp:include>
    <div class="content">
	    <div class="error">
		    <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-512.png" width="300">
		    <br><br>
		    <h1 style="font-weight:bold">${errorMsg}</h1>
	    </div>
    </div>
</body>
</html>