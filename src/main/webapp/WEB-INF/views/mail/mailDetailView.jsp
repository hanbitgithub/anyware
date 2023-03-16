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
                    <a href=""><img src="resources/images/send (1).png"width="20"> 답장</a>
                    <a href=""><img src="resources/images/next.png"width="20"> 전달</a>
                    <a href=""><img src="resources/images/delete.png"width="20"> 휴지통</a>
              <!--       <a href=""><img src="resources/images/no-spam.png"width="20"> 스팸차단</a> -->
                    <a href=""><img src="resources/images/back.png"width="20"> 목록으로</a>
                    
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
	                                		<img src="${a.changeName}" width="20px"> &nbsp;<a href="${a.changeName }" download="${a.originName}">${a.originName} </a>&nbsp;&nbsp;
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
                   
                    

                </div>

            </div>

            
        </div>
	
	

</body>
</html>