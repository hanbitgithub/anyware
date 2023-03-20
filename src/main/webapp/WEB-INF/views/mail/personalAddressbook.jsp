<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인주소록</title>
</head>
<style>
/*메일*/
#navbarSupportedContent li{
    font-size: 15px;
    color:black;
    font-weight: 600;
    margin-left: 5px;

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

/*주소록 추가 모달*/
.modal-body input{
    border-radius: 5px;
    border: 1px solid rgb(190, 190, 190);
    width: 300px;
    height: 35px;
    margin-bottom: 5px;
}
.modal-body select{
    border-radius: 5px;
    border: 1px solid rgb(190, 190, 190);
    width: 265px;
    height: 35px;
}

.btn2{
    background-color:  #a8a8a8;
    border: none;
    border-radius: 5px;
    font-size: 13px;
 
    color: white;
    padding: 5px 10px;
}

</style>
<body>

	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	  <b style="font-size: 18px;"> 개인주소록</b>
            <br><br><br>

            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link"  data-bs-toggle="modal" data-bs-target="#addAddress">
                            <img src="resources/images/add-friend.png" width="20px">
                              추가
                            </a>

               			</li>
                       
	               <!-- Modal -->
	              <div class="modal fade" id="addAddress" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                       <div class="modal-content">
	                           <div class="modal-header">
	                           <b>주소록 추가</b>
	                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                           </div>
	                           <div class="modal-body addAddress">
	                           
	                           <form action="insert.ad" method="post" id="addForm">
	                               <table style="text-align: center;">
	                               		<input type="hidden" name="memNo" value="${loginUser.memberNo}">
	                                   <tr>
	                                       <th width="100">이름 </th>
	                                       <td><input type="text" name="name" required class="required"  data-name="이름"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>이메일</th>
	                                       <td><input type="text" name="email" required class="required" data-name="이메일"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>연락처</th>
	                                       <td><input type="text" name="phone" required class="required" data-name="연락처"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>회사명</th>
	                                       <td><input type="text" name="bizName"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>부서</th>
	                                       <td><input type="text" name="deptName"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>직급</th>
	                                       <td><input type="text" name="jobName"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>그룹 </th> 
	                                       <td>
	                                           <select name="groupNo">
	                                           
	                                           </select>

	                                           <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#groupAdd">+</button>
	                                       </td>
	                                   </tr>

	                               </table>
	                              
	                           </div>
	                           <div class="modal-footer">
	                           <button type="submit" class="btn btn-primary btn-sm sub">저장</button>
	                           <button type="button" class="btn2 btn-secondary" data-bs-dismiss="modal">취소</button>
	                           </div>
	                         </form>
	                       </div>
	                   </div>
	               </div>
	               
		           <script>
		          $(function(){
		        	  groupList();
		          }) 
		           
		          function groupList(){
		           $.ajax({
		        	   url: 'glist.ad',
		        	   method: 'GET',
		        	   data : {no: '${loginUser.memberNo}'},
		        	   success: function(list) {
		        		   //console.log(list);
		        		   
		        		   var selectOptions = '';
		        		    $.each(list, function(index, item) {
		        		      selectOptions += '<option name="groupNo" value="' + item.groupNo + '">' + item.groupName + '</option>';
		        		    });

		        		    // 생성된 option 요소들을 select 요소에 삽입
		        		    $('select[name="groupNo"]').html(selectOptions);
		        	   
		        	   },
		        	   error: function() {
		        	     console.log('Error');
		        	   }
		        	 });
		        } 
		           
				    $(function(){
				        $(".sub").click(function(){
				            var isRight = true;
				            $("#addForm").find(".required").each(function(index, item){
				                // 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
				                if ($(this).val().trim() == '') {
				                    alert($(this).attr("data-name")+" 항목을 입력하세요.");
				                    isRight = false;
				                    return false;
				                }
				                     
				            });
				            if (!isRight) {
				                return;
				            }
				
				            $(this).prop("disabled", true);
				            $(this).prop("disabled", false);
				        });
				
				    });
				</script>
		                     
                         
                     <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#" onclick="updateAddress();">
                            <img src="resources/images/refresh2.png" width="18px">
                            수정</a>
                      </li>
                      
                      
                      <script>
                      function updateAddress(){
                          // 선택한 요소가 있는지 확인
                          let $checked = $(".addNo:checked");

                          // 선택하지 않은 경우
                          if( $checked.length < 1){
                              alert("수정할 연락처를 선택해주세요.");
                              return false;

                          } else if($checked.length>=2){ // 선택한 경우
                              alert("한개의 연락처만 선택해주세요.");
                              return false;

                          }else{
                        	  const addNo = $(".addNo:checked").val();
                        	  
                        	  $.ajax({
                        	      url: "getAddressInfo.ad",
                        	      data: { addNo: addNo },
                        	      dataType: "json",
                        	      success: function (data) {
                        	        // 주소록 정보가 담긴 모달 띄우기
                        	        $("#addAddressModal").modal("show");

                        	        // 모달 안의 입력 필드에 가져온 주소록 정보 넣기
                        	        $("#updateForm [name='name']").val(data.name);
                        	        $("#updateForm [name='email']").val(data.email);
                        	        $("#updateForm [name='phone']").val(data.phone);
                        	        $("#updateForm [name='bizName']").val(data.bizName);
                        	        $("#updateForm [name='deptName']").val(data.deptName);
                        	        $("#updateForm [name='jobName']").val(data.jobName);
                        	        $("#updateForm [name='groupNo']").val(data.groupNo);
                        	        $("#updateForm [name='addNo']").val(data.addNo);
                        	      },
                        	      error: function () {
                        	        alert("주소록 정보를 가져오지 못했습니다.");
                        	      }
                        	    });
                     
                        	    $('#updateAddress').modal('show'); // 모달 띄우기
                        	  
                          }
                      }
                      </script>
                      
                      
                    <!-- Modal -->
	               <div class="modal fade" id="updateAddress" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                       <div class="modal-content">
	                           <div class="modal-header">
	                           <b>주소록 수정</b>
	                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                           </div>
	                           <div class="modal-body addAddress">
	                           
	                           <form  method="post" id="updateForm">
	                               <table style="text-align: center;">
	                               		<input type="hidden" id="addNo" name="addNo">
	                               		<input type="hidden" name="memNo" value="${loginUser.memberNo}">
	                                   <tr>
	                                       <th width="100">이름 </th>
	                                       <td><input type="text" name="name" required  data-name="이름"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>이메일</th>
	                                       <td><input type="text" name="email" required  data-name="이메일"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>연락처</th>
	                                       <td><input type="text" name="phone" required data-name="연락처"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>회사명</th>
	                                       <td><input type="text" name="bizName"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>부서</th>
	                                       <td><input type="text" name="deptName"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>직급</th>
	                                       <td><input type="text" name="jobName"></td>
	                                   </tr>
	                                   <tr>
	                                       <th>그룹 </th> 
	                                       <td>
	                                           <select name="groupNo">
	                                           
	                                           </select>

	                                           <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#groupAdd2">+</button>
	                                       </td>
	                                   </tr>

	                               </table>
	                              
	                           </div>
	                           <div class="modal-footer">
	                           <button type="button" class="btn btn-primary btn-sm" onclick="updateAddressBook();">저장</button>
	                           <button type="button" class="btn2 btn-secondary" data-bs-dismiss="modal">취소</button>
	                           </div>
	                         </form>
	                       </div>
	                   </div>
	               </div>
	               
	               <script>
	               	 function updateAddressBook(){
	               		
	        				$.ajax({
	        					url : "update.ad",
	        					data : {
	        						 'addNo': $('.addNo:checked').val(),
	        						  'name': $('#updateForm [name="name"]').val(),
	        						  'email': $('#updateForm [name="email"]').val(),
	        						  'phone': $('#updateForm [name="phone"]').val(),
	        						  'bizName': $('#updateForm [name="bizName"]').val(),
	        						  'deptName': $('#updateForm [name="deptName"]').val(),
	        						  'jobName': $('#updateForm [name="jobName"]').val(),
	        						  'groupNo': $('#updateForm [name="groupNo"]').val()
	        					},
	        					success : function(result){
	        						//console.log(result);
	        						
	        						if(result == 'success'){
	        							alert("성공적으로 연락처를 수정했습니다.");
	        							location.reload();
	        						}
	        					},
	        					error : function(){
	        						alert("연락처 정보를 수정하는데 실패했습니다. 다시 시도해주세요.");
	        						location.reload();
	        					}
	        				})
	        			
	               	 }
	               
	               
	               </script>
                      

                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#" onclick="deleteAddress();">
                            <img src="resources/images/removeuser.png" width="20px">
                            삭제</a>
                      </li>
                      
                    <script>
                     // '삭제'버튼 클릭시 실행하는 함수
  					function deleteAddress(){
  							 
  						// 선택한 요소가 있는지 확인
  						let $checked = $(".addNo:checked");
  							 
  						// 선택하지 않은 경우
  						if( $checked.length < 1){
  							alert("삭제할 연락처를 선택해주세요.");
  							return false;
  								 
  						} else { // 선택한 경우
  								
  							 if( confirm("선택한 연락처를 삭제하시겠습니까?") ){
  								 let checkArr = [];
  								 
  								 $(".addNo").each(function(){
  									 
  									 if($(this).prop("checked")){
  										 checkArr.push( $(this).val() );
  									 }
  								 });
  								 
  							const addPerNo = checkArr.toString();
  							
  								$.ajax({
  									url : "delete.ad",
  									data : {
  										memNo : ${loginUser.memberNo},
  										addPerNo : addPerNo
  									},
  									success : function(result){
  										
  										if(result == 'success'){
  											alert("성공적으로 연락처를 삭제했습니다.");
  											location.reload();
  										}
  									},
  									error : function(){
  										alert("연락처를 삭제하는데 실패했습니다.\n다시 시도해주세요.");
  										console.log("실패");
  									}
  								 })
  							   }
  						    } 
  						 }
  					 
                      
                      </script>
                      
                      
                      
                      <li class="nav-item">
                        <a class="nav-link" href="#" onclick="sendMail();">
                            <img src="resources/images/send (1).png" width="18px">
                            메일전송</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="modal" data-bs-target="#groupModal">
                        <img src="resources/images/team (1).png" width="18px" alt="">
                            그룹관리
                        
                        </a>
                        <!-- Modal -->
                        <div class="modal fade" id="groupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                <b>그룹관리</b>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                <table id="groupUpdate">
                                    <tr>
                                        <th width="100">그룹관리</th>
                                        <td>
                                             <select name="groupNo">
	                                           
	                                         </select>
                                             <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#groupAdd3">+</button>
                                         </td>
                                    </tr>
                                    <tr>
                                        <th>새이름</th>
                                        <td><input type="text" name="newName" id="newgroup"></td>
                                    </tr>
                                </table>
                    
                                </div>
                                <div class="modal-footer">
                                
                                <button type="button" class="btn btn-primary btn-sm" onclick="updateGroup();">그룹이름변경</button>
                                <button type="button" class="btn2" onclick="deleteGroup();">그룹삭제</button>
                              
                                </div>
                            </div>
                            </div>
                        </div>
                      </li>
                      
                      
                      
                      <script>
                      function deleteGroup(){
                    	  
	                      var selectedGroupNo =  $('#groupUpdate [name="groupNo"]').val(); // 선택된 그룹 번호 가져오기
	                      console.log(selectedGroupNo);
	                      deleteAddBook(selectedGroupNo);
                      }
                      
                      function updateGroup(){
                    	  var groupNo =  $('#groupUpdate [name="groupNo"]').val();
        			       console.log(groupNo);
                    	  updateAddGroup2(groupNo);
                      }
                     
                      function updateAddGroup2(groupNo){
      					
                    	  var newName = $("#newgroup").val();
      				
      					$.ajax({
      						url : "updateGroup.ad",
      						data : {
      							memNo : '${loginUser.memberNo}',
      							groupNo :  $('#groupUpdate [name="groupNo"]').val(),
      							groupName : newName
      						},
      						success : function(result){
      							if(result == 'success'){
      								selectGroupList();
      								alert("그룹명 수정 성공");
      								$('#groupUpdate [name="newName"]').val("")
      								groupList();
      							}
      						},
      						error : function(){
      							console.log("그룹명 수정 실패");
      						}
      					})
      					
      				}   
                      
                      
                      
                      </script>
                     
                      
                    </ul>
                    <form class="d-flex" role="search">
                      <input class="form-control form-control-sm me-2" id="search" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                      <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                    </form>
                  </div>
                </div>
              </nav>

            <table class="table" style="text-align: center;">
                <thead>
                    <tr style="font-size: 14px; font-weight: bold;">
                        <td width="10"><input type="checkbox" id="chkAll"></td>    
                        <td width="50">이름</td>
                        <td width="150">이메일</td>
                        <td width="100">연락처</td>
                        <td width="120">회사명</td>
                        <td width="50">부서</td>
                        <td width="50">직급</td>
                        <td width="100">그룹</td>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty list}">
                			<tr style="font-size: 14px;">
                				<td colspan="8">등록된 주소록이 없습니다.</td>		
                			</tr>
                		</c:when>
                	</c:choose>
                
                	<c:forEach var="ad" items="${list}">
                	
	                    <tr style="font-size: 14px;">
	                        <td width="10"><input type="checkbox" name="check" class="addNo" value="${ad.addNo }">
	                        <input type="hidden" name="adMail" class="adMail" value="${ad.email }">
	                        </td>
	                        <td width="50">${ad.name }</td>
	                        <td width="150">${ad.email }</td>
	                        <td width="100">${ad.phone }</td>
	                        <td width="120">${ad.bizName}</td>
	                        <td width="50">${ad.deptName}</td>
	                        <td width="50">${ad.jobName }</td>
	                        <td width="100">${ad.groupName}</td>
	                    </tr>
              	 </c:forEach> 
                </tbody>
                
            </table>
            
            
            <form id="mail" action="" method="post">
			<input type="hidden" name="receivers" id="receivers" >
			<input type="hidden" name="sender" value="${loginUser.memberId}">
			</form>
            
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
          
          <script>
          function sendMail(){
					// 선택한 요소가 있는지 확인
					let $checked = $(".addNo:checked");
						 
					// 선택하지 않은 경우
					if( $checked.length < 1){
						alert("선택된 연락처가 없습니다.");
						return false;
							 
					} else { // 선택한 경우

							 let checkArr = [];
							 $(".addNo").each(function(){
								 if($(this).prop("checked")){
									 checkArr.push( $(this).siblings().val() );
								 }
							 });
							 
						const receivers = checkArr.toString();
						
						console.log(receivers);

		              	 $("#receivers").val(receivers);
		                 $("#mail").attr("action", 'sendCheckMail.ad').submit();
						
						
							
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
						
							<button onclick="location.href='personal.ad?cpage=${pi.currentPage - 1}'">이전</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='personal.ad?cpage=${pi.currentPage-1}&keyword=${keyword}'">이전</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty keyword }">
						<button onclick="location.href='personal.ad?cpage=${p}'">${p}</button>
					</c:when>
					<c:otherwise>
						<button
							onclick="location.href='personal.ad?cpage=${p}&keyword=${keyword}'">${p}</button>
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
								onclick="location.href='personal.ad?cpage=${pi.currentPage + 1}'">다음</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='personal.ad?cpage=${pi.currentPage+1}&keyword=${keyword}'">다음</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>

		</div>



	</div> 

 			<!-- Modal -->
               <div class="modal fade" id="groupAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                   <div class="modal-content">
                       <div class="modal-header">
                       <b>그룹추가</b>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                       <table>
                           <tr>
                               <th width="100">그룹명</th>
                               <td><input type="text" name="groupName" class="groupName1"></td>
                           </tr>
                       </table>
           
                       </div>
                       <div class="modal-footer">
                       
                       <button type="button" class="btn btn-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#addAddress" onclick="insertAddGroup2(1);">그룹추가</button>
                       <button type="button" class="btn2"  data-bs-toggle="modal" data-bs-target="#addAddress">취소</button>
                     
                       </div>
                   </div>
                   </div>
             </div>      
             
             <!-- Modal -->
               <div class="modal fade" id="groupAdd2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                   <div class="modal-content">
                       <div class="modal-header">
                       <b>그룹추가</b>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                       <table>
                           <tr>
                               <th width="100">그룹명</th>
                               <td><input type="text" name="groupName" class="groupName2"></td>
                           </tr>
                       </table>
           
                       </div>
                       <div class="modal-footer">
                       
                       <button type="button" class="btn btn-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#updateAddress" onclick="insertAddGroup2(2);">그룹추가</button>
                       <button type="button" class="btn2"  data-bs-toggle="modal" data-bs-target="#updateAddress">취소</button>
                     
                       </div>
                   </div>
                   </div>
             </div>  
             <!-- Modal -->
               <div class="modal fade" id="groupAdd3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                   <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                   <div class="modal-content">
                       <div class="modal-header">
                       <b>그룹추가</b>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                       <table>
                           <tr>
                               <th width="100">그룹명</th>
                               <td><input type="text" name="groupName" class="groupName3"></td>
                           </tr>
                       </table>
           
                       </div>
                       <div class="modal-footer">
                       
                       <button type="button" class="btn btn-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#groupModal" onclick="insertAddGroup2(3);">그룹추가</button>
                       <button type="button" class="btn2"  data-bs-toggle="modal" data-bs-target="#groupModal">취소</button>
                     
                       </div>
                   </div>
                   </div>
             </div>      

                    
                    <script>
                    // 주소록 그룹 '추가'시 실행하는 ajax
    				function insertAddGroup2(num){
              
    					if ($(".groupName"+num).val().trim() != 0) {
    						$.ajax({
    							url : "insertAddGroup.ad",
    							data : {
    								memNo : '${loginUser.memberNo}',
    								groupName : $(".groupName"+num).val()
    							},
    							success:function(result) {
										console.log(result);
										// alert("그룹 추가성공");
										
										$.ajax({
						                    url: 'glist.ad',
						                    method: 'GET',
						                    data: {no: '${loginUser.memberNo}'},
						                    success: function(list) {
						                        var selectOptions = '';
						                        $.each(list, function() {
						                            selectOptions += '<option value="' + this.groupNo + '">' + this.groupName + '</option>';
						                        });
						                        $('select[name="groupNo"]').html(selectOptions);
						                        $(".groupName"+num).val("");
						                        selectGroupList();
						                    },
						                    error: function() {
						                        console.log('Error');
						                    }
						                });
										
										
    							},
    							error: function(){
    								console.log("주소록 추가 ajax 통신실패");
    							}

    						})
    					} else {
    						alert("그룹명을 입력해주세요.");
    						return false;
    					}

    				}

                    
                    </script>

   



             

</body>
</html>