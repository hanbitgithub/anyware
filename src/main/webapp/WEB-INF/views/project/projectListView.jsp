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
		/* height: 30px; */
		font-size: 18px;
		text-overflow:ellipsis;
		overflow:hidden;
		word-break: break-word;
		display:-webkit-box;
		-webkit-line-clamp:2;
    	-webkit-box-orient: vertical;
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
		font-size: 15px;
		position: absolute;
		bottom: 7px;
		left: 10px;
	}
	.favorite{
		width: 25px;
		height: 20px;
		font-size: 20px;
		position: absolute;
		bottom: 10px;
		right: 5px;
	}
	.project:hover{
		cursor: pointer;
	}

	.page-area{
		width: 1300px;
		text-align: center;
	}
	.pagebtn{
		font-size: 18px;
		background-color: white; 
		color: #7291f6;
		border:1px solid #7291f6; 
		border-radius: 4px; 
		padding: 4px;
		padding-left: 8px;
		padding-right: 8px;
	}
    .pagebtn:hover{
		text-decoration: none; 
		background-color: #7291f6;
		color: white; 
		transition: 0.3s;
		cursor: pointer;
		}
	#condition{
		height: 29px;
		text-align: center;
	}
	#searchbtn{
		height: 30px;
		line-height: 15px;
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
		
		<div class="search-area">
			<form action="search.pj">
				<select name="condition" id="condition">
					<option value="title">프로젝트명</option>
					<option value="participant">참여자</option>
				</select>
				<input type="search" placeholder="Search Project" id="search-project" name="keyword">
				<button type="submit" class="btn btn-primary" id="searchbtn">검색</button>
			</form>
		</div>

		<script>
        	document.querySelector(".search-area option[value=${ condition }]").selected = true;
        </script>

		<br><br>

		<div class="project-area">
			<c:forEach var="l" items="${ list }">
				<div class="project" onclick="location.href='detail.pj?no=${ l.projectNo }';">
					<div class="project-name">${ l.projectTitle }</div>
					<c:choose>
						<c:when test="${ l.publicStatus eq 'Y' }">
							<div class="public">🔓</div>
						</c:when>
						<c:otherwise>
							<div class="public">🔒</div>
						</c:otherwise>
					</c:choose>	
					<div class="project-people">${ l.owner }</div>
					<c:choose>
						<c:when test="${ l.like eq '1' }">
							<div class="favorite" onclick="clickHeart(this);">💙</div>
							<input type="hidden" value="${ l.projectNo }">
						</c:when>
						<c:otherwise>
							<div class="favorite" onclick="clickHeart(this);">🤍</div>
							<input type="hidden" value="${ l.projectNo }">
						</c:otherwise>
					</c:choose>	
				</div>
			</c:forEach>
		</div>

		<script>
			function clickHeart(e){
				event.stopImmediatePropagation();
				// console.log($(e).next().val())
				// console.log(e.nextElementSibling)

				if(e.innerHTML == "🤍"){
					$.ajax({
						url:"insertLike.ajax",
						type:"post",
						data:{projectNo:$(e).next().val()},
						success:function(result){
							if(result == "success"){
								$(e).text("💙");
							}
						},
						error:function(){
							console.log("즐겨찾기 추가 ajax 통신 실패");
						}
					})
				} else {
					$.ajax({
						url:"deleteLike.ajax",
						type:"post",
						data:{projectNo:$(e).next().val()},
						success:function(result){
							if(result == "success"){
								$(e).text("🤍");
							}
						},
						error:function(){
							console.log("즐겨찾기 해제 ajax 통신 실패");
						}
					})
				}
			}
		</script>

		<br><br>

		<div class="page-area">
			<c:if test="{ pi.currentPage ne 1 }">
				<c:choose>
					<c:when test="${ empty condition }">
						<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }">&lt;</a>
					</c:when>
					<c:otherwise>
						<a class="pagebtn" href="search.pj?cpage=${ pi.currentPage - 1 }">&lt;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ empty condition }">
						<a class="pagebtn" href="list.pj?cpage=${ p }">${ p }</a>
					</c:when>
					<c:otherwise>
						<a class="pagebtn" href="search.pj?cpage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>

			<c:if test="{ pi.currentPage ne pi.maxPage }">
				<c:choose>
					<c:when test="${ empty condition }">
						<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }">&gt;</a>
					</c:when>
					<c:otherwise>
						<a class="pagebtn" href="search.pj?cpage=${ pi.currentPage - 1 }">&gt;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
	</div>

</body>
</html>