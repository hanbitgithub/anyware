<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*메일*/
#btn-area a{
    color: black;
    font-weight: 600;
    font-size: 15px;
    margin-right: 10px;
}
#btn-area a:hover{
 color: #7c7c7c;
 text-decoration: none;
 cursor:pointer;
}


#send-area{
    margin-left: 50px;
}
.emContent{
	width: 1200px;
	/* height: 500px; */
    /* border: 1px solid rgb(202, 202, 201);
    border-radius: 5px; */
    padding: 20px 30px;
}

/* #fileArea{
 	background-color :rgb(239, 239, 239);
}

 */
</style>
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	
      <div class="content">
          <b style="font-size: 18px;">${title }</b>
          <br><br> 

            <div id="send-area">
                <div id="btn-area">
                    <a onclick="replyEm();"><img src="resources/images/send (1).png"width="20"> 답장</a>
                  
                    <a id="forward"><img src="resources/images/next.png"width="20"> 전달</a>
                    
                    <c:choose>
                    <c:when test="${box eq 5}">
                    	<a onclick="deleteEm();"><img src="resources/images/delete.png"width="20"> 영구삭제</a>
                    </c:when>
                    <c:otherwise>
                    	 <a onclick="deleteEm();"><img src="resources/images/delete.png"width="20"> 휴지통</a>
                    </c:otherwise>
                    </c:choose>
                   
              <!--       <a href=""><img src="resources/images/no-spam.png"width="20"> 스팸차단</a> -->
                    <a onclick="goBack();"><img src="resources/images/back.png"width="20"> 목록으로</a>
                   <script>
					function goBack() {
					  history.back();
					}
					</script>
                </div>
                <br>
                <div>
                    <table id="send"style="font-size: 15px;" >
                        <tr>
                            <th colspan="2" height="40px" style="font-size: large;">
                            <c:choose>
                				<c:when test="${m.mailStatus.important eq 'N' }">
                					<img src="resources/images/award.png" width="20" class="star" data-emNo="${r.emNo }">    					
                				</c:when>
                				<c:otherwise>
                					<img src="resources/images/star.png" width="20" class="star" data-emNo="${r.emNo }">
                				</c:otherwise>	
                			</c:choose>
                            &nbsp;${m.emTitle} </th>
                            
                        </tr>
                        <tr>
                            <td colspan="2"  height="30px" style="font-size: 13px;">
                            ${m.sendDate }</td>
                        </tr>
                        <tr>
                            <th width="120" height="35px">보낸사람</th>
                            <td>
                            <c:choose>
	                            <c:when test="${m.sender eq loginUser.memberId }">
	                            	${m.memName }
	                            </c:when>
	                            <c:otherwise>
	                           		 ${m.memName} ${m.sender }@anyware.com </td>
	                            </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <th  width="120" height="35px">받는사람</th>
                            <td> ${m.receivers}</td>
                        </tr>
                        <c:if test="${not empty m.refEmail  }">
                         <tr>
                            <th  width="120" height="35px">참조</th>
                            <td>${m.refEmail }</td>
                        </tr>
                        </c:if>
						
                        <tr>
                           <%--  <th height="40px">보낸날짜</th>
                            <td>
                            	
                            	<c:choose>
	                                <c:when test="${m.mailFile.atcount >0 }">
	                                	<c:forEach var="a" items="${m.fileList}">
	                                		 <a href="${a.changeName }" download="${a.originName }">${a.originName}</a>
	                                	</c:forEach>
	                                </c:when>
	                                <c:otherwise>
	                                첨부파일이 없습니다.
	                                </c:otherwise>
                                </c:choose>
                            </td> --%>
                          
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                            
                            <hr>
                          		
                            	<c:choose>    
	                                <c:when test="${m.atcount>0 }">	           		 
	                                	첨부파일 : ${fn:length(m.fileList) }개 
	                                	<br>
	                                	<div id="fileArea">
	                                	<c:forEach var="a" items="${m.fileList }">
	                                		<img src="${a.changeName}" width="20px" onerror="this.src='resources/images/docs.png';" this.alt='PDF 아이콘'"> &nbsp;<a href="${a.changeName }" download="${a.originName}">${a.originName} </a>&nbsp;&nbsp;
	                                		<c:set var="fileSizeInKB" value="${a.fileSize div 1024}"/>
	                                		 (<fmt:formatNumber value="${a.fileSize div 1024}" pattern="#,##0.00"/> KB)

	                                		<br>
	                                	</c:forEach>
	                                	</div>
	                                	<hr>
	                                </c:when>
	                                
	                                <c:otherwise>
	                               <!--  첨부파일이 없습니다. -->
	                                </c:otherwise>
                                </c:choose>
                               
                                <div class="emContent">${m.emContent }
                                </div>
                            </td>
                        </tr>
                        
                       

                    </table>
                    
                    <form id="mailDetail" action="" method="post">
						<input type="hidden" name="emNo" id="detailNo" value="${m.emNo }">
						<input type="hidden" name="emType" value="${m.mailStatus.emType}">
						<input type="hidden" name="receiver" value="${m.mailStatus.receiver}">
					    <input type="hidden" name="sender" value="${m.sender }">
					    <input type="hidden" name="box" value="${box }">
					</form>
                   
                   
                    <script>
                    //메일 답장하기 버튼 클릭시 
                    function replyEm(){
       					$("#mailDetail").attr("action", 'reply.em').submit();

                    }     
                    </script>
                    
                    <script>
                    $("#forward").click(function(){
                    	$("#mailDetail").attr("action", 'forward.em').submit();
                    })

                    </script>
                    
                   
                    
                    <script>
                    $(function(){
                    	console.log("emNo:"+ $("input[name=emNo]").val());
                    	console.log("emType:"+ $("input[name=emType]").val());
                    	console.log("receiver :"+$("input[name=receiver]").val());
                    	console.log("sender :"+ $("input[name=sender]").val());
                    	console.log("box:" +$("input[name=box]").val());
                    })
                    </script>
                    
                    
                <script>
                //메일 삭제 클릭시 
                function deleteEm(){

				let emNo = $("input[name=emNo]").val();
				let emType =  $("input[name=emType]").val();
				let box = '${box}';
				
				// --------- 휴지통에서 삭제하는 경우 -----------
				if(box == '5'){
					
					if(confirm("휴지통의 메일을 지우면 지워진 메일들은 복구할 수 없습니다.\n 메일을 삭제하시겠습니까?")){
					$.ajax({
						url : "removeMail.em",
						data : {
							sender : '${loginUser.memberId}',
							receiver : '${loginUser.memberId}',
							emNo : emNo,
							emType : emType
						},
						success : function(result){
							console.log(result);
							if(result == 'success'){
								 location.href="trash.em";
							}		
						},
						error : function(){
							console.log("메일 삭제 실패");
						}
					})	
				}

				} else {
				// --------- 휴지통 외에서 삭제하는 경우 -----------
					$.ajax({
						url : "deleteMail.em",
						data : {
							sender : '${loginUser.memberId}',
							receiver : '${loginUser.memberId}',
							emNo : emNo,
							emType : emType
						},
						success : function(result){
							console.log(result);
							if(result == 'success'){
								switch(box){
								case "0" : location.href="sendbox.em"; break; 
								case "1" : location.href="receivebox.em"; break;
								case "2" : location.href="important.em"; break;
								case "3" : location.href="sendToMebox.em"; break;
								case "4" : location.href="storage.em"; break;
								
								}
								
								alert("메일이 휴지통으로 이동되었습니다.");
							}	
						},
						error : function(){
							console.log("메일 삭제 실패");
						}
					})
				}
			}
                    
                    
                    </script>

                </div>

            </div>

            
        </div>
	
	

</body>
</html>