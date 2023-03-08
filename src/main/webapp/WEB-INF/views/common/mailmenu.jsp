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
                <a href="test.do">테스트</a>
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

   					<input id="check-btn" type="checkbox" /> 
   					<label for="check-btn" class="label">
   					<ion-icon name="chevron-down-outline" ></ion-icon> 개인주소록</label>

                     <ul class="group menubars" id="personal">
                        <li id="all"><a href="personal.ad">전체 </a></li>
                       
                   
		             <!--========== 주소록 그룹 추가하는 함수 ==========-->
					<div class="insider insertAddBook">
						<div class="insertAddress">
							<span> <input type="text" name="addName" id="addName"></span>
	
							<div class="update-addBtn">
								<a id="insertAddIndiv" onclick="insertAddIndiv();"><i class="fas fa-check"></i></a> 
								<a onclick="dismissInsertAdd();"><i class="fas fa-times"></i></a>
							</div>
						</div>
					</div>
	
					<div id="plus-tag" onclick="return insertAddBook();" style="color:rgb(139, 139, 139)">+ 주소록 추가</div>
	                   
                   </ul>
                  
                    
                    <script>
                    
                    
                 // 주소록 추가 클릭시 처리하는 함수
    				function insertAddBook() {
    					$(".insertAddBook").show();
    					
    				}
                 // 주소록 그룹 '추가'시 실행하는 ajax함수
    				function insertAddIndiv(){

    					if ($("#addName").val().trim() != 0) {

    						$.ajax({
    							url : "insertAddGroup.ad",
    							data : {
    								memNo : '${loginUser.memNo }',
    								groupName : $("#addName").val()
    							},
    							success : function(result) {
    								console.log($("#addName").val());
    								if (result == "success") {
    									location.reload(); // 서버 새로고침
    								}
    							},
    							error : function() {
    								alert("주소록을 추가하는데 실패했습니다. 다시 시도해주세요.");
    							}

    						})
    					} else {
    						alert("주소록명을 입력해주세요.");
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
    					<a><ion-icon name="chevron-down-outline" ></ion-icon> 사내주소록</a>
                   		</label>
                    <ul class="group menubars2">
                        <li><a href="company.ad"> 전체</a></li>
                        <li><a href="#">인사팀</a></li>
                        <li><a href="#">개발팀</a></li>
                        <li><a href="#">총무팀</a></li>
                    </ul>
             
               <script>
               	 $(function(){
               		selectGroupList();
               	 })
               
               	  function selectGroupList(){
               		  $.ajax({
               			  url:"glist.ad",
               			  data: {no: 1},
               			  success:function(list){
               				  //console.log(list);
               			  
               				  let value="";
               				  for(let i=0; i<list.length; i++){
               					  value += "<li>" + list[i].groupName + "</li>";
               				  }
               				  
               				  $("#all").append(value);
               				  
               			  },error:function(){
               				  console.log("그룹조회용 ajax 통신실패");
               			  }
               		  })
               	  }
               
               
               </script>
               
               
               
               
            </div>
            
			
			 
    </div>
	
</body>
</html>