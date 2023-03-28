<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
.notice{
    background-color: rgb(247, 247, 247);
	border-radius: 5px;
    width: 48%;
    height: 600px;
    flex:1;
    padding: 30px;
            
}
.board{
    background-color: rgb(247, 247, 247);
	border-radius: 5px;
    width: 48%;;
    height: 600px;
    flex:1;
    padding: 30px;    
}
tbody{
    list-style:none;
    font-size: 15px;
    line-height: 50px;
}
.a {
	color: rgb(221, 221, 221);

}
h5 > a {
	font-weight:600;
}
table{
	background-color: white;
	font-size:small;
}
#tablecontent{
	font-size: 13px;
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
	    <div class="notice" style="display: inline-block"> 
    		<br>
				<table id="noticeList" class="table table-hover" style="text-align: center; margin-top: 30px;">
					<h5 align="center"><a href="nlist.bo">공지사항</a></h5>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						  </tr>
					</thead>
					<tbody id="tablecontent">
					</tbody>
				</table>
	    </div>

    &nbsp;&nbsp;&nbsp;

	    <div class="board" style="display: inline-block">
	        <br>
				<table id="boardList" class="table table-hover" style="text-align: center; margin-top: 30px;">
					<h5 align="center"><a href="list.bo">자유게시판</a></h5>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						  </tr>
					</thead>
					<tbody id="tablecontent">
					</tbody>
				</table>
			</div>
		</div>
	
            <script>
            	$(function(){
            		
            		mainNoticeList();
            		
            		$(document).on("click", "#noticeList>tbody>tr", function(){
            			location.href = 'detail.bo?no=' + $(this).children().eq(0).text();
            		})
            	})
            	
            	function mainNoticeList(){
            		$.ajax({
            			url:"mainList.no",
            			success:function(list){
            				console.log(list);
            				
            				let value = "";
            				for(let i=0; i<list.length; i++){
            					let n = list[i];
            					value += "<tr>" 
            							+ '<td>' + n.boardNo + "</td>"
            							+ "<td>";
            							if(n.originName != null){
            								value += "📁";
            							}
            							value += n.boardTitle + "</td>" 
            							+ "<td>" + n.name + n.jobName + "</td>" 
            							+ "<td>" + n.createDate + "</td>"
            							+ "</tr>";
            						
            					
            				}
            				
            				$("#noticeList tbody").html(value);
            			},error:function(){
            				console.log("메인 게시글 조회용 ajax 통신실패");
            			}
            			
            		})
            	}
            	
            </script>
            
            <script>
            	$(function(){
            		
            		mainBoardList();
            		
            		$(document).on("click", "#boardList>tbody>tr", function(){
            			location.href = 'detail.bo?no=' + $(this).children().eq(0).text();
            		})
            	})
            	
            	function mainBoardList(){
            		$.ajax({
            			url:"mainList.bo",
            			success:function(list){
            				console.log(list);
            				
            				let value = "";
            				for(let i=0; i<list.length; i++){
            					let b = list[i];
            					value += "<tr>" 
            							+ '<td>' + b.boardNo + "</td>"
            							+ "<td>";
            							if(b.originName != null){
            								value += "📁";
            							}
            							value += b.boardTitle + "</td>" 
            							+ "<td>" + b.name + b.jobName + "</td>" 
            							+ "<td>" + b.createDate + "</td>"
            							+ "</tr>";
            						
            					
            				}
            				
            				$("#boardList tbody").html(value);
            			},error:function(){
            				console.log("메인 게시글 조회용 ajax 통신실패");
            			}
            			
            		})
            	}
            	
            </script>
</body>
</html>