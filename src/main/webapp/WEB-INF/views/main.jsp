<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<title>anyware</title>
<style>
#wrap {
    position:relative;
    /*width:1300px;  wrap에 속한 div의 넓이+margin값을 더한 넓이와 높이값
    height:700px; */
    top:30%;
    left:30%;
    transform: translate(-30%, +5%); /* 중앙정렬 */
    margin:auto;
}
#wrap > #left {
    width:35%;
    height:350px;
    border: 1px solid rgb(247, 247, 247);
    border-radius: 5px;
    /*background-color: rgb(247, 247, 247);*/
    float:left;
    margin: 5px;
    box-sizing:border-box; /* border 또한 위치값을 갖기에 div크기가 더 커짐을 방지하기 위한 */
}
#wrap > #right {
    width:60%;
    height:350px;
    border: 1px solid rgb(247, 247, 247);
    border-radius: 5px;
    /*background-color: rgb(247, 247, 247);*/
    float:left;
    margin: 5px;
    box-sizing:border-box; /* border 또한 위치값을 갖기에 div크기가 더 커짐을 방지하기 위한 */
}
#wrap > div:nth-child(3) {
    clear:both; /* float:left 의 줄바꿈을 위한 */
}


/* 프로필 이미지 */
.profile {
  width:90px;
  border-radius: 100%;
  }

/* 버튼 스타일 */
  .button1 {
  width: 60px; 
  background-color: #0099cc;
  color: rgb(255, 255, 255);
  border: 2px solid  #0099cc;
  border-radius: 7px;
}

.button2 {
  width: 60px; 
  background-color: #e7e7e7;
  color: black;
  border: 2px solid #e7e7e7;
  border-radius: 7px;
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
}  


</style>
</head>
<body>
	
	<!-- 사이드 바  -->
	<jsp:include page="common/sidebar.jsp"></jsp:include>
	
	
	
	<!-- 세부 내용 -->
	<div class="content">
		HEAD
		content
		

		 
    <div id="wrap">
        <div id="left" style="text-align:center;">
          <br><br><br>
          <img class="profile" src="">
            <p><b>${ loginUser.name }</b><b> ${ loginUser.jobName }</b></p>
          <p> 
            출근시간 : ${ commute.commuteIn } 
            <br>
            퇴근시간 : ${ commute.commuteOut }
          </p>
          <button class="boutton button1" onclick="enrollAndOut(1);">출근</button>
          <button class="boutton button2" onclick="enrollAndOut(2);">퇴근</button>
        </div>
       
       
        	
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


        <div id="right">
        <br>
        <i class="fa-regular fa-file"></i> &nbsp;
          <span><b>전자결재</b></span>
        </div>


        <div id="left">
        <br>
       <!-- <i class="fa-regular fa-envelope"></i> &nbsp; -->
          <span><b>&nbsp;&nbsp; ✉️ &nbsp; 메일함</b></span>
          <div class="container">
               <br>
               <!-- Nav tabs -->
               <ul class="nav nav-tabs flex-column flex-sm-row nav-justified" role="tablist">
                 <li class="nav-item">
                   <a class="nav-link active" data-toggle="tab" href="#receive" style="color:black;">받은메일</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" data-toggle="tab" href="#send" style="color:black;">보낸메일</a>
                 </li>
                
               </ul>

             
               <!-- Tab panes -->
               <div class="tab-content">
                 <div id="receive" class="container tab-pane active">
                  <table class="table table-hover" style="font-size:12px">
	                  <tr>
	                  	<td width="15">김강쥐</td>
	                  	<td width="100">어쩌고 회신부탁드립니다.</td>
	                  	<td width="10">2023-03-08</td>
	                  </tr> 
	                  <tr>
	                  	<td width="15">김강쥐</td>
	                  	<td width="100">어쩌고 회신부탁드립니다.</td>
	                  	<td width="10">2023-03-08</td>
	                  </tr> 
	                  <tr>
	                  	<td width="15">김강쥐</td>
	                  	<td width="100">어쩌고 회신부탁드립니다.</td>
	                  	<td width="10">2023-03-08</td>
	                  </tr> 
	                  <tr>
	                  	<td width="15">김강쥐</td>
	                  	<td width="100">어쩌고 회신부탁드립니다.</td>
	                  	<td width="10">2023-03-08</td>
	                  </tr> 
	                     
	                  
	                   
                  </table>
                  
                 </div>
                 <div id="send" class="container tab-pane fade">       
                   <table class="table table-hover" style="font-size:12px">
	                  <tr>
	                  	<td width="15">이배추</td>
	                  	<td width="100">견적서 요청 어쩌고어쩌고 어쩌고....</td>
	                  	<td width="20">2023-03-08</td>
	                  </tr> 
	                  <tr>
	                  	<td width="15">이배추</td>
	                  	<td width="100">견적서 요청 어쩌고어쩌고 어쩌고....</td>
	                  	<td width="20">2023-03-08</td>
	                  </tr> 
	                 
	                 <tr>
	                  	<td width="15">이배추</td>
	                  	<td width="100">견적서 요청 어쩌고어쩌고 어쩌고....</td>
	                  	<td width="20">2023-03-08</td>
	                  </tr> 
	                 
	                 <tr>
	                  	<td width="15">이배추</td>
	                  	<td width="100">견적서 요청 어쩌고어쩌고 어쩌고....</td>
	                  	<td width="20">2023-03-08</td>
	                  </tr> 
	                 
	                 <tr>
	                  	<td width="15">이배추</td>
	                  	<td width="100">견적서 요청 어쩌고어쩌고 어쩌고....</td>
	                  	<td width="20">2023-03-08</td>
	                  </tr> 
	                 
	                 
	                   
                  </table>
                 </div>
                
               </div>
          </div>
                              
				
		</div>


        <div id="right">
        <br>
        <i class="fa-solid fa-list"></i> &nbsp;
          <span><b>자유게시판</b></span>
        </div>
    </div>


	</div>
	
</body>
</html>