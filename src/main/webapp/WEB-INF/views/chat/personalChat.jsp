<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.list-area{
		border-right: 1px solid rgb(211, 210, 210);
		width: 500px;
		height: 850px;
		float: left;
	}
	.chat-area{
		border: 1px solid red;
		width: 860px;
		float: left;
		height: 850px;
	}
	.list-area>input{
		width: 450px;
	}
	

	.thumbnail{
		margin-top: 10px;
		width: 450px;
		height: 70px;
	}
	.thumbnail:hover{
		background-color: lightgray;
		cursor: pointer;
	}
	.img-td{
		width: 70px;
		height: 70px;
	}
	.name-td, .content-td{
		width: 280px;
		height: 35px;
	}
	.content-div{
		width: 280px;
		text-overflow:ellipsis; 
		overflow:hidden;
    	white-space:nowrap;
	}
	.profileImg{
		width: 70px;
		height: 70px;
		border-radius: 50%;
		box-sizing: border-box;
	}
	.logincheck{
		width: 15px;
		height: 15px;
		border-radius: 50%;
	}
	.name{
		font-weight: bold;
		font-size: 17px;
	}
	.content-span{
		font-size:14px;
	}
	.notread-td{
		width: 30px;
		height: 75px;
		text-align: center;
	}

	.profile-area{
		margin-top: 50px;
	}
</style>
</head>
<body>
	
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/chatmenu.jsp"></jsp:include>
	
	<div class="content">
		<div class="list-area">
			<h1>개인 메신저</h1>
			<br>
			<input type="search" placeholder="이름 혹은 부서명으로 검색">
			<br>

			<div class="list-wrap">
                <table class="thumbnail">
                    <tr>
                        <td class="img-td" rowspan="2">
                            <img src="resources/images/chat/defaultProfile.png" class="profileImg">
                        </td>
                        <td class="name-td">
							<img src="resources/images/chat/green.png" class="logincheck">
                            <span class="name">김현지</span>
                        </td>
                        <td rowspan="2" class="notread-td">
                            3
                        </td>
                    </tr>
                    <tr>
                        <td class="content-td">
                            <div class="content-div">힝ㅠ</div>
                        </td>
                    </tr>
                </table>
				<table class="thumbnail">
                    <tr>
                        <td class="img-td" rowspan="2">
                            <img src="resources/images/chat/defaultProfile.png" class="profileImg">
                        </td>
                        <td class="name-td">
							<img src="resources/images/chat/green.png" class="logincheck">
                            <span class="name">김진우</span>
                        </td>
                        <td rowspan="2" class="notread-td">
                            1
                        </td>
                    </tr>
                    <tr>
                        <td class="content-td">
                            <div class="content-div">안녕하세요</div>
                        </td>
                    </tr>
                </table>
				<table class="thumbnail">
                    <tr>
                        <td class="img-td" rowspan="2">
                            <img src="resources/images/chat/defaultProfile.png" class="profileImg">
                        </td>
                        <td class="name-td">
							<img src="resources/images/chat/red.png" class="logincheck">
                            <span class="name">유한빛</span>
                        </td>
                        <td rowspan="2" class="notread-td">
                            2
                        </td>
                    </tr>
                    <tr>
                        <td class="content-td">
                            <div class="content-div">반갑습니다</div>
                        </td>
                    </tr>
                </table>
				<table class="thumbnail">
                    <tr>
                        <td class="img-td" rowspan="2">
                            <img src="resources/images/chat/defaultProfile.png" class="profileImg">
                        </td>
                        <td class="name-td">
							<img src="resources/images/chat/green.png" class="logincheck">
                            <span class="name">이빛나</span>
                        </td>
                        <td rowspan="2" class="notread-td">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="content-td">
                            <div class="content-div">가나다라마바사아자차카타파하</div>
                        </td>
                    </tr>
                </table>
				<table class="thumbnail">
                    <tr>
                        <td class="img-td" rowspan="2">
                            <img src="resources/images/chat/defaultProfile.png" class="profileImg">
                        </td>
                        <td class="name-td">
							<img src="resources/images/chat/red.png" class="logincheck">
                            <span class="name">이소민</span>
                        </td>
                        <td rowspan="2" class="notread-td">
                            
                        </td>
                    </tr>
                    <tr>
                        <td class="content-td">
                            <div class="content-div">ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</div>
                        </td>
                    </tr>
                </table>
				<table class="thumbnail">
                    <tr>
                        <td class="img-td" rowspan="2">
                            <img src="resources/images/chat/defaultProfile.png" class="profileImg">
                        </td>
                        <td class="name-td">
							<img src="resources/images/chat/red.png" class="logincheck">
                            <span class="name">성찬호</span>
                        </td>
                        <td rowspan="2" class="notread-td">
                            1
                        </td>
                    </tr>
                    <tr>
                        <td class="content-td">
                            <div class="content-div">ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ</div>
                        </td>
                    </tr>
                </table>
			</div>
		</div>

		<div class="chat-area">
			<div class="profile-area">
				<img src="resources/images/chat/defaultProfile.png" class="profileImg">
			</div>
			<div class="chat-content">

			</div>
			<div class="chat-input">

			</div>
		</div>
	</div>
	
</body>
</html>