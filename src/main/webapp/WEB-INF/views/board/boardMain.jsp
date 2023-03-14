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
#ul{
    list-style:none;
    font-size: 15px;
    line-height: 50px;
}
#ul > li > a{
    color: black;
    
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
	    <div id="boardList" class="notice" style="display: inline-block"> 
    		<h3 align="center"><a href="list.bo">자유게시판</a></h3>
		        <ul id="ul" id="blist">

		        </ul>    
	
	    </div>

    &nbsp;&nbsp;&nbsp;

	    <div id="boardList" class="board" style="display: inline-block">
	        <h3 align="center"><a href="nlist.bo">공지사항</a></h3>
	        <ul id="ul">

	        </ul>
	        
			</div>
		</div>
	
            <script>
            	$(function(){
            		
            		mainBoardList();
            		
            		$("#boardList > ul > li").click(function(){
            			location.href = 'detail.bo?no=' + $(this).children(".bno").text();
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
            					value += "<li>" + '<input type="hidden" class="bno" value="' + b.boardNo + '">' + b.boardTitle + "</li>" ;
            						
            					
            				}
            				
            				$("#boardList ul").html(value);
            			},error:function(){
            				console.log("메인 게시글 조회용 ajax 통신실패");
            			}
            			
            		})
            	}
            	
            </script>
</body>
</html>