<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="currTime" class="java.util.Date" /> 
<jsp:useBean id="now" class="java.util.Date" />  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>anyware</title>
<style>
#wrap {
    position:relative;
   /* width: 1300px;/* wrap에 속한 div의 넓이+margin값을 더한 넓이와 높이값
    height:700px; */
    left:30%;
    transform: translate(-35%,1%); /* 중앙정렬 */
    margin:auto;
 
}
#wrap > .left {
    width:38%;
    height:350px;
    border: 1px solid rgb(230, 230, 230);
    border-radius: 5px;
    /*background-color: rgb(247, 247, 247);*/
    float:left;
    margin: 5px;
    box-sizing:border-box; /* border 또한 위치값을 갖기에 div크기가 더 커짐을 방지하기 위한 */
}
#wrap > .right {
    width:60%;
    height:350px;
    border: 1px solid rgb(230, 230, 230);
    border-radius: 5px;
    /*background-color: rgb(247, 247, 247);*/
    float:left;
    margin: 5px;
    box-sizing:border-box; /* border 또한 위치값을 갖기에 div크기가 더 커짐을 방지하기 위한 */
}
/*
#wrap > div:nth-child(3) {
    clear:both;  float:left 의 줄바꿈을 위한 
}
*/

/* 프로필 이미지 */
.profile {
  width:120px;
  height: 120px;
  border-radius: 100%;
  margin-bottom: 5px;
  }
  
#profile-area{
  width:50%;
  height: 300px;
  float:left;
  margin-top: 30px;
  
}
#attendence-area{
 	width:40%;
 	height: 300px;
 	float:left;
    margin-top: 40px;
 	
}

/* 버튼 스타일 */
  .button1 {
  width: 60px; 
  background-color: #7291f6;
  color: rgb(255, 255, 255);
  border: 2px solid  #7291f6;
  border-radius: 7px;
  font-weight: bold;
  
}

.button2 {
  width: 60px; 
  background-color: #e7e7e7;
  color: black;
  border: 2px solid #e7e7e7;
  border-radius: 7px;
  font-weight: bold;

}

button:hover{
	opacity: 70%
}

/* 아이콘 */
.icon {
  width:25px;
  float: left;
  margin-left: 10px;
  }


/*메일*/
.nav-tabs{
  font-size: 13px;
  font-weight:600;
}  
tr:hover {
  background-color: #eee;
  cursor: pointer;
}
#mailC:hover{
	opacity: 70%;
	cursor:pointer;
}
#boardList{
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	padding-bottom: 10px;
}
#board-btn{
	padding-right: 20px;
	float: right;
	font-size:small;
	color: #464646;
}
</style>
</head>
<body>
	
	<!-- 사이드 바  -->
	<jsp:include page="common/sidebar.jsp"></jsp:include>
	
	
	
	<!-- 세부 내용 -->
	<div class="content">


    <div id="wrap">
        <div class="left" style="text-align:center;">
          <br><br>
           <div id="profile-area" >
	          <img class="profile" src="<c:out value='${loginUser.profileUrl }' default='resources/images/profile2.jpg' />">
	            <p><b>${ loginUser.name }</b><b> ${ loginUser.jobName }</b>
	            <br><span style="font-size:14px;">${ loginUser.deptName }</span>
	            </p>
           </div> 
           
           <div id="attendence-area">
           	<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일" var="now" />
           		<c:out value="${now}"/>
           		<fmt:formatDate value="${currTime}" pattern="HH:mm:ss" var="currTime" />
	            <p id="WhatTimeIsItNow" style="font-size:25px; text-align:center;"><b></b><c:out value="${currTime}"/><b></b></p> 
				<table>
			
					<tr>
						<th width="150" height="30px">출근</th>
						<td width="200">${ loginUser.commuteIn }</td>
					
					</tr>
					<tr>
						<th width="150">퇴근</th>
						<td width="200">${ loginUser.commuteOut }</td>
					</tr>
				
				</table>
	           <%-- <p> 
	            <span><b>출근시간</b></span> &nbsp;<span> ${ commute.commuteIn } </span>
	            <br>
	            <span><b>퇴근시간</b> </span> &nbsp; <span>${ commute.commuteOut }</span>
	          </p> --%>
	          <br>
	          <button class="boutton button1" onclick="enrollAndOut(1);">출근</button>
	          <button class="boutton button2" onclick="enrollAndOut(2);">퇴근</button> 
	        </div>
        </div>
       <script type="text/javascript">
			$(document).ready(function(){
				var timeBoard = document.getElementById("WhatTimeIsItNow");

			    function getTime() {
			        var d = new Date();
			        var hur = d.getHours();
			        var min = d.getMinutes();
			        var sec = d.getSeconds();

			        var time = (hur < 10 ? "0" + hur  : hur) + ":" + (min < 10 ? "0" + min  : min) + ":" + (sec < 10 ? "0" + sec  : sec);

			        timeBoard.innerHTML = time;
			    }

			    setInterval(getTime, 1000);
			
			})
		</script>
        	
        <script>
          function enrollAndOut(num){
        	  
        	  
        	//const c = new Date();
        	//const year = c.getFullYear();
        	//const month = (c.getMonth() + 1);
        	//const date = c.getDate();
          	//const hour = c.getHours();
          	//const min = c.getMinutes();
          
          	//const cDate = c.getFullYear() + '-' + (c.getMonth() + 1) + '-' + c.getDate();
          	//const cTime = c.getHours() + ':' + c.getMinutes();
          	          	          	          	  
            if(num == 1){
                    location.href = 'commuteIn.me?memberNo='+${loginUser.memberNo}+'&name='+'${loginUser.name}';
                    				//+'&commuteDate='+cDate + '&commuteIn='+cTime;
            }else{
                    location.href = 'commuteOut.me?memberNo='+${loginUser.memberNo}+'&name='+'${loginUser.name}';
            }
          }
        </script>


        <div class="right">
        <br>
        
        &nbsp;&nbsp;&nbsp;<img src="resources/images/appro.png" width="18px;" height="18px;" style="margin-bottom: 5px;">&nbsp;
        <span><b>전자결재</b></span>
        
	  	<div id="approContent" style="margin:10px;">
		  <table id="approList" class="table table-hover" style="font-size: small; text-align: center;">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>중간기안자</th>
				<th>최종기안자</th>
		    </tr>
			</thead>
			<tbody style="border: white">
			</tbody>
		  </table>
			</div>
		</div>
		<script>
		
		<!-- 결재 상세 페이지-->
	
		
		$(document).ready(function(){
			
			let approList;
			
			$.ajax({
				url:"main.appro",
				data:{
				},
				success:function(list){
					
					approList = list;
					
					let m= "";
					
					for (let i=0; i< approList.length; i++){
						m += "<tr>"
								+ "<td>" + approList[i].approNo + "</td>"
								+ "<td>" + approList[i].approTitle + "</td>"
								+ "<td>" + approList[i].interName + "</td>"
								+ "<td>" + approList[i].finalName + "</td>"
								+"</tr>"
					}
					
					$("#approList tbody").html(m);
				  	
					
				},error:function(){
					
				}
				
			})
				
		})
		
		$(function(){
			$(document).on("click", "#approList>tbody>tr", function(){
					location.href ='detail.appro?approNo='+$(this).children().eq(0).text();
			})
		})
		</script>
		  
		
        <div class="left">
        <br>
       <!-- <i class="fa-regular fa-envelope"></i> &nbsp; -->
          <span onclick="location.href='receivebox.em'" id="mailC"><b>&nbsp;&nbsp;&nbsp;<img src="resources/images/maile.gif" width="30px;">  메일함</b> </span> &nbsp;<span class="count badge text-bg-primary"></span>
          <div class="container">
               <br>
               <!-- Nav tabs -->
               <ul class="nav nav-tabs flex-column flex-sm-row nav-justified" role="tablist">
                 <li class="nav-item">
                   <a class="nav-link active" data-toggle="tab" href="#receive" style="color:rgb(88, 88, 88);">받은메일</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" data-toggle="tab" href="#send" style="color:rgb(88, 88, 88)">보낸메일</a>
                 </li>
                
               </ul>

             
               <!-- Tab panes -->
               <div class="tab-content" style="padding:0px;">
                 <div id="receive" class="container tab-pane active">
                  <table class="table table-hover rlist"  style="font-size:13px">
                 
                  </table>
                  
                 </div>
                 <div id="send" class="container tab-pane fade">       
                   <table class="table table-hover slist" style="font-size:13px">
	      
                  </table>
                 </div>
                
               </div>
          </div>
        </div>
          <script>
          $(function(){
        	  $.ajax({
        		  url: "receiveList.em",
        		  success:function(list){
        			 // console.log(list);
        			  let value = "";
        			  for(let i=0; i<list.length; i++){
        				  let r = list[i];
      	
        				  if(r.mailStatus.read == 'Y'){
        				  value += "<tr style='font-weight: 500' class='mstatus" + r.emNo +"'>"
        				        + "<input type='hidden' name='mailNo' value=' " + r.emNo + "'>"
        				        + "<td width='10'>" + r.memName +"</td>"
        				        + "<td width='120'>" + (r.emTitle.length > 20 ? r.emTitle.substring(0, 20) + '..' : r.emTitle)  
        				        + "</td>"
        				        + "<td width='20'>" + r.sendDate +"</td>"
        				        + "</tr>"
        				  }else{
        					  value += "<tr style='font-weight: bold' class='mstatus" + r.emNo +"'>"
        					    + "<input type='hidden' name='mailNo' value=' " + r.emNo + "'>"
          				        + "<td width='10'>" + r.memName +"</td>"
          				        + "<td width='120'>" +(r.emTitle.length > 20 ? r.emTitle.substring(0, 20) + '..' : r.emTitle)
          				        + "</td>"
          				        + "<td width='20'>" + r.sendDate +"</td>"
          				        + "</tr>"
        				  }  
        			  }
        			  
        			     $(".rlist").html(value);
        		  },
        		  error:function(){
        			  console.log("받은메일 조회 ajax 통신실패");
        		  }
        	  })

          })
          </script>
          <script>
          	$(function(){
          		unreadCount();
          	})
          	
          	function unreadCount(){
                   		$.ajax({
                   		    url: "unreadcount.em",
                   		    data: { memId : '${loginUser.memberId}' },
                   		    success: function (count){
                   		    	console.log(count);
                   		    	var value="";
                   		    	if(count != 0 ){
                   		    		value = count;
                   		    	}else{
                   		    		value = 0;
                   		    		
                   		    	}
                   		            
                   		          $(".count").html(value);
                   		       
                   		    	
                   		    },error: function () {
                     		      console.log("안읽은메일조회용 ajax 통신실패");
                   		    }
                   		  });
                   		     
            	}
            
            
            </script>
          </script>
          
           
	       <form id="mailDetail" action="" method="post">
	        <input type="hidden" name="box">
			<input type="hidden" name="emType">
			<input type="hidden" name="emNo" id="detailNo">
			<input type="hidden" name="receiver" value="${loginUser.memberId}">
			<input type="hidden" name="sender" value="${loginUser.memberId}">
		  </form>
					
			  <script>
         		 $(".rlist").on("click","tr",function(){
				
					let emNo = $(this).children('input[type=hidden]').val();
					console.log(emNo);
					
					$("#detailNo").val(emNo);
					$("input[name=box]").val(1);
					$("input[name=emType]").val(1);
					
					$(".mstatus"+emNo ).css("font-weight","300");
			
					$("#mailDetail").attr("action", 'mail.em').submit();

				});
         		 

         		 $(".slist").on("click","tr",function(){
				
					let emNo = $(this).children('input[type=hidden]').val();
					console.log(emNo);
					$("#detailNo").val(emNo);
					$("input[name=box]").val(0);
					$("input[name=emType]").val(0);
					
					$(".mstatus"+emNo ).css("font-weight","300");
			
					$("#mailDetail").attr("action", 'mail.em').submit();

				});
			
	          </script>
	          	

          <script>
          $(function(){
        	  $.ajax({
        		  url: "sendList.em",
        		  success:function(list){
        			 // console.log(list);
        			  let value = "";
        			  for(let i=0; i<list.length; i++){
        				  let r = list[i];
      	
        				  if(r.mailStatus.read == 'Y'){
        				  value += "<tr style='font-weight: 500'  class='mstatus" + r.emNo +"'>"
        					   + "<input type='hidden' name='mailNo' value=' " + r.emNo + "'>"
        				        + "<td width='10'>" + r.receivers.substring(0,3) +"</td>"
        				        + "<td width='120'>" + (r.emTitle.length > 20 ? r.emTitle.substring(0, 20) + '..' : r.emTitle) 
        				        + "</td>"
        				        + "<td width='20'>" + r.sendDate +"</td>"
        				        + "</tr>"
        				  }else{
        					  value += "<tr style='font-weight: bold' class='mstatus" + r.emNo +"'>"
        						 + "<input type='hidden' name='mailNo' value=' " + r.emNo + "'>"
          				        + "<td width='10'>" + r.receivers.substring(0,3) +"</td>"
          				        + "<td width='120'>" +(r.emTitle.length > 20 ? r.emTitle.substring(0, 20) + '..' : r.emTitle) 
          				        + "</td>"
          				        + "<td width='20'>" + r.sendDate +"</td>"
          				        + "</tr>"
        				  }  
        			  }
        			  
        			     $(".slist").html(value);
        		  },
        		  error:function(){
        			  console.log("받은메일 조회 ajax 통신실패");
        		  }
        	  })
          })
          
          </script>
          
          
                              
				
	


        <div class="right">
        <br>
		&nbsp;&nbsp;&nbsp;
		<img src="resources/images/board.png" width="20px;" height="25px;" style="margin-bottom: 5px;">&nbsp;
          <span><b>자유게시판</b></span> 
          <a href="list.bo" id="board-btn">+더보기</a>
		  <div id="boardList">
		  <table id="boardList" class="table table-hover" style="font-size: small; text-align: center;">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			  </tr>
			</thead>
			<tbody style="border: white">
			</tbody>
		  </table>
			</div>
        </div>
            <script>
            	$(function(){
            		
            		mainBoardList();
            		
            		$(document).on("click", "#boardList>tbody>tr", function(){
            			location.href = 'detail.bo?no=' + $(this).children().eq(0).text();
            		})
            	})
            	
            	function mainBoardList(){
            		$.ajax({
            			url:"mainPage.bo",
            			success:function(list){
            				console.log(list);
            				
            				let value = "";
            				for(let i=0; i<list.length; i++){
            					let b = list[i];
            					value += "<tr>" 
            							+ '<td>' + b.boardNo + "</td>"
            							+ "<td>";
            							if(b.originName != null){
            								value += "📁";
            							}
            							value += b.boardTitle + "</td>" 
            							+ "<td>" + b.name + b.jobName + "</td>" 
            							+ "<td>" + b.createDate + "</td>"
            							+ "<td>" + b.count + "</td>"
            							+ "</tr>";
            						
            					
            				}
            				
            				$("#boardList tbody").html(value);
            			},error:function(){
            				console.log("메인 게시글 조회용 ajax 통신실패");
            			}
            			
            		})
            	}
            	
            </script>
    </div>


	</div>
	
</body>
</html>