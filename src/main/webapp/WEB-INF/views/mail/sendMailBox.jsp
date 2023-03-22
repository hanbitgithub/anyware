<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸메일함</title>
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

.table a:hover{
	text-decoration:none;
	
}

input[type=checkbox] {
	transform : scale(1.01);
}
#search{
 	width:250px;
 }
.btn2{
	border:1px solid  rgb(201, 201, 201);
	border-radius:5px;
	background-color: white;
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
                               <li><a class="dropdown-item" onclick="readMail();">읽음으로표시</a></li>
                         	   <li><a class="dropdown-item" onclick="unreadMail();">안읽음으로표시</a></li>
                              
                            </ul>
                          </li>
                          
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page"  onclick="deleteMail();">
                            <img src="resources/images/bin.png" width='15px' >
                            삭제</a>
                      </li>
                     
                      <li class="nav-item">
                        <a class="nav-link" href="#" onclick="replyMail();">
                            <img src="resources/images/send (1).png" width='15px'>
                            답장</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#" onclick="forwardMail();">
                            <img src="resources/images/next.png" width='15px' alt="" >
                            전달</a>
                      </li>
                       <!-- <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="resources/images/cancel.png" width='18px' alt="">
                            회수</a>
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
                        <ul class="dropdown-menu" id="filter">
                          <li><a class="dropdown-item" href="#">전체</a></li> 
                          <li><a class="dropdown-item" href="#">안읽은메일</a></li>
                          <li><a class="dropdown-item" href="#">중요메일</a></li>
                          <li><a class="dropdown-item" href="#">첨부메일</a></li>
                        
                        </ul>
                      </li>
                      
                    </ul>
                    	<script>
                    		$("#filter a").click(function(){
                    			var filter = $(this).text();
                    			$("input[name=filter]").val(filter);
                    			
                    			$(".d-flex").submit();
                    		})
                    	
                    	</script>
                    
                    
                    
                    
                    
                    
                    
                    <form class="d-flex" role="search" action="searchS.em">
                      <input class="form-control form-control-sm me-2" id="search" name="keyword"  value="${keyword }"type="search" placeholder="검색어를 입력하세요" aria-label="Search">         
                      <input type="hidden" name="sender" value="${loginUser.memberId}">
                      <input type="hidden" name="filter" value="${filter}">
                      <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                    </form>
                  </div>
                </div>
              </nav>

              <table class="table">
              
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
			                		<tr style="font-size: 14px;" class="mstatus${s.emNo}"> 
			                			<td width="25"><input type="checkbox" name="check" class="emNo" value="${s.emNo }" data-emtype="${s.mailStatus.emType }"></td>
			                			<td width="25">
			                				<c:choose>
			                				<c:when test="${s.mailStatus.important eq 'N' }">
			                					<img src="resources/images/award.png" width="18" class="star" data-emNo="${s.emNo }">
			                				</c:when>
			                				<c:otherwise>
			                					<img src="resources/images/star.png" width="18" class="star" data-emNo="${s.emNo }">
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
			                			<td width="700"class="mail-title">${s.emTitle }
			                			<input type="hidden" name="mailNo" value="${s.emNo }">
			                			</td>
			                			<td width="50">
			                				<c:if test="${ s.mailFile.atcount > 0}">
			                					<img src="resources/images/paper-clip.png" width="16">
			                				</c:if>
			                			</td>	
			                			<td>${s.sendDate }</td>	
			                			<td><button class="btn2" data-bs-toggle="modal" data-bs-target="#receipt" data-emNo="${s.emNo }">수신확인</button></td>
			                		</tr>
	                			</c:when>
	                			<c:otherwise>
	                				<tr style="font-size: 14px; font-weight: bold" class="mstatus${s.emNo}"> 
			                			<td width="25"><input type="checkbox"name="check" class="emNo" value="${s.emNo }"data-emtype="${s.mailStatus.emType }"></td>
			                			<td width="25">
			                			<c:choose>
			                				<c:when test="${s.mailStatus.important eq 'N' }">
			                					<img src="resources/images/award.png" width="18" class="star" data-emNo="${s.emNo }">
			                				</c:when>
			                				<c:otherwise>
			                					<img src="resources/images/star.png" width="18" class="star" data-emNo="${s.emNo }">
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
			                			<td width="700" class="mail-title">${s.emTitle }
			                			<input type="hidden" name="mailNo" value="${s.emNo }">
			                			</td>
			                			<td width="50">
			                				
			                				<c:if test="${s.mailFile.atcount > 0}">
			                					<img src="resources/images/paper-clip.png" width="16">
			                				</c:if>
			                			</td>	
			                			<td>${s.sendDate }</td>	
			                			<td><button class="btn2"  data-bs-toggle="modal" data-bs-target="#receipt" data-emNo="${s.emNo }">수신확인</button></td>
			                		</tr>
	                			</c:otherwise>
	                		</c:choose>
                		</c:forEach>
              
                	</c:otherwise>
                </c:choose>
                
                
                
            </table>
            
            <form id="mailDetail" action="" method="post">
			<input type="hidden" name="box" value="0">
			<input type="hidden" name="emType" value="0">
			<input type="hidden" name="emNo" id="detailNo">
			<input type="hidden" name="sender" value="${loginUser.memberId}">
			</form>
			
			<script>
			// '메일 조회'시 실행하는 함수
			$(function(){
				$(".mail-title").click(function(){
					var $tr = $(this).closest("tr");
					  
					let emNo = $(this).children('input[type=hidden]').val();
					//console.log(emNo);
					$("#detailNo").val(emNo);
					
					$(".mstatus"+emNo ).css("font-weight","300");
					$tr.find("img.envelope").attr("src", "resources/images/envelope.png");
					
					$("#mailDetail").attr("action", 'mail.em').submit();

				})
			})	
			
			
				  function replyMail(){
	           	 // 선택한 요소가 있는지 확인
	               let $checked = $(".emNo:checked");
	               // 선택하지 않은 경우
	               if( $checked.length < 1){
	                   alert("답장할 메일을 선택해주세요.");
	                   return false;
	
	               } else if($checked.length>=2){ // 선택한 경우
	                   alert("한개의 메일만 선택해주세요.");
	                   return false;
	
	               }else{
	             	  const emNo = $(".emNo:checked").val();
	             	  $("#detailNo").val(emNo);
	             	
	                 $("#mailDetail").attr("action", 'replyMail.em').submit();
						}
					
	             	  
	           	
	           }
			
			   function forwardMail(){
	            	 // 선택한 요소가 있는지 확인
	                let $checked = $(".emNo:checked");
	                // 선택하지 않은 경우
	                if( $checked.length < 1){
	                    alert("전달할 메일을 선택해주세요.");
	                    return false;

	                } else if($checked.length>=2){ // 선택한 경우
	                    alert("한개의 메일만 선택해주세요.");
	                    return false;

	                }else{
	              	  const emNo = $(".emNo:checked").val();
	              	  $("#detailNo").val(emNo);
	              	
	                  $("#mailDetail").attr("action", 'forward.em').submit();
						}
					
	              	  
	            	
	            }
           
			
			
			
			</script>
			
			
            
            <script>
           
      		 $(".star").click(function(){
				 var star = "resources/images/star.png"
		         var award = "resources/images/award.png"
		         var emNo = $(this).data("emno");
				 var $button = $(this);
				 
           	  if($button.attr("src") != star){  
           			$.ajax({
		   					url:"like.em",
		   					data:{
		   						emNo : emNo,
		   						emType: 0,
		   						sender : '${loginUser.memberId}'
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
                			emType: 0,
                			sender : '${loginUser.memberId}'
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
                			 sender : '${loginUser.memberId}'

                		 },
                		 success:function(result){
                			// console.log(result);
                			 $button.attr("src",read);
                			 $(".mstatus"+emNo ).css("font-weight","500");
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
                			 emType : 0,
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
                      
                      
                      
               <!-- Modal -->
	              <div class="modal fade" id="receipt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
	                       <div class="modal-content">
	                           <div class="modal-header">
	                           <b>수신확인</b>
	                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                           </div>
	                           <div class="modal-body receiptCheck">
								<span style="font-size:13px; color: blue;"> ※ 수신완료 된 메일은 발송취소를 할 수 없습니다.</span><br>
	                               <table id="receiverTb" class="table" style="font-size : 14px;">
	                               		<input type="hidden" name="memNo" value="${loginUser.memberNo}">
	                               	<thead>
	                                   <tr>
	                                   	   <th width="20"><input type="checkbox" id="selectAll"></th>
	                                       <th width="70">수신인</th>
	                                       <th width="120">이메일</th>
	                                       <th width="60">상태</th>
	                                       <th width="120">수신일</th>
	                                   </tr>
	                                </thead>  
	                                <tbody>
	                                
	                                </tbody> 
	                               </table>
	                              
	                           </div>
	                           <div class="modal-footer">
	                           <button type=button" class="btn btn-primary btn-sm sub" onclick="cancelEm();">발송취소</button>
	                           <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">취소</button>
	                           </div>
	                         
	                       </div>
	                   </div>
	               </div>

	               <script>
	      
	               $(".btn2").click(function(){
	            	   var emNo = $(this).data("emno");
	            	   
	            	   $.ajax({
	            		   url: "receiverData.em",
	            		   data:{emNo : emNo},
	            		   success:function(list){
	            			   console.log(list);
	            			   
	            			   value = "";
	            			   for(let i = 0; i < list.length; i++){
	            				   
	            				   let readStatus = list[i].read;
	            				   let disableCheckbox = (readStatus == '수신완료' || readStatus == '발송취소') ? 'disabled' : '';
	            				   
	            				   value += "<tr>"          				   
	            				         + "<td><input type='checkbox' name='checkR' class='checkR' "
	            				         +  "value='" + list[i].emNo + "' "
	            				         +  disableCheckbox + ">"
	            				         + "<input type='hidden' name='receiver' value='"+ list[i].receiver + "'>"
	            				         + "</td>"
	            				         + "<td>" + list[i].receiverName + "</td>"
	            				         + "<td>" + list[i].receiver +"@anyware.com"+ "</td>"
	            				         + "<td class='status'>" + list[i].read + "</td>"
	            				         + "<td>" 

	            				         if(list[i].readTime != null && readStatus == '수신완료' ){
	            				        	 value += list[i].readTime 
	            				         }
	            				   value += "</td>"
 									
	            			   }
	            			   
	            		     $("#receiverTb tbody").html(value);
	            		   },error:function(){
	            			   console.log("ajax 수신확인 리스트 조회실패");
	            			   
	            		   }
	            	
	            	   })
	            	   
	               })
	               
	               </script>
	               
	               
	             <script>
	              
                   $(function(){
                       $("#selectAll").click(function(){
                           if($(this).is(":checked")){
 
                        	   $("input[name=checkR]").each(function(){
                        		  var opt = $(this).prop("disabled");
                        		  if(!opt){
                        			  $(this).prop("checked",true);
                        		  }
                        	   })
                              
                           }else{
                        	   $("input[name=checkR]").prop("checked",false);
                           }
                       })
                   })
	               
	           </script>
	           
	           
	           
	          <script>
	           function cancelEm(){
						// 선택한 요소가 있는지 확인
						let $checked = $(".checkR:checked");
						let emNo = $checked.val();
						var tr = $checked.closest('tr');
						let status = tr.children(".status");
						

						console.log("emNo" + emNo);
						// 선택하지 않은 경우
						if( $checked.length < 1){
							alert("회수할 메일을 선택해주세요.");
							return false;
								 
						} else { // 선택한 경우
							 let checkArr = [];
							 let receiverArr = [];

							 $(".checkR").each(function(){
								 if($(this).prop("checked")){
									 checkArr.push( $(this).val() );
									
									 var memId = $(this).siblings("input[name=receiver]").val();
									 receiverArr.push(memId);
								 }
							 });
							 
							const emNoArr = checkArr.toString();
							const reArr = receiverArr.toString();
	
							 $.ajax({
									url : "cancel.em",
									data : {
										receiver : reArr,
										emNo : emNoArr
									},
									success : function(result){
										if(result == 'success'){
										   	console.log(result);
										   	alert("메일이 회수되었습니다.");
										   	
										   	status.text("발송취소");
										}
									},
									error : function(){
										alert("회수에 실패했습니다.\n다시 시도해주세요.");
										console.log("ajax 회수실패 ");
									}
								 })
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
						<c:when test="${empty keyword and empty filter}">
							<button
								onclick="location.href='sendbox.em?cpage=${pi.currentPage - 1}'">이전</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='searchS.em?cpage=${pi.currentPage-1}&keyword=${keyword}&sender=${loginUser.memberId }&filter=${filter}'">이전</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty keyword and empty filter }">
						<button onclick="location.href='sendbox.em?cpage=${p}'">${p}</button>
					</c:when>
					<c:otherwise>
						<button
							onclick="location.href='searchS.em?cpage=${p}&keyword=${keyword}&sender=${loginUser.memberId }&filter=${filter}'">${p}</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${pi.currentPage eq pi.maxPage }">
					<button disabled>다음</button>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${empty keyword and empty filter}">
							<button
								onclick="location.href='sendbox.em?cpage=${pi.currentPage + 1}'">다음</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='searchS.em?cpage=${pi.currentPage+1}&keyword=${keyword}&sender=${loginUser.memberId }&filter=${filter}'">다음</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>

		</div>



	</div> 

        
		
	</div>
	
	
	
	
	
	
	

</body>
</html>