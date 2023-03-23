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
	#none{
		margin-top: 50px;
		font-size: 25px;
		text-align: center;
	}
	.title{
		font-size: 40px;
		font-weight: bold;
	}
</style>
</head>
<body>
	
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/projectmenu.jsp"></jsp:include>

	<div class="content">
		<c:choose>
			<c:when test="${ category eq 'all' || category eq 'all-search' }">
				<div class="title">전체 프로젝트</div>
			</c:when>
			<c:when test="${ category eq 'my' || category eq 'my-search' }">
				<div class="title">참여한 프로젝트</div>
			</c:when>
			<c:when test="${ category eq 'like' || category eq 'like-search' }">
				<div class="title">즐겨찾기</div>
			</c:when>
		</c:choose>
		<br>
		
		<div class="search-area">
			<form action="list.pj">
				<c:choose>
					<c:when test="${ category eq 'all' || category eq 'all-search' }">
						<input type="hidden" name="category" value="all-search">
					</c:when>
					<c:when test="${ category eq 'my' || category eq 'my-search' }">
						<input type="hidden" name="category" value="my-search">
					</c:when>
					<c:when test="${ category eq 'like' || category eq 'like-search' }">
						<input type="hidden" name="category" value="like-search">
					</c:when>
				</c:choose>
				<select name="condition" id="condition">
					<option value="title">프로젝트명</option>
					<option value="participant">참여자</option>
				</select>
				<input type="search" placeholder="Search Project" id="search-project" name="keyword" required>
				<button type="submit" class="btn btn-primary" id="searchbtn">검색</button>
			</form>
		</div>

		<script>
        	document.querySelector("#condition option[value=${ condition }]").selected = true;
			document.querySelector("input[type=search]").value = "${ keyword }";
        </script>

		<br><br>

		<div class="project-area">
			<c:if test="${ empty list }">
				<div id="none">조회된 프로젝트가 없습니다.</div>
			</c:if>

			<c:forEach var="l" items="${ list }">
				<div class="project" onclick="goDetail(this);">
					<div class="project-name">${ l.projectTitle }</div>
					<c:choose>
						<c:when test="${ l.publicStatus eq 'Y' }">
							<div class="public">🔓</div>
						</c:when>
						<c:otherwise>
							<div class="public">🔒</div>
						</c:otherwise>
					</c:choose>
					<input type="hidden" value="${ l.projectNo }">
					<c:choose>
						<c:when test="${ l.count ne 1 }">
							<div class="project-people">${ l.owner } 외 ${ l.count - 1 }명</div>
						</c:when>
						<c:otherwise>
							<div class="project-people">${ l.owner }</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${ l.like eq '1' }">
							<div class="favorite" onclick="clickHeart(this);">💙</div>
							<input type="hidden" class="projectNo" value="${ l.projectNo }">
						</c:when>
						<c:otherwise>
							<div class="favorite" onclick="clickHeart(this);">🤍</div>
							<input type="hidden" class="projectNo" value="${ l.projectNo }">
						</c:otherwise>
					</c:choose>
					<input type="hidden" class="participation" value="${ l.participation }">
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

			function goDetail(e){
				let $lock = $(e).children().eq(1).text();
				let $projectNo = $(e).children().eq(2).val();
				let $pp = $(e).children(".participation");
				if($lock == '🔓'){
					location.href='detail.pj?projectNo=' + $projectNo;
				} else {
					if($pp.val() == 1){
						location.href='detail.pj?projectNo=' + $projectNo;
					} else {
						$(".requestModal").click();
						$("#no").val($projectNo);
					}
					
				}
			}
		</script>

		<br><br>

		<div class="page-area">
			<c:if test="${ pi.currentPage ne 1 }">
				<c:choose>
					<c:when test="${ empty condition }">
						<c:choose>
							<c:when test="${ category == 'all' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }&category=all">&lt;</a>
							</c:when>
							<c:when test="${ category == 'my' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }&category=my">&lt;</a>
							</c:when>
							<c:when test="${ category == 'like' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }&category=like">&lt;</a>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ category == 'all-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }&category=all-search">&lt;</a>
							</c:when>
							<c:when test="${ category == 'my-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }&category=my-search">&lt;</a>
							</c:when>
							<c:when test="${ category == 'like-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }&category=like-search">&lt;</a>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ empty condition }">
						<c:choose>
							<c:when test="${ category == 'all' }">
								<a class="pagebtn" href="list.pj?cpage=${ p }&category=all">${ p }</a>
							</c:when>
							<c:when test="${ category == 'my' }">
								<a class="pagebtn" href="list.pj?cpage=${ p }&category=my">${ p }</a>
							</c:when>
							<c:when test="${ category == 'like' }">
								<a class="pagebtn" href="list.pj?cpage=${ p }&category=like">${ p }</a>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ category == 'all-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ p }&condition=${ condition }&keyword=${ keyword }&category=all-search">${ p }</a>
							</c:when>
							<c:when test="${ category == 'my-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ p }&condition=${ condition }&keyword=${ keyword }&category=my-search">${ p }</a>
							</c:when>
							<c:when test="${ category == 'like-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ p }&condition=${ condition }&keyword=${ keyword }&category=like-search">${ p }</a>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
				
			</c:forEach>

			<c:if test="${ pi.maxPage ne 0 and pi.currentPage ne pi.maxPage }">
				<c:choose>
					<c:when test="${ empty condition }">
						<c:choose>
							<c:when test="${ category == 'all' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage + 1 }&category=all">&gt;</a>
							</c:when>
							<c:when test="${ category == 'my' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage + 1 }&category=my">&gt;</a>
							</c:when>
							<c:when test="${ category == 'like' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage + 1 }&category=like">&gt;</a>
							</c:when>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${ category == 'all-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }&category=all-search">&gt;</a>
							</c:when>
							<c:when test="${ category == 'my-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }&category=my-search">&gt;</a>
							</c:when>
							<c:when test="${ category == 'like-search' }">
								<a class="pagebtn" href="list.pj?cpage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }&category=like-search">&gt;</a>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>

		<button type="button" class="btn btn-primary requestModal" data-toggle="modal" data-target="#requestModal" style="display: none;"></button>

	</div>

	<div class="modal" id="requestModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body" style="text-align: center; font-size: 20px;">
						<br>
						<div>비공개 프로젝트입니다.</div>
						<div>프로젝트 참여 요청을 하시겠습니까?</div>
						<br>
						<input type="hidden" id="no" value="">
					<button type="button" class="btn btn-primary" onclick="addRequest();">요청</button>
					<button type="button" class="btn btn-danger closebtn" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		let p = document.querySelectorAll(".pagebtn");
		for(let i=0; i<p.length; i++){
			if(p[i].innerHTML == ${pi.currentPage}){
				p[i].style.backgroundColor = "#7291f6";
				p[i].style.color = "white";
			}
		}

		function addRequest(e){
			$(".closebtn").click();
			$.ajax({
				url:"addrequest.ajax",
				data:{projectNo:$("#no").val()},
				success:function(result){
					if(result == 'success'){
						alert("참여 요청이 완료되었습니다.");
					} else if(result == 'already') {
						alert("이미 참여요청 된 프로젝트입니다.");
					} else {
						alert("참여 요청에 실패했습니다.");
					}
				},
				error:function(){
					console.log("참여 요청용 ajax 통신 실패");
				}
			})
		}
	</script>

</body>
</html>