<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* div{border: 1px solid black;} */
	#search-project{
		width: 300px;
	}

	.project-area{
		width: 1400px;
		height: 500px;
	}
	.project{
		border: 1px solid black;
		border-radius: 0.3em;
		width: 220px;
		height: 220px;
		float: left;
		box-sizing: border-box;
		position: relative;
		padding: 10px;
		margin-right: 50px;
		margin-bottom: 30px;
	}
	.project-name{
		width: 190px;
		height: 30px;
		font-size: 18px;
		text-overflow:ellipsis;
		overflow:hidden;
    	white-space:nowrap;
		box-sizing: border-box;
		font-weight: bold;
	}
	.public{
		width: 30px;
		height: 30px;
		font-size: 20px;
	}
	.project-people{
		width: 150px;
		height: 20px;
		font-size: 13px;
		position: absolute;
		bottom: 5px;
		left: 10px;
	}
	.favorite{
		width: 25px;
		height: 20px;
		font-size: 15px;
		position: absolute;
		bottom: 5px;
		right: 0px;
	}
	.project:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/projectmenu.jsp"></jsp:include>

	<div class="content">

		<h1>전체 프로젝트</h1>
		<br>

		<input type="search" placeholder="Search Project" id="search-project">
		<br><br>

		<div class="project-area">

			<div class="project">
				<div class="project-name">[개발]프로젝트1ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트2ㅇㅇㅇㅇd</div>
				<div class="public">🔒</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">🤍</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트3ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트4ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트5ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트6ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트7ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트8ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트9ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			<div class="project">
				<div class="project-name">[개발]프로젝트10ㅇㅇㅇㅇd</div>
				<div class="public">🔓</div>
				<div class="project-people">김현지 외 5명</div>
				<div class="favorite">💙</div>
			</div>
			
		</div>

		<br><br>

		<div class="page-area" style="width: 1300px;">
			<ul class="pagination" style="justify-content : center;">
				<li class="page-item"><a class="page-link" href="#">이전</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">다음</a></li>
			</ul>
		</div>
	</div>

</body>
</html>