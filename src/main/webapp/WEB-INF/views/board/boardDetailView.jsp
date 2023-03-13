<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#img {
    width: 30px;
    border-radius: 50%;
}
#aaa{
   list-style:none;
   line-height: 50px;
   }
textarea {
    width: 90%;
    height: 200px;
    border: none;
    resize: none;
    padding: auto;
  }
#span1{
    float: left;
    
}
#span2{
    float: right;
}
#btn{
    border-radius: 5px;
    border: 1px solid rgb(219, 219, 219);
    background-color: rgb(255, 255, 255);
    font-size: 13px;
	
}
#btn2{
	border-radius: 5px;
    border: 1px solid rgb(219, 219, 219);
    background-color: rgb(255, 255, 255);
    font-size: 15px;
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
	<p><b>게시글 상세보기</b></p> 
	<hr>
		<!-- 게시글 -->
		<input id="btn" type="button" value="뒤로가기" onClick="history.go(-1)" style="float: right; height: 25px;"> 
		<table>
		<ul id="aaa">
		    <li>
		       <b style="font-size: large;"><span name="boardTitle">${b.boardTitle }</span></b> 
		    </li>
		
		    <li>
		        <img id="img" src="arrow\이배추대표이사.jpg" alt="">
		        <span>
		            <b>${b.boardWriter }</b> 
		            대표이사
		        </span>
		        <span style="color: rgb(170, 170, 170);">${b.createDate }</span>
		    </li>
		
		    <li style="height: 200px;">
		        ${b.boardContent }
 
		    </li>
		
		    <li>
		        <div id="span1">
                 <c:choose>
	                 <c:when test="${ not empty b.originName }">
	                     <a href="${ b.changeName }" download="${ b.originName }">${ b.originName }</a>
	                    </c:when>
	                    <c:otherwise>
	                     첨부파일이 없습니다.
	                    </c:otherwise>
                 </c:choose> 
		        </div>
		        
		        <c:if test="${ loginUser.memberNo eq b.boardWriter }">
		        <div id="span2">
		        <button id="btn" class="btn-sm" onclick="postFormSubmit(1);">수정하기</button>  
		        <button id="btn" class="btn-sm" onclick="postFormSubmit(2);">삭제하기</button>  
		        </div>
				
				<form action="" method="post" id="postForm">
					<input type="hidden" name="no" value="${b.boardNo }">
					<input type="hidden" name="filePath" value="${b.changeName }">
				</form>
		
		    </li>
		</ul>
		</table>				
				<script>
					function postFormSubmit(num){
						if(num == 1){
							$("#postForm").attr("action", "updateForm.bo").submit();
						}else{
							$("#postForm").attr("action", "delete.bo").submit();
						}
					}
				</script>
		        </c:if>
		            
		            

		
		<!-- 댓글 -->
		<table id="replyArea" class="table" style="font-size: 13px;">
		    <thead>
		        <tr>
		           <td colspan="2" style="font-size: 13px;">
		            댓글 (<span id="rcount"></span>)
		            <a style="float: right; font-size: 13px;"href="">신고하기</a>
		        </td>
		        </tr>
		    </thead>
		    <tbody></tbody>  
		    <tfoot>
		    	<tr>
		            <th>
		                <textarea class="form-control" id="rcontent" cols="55" rows="2" style="resize:none; width:100%; height:60px;"></textarea>
		            </th>
		            <th style="vertical-align: middle"><button onclick="addReply();" id="btn2" class="btn-lg">등록하기</button></th>
		        </tr>
		    </tfoot> 
		    
		</table>
			
	</div>
	
	 <script>
    	$(function(){
    		selectReplyList();
    	})
    	
    	function addReply(){ 
    		
    		if($("#rcontent").val().trim().length > 0){ 
    			
    			$.ajax({
    				url:"rinsert.bo",
    				data:{
    					replyContent:$("#rcontent").val(),
    					memberNo:${loginUser.memberNo},
    					postNo:${b.boardNo}
    				},success:function(result){
    					if(result == "success"){
    						$("#rcontent").val("");
    						selectReplyList();
    					}
    				},error:function(){
    					console.log("댓글 작성용 ajax 통신 실패");
    				}
    			})
    			
    			
    		}else{
    			alertify.alert("댓글 작성 후 등록 요청해주세요");
    		}
    			
    	}
    	
    	function selectReplyList(){
    		$.ajax({
    			url:"rlist.bo",
    			data:{no:${b.boardNo}},
    			success:function(list){
    				console.log(list);
    				
    				let value = "";
					for(let i=0; i<list.length; i++){
						value += "<tr>"
								+ "<td>"
								+ "<span>" + "<b>" + list[i].memberNo + "</b>" + "</span>"
								+ "&nbsp;"
								+ "<span>" + list[i].createDate + "</span>"
								+ "<br><br>"
								+ "<p>" + list[i].replyContent + "</p>"
								+ "</td>"
								+ "</tr>";
					}
    				
    				$("#replyArea tbody").html(value);
    				$("#rcount").text(list.length);
    				
    			},error:function(){
    				console.log("댓글리스트 조회용 ajax 통신 실패");
    			}
    		})
    	}
    </script>
</body>
</html>