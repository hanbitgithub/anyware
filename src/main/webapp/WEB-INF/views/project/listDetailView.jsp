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
        overflow: auto;
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
    
    .chat-other, .chat-mine{
        display: flex;
        margin-bottom: 10px;
    }
    .chat-mine{
        justify-content:flex-end;
    }
    img{
        width: 50px;
        height: 50px;
        box-sizing: border-box;
        margin-right: 5px;
    }
    .content-other{
        background-color: lightgray;
        border-radius: 0.3em;
        padding: 5px;
        max-width: 700px;
        margin-right: 2px;
    }
    .content-mine{
        background-color: beige;
        border-radius: 0.3em;
        padding: 5px;
        max-width: 700px;
        margin-left: 2px;
    }
    .time-td{
        vertical-align: bottom;
    }
    .time{
        font-size: 10px;
    }
    .writer{
        margin-bottom: 2px;
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
            <table class="chat-other">
                <tr>
                    <td rowspan="2">
                        <img src="../../../resources/images/chat/defaultProfile.png">
                    </td>
                    <td colspan="2">
                        <div class="writer">김현지(개발부/사원)</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="content-other">사진보내주세요...제발요ㅠ</div>
                    </td>
                    <td class="time-td">
                        <span class="time">12:10 PM</span>
                    </td>
                </tr>
            </table>
            
            <table class="chat-mine">
                <tr>
                    <td class="time-td">
                        <span class="time">12:10 PM</span>
                    </td>
                    <td>
                        <div class="content-mine">키키</div>
                    </td>
                </tr>
            </table>

            <!-- <div class="chat-message mine">
	            <div class="send-message">내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지</div>
	        </div>
         
            <div class="chat-message other">
            	<span class="send-user">상대방</span>
            	<div class="send-message">남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지</div> -->
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