<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/*메일*/
#navbarSupportedContent li{
    font-size: 15px;
    color:black;
    font-weight: 600;
    margin-left: 5px;

}
.dropdown-menu>li a{
    font-size: 13px;
}

.table tr:hover{
	background-color: rgb(250, 249, 249);
}

#search{ 
	width:250px;
}



/*페이징*/
#paging-area button{
    border: none;
    border-radius: 5px;
    font-size: 13px;
    
}
#paging-area button:hover{
    background-color: rgb(212, 211, 211)
    
}


</style>

<body>

	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
		 <b style="font-size: 18px;"> 보낸메일함</b>
            <br><br><br>

            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                             <img src="resources/images/email2.png" width='15px' alt=""> 읽음
                            </a>
                            <ul class="dropdown-menu" style="font-size: 12px;">
                              <li><a class="dropdown-item" href="#">읽음으로 표시</a></li>
                              <li><a class="dropdown-item" href="#">안읽음으 로표시</a></li>
                              
                            </ul>
                          </li>
                          
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">
                            <img src="resources/images/bin.png" width='15px' alt="">
                            삭제</a>
                      </li>
                     
                      <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="resources/images/send (1).png" width='15px' alt="">
                            재발송</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="resources/images/next.png" width='15px' alt="">
                            전달</a>
                      </li>
                       <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="resources/images/cancel.png" width='18px' alt="">
                            회수</a>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="resources/images/outbox.png" width='15px' alt="">
                            이동
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="#">받은메일함</a></li>
                          <li><a class="dropdown-item" href="#">보낸메일함</a></li>
                          <li><a class="dropdown-item" href="#">임시저장함</a></li>
                          <li><a class="dropdown-item" href="#">스팸메일함</a></li>
                          <li><a class="dropdown-item" href="#">휴지통</a></li>
                        </ul>
                      </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="resources/images/filter.png" width='15px' alt="">
                            필터
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="#">안읽은메일</a></li>
                          <li><a class="dropdown-item" href="#">중요메일</a></li>
                          <li><a class="dropdown-item" href="#">첨부메일</a></li>
                        
                        </ul>
                      </li>
                      
                    </ul>
                    <form class="d-flex" role="search">
                      <input class="form-control form-control-sm me-2" id="search"type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                      <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                    </form>
                  </div>
                </div>
              </nav>

              <table class="table">
               <!--  <tr style="font-size: 14px; font-weight: bold;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="25"><img src="resources/images/award.png" width="18" class="star"></td>
                    <td width="25"><img src="resources/images/envelope2.png" width="17" class="envelope"></td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50"><img src="resources/images/paper-clip.png" width="16"></td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr> -->
               <c:choose>
                	<c:when test="${ empty slist }">
                		<tr align="center">
                			<td colspan="7">보낸 메일함이 비어있습니다.</td>
                		</tr>
                	</c:when>
                	
                	<c:otherwise>
                		<c:forEach var="s" items="${slist }">
                			<c:choose>
                				<c:when test="${s.mailStatus.read eq 'Y' }">
			                		<tr style="font-size: 14px;"> 
			                			<td width="20"><input type="checkbox" value="${s.emNo }"></td>
			                			<td width="25">
			                				<c:choose>
			                				<c:when test="${s.mailStatus.important eq 'N' }">
			                					<img src="resources/images/award.png" width="18" class="star">
			                				</c:when>
			                				<c:otherwise>
			                					<img src="resources/images/star.png" width="18" class="star">
			                				</c:otherwise>	
			                			</c:choose>
			                			
			                			</td>
			                			<td width="25"><img src="resources/images/envelope.png" width="17" class="envelope"></td>
			                			<td width="150">
			                			<c:set var="r" value="${s.receivers}"/>
			                			
									    <c:choose>
									      <c:when test="${not empty receivers}">
									        <c:set var="emails" value="${fn:split(receivers, ',')}" />
									       		 <c:forEach var="name" items="${names}" varStatus="loop">
											      <c:if test="${loop.index < 2}">
											        ${fn:trim(fn:substringBefore(name, ' '))}
											        <c:if test="${loop.index < fn:length(names)-1}">, </c:if>
											      </c:if>
											      <c:if test="${loop.index == 2}">
											        ..
											      </c:if>
											    </c:forEach>
									        </c:when>
									     </c:choose>   
			                			</td>
			                			<td width="700">${s.emTitle }</td>
			                			<td width="50">
			                				
			                				<c:if test="${not empty s.emfNo}">
			                					<img src="resources/images/paper-clip.png" width="16">
			                				</c:if>
			                			</td>	
			                			<td>${s.sendDate }</td>	
			                		</tr>
	                			</c:when>
	                			<c:otherwise>
	                				<tr style="font-size: 14px; font-weight: bold"> 
			                			<td width="20"><input type="checkbox" value="${s.emNo }"></td>
			                			<td width="25">
			                			<c:choose>
			                				<c:when test="${s.mailStatus.important eq 'N' }">
			                					<img src="resources/images/award.png" width="18" class="star">
			                				</c:when>
			                				<c:otherwise>
			                					<img src="resources/images/star.png" width="18" class="star">
			                				</c:otherwise>	
			                			</c:choose>
			                			</td>
			                			<td width="25"><img src="resources/images/envelope2.png" width="17" class="envelope"></td>
			                			<td width="150">
			                			<c:set var="receivers" value="${s.receivers}"/>
  
									    <c:choose>
									      <c:when test="${not empty receivers}">
									         <c:set var="names" value="${fn:split(receivers, ',')}" />
											    <c:forEach var="name" items="${names}" varStatus="loop">
											      <c:if test="${loop.index < 2}">
											        ${fn:trim(fn:substringBefore(name, ' '))}
											        <c:if test="${loop.index < fn:length(names)-1}">, </c:if>
											      </c:if>
											      <c:if test="${loop.index == 2}">
											        ..
											      </c:if>
											    </c:forEach>
									        </c:when>
									    </c:choose>    
			                			<td width="700">${s.emTitle }</td>
			                			<td width="50">
			                				
			                				<c:if test="${not empty s.emfNo}">
			                					<img src="resources/images/paper-clip.png" width="16">
			                				</c:if>
			                			</td>	
			                			<td>${s.sendDate }</td>	
			                		</tr>
	                			</c:otherwise>
	                		</c:choose>
                		</c:forEach>
              
                	</c:otherwise>
                </c:choose>
                
            </table>
            <script>
             $(function(){
                var star = "resources/images/star.png"
                var award = "resources/images/award.png"
                  $(".star").click(function(){
                    if($(this).attr("src") != star){  
                     $(this).attr("src",star);

                    }else{
                      $(this).attr("src",award);
                    }


                 })
                 var read= "resources/images/envelope.png"
                     var nonRead = "resources/images/envelope2.png"
                    	 $(".envelope").click(function(){
                             if($(this).attr("src") != read){  
                            	  $(this).attr("src",read);
         	
                             }else{
                              	 $(this).attr("src",nonRead);
                             }

                          })
                      
             })
            </script>
	   				
			




       <!--페이징 영역-->
		<div id="paging-area" align="center">

			<c:choose>
				<c:when test="${pi.currentPage eq 1}">
					<button disabled>이전</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty keyword }">
							<button
								onclick="location.href='sendbox.em?cpage=${pi.currentPage - 1}'">이전</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='sendbox.em?cpage=${pi.currentPage-1}&keyword=${keyword}'">이전</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty keyword }">
						<button onclick="location.href='sendbox.em?cpage=${p}'">${p}</button>
					</c:when>
					<c:otherwise>
						<button
							onclick="location.href='sendbox.em?cpage=${p}&keyword=${keyword}'">${p}</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage }">
					<button disabled>다음</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty keyword }">
							<button
								onclick="location.href='sendbox.em?cpage=${pi.currentPage + 1}'">다음</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='sendbox.em?cpage=${pi.currentPage+1}&keyword=${keyword}'">다음</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>

		</div>



	</div> 

        
		
	</div>
	
	
	
	
	
	
	

</body>
</html>