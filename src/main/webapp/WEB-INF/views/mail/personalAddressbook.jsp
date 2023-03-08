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
.table tr:hover{
	background-color: rgb(250, 249, 249);
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
                            <a class="nav-link"  data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <img src="resources/images/add-friend.png" width="20px">
                              추가
                            </a>

                
                        
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <b>주소록 추가</b>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body addAddress">
                                        <table style="text-align: center;">
                                            <tr>
                                                <th width="100">이름</th>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <th>이메일</th>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <th>연락처</th>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <th>회사명</th>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <th>부서</th>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <th>직급</th>
                                                <td><input type="text"></td>
                                            </tr>
                                            <tr>
                                                <th>그룹 </th> 
                                                <td>
                                                    <select>
                                                        <option>전체</option>
                                                        <option>거래처1</option>
                                                        <option>거래처2</option>
                                                    </select>
                                                    <button class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#groupAdd">+</button>
                                                </td>
                                            </tr>
                                            
                                 
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                    <button type="button" class="btn btn-primary btn-sm">저장</button>
                                    <button type="button" class="btn2 btn-secondary" data-bs-dismiss="modal">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </li>
                          
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">
                            <img src="resources/images/refresh2.png" width="18px">
                            수정</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">
                            <img src="resources/images/removeuser.png" width="20px">
                            삭제</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">
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
                                <table>
                                    <tr>
                                        <th width="100">그룹관리</th>
                                        <td>
                                            <select>
                                                <option>거래처1</option>
                                                <option>거래처2</option>
                                            </select>
                                            <button class="btn btn-secondary btn-sm btn2" data-bs-toggle="modal" data-bs-target="#groupAdd">+</button>
                                         </td>
                                    </tr>
                                    <tr>
                                        <th>새이름</th>
                                        <td><input type="text"></td>
                                    </tr>
                                </table>
                    
                                </div>
                                <div class="modal-footer">
                                
                                <button type="button" class="btn btn-primary btn-sm">그룹이름변경</button>
                                <button type="button" class="btn2">그룹삭제</button>
                              
                                </div>
                            </div>
                            </div>
                        </div>
                      </li>
                     
                      
                    </ul>
                    <form class="d-flex" role="search">
                      <input class="form-control form-control-sm me-2" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
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
                	<c:forEach var="ad" items="${list}">
                	
                    <tr style="font-size: 14px;">
                        <td width="10"><input type="checkbox" name="check"></td>
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
       
            

            <!--페이징 영역-->
            <div id="paging-area" align="center">
            
            <c:choose>
            	<c:when test="${pi.currentPage eq 1}">
                	<button disabled>이전</button>
                </c:when>
                <c:otherwise>
                	<button onclick="location.href='personal.ad?cpage=${pi.currentPage - 1}'">이전</button>
                </c:otherwise>
            </c:choose> 
           	<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
           		<button onclick="location.href='personal.ad?cpage=${p}'">${p}</button>
           	</c:forEach>
             
            <c:choose>
            	<c:when test="${pi.currentPage eq pi.maxPage }">
            		<button disabled>다음</button>
            	</c:when>  
            	<c:otherwise>
            		<button onclick="location.href='personal.ad?cpage=${pi.currentPage + 1}'">다음</button>
            	</c:otherwise> 
            </c:choose>    
           
           </div>  
              


       </div> 
       
       		 <!-- Modal -->
                        <div class="modal fade" id="groupAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                            <div class="modal-content">
                                <div class="modal-header">
                                <b>그룹관리</b>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                <table>
                                  
                                    <tr>
                                        <th width="100">그룹명</th>
                                        <td><input type="text"></td>
                                    </tr>
                                </table>
                    
                                </div>
                                <div class="modal-footer">
                                
                                <button type="button" class="btn btn-primary btn-sm">그룹추가</button>
                                <button type="button" class="btn2">취소</button>
                              
                                </div>
                            </div>
                            </div>
                        </div>

       



             

</body>
</html>