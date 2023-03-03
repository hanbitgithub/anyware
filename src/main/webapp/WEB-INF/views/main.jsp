<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/def66b134a.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style>
#wrap {
    position:relative;
    width:1300px; /* wrap에 속한 div의 넓이+margin값을 더한 넓이와 높이값 */
    height:700px;
    top:30%;
    left:30%;
    transform: translate(-30%, +5%); /* 중앙정렬 */
    margin:auto;
}
#wrap > #left {
    width:500px;
    height:350px;
    border: 1px solid rgb(247, 247, 247);
    border-radius: 5px;
    background-color: rgb(247, 247, 247);
    float:left;
    margin: 5px;
    box-sizing:border-box; /* border 또한 위치값을 갖기에 div크기가 더 커짐을 방지하기 위한 */
}
#wrap > #right {
    width:770px;
    height:350px;
    border: 1px solid rgb(247, 247, 247);
    border-radius: 5px;
    background-color: rgb(247, 247, 247);
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
</style>
</head>
<body>
	
	<!-- 사이드 바  -->
	<jsp:include page="common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="common/appro.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
		HEAD
		content
		

		 
    <div id="wrap">
        <div id="left" style="text-align:center;">
          <br><br><br>
          <img class="profile" src="C:\Users\GDJ57\Desktop\이배추대표이사.jpg">
            <p><b>이배추 대표이사</b><br>CEO</p>
          <p> 
            출근시간 : 09:00 
            <br>
            퇴근시간 : -- : --
          </p>
          <button class="boutton button1">출근</button>
          <button class="boutton button2">퇴근</button>
        </div>


        <div id="right">
        <br>
        <i class="fa-regular fa-file"></i> &nbsp;
          <span><b>전자결재</b></span>
        </div>


        <div id="left">
        <br>
        <i class="fa-regular fa-envelope"></i> &nbsp;
          <span><b>메일</b></span>
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