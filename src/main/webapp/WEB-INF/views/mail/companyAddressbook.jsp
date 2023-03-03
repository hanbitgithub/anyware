<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*메일*/
#navbarSupportedContent li{
    font-size: 15px;
    color:black;
    font-weight: 600;
    margin-left: 5px;

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
    font-weight: 600;
    color: white;
    padding: 5px 10px;
}

</style>
</head>
<body>
<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	  <b style="font-size: 18px;"> 사내주소록</b>
            <br><br><br>

            <nav class="navbar navbar-expand-lg bg-light">
                <div class="container-fluid">
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                       
                      <li class="nav-item">
                        <a class="nav-link" href="#">
                            <img src="resources/images/send (1).png" width="18px">
                            메일전송</a>
                      </li>
                     
                      
                    </ul>
                    <form class="d-flex" role="search">
                      <input class="form-control form-control-sm me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                      <button class="btn" type="submit" style="font-size: 13px; color: #ffffff; background-color: rgb(192, 192, 192);"><b>Search</b></button>
                    </form>
                  </div>
                </div>
              </nav>

            <table class="table table-hover" style="text-align: center;">
                <thead>
                    <tr style="font-size: 14px; font-weight: bold;">
                        <td width="10"><input type="checkbox"></td>
                    
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
                    <tr style="font-size: 14px;">
                        <td width="10"><input type="checkbox"></td>
                      
                        <td width="50">곽두팔</td>
                        <td width="150">doopal@naver.com</td>
                        <td width="100">010-2142-4121</td>
                        <td width="120">감자팩토리</td>
                        <td width="50">영업부</td>
                        <td width="50">대리</td>
                        <td width="100">거래처1</td>
                    </tr>
                    <tr style="font-size: 14px;">
                        <td width="10"><input type="checkbox"></td>
                       
                        <td width="50">곽두팔</td>
                        <td width="150">doopal@naver.com</td>
                        <td width="100">010-2142-4121</td>
                        <td width="120">감자팩토리</td>
                        <td width="50">영업부</td>
                        <td width="50">대리</td>
                        <td width="100">거래처1</td>
                    </tr>

                </tbody>
                
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