<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
.notice{
    background-color: rgb(247, 247, 247);
    width: 45%;
    height: 600px;
    flex:1;
    padding: 30px;
            
}
.board{
    background-color: rgb(247, 247, 247);
    width: 45%;;
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
	color: rgb(247, 247, 247);

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
    		
				<table id="noticeList">
					<thead>
						<h3 align="center"><a href="nlist.bo">공지사항</a></h3>
					</thead>
					<tbody>
					</tbody>
				</table>
	    </div>

    &nbsp;&nbsp;&nbsp;

	    <div class="board" style="display: inline-block">
	        
				<table id="boardList">
					<thead>
						<h3 align="center"><a href="list.bo">자유게시판</a></h3>
					</thead>
					<tbody>
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
            							+ '<td class="a">' + n.boardNo + "</td>"
            							+ "<td>" + "&nbsp;&nbsp;" + n.boardTitle + "</td>" 
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
            							+ '<td class="a">' + b.boardNo + "</td>"
            							+ "<td>" + "&nbsp;&nbsp;" + b.boardTitle + "</td>" 
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