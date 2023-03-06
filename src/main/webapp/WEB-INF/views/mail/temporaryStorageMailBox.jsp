<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
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
                            <img src="resources/images/next.png" width='15px' alt="">
                            전달</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">
                            <img src="resources/images/refresh2.png" width='15px' alt="">
                            이어쓰기</a>
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
                      <input class="form-control form-control-sm me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                      <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                    </form>
                  </div>
                </div>
              </nav>

            <table class="table table-hover">
                <tr style="font-size: 14px; font-weight: bold;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="25">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50"></td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
                <tr style="font-size: 14px;">
                    <td width="20"><input type="checkbox"></td>
                    <td width="20">⭐</td>
                    <td width="50">✉️</td>
                    <td width="100">곽두팔</td>
                    <td width="700">2월 3주차 주간 매출 보고</td>
                    <td width="50">📎</td>
                    <td width="200">2023-02-22 16:20:04</td>
                </tr>
            </table>






            <!--페이징 영역-->
            <div id="paging-area" align="center">
                <button>이전</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>다음</button>
            </div>  
              


        
		
	</div>
	
	
	
	
	
	
	

</body>
</html>