<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사내주소록</title>
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
                        <a class="nav-link" href="#" onclick="sendMail();">
                            <img src="resources/images/send (1).png" width="18px">
                            메일전송</a>
                      </li>
                     
                      
                    </ul>
                    <form class="d-flex" role="search" action="searchEmp.ad" method="get">
                      <input class="form-control form-control-sm me-2" id="search" type="search" name="keyword" placeholder="검색어를 입력하세요" aria-label="Search" value="${keyword }">
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
                        <td width="50">직급</td>
                        <td width="100">부서</td>
                    </tr>
                </thead>
                <tbody>
                
                <c:choose>
                	<c:when test="${not empty mlist}">
                		<c:forEach var="m" items="${mlist}">
		                    <tr style="font-size: 14px;">
		                        <td width="10"><input type="checkbox" name="check" class="memId" value="${m.name } ${m.memberId}@anyware.com"></td>
		                        <td width="50">${m.name }</td>
		                        <td width="150">${m.email }</td>
		                        <td width="100">${m.phone }</td>
		                        <td width="120"></td>  
		                        <td width="50">${m.deptName }</td>
		                        <td width="100">${m.jobName }</td>
		                    </tr>
	                    </c:forEach>
                    </c:when>
                    <c:otherwise>
                    	<tr><td colspan="7">등록된 연락처가 없습니다.</td></tr>
                    </c:otherwise>
				</c:choose>                  

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
            // '메일전송'버튼 클릭시 실행하는 함수
				function sendMail(){
						 
					// 선택한 요소가 있는지 확인
					let $checked = $(".memId:checked");
						 
					// 선택하지 않은 경우
					if( $checked.length < 1){
						alert("선택된 연락처가 없습니다.");
						return false;
							 
					} else { // 선택한 경우

							 let checkArr = [];
							 $(".memId").each(function(){
								 
								 if($(this).prop("checked")){
									 checkArr.push( $(this).val() );
								 }
							 });
							 
						const receivers = checkArr.toString();
						
						//console.log(receivers);
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
							<button
								onclick="location.href='company.ad?cpage=${pi.currentPage - 1}'">이전</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='searchEmp.ad?cpage=${pi.currentPage-1}&keyword=${keyword}'">이전</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
				<c:choose>
					<c:when test="${empty keyword }">
						<button onclick="location.href='company.ad?cpage=${p}'">${p}</button>
					</c:when>
					<c:otherwise>
						<button
							onclick="location.href='searchEmp.ad?cpage=${p}&keyword=${keyword}'">${p}</button>
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
								onclick="location.href='company.ad?cpage=${pi.currentPage + 1}'">다음</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='searchEmp.ad?cpage=${pi.currentPage+1}&keyword=${keyword}'">다음</button>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>

		</div>



       </div> 

       



             

</body>
</html>