<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .chat-area{
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.3em;
        width: 1400px;
        height: 650px;
        padding: 10px;
    }
    .input-area{
        width: 1400px;
        height: 40px;
    }
    .inputbtn{
        width: 1348px;
        position: relative;
        display: inline-block;
    }
    .input{
        width: 1348px;
        height: 40px;
        padding-left: 10px;
        padding-right: 10px;
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.3em;
        box-sizing: border-box;
    }
    .filebtn{
        width: 47px;
        height: 40px;
        font-size: 25px;
        right: 50;
        border: none;
        box-sizing: border-box;
        background-color:transparent;
        position: absolute;
        right: 0;
    }
    .submit{
        height: 40px;
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.3em;
        box-sizing: border-box;
        background-color: white;
        color: gray;
    }
    
</style>
</head>
<body>

    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/listdetailmenu.jsp"></jsp:include>

    <div class="content">
        <b style="font-size: 40px">프로젝트 기획보고서</b>
        <br><br>

        <div class="chat-area">
            <div class="chat-message mine">
	            <div class="send-message">내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지</div>
	        </div>
         
            <div class="chat-message other">
            	<span class="send-user">상대방</span>
            	<div class="send-message">남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지</div>
            </div>
        </div>

        <br>

        <div class="input-area">
            <div class="inputbtn">
                <input type="text" class="input">
                <button class="filebtn" onclick="openfile();">📂</button>
                <input type="file" style="display: none;">
            </div>
            <button class="submit">전송</button>
        </div>
    </div>
    
    <script>
        function openfile(){
           document.querySelector("input[type=file]").click();
        }
    </script>

</body>
</html>