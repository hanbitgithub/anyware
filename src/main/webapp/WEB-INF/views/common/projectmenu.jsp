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
	#project-area li a:hover{
	    color: gray;
	    cursor: pointer;
	    text-decoration: none;
	}
	a{
	  color: inherit;
	  text-decoration:none;
	}
	
	.add-btn{
		width: 100px;
		margin-top: 10px;
		font-size: 13px;
	}

	.essential{
		color: red;
	}
	#name{
		width: 350px;
		margin-left: 10px;
	}
	.btn-area{
		width: 466px;
	}
	label{
		font-size: 15px;
	}
	textarea{
		margin-top: 5px;
	}
</style>
</head>
<body>
	 <div class="menu">
        <span style="font-weight: 600; font-size: 19px;">프로젝트</span>
        <a class="btn btn-primary add-btn" href="" data-toggle="modal" data-target="#myModal">새로 만들기</a>
        <br><br>
        <div id="project-area">
	        <ul>
	            <li><a href="list.pj">전체 프로젝트</a></li> <br>
	            <li><a href="">참여한 프로젝트</a></li> <br>
	            <li><a href="">즐겨찾기</a></li> <br>
	        </ul>
        </div>
	
    </div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">프로젝트 생성</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<form action="">
						<div>
							<b>프로젝트명<span class="essential"> *</span></b>
							<input type="text" id="name" name="projectName">
						</div>
						<br>
						<div><b>프로젝트 내용</b></div>
						<textarea name="" id="" cols="53" rows="10" style="resize: none;"></textarea>
						<br><br>
						<b>공개 여부<span class="essential"> *</span></b>&nbsp;
						<input type="radio" name="public" id="public">
						<label for="public">공개</label>&nbsp;
						<input type="radio" name="public" id="private">
						<label for="private">비공개</label>

						<br><br>

						<div class="btn-area" align="center">
							<button type="submit" class="btn btn-primary">생성</button>&nbsp;
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>

					</form>
				</div>
		
			</div>
		</div>
	</div>
	
</body>
</html>