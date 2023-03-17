<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
table{
    margin-top: 13px;
    text-align: center;
}
.button {
    border-radius: 5px;
    border: 1px solid rgb(221, 221, 221);
    font-size: 14px;
    margin-top: 13px;
    height: 25px;
}
.page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	margin-left:0;
}
.page_nation .prev {
	margin-right:7px;
}
.page_nation .next {
	margin-left:7px;
}
.page_nation .nnext {
	margin-right:0;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
</style>    
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/boardmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	<p><b>자유게시판</b></p>
	<hr>
	<div class="">
		<form action="">
            <select name="" id="" class="button">
              <option value="전체">전체</option>
              <option value="제목">제목</option>
              <option value="작성자">작성자</option>
            </select>
            <input type="text" name="keyword" class="button" placeholder="제목으로 검색하기">
            <button type="submit" class="button">검색</button>
        </form>

            <table id="boardList" class="table table-hover" align="center">
              <thead>
              <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody style="border: white">
                <c:forEach var="b" items="${ list }">
                <tr>
                  <td class="bno" >${ b.boardNo }</td>
                  <td>
                  	<c:if test="${ not empty b.originName }">
	                  📁
	                </c:if>
                  	${ b.boardTitle }
                  </td>
                  <td>${ b.name } ${ b.jobName }</td>
                  <td>${ b.createDate }</td>
                  <td>${ b.count }</td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
            
            <script>
            	$(function(){
            		$("#boardList>tbody>tr").click(function(){
            			location.href = 'detail.bo?no=' + $(this).children(".bno").text();
            		})
            	})
            </script>
            <br><br><br>

			
            <div class="page_wrap">
              <div class="page_nation">
                <c:choose>
	              	<c:when test="${pi.currentPage eq 1 }">
                    <a class="arrow prev" href="#" disabled>이전</a>
                  </c:when>
                  <c:otherwise>  
                    <a class="arrow prev" href="list.bo?cpage=${pi.currentPage-1 }">이전</a>
                  </c:otherwise>
                  </c:choose>
                  
                  <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">    
                    <a class="" href="list.bo?cpage=${ p }">${ p }</a>
                  </c:forEach>
                  
                  <c:choose>
                    <c:when test="${pi.currentPage eq pi.maxPage }"> 
                   <a class="arrow next" href="#">다음</a>
                     </c:when>
                     <c:otherwise>
                   <a class="arrow next" href="list.bo?cpage=${ pi.currentPage + 1 }">다음</a>
                      </c:otherwise>
                </c:choose>   
                </div>
              </div>
               
	
	</div>
</body>
</html>