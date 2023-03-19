<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시보관함</title>
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
input[type=checkbox] {
	transform : scale(1.01);
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
		 <b style="font-size: 18px;"> 임시보관함</b>
            <br><br><br>

            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	                    <li class="nav-item">
	                        <a class="nav-link" aria-current="page" href="#">
	                           &nbsp;<input type="checkbox" class="form-check-input" id="chkAll">
	                            </a>
	                    </li>
	                    
	                 <script>
					 $(function(){
	                        $("#chkAll").click(function(){
	                            if($(this).is(":checked")){
	                                $("input[name=check]").attr("checked",true);
	                            }else{
	                                $("input[name=check]").attr("checked",false);
	                            }
	                        })
	                    })

					</script>   
	                     
  		                 <li class="nav-item dropdown">
                            <a class="nav-link" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                             <img src="resources/images/email2.png" width='15px' alt=""> 읽음
                            </a>
                            <ul class="dropdown-menu" style="font-size: 12px;">
                              <li><a class="dropdown-item" href="#" onclick="readMail();">읽음으로표시</a></li>
                              <li><a class="dropdown-item" href="#" onclick="unreadMail();">안읽음으로표시</a></li>
                              
                            </ul>
                          </li> 
                          
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#" onclick="deleteMail();">
                            <img src="resources/images/bin.png" width='15px' alt="">
                            삭제</a>
                      </li>
      
                      <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="resources/images/next.png" width='15px' alt="">
                            전달</a>
                      </li>
                      <!-- <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">
                            <img src="resources/images/refresh2.png" width='15px' alt="">
                            이어쓰기</a>
                      </li> -->
                       
                      <!-- <li class="nav-item dropdown">
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
                      </li> -->
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
                      <input class="form-control form-control-sm me-2" name="keyword" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                      <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                    </form>
                  </div>
                </div>
              </nav>

            <table class="table">
               <!--  <tr style="font-size: 14px; font-weight: bold;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="25"><img src="resources/images/award.png" width="18"></td>
                    <td width="25"><img src="resources/images/envelope2.png" width="17"></td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50"><img src="resources/images/paper-clip.png" width="16"></td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr> -->
                
                 <c:choose>
                	<c:when test="${ empty slist }">
                		<tr align="center">
                			<td colspan="7">임시 보관함이 비어있습니다.</td>
                		</tr>
                	</c:when>
                	
                	<c:otherwise>
                		<c:forEach var="s" items="${slist }">
                			<c:choose>
                				<c:when test="${s.mailStatus.read eq 'Y' }">
			                		<tr style="font-size: 14px;" class="mstatus${s.emNo}"> 
			                			<td width="25"><input type="checkbox" name="check" class="emNo" value="${s.emNo }" data-emtype="${s.mailStatus.emType }"></td>
			                			<td width="25">
											<c:choose>
				                				<c:when test="${s.mailStatus.important eq 'N' }">
				                					<img src="resources/images/award.png" width="18" class="star" data-emtype="${s.mailStatus.emType }"data-emNo="${s.emNo }">
				                				</c:when>
				                				<c:otherwise>
				                					<img src="resources/images/star.png" width="18" class="star" data-emtype="${s.mailStatus.emType }"data-emNo="${s.emNo }">
				                				</c:otherwise>	
			                				</c:choose>
			                			</td>
			                			<td width="25"><img src="resources/images/envelope.png" width="17" class="envelope" data-emNo="${s.emNo }"></td>
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
			                			</td>
			                			<td width="700" class="mail-title">
			                			${s.emTitle }<input type="hidden" name="mailNo" value="${s.emNo }"><input type="hidden" name="emType" value="${s.mailStatus.emType }"></td>
			                			<td width="50">
			                				
			                				<c:if test="${s.mailFile.atcount > 0}">
			                					<img src="resources/images/paper-clip.png" width="16">
			                				</c:if>
			                			</td>	
			                			<td>${s.tempDate }</td>	
			                		</tr>
	                			</c:when>
	                			<c:otherwise>
	                				<tr style="font-size: 14px; font-weight: bold" class="mstatus${s.emNo}"> 
			                			<td width="25"><input type="checkbox" name="check" class="emNo" value="${s.emNo }" data-emtype="${s.mailStatus.emType }"></td>
			                			<td width="25">
			                				<c:choose>
				                				<c:when test="${s.mailStatus.important eq 'N' }">
				                					<img src="resources/images/award.png" width="18" class="star" data-emtype="${s.mailStatus.emType }"data-emNo="${s.emNo }">
				                				</c:when>
				                				<c:otherwise>
				                					<img src="resources/images/star.png" width="18" class="star" data-emtype="${s.mailStatus.emType }"data-emNo="${s.emNo }">
				                				</c:otherwise>	
			                				</c:choose>
			                			
			                			</td>
			                			<td width="25"><img src="resources/images/envelope2.png" width="17" class="envelope" data-emNo="${s.emNo }"></td>
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
			                			<td width="700" class="mail-title">
			                			<input type="hidden" name="mailNo" value="${s.emNo }"><input type="hidden" name="emType" value="${s.mailStatus.emType }">
			                			${s.emTitle }</a></td>
			                			<td width="50">
			                				
			                				<c:if test="${s.mailFile.atcount > 0}">
			                					<img src="resources/images/paper-clip.png" width="16">
			                				</c:if>
			                			</td>	
			                			<td>${s.tempDate}</td>	
			                		</tr>
	                			</c:otherwise>
	                		</c:choose>
                		</c:forEach>
              
                	</c:otherwise>
                </c:choose>
                
            </table>
            
            <form id="mailDetail" action="" method="post">
			<input type="hidden" name="box" value="4">
			<input type="hidden" name="emType" id="emType">
			<input type="hidden" name="emNo" id="detailNo">
			<input type="hidden" name="sender" value="${loginUser.memberId}">
			<input type="hidden" name="receiver" value="${loginUser.memberId}">
			<input type="hidden" name="tempSave" value="Y">
			
			</form>
			
			<script>
			// '메일 조회'시 실행하는 함수
			$(function(){
				$(".mail-title").click(function(){
					var $tr = $(this).closest("tr");
					let emNo = $(this).children('input[type=hidden]').val();
					let emType = $(this).children('input[name=emType]').val();
					//console.log(emType);
					//console.log(emNo);
					$("#detailNo").val(emNo);
					$("#emType").val(emType);
					
					$(".mstatus"+emNo ).css("font-weight","300");
					$tr.find("img.envelope").attr("src", "resources/images/envelope.png");
					$("#mailDetail").attr("action", 'tempMail.em').submit();

				})
			})	
			</script>
            
              <script>
              
       		 $(".star").click(function(){
 				 var star = "resources/images/star.png"
 		         var award = "resources/images/award.png"
 		         var emNo = $(this).data("emno");
 				 var emType = $(this).data("emtype");
 				 var $button = $(this);
 				 
            	  if($button.attr("src") != star){  
            			$.ajax({
 		   					url:"like.em",
 		   					data:{
 		   						emNo : emNo,
 		   						emType:emType,				
 		   						receiver : '${loginUser.memberId}',
 		   					    sender: '${loginUser.memberId}'
 		   						
 		   					},
 		   					success:function(result){
 		   						//console.log(result);
 		   					 	$button.attr("src",star);
 		   						 
 		   					},error:function(){
 		   						console.log("좋아요실패");
 		   					}
            			})

                }else{
                 	$.ajax({
                 		url:"dislike.em",
                 		data:{
                 			emNo : emNo,
                 			emType:emType ,
                 			receiver : '${loginUser.memberId}',
                 			sender: '${loginUser.memberId}'
                 		},
                 		success:function(result){
                 			//console.log(result);
                 			$button.attr("src",award);
                 		
                 		},error: function(){
                 			console.log("좋아요 취소 실패");
                 		}
                 	}) 
                	
                }

            })
             
            </script>
            
 
            
            <script>
        	 $(".envelope").click(function(){
        		 var read= "resources/images/envelope.png"
                 var nonRead = "resources/images/envelope2.png" 
        		 var emNo = $(this).data("emno");
			     var $button = $(this);
					 
        		 
                 if($button.attr("src") != read){  
                	 $.ajax({
                		 url: "read.em",
                		 data: {
                			 emNo : emNo,  	
                			 emType : 0,
                			 sender:'${loginUser.memberId}'

                		 },
                		 success:function(result){
                			// console.log(result);
                			 $button.attr("src",read);
                			 $(".mstatus"+emNo ).css("font-weight","300");
                			 unreadCount();
                			 
                		 },error:function(){
                			 console.log("읽음표시 ajax실패");
                		 }
                		 
                	 })
                	 
                 }else{
                	 $.ajax({
                		 url: "unread.em",
                		 data: {
                			 emNo : emNo,
                			 emType: 0,
                			 sender : '${loginUser.memberId}'

                		 },
                		 success:function(result){
                			// console.log(result);
                			 $button.attr("src",nonRead);
                			 $(".mstatus"+emNo ).css("font-weight","bold");
                			 unreadCount();
                			 
                		 },error:function(){
                			 console.log("읽음표시해제 ajax실패");
                		 }
                		 
                	 })
            
                 }


              })

            </script>
            
            
             <script>
				 var read= "resources/images/envelope.png"
	             var nonRead = "resources/images/envelope2.png" 
	             var $checked = $(".emNo:checked");		
	             var tr = $checked.closest('tr');
	             var img = tr.find('img.envelope');
	           
				
	            //읽음버튼 클릭시 
	            function readMail(){
	            	 var $checked = $(".emNo:checked");		
	 	             var tr = $checked.closest('tr');
	 	             var img = tr.find('img.envelope');
	 	             var emNo = img.attr("data-emno");
	 	             var emType;
	 	            
	            	if($checked.length<1){
	            		alert("선택된 메일이 없습니다.");
	            		return false;
	            	}else{
            		
						 let checkArr = [];
						 let typeArr = [];
						 
						 $(".emNo").each(function(){
							 if($(this).prop("checked")){
								 checkArr.push( $(this).val() );

								 var emType = $(this).data("emtype");
								  typeArr.push(emType);
								 }
							
						   });
						 
						 const emNoArr = checkArr.toString();
						 const emTypeArr = typeArr.toString();
						 
						 console.log(emTypeArr);

						 $.ajax({
								url : "checkRead.em",
								data : {
									sender: '${loginUser.memberId}',
									emType: emTypeArr,
									emNo : emNoArr
								},
								success : function(result){
									if(result == 'success'){
									     img.attr("src",read);
			                			 tr.css("font-weight","300");
			                			 unreadCount();
									}
								},
								error : function(){
									alert("읽음처리 실패했습니다.\n다시 시도해주세요.");
									console.log("실패");
								}
							 })
						   }
					    } 
				 
				  function unreadMail(){
					  var $checked = $(".emNo:checked");		
			          var tr = $checked.closest('tr');
			          var img = tr.find('img.envelope');
			          var emNo = img.attr("data-emno");
			          
					 if($checked.length<1){
		            		alert("선택된 메일이 없습니다.");
		            		return false;
		            	}else{
	            		
							 let checkArr = [];
							 let typeArr = [];
							 
							 $(".emNo").each(function(){
								 if($(this).prop("checked")){
									 checkArr.push( $(this).val() );

									 var emType = $(this).data("emtype");
									  typeArr.push(emType);
									 }
								
							   });
							 
							 const emNoArr = checkArr.toString();
							 const emTypeArr = typeArr.toString();

							 $.ajax({
									url : "checkUnRead.em",
									data : {
										sender: '${loginUser.memberId}',
										emType: emTypeArr,
										emNo : emNoArr
									},
									success : function(result){
										if(result == 'success'){
										     img.attr("src",nonRead);
				                			 tr.css("font-weight","bold");
				                			 unreadCount();
										}
									},
									error : function(){
										alert("읽음처리 실패했습니다.\n다시 시도해주세요.");
										console.log("실패");
									}
								 })
		            	}
					} 
				 
			
	            </script>
	            
	            <script>
                 // '삭제'버튼 클릭시 실행하는 함수
                 function deleteMail(){
  							 
  						// 선택한 요소가 있는지 확인
  						let $checked = $(".emNo:checked");
  							 
  						// 선택하지 않은 경우
  						if( $checked.length < 1){
  							alert("삭제할 메일을 선택해주세요.");
  							return false;
  								 
  						} else { // 선택한 경우
  								
  							 if( confirm("선택한 메일을 삭제하시겠습니까?") ){
  								 let checkArr = [];
  								 let typeArr = [];
  								 
  								 $(".emNo").each(function(){
  									 
  									 if($(this).prop("checked")){
  										 checkArr.push( $(this).val() );

  										 var emType = $(this).data("emtype");
  										  typeArr.push(emType);
  									 }
  								 });
  								 
  								const emNoArr = checkArr.toString();
  								const emTypeArr = typeArr.toString();
  								//console.log(emNoArr);
  							
  								$.ajax({
  									url : "delete.em",
  									data : {
  										sender : '${loginUser.memberId}',
  										emType: emTypeArr,
  										emNo : emNoArr
  									},
  									success : function(result){
  										
  										if(result == 'success'){
  											alert("삭제한 메일은 휴지통에서 확인가능합니다.");
  											location.reload();
  										}
  									},
  									error : function(){
  										alert("메일을 삭제하는데 실패했습니다.\n다시 시도해주세요.");
  										console.log("실패");
  									}
  								 })
  							   }
  						    } 
  						 }
  					 
                      
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