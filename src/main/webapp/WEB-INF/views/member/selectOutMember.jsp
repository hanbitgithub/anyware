<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>


.partLine{border: 1px solid gray;}
.thead-th{border: 1px solid gray; background-color: gray; color: blanchedalmond; font-weight: bold;}
.tbody-td{border: 1px solid gray;}
.thead-th,.tbody-td{text-align: center;}
#search-area{margin-left: 75%;}
#paging-area{width: 50%; align: center;}
#paging-area2{align: center;}
 </style>
</head>
<body id="body-pd">
    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
   <!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>
        <div class="content">
            <b> 전체사원조회</b>

            <br><br>
                <div class="partLine"></div>
                <br>

                

            <div id="table-div" align="center">
                <table style="border: 1px solid black;">
                    <thead>
                        <tr>
                            <th class="thead-th" style="width: 200px;">사원번호</th>
                            <th class="thead-th" style="width: 100px;">부서</th>
                            <th class="thead-th" style="width: 100px;">직급/직책</th>
                            <th class="thead-th" style="width: 100px;">이름</th>
                            <th class="thead-th" style="width: 200px;">아이디</th>
                            <th class="thead-th" style="width: 200px;">입사일</th>
                            <th class="thead-th" style="width: 100px;">이메일</th>
                            
                           
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${ list }">
                        <tr>
                            <td class="tbody-td" id="memberNo">${ m.memberNo }</td>
                            <td class="tbody-td">${ m.deptName }</td>
                            <td class="tbody-td">${ m.jobName }/${ m.position }</td>
                            <td class="tbody-td">${ m.name }</td>
                            <td class="tbody-td">${ m.memberId }</td>
                            <td class="tbody-td">${ m.enrollDate }</td>
                            <td class="tbody-td">${ m.email }</td>                            
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            

            <div id="paging-area">
                <div id="paging-area2" align="center">
                
                    <!--페이징바 영역-->
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            </c:when>
                            
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="selectOut.me?cpage=${ pi.currentPage - 1 }&deptName=${ loginUser.deptName }">이전</a></li>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item"><a class="page-link" href="selectOut.me?cpage=${ p }&deptName=${ loginUser.deptName }">${ p }</a></li>
                        </c:forEach>
                        
                    
                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="selectOut.me?cpage=${ pi.currentPage + 1 }&deptName=${ loginUser.deptName }">다음</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>    
            </div>
            


            
        </div>    
            
        

       



             






        
        
    



</body>
</html>