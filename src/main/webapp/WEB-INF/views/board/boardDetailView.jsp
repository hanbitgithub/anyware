<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
#replyContent{
	resize: none;
	background-color: white;
	height: 30px;
	border: none;
}
#like-btn{
	border: none;
	background-color: rgba(255, 255, 255, 0);
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
		<c:choose>
			<c:when test="${b.category eq '5' }">
				<button id="btn" type="button"  onclick="location.href='list.bo'" style="float: right; height: 25px;">목록</button>
			</c:when>
			<c:when test="${b.category eq '6' }">
				<button id="btn" type="button" onclick="location.href='nlist.bo'" style="float: right; height: 25px;">목록</button>
			</c:when>
			<c:otherwise>
				<button id="btn" type="button" onclick="location.href='glist.bo'" style="float: right; height: 25px;">목록</button>
			</c:otherwise>	
		</c:choose>
		
		<table>
		<ul id="aaa">
		    <li>
		       <b style="font-size: large;"><span name="boardTitle">${b.boardTitle }</span></b>
		       &nbsp; 
					<c:if test="${not empty b.likeDate }">
					<span class="like" onclick="like(this);">❤️</span>
					<input type="hidden" name="boardNo" value="${b.boardNo }">
					</c:if>
					<c:if test="${ empty b.likeDate }">
					<span class="like" onclick="like(this);">🤍</span>
					<input type="hidden" name="boardNo" value="${b.boardNo }">
					</c:if>
		       
		    </li>
	<script>
	
	function like(e){
		event.stopImmediatePropagation();

		if(e.innerHTML == "🤍"){
			$.ajax({
				url:"like.bo",
				type:"post",
				data:{boardNo:${b.boardNo}},
				success:function(result){
					if(result == "success"){
						$(e).text("❤️");
					}
				},
				error:function(){
					console.log("즐겨찾기 추가 ajax 통신 실패");
				}
			})
		} else {
			$.ajax({
				url:"unlike.bo",
				type:"post",
				data:{boardNo:${b.boardNo}},
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
		    <li>
		        
		        <span>
		            <b>${ b.name }</b> 
		            ${ b.jobName }
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
		            <c:if test="${b.category != '6' }">
		            <a style="float: right; font-size: 13px;"href="" data-toggle="modal" data-target="#myModal">신고하기</a>
		            </c:if>
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
		// 댓글리스트조회
    	function selectReplyList(){
    		$.ajax({
    			url:"rlist.bo",
    			data:{no:${b.boardNo}},
    			success:function(list){
    				console.log(list);
    				
    				let value = "";
					for(let i=0; i<list.length; i++){
    				if('${loginUser.name}' == list[i].name){
								value += "<tr>"
								+ "<td>"
								+ "<span>" + "<b>" + list[i].name + "</b>" + "&nbsp;" + list[i].jobName + "</span>"
								+ "&nbsp;"
								+ "<span>" + list[i].createDate + "</span>"
								+ "<br><br>"
								+ "<div id='replyarea'>"
								+ "<input type='hidden' name='reply-no' value='"+ list[i].replyNo +"'>"
								+ "<p readonly>" + list[i].replyContent + "</p>" + "<br>"
								+ "<a onclick='dis()' style='color:gray;'>수정</a>" + '&nbsp;' + "<a style='color:gray;' onclick='deleteReply(" + list[i].replyNo + ");'>삭제</a>"
								+ "</div>"
								// 수정창
								+ "<div id='replyarea1' style='display:none'>"
								+ "<input type='hidden' name='reply-no' value='"+ list[i].replyNo +"'>"
								+ "<textarea rows='4' cols='95' style='resize:none;' name='replyContent'>" + list[i].replyContent + "</textarea>" + "<br>"
								+ "<button id='btn'>등록</button>"
								+ "</div>"
						}else{
										value += "<tr>"
										+ "<td>"
										+ "<span>" + "<b>" + list[i].name + "</b>" + "&nbsp;" + list[i].jobName + "</span>"
										+ "&nbsp;"
										+ "<span>" + list[i].createDate + "</span>"
										+ "<br><br>"
										+ "<p>" + list[i].replyContent + "</p>"
										+ "</td>"
										+ "</tr>";
						}
					}
    				
    				$("#replyArea tbody").html(value);
    				$("#rcount").text(list.length);
    				
    			},error:function(){
    				console.log("댓글리스트 조회용 ajax 통신 실패");
    			}
    		})
    	}
		
    	 function dis(){
             if($('#replyarea').css('display') == 'none'){
             $('#replyarea').show();
             $('#replyarea1').hide();
         }else{
             $('#replyarea').hide();
             $('#replyarea1').show();
         }
         }
            
		
    	$(function(){
    		$(document).on("click", "#replyarea1 #btn", function(){
    			updateReply($(this).prev().prev().val(), $(this).prev().val());
    		})
    	})
    	// 댓글수정
    	function updateReply(no, content){
    	  $.ajax({
    	      url:"update.re",
    	      data:{ replyNo:no,
    	    	  replyContent:content
    	      },
    				type:"post",
    	        success:function(result){
    	        	if(result>0){	
    	        		
    	        		selectReplyList();
    	        		alert("성공적으로 수정되었습니다.");
    	        		
    	        			}else{			
    	        				
    	        			alert("댓글 등록 실패");
    	        			}
    	        	
    	        		}, error:function(){
    	        		 console.log("댓글수정용 ajax 통신실패")
    	        			}
    	        		})
    	        	}
    	
		
		
		// 댓글작성
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
    	
    </script>

    <script>

   
	$(function(){
		selectReplyList();
	}) 
	function deleteReply(replyNo){
		$.ajax({
			url:"delete.re",
			data:{no:replyNo},
			success:function(result){
				
				console.log(result);
				
				if(result>0){	
					selectReplyList();
					alert("성공적으로 삭제되었습니다.");
				} else {			
					alert("댓글 삭제 실패");
				}
				
			},error:function(){
				console.log("ajax 댓글 삭제 실패")
			}
		})
	}

    </script>
    
           <!-- 신고 모달 -->
        <div class="modal" id="myModal" style="color:rgb(50, 50, 50);">
            <div class="modal-dialog">
                <div class="modal-content" style="padding:30px 20px;">
        
                    <!-- Modal Header -->
                    <div class="modal-header" style="justify-content: left;">
                        <h5 class="modal-title" style="font-weight:600;">신고하기</h5>
                    </div>
        
                    <!-- Modal body -->
        			<form id="insertReport" action="insert.rp" method="post">
                    <div class="modal-body" style="color:gray; font-size:13px;">
                   	<input type="hidden" name="postNo" value="${b.boardNo }">
                   	<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
                    
                    	
                        <br>
                        ※ 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니<br> 
						&nbsp;&nbsp;&nbsp;  유의하시어 신중하게 신고해 주세요. <br>
                        
                        <br>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report1" name="reportContent" value="스팸홍보 / 도배글입니다.">
                            <label for="report1">
                                <b style="color:rgb(50, 50, 50)">스팸홍보 / 도배글입니다.</b> 
                            </label>
                        </div>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report2" name="reportContent" value="음란물입니다.">
                            <label for="report2">
                                <b style="color:rgb(50, 50, 50)">음란물입니다.</b>
                            </label>
                        </div>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report3" name="reportContent" value="불법정보를 포함하고 있습니다.">
                            <label for="report3">
                               <b style="color:rgb(50, 50, 50)">불법정보를 포함하고 있습니다.</b>
                            </label>
                        </div>
                        <div style="margin-bottom:10px;">
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report4" name="reportContent" value="개인정보 노출 게시물입니다.">
                            <label for="report4">
                                <b style="color:rgb(50, 50, 50)">개인정보 노출 게시물입니다.</b>
                            </label>
                        </div>
                        <div>
                            <input type="radio" style="margin-right:10px; vertical-align:middle;" id="report5" name="reportContent" value="욕설/생명경시/혐오/차별적 표현입니다.">
                            <label for="report5">
                                <b style="color:rgb(50, 50, 50)">욕설/비방/혐오/차별적 표현입니다.</b>
                            </label>
                        </div>

                    	<hr>
                        
                        <br>
                        <button type="submit" id="btn" style="float: right;" class="btn-lg">제출</button>
        
                    </div>
        				</form>
                </div>
            </div>
        </div>

        <script>
            $(function(){
                $("#myModal button").click(function(){
                    alert("신고가 접수되었습니다.");
                })
            })
        </script>
        
        	
			  
			
		  
		
		
	  
</body>
</html>