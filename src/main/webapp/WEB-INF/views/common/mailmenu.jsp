<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<script src="https://kit.fontawesome.com/6f4b87b4ed.js" crossorigin="anonymous"></script>
<style>
/*서브메뉴*/
.menu{
    position: fixed;
    height: 100vh;
    width: 160px;
    font-size: 14px;
    padding: 40px 20px;
    border-right: 1px solid rgb(211, 210, 210);
    font-family: 'Nanum Gothic', sans-serif;
}
.menu li{
    margin-top: 5px;
   
}
#mail-area li a:hover{
    color: gray;
    cursor: pointer;
    text-decoration: none;
    
}
#adbook-area>ul>li a:hover{
    color: gray;
    cursor: pointer;
    text-decoration: none;
}

/* 노멀라이징 */

a{
  color: inherit;
  text-decoration:none;
}


/*주소록 그룹*/

.group{
   /*  padding: 0px 10px; */
    font-size: 13px;
}

#check-btn { display: none;}
#check-btn:checked ~ .menubars { display: block; } 
.menubars { display: none; }

#check-btn2 { display: none;}
#check-btn2:checked ~ .menubars2 { display: block; } 
.menubars2 { display: none; }

.label{margin-top:10px}



/* ======== 개인 주소록 수정 ======== */
#plus-tag{
    margin-left: 10px;
    color:gray;
    cursor:pointer;
}


.address-title{
    display:flex;
    cursor: pointer;
}

.basic-title{
	cursor: pointer;
}


.tag-delete{
    padding-top: 6px;
    margin-left:70px;
}

.tag-modify, .tag-modify:hover{
    color: lightgray;
    margin: 0px 10px;
    float: right;

}
#adbook-area .dropdown-item{
	font-size:14px;
}
.category-title{
	width:80%;
}

.insertAddress span, .updateAddress span{
    width: 70%;
}

.insertAddress input[type=text], .updateAddress input[type=text], #select-addressBook{
    width:90%;
    height: 25px;
}

.update-addBtn span, .update-addBtn a, .update-addBtn a:hover{
    color:black;
    cursor: pointer;
    margin-right:10px;
}

#adbook-area input[type=text]{
    width:120px;
    border: 1px solid rgb(206, 206, 206);
    border-radius : 5px;
}
.insertAddBook, .updateAddBook{
    margin-bottom: 10px;
    display:none;
}

.insertAddress, .updateAddress{
 	/*  display:flex; */
 	text-align:right;
} 

.insertAddress span, .updateAddress span{
    width: 70%;
}

.insertAddress input[type=text], .updateAddress input[type=text], #select-addressBook{
    width:100%;
    height: 25px;
}

.update-addBtn span, .update-addBtn a, .update-addBtn a:hover{
    cursor: pointer;
    margin-right:5px;
    text-decoration:none;
     
}

.fa-check{color:green;}
.fa-times{color:red;}




</style>
</head>
<body>
	 <div class="menu">
            <span style="font-weight: 600; font-size: 19px;">메일</span><br><br>
            <a class="btn btn-primary" href="sendForm.em"style="font-size: 13px; font-weight:600; width: 100px;">메일쓰기</a>
            <br><br>
            <div id="mail-area">
                <a href="test.do">test</a>
            <ul>
                <li><a href="receivebox.em">받은메일함</a></li>
                <li><a href="sendbox.em">보낸메일함</a></li>
                <li><a href="important.em">중요메일함</a></li>
                <li><a href="storage.em">임시보관함</a></li>
                <li>
                    <a>스팸메일함 </a>&nbsp;
                    <a href="#" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="resources/images/bin.png"  width="14px"alt="">
                    </a>
                
                </li>
                <li>
                    <a href="trash.em">휴지통 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="resources/images/bin.png"  width="14px"alt="">
                    </a>
                </li>
               
            </ul>

            </div>
            <br><br>
            <div id="adbook-area">
                <span style="font-weight: 600; font-size: 15px;" >주소록</span><br>

   					<input id="check-btn" type="checkbox" checked/> 
   					<label for="check-btn" class="label">
   					<ion-icon name="chevron-down-outline"></ion-icon><a href="personal.ad">개인주소록</a></label>
   					 <ul class="group menubars" id="personal">
                     	 <li id="all"><a href="personal.ad">전체 </a></li>
                     	 
                     	 
                     <%-- 	 
                      <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown">
										
							<!--========== 수정, 삭제 버튼 ==========-->
							<a class="dropdown-item d-flex align-items-center"
								onclick="updateAddBook('${c.groupNo}');"> <span
								class="font-weight-bold">수정하기</span>
								
							</a> <a class="dropdown-item d-flex align-items-center"
								onclick="deleteAddBook('${c.groupNo}');"> <span
								class="font-weight-bold">삭제하기</span>
							</a>
					 </div> --%>
                  	
				<!--반복문 시작 -->
				<%-- <c:choose>
					<c:when test="${not empty glist}">
						<c:forEach var="c" items="${glist}">
							<c:if test="${c.memNo == loginUser.memberNo}">
								<div class="address-title" id="addTitle${c.groupNo }">
								
									<!--==========주소록 클릭시 수정,삭제 처리하는 dropdown 생성 ==========-->
									<a class="tag-modify" href="#" id="dotDropdown" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
									</a>
									
									<div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown">
										
										<!--========== 수정, 삭제 버튼 ==========-->
										<a class="dropdown-item d-flex align-items-center"
											onclick="updateAddBook('${c.groupNo}');"> <span
											class="font-weight-bold">수정하기</span>
											
										</a> <a class="dropdown-item d-flex align-items-center"
											onclick="deleteAddBook('${c.groupNo}');"> <span
											class="font-weight-bold">삭제하기</span>
										</a>
									</div>

								</div>

								<form id="post" action="" method="post">

									<input type="hidden" name="memNo" value="${loginUser.memberNo }">
									<input type="hidden" name="groupNo" id="groupNo">

								</form>

								<!--========== 주소록 그룹명 수정 처리하는 함수 ==========-->
								<div class="insider updateAddBook" id="update${c.groupNo }">
									<div class="updateAddress">
										<span><input type="text" id="groupName${c.groupNo }" name="groupName" value="${c.groupName }"></span>
										<div class="update-addBtn">
											<span onclick="updateAddGroup('${c.groupNo}')"><i class="fas fa-check"></i></span> 
											<span onclick="dismissUpdateAdd('${c.groupNo}');"><i class="fas fa-times"></i></span>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 반복문 끝 -->
					</c:when>
				</c:choose>
				 --%>
				
				
                </ul>
                
                  <!--========== 주소록 그룹 추가하는 함수 ==========-->
					<div class="insider insertAddBook">
						<div class="insertAddress">
							<span> <input type="text" name="addName" id="addName"></span>
	
							<div class="update-addBtn">
								<a id="insertAddIndiv" onclick="insertAddGroup();"><i class="fas fa-check"></i></a> 
								<a onclick="dismissInsertAdd();"><i class="fas fa-times"></i></a>
							</div>
						</div>
					</div>
	
					<div id="plus-tag" onclick="return insertAddBook();" style="color:rgb(139, 139, 139)">+ 그룹 추가</div>
   					
     
                    <script>
	            	function postFormSubmit(url){
	            		$("#post").attr("action", url).submit();
	            	}
	               </script>
	               
	                <script>
               	 $(function(){
               		selectGroupList();
               	 })
               
               	  function selectGroupList(){
               		  $.ajax({
               			  url:"glist.ad",
               			  data: {no: ${loginUser.memberNo}},
               			  success:function(list){
               				  //console.log(list);
               			  
               				    var li=""
               				  for(let i=0; i<list.length; i++){
               					  li   += "<li>"  
               					        + "<a href='group.ad?groupNo="+
	               				   		+ list[i].groupNo + "'>"
               					        + list[i].groupName 
               					        +"<a class='tag-modify' id='dotDropdown' role='button'data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'> <i class='fas fa-ellipsis-v'></i></a>"
               					        +"</li>"
               					       
               				  }
               			
               				  $(".menubars").append(li);
               				  
               			   var dropdown = $('<div>').addClass('dropdown').appendTo(li);
               		      var dropdownButton = $('<button>').addClass('dropdown-toggle').attr('type', 'button').attr('id', 'dropdownMenuButton').attr('data-toggle', 'dropdown').attr('aria-haspopup', 'true').attr('aria-expanded', 'false').appendTo(dropdown);
               		      dropdownButton.text('Dropdown');
               		    var dropdownMenu = $('<div>').addClass('dropdown-menu').attr('aria-labelledby', 'dropdownMenuButton').appendTo(dropdown);
               		    var dropdownItem1 = $('<a>').addClass('dropdown-item').attr('href', '#').text('Item 1').appendTo(dropdownMenu);
               		    var dropdownItem2 = $('<a>').addClass('dropdown-item').attr('href', '#').text('Item 2').appendTo(dropdownMenu);
                 			
               				   
               			  },error:function(){
               				  console.log("그룹조회용 ajax 통신실패");
               			  }
               		  })
               	  }
       
               </script>
				
                    
                <script>
        
                    
                 // 해당 주소록 그룹으로 이동 처리하는 함수	
    				function postSubmit(url, groupNo) {
    					$("#post").children("#groupNo").val(groupNo); // hidden값에 반복되는 addNo요소 중 클릭된 요소만 value값에 넣기
    					$("#post").attr("action", url).submit();
    				}

    				// 개인 주소록 수정 클릭시 실행하는 함수
    				function updateAddBook(addNo) {
    					// 해당 주소록 번호만 들어간 요소 hide, show 이벤트 부여
    					$("#addTitle"+groupNo).hide();
    					$("#update"+groupNo).show();
    					
    				}
    				
    				// 개인 주소록 수정 처리하는 함수
    				function updateAddGroup(groupNo){
    					
    					let name = $("#groupName" + groupNo).val();
    					console.log($("#groupName" + groupNo).val());
    					
    					
    					$.ajax({
    						url : "updateIndivAddGroup.ma",
    						data : {
    							memNo : '${loginUser.memberNo}',
    							groupNo : groupNo,
    							addName : name
    						},
    						success : function(result){
    							if(result == 'success'){
    								location.reload();
    							}
    						},
    						error : function(){
    							console.log("주소록 그룹명 수정 실패");
    						}
    					})
    					
    				}

    				// 개인 주소록 삭제 처리하는 함수
    				function deleteAddBook(groupNo) {
    					let answer = confirm("주소록을 삭제하면 안에 있는 연락처가 모두 삭제됩니다.\n주소록을 삭제하시겠습니까?");
    					
    					// 삭제 '확정'시 실행
    				 	if(answer == true){
    				 		
    				 		$.ajax({
    				 			url : "deleteAllIndivAddBook.ad",
    				 			data : {
    				 				memNo : ${loginUser.memberNo},
    				 				groupNo : groupNo
    				 			},
    				 			success : function(result){
    				 				console.log(result);
    				 				if(result == 'success'){
    					 				alert("주소록을 삭제했습니다.");
    					 				location.reload(); // 서버 새로고침
    				 				}

    				 			},
    				 			error : function(){
    				 				console.log("실패");
    				 			}
    				 		})
    				 		
    				 	}
    				}

    				// 주소록 그룹명 수정 '취소'시 처리하는 함수
    				function dismissUpdateAdd(groupNo) {
    					$("#update"+groupNo).hide();
    					$("#addTitle"+groupNo).show();
    				}

    				
                   
                 // 주소록 추가 클릭시 처리하는 함수
    				function insertAddBook() {
    					$(".insertAddBook").show();
    					
    				}
                 // 주소록 그룹 '추가'시 실행하는 ajax
    				function insertAddGroup(){

    					if ($("#addName").val().trim() != 0) {
    						$.ajax({
    							url : "insertAddGroup.ad",
    							data : {
    								memNo : '${loginUser.memberNo}',
    								groupName : $("#addName").val()
    							},
    							success:function(adg) {
										console.log(adg);

    		               				  let value="";
    		               				   value += "<li>" 
    		               				   		+"<a href='group.ad?groupNo="+
    		               				   		+ adg.groupNo + "'>"
    		               				   		+ $("#addName").val() 
    		               				   		+ "<a class='tag-modify' id='dotDropdown' role='button'data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'> <i class='fas fa-ellipsis-v'></i></a>"
    		               				   		+ "</li>";
    		               				   
    		               				 $(".menubars").append(value);	
    									$(".insertAddBook").hide();
    						
    								
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

    				// 주소록 추가 '취소'시 처리하는 함수
    				function dismissInsertAdd() {
    					$(".insertAddBook").hide();
    					$("#addName").val("");
    				}

                    </script>

                    
                <br>
               
                    <input id="check-btn2" type="checkbox" /> 
    					<label for="check-btn2">
    					<a><ion-icon name="chevron-down-outline" ></ion-icon></a><a href="company.ad"> 사내주소록</a>
                   		</label>
                    <ul class="group menubars2">
                        <li><a href="company.ad"> 전체</a></li>
                        <li><a href="#">인사부</a></li>
                        <li><a href="#">개발부</a></li>
                        <li><a href="#">총무부</a></li>
                        <li><a href="#">디자인부</a></li>
                    </ul>
             
             
            </div>
            
			
			 
    </div>
	
</body>
</html>