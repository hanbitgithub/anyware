<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
   
/*서브메뉴*/
.menu{
    position: fixed;
    height: 100vh;
    width: 150px;
    font-size: 14px;
    padding: 50px 20px;
    border-right: 1px solid rgb(211, 210, 210);
    font-family: 'Nanum Gothic', sans-serif;
}
.menu li{
    margin-top: 5px;
   
}
#mail-area li:hover{
    color: gray;
    cursor: pointer;
}
#adbook-area>ul>li li:hover{
    color: gray;
    cursor: pointer;
}

/*컨텐트 영역*/
.content{
    width: 80%;
    margin-left: 200px;
    margin-top: 50px;
}
.partLine{border: 1px solid gray;}
.thead-th{border: 1px solid gray; background-color: gray; color: blanchedalmond; font-weight: bold;}
.tbody-td{border: 1px solid gray;}
.thead-th,.tbody-td{text-align: center;}
#search-area{margin-left: 71%;}
#paging-area{width: 50%; align: center; margin:auto;}
#paging-area2{align: center; margin-left:150px;}
input[type="text"]{
	border: 1px solid rgb(213, 212, 212);
	border-radius: 5px;
	width:200px;
}
select{
	border: 1px solid rgb(213, 212, 212);
	border-radius: 5px;
	height: 29px
}
</style>
</head>
   <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
<!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>
	

        <div class="content">
            <b style="font-size: 17px;"> 전체사원조회</b>

            <br><br>
                <div class="partLine"></div>
                <br>

                <div id="search-area">
                    <form action="" method="get">
                    <input type="hidden" name="cpage" value="1">
                         <select name="condition">
                             <option value="">인사부</option>
                             <option value="">총무부</option>
                             <option value="">영업부</option>
                         </select>
                        
                         <input type="text" name="keyword" value="${ keyword }">
                         <button class="btn btn-primary btn-sm" type="submit">검색</button>
                    </form>
                 </div>
                 <br>

            <div id="table-div" align="center">
                <table style="border: 1px solid black;" >
                    <thead>
                        <tr>
                            <th class="thead-th" style="width: 80px;">사원번호</th>
                            <th class="thead-th" style="width: 100px;">부서</th>
                            <th class="thead-th" style="width: 120px;">직급/직책</th>
                            <th class="thead-th" style="width: 100px;">이름</th>
                            <th class="thead-th" style="width: 200px;">주민등록번호</th>
                            <th class="thead-th" style="width: 400px;">주소</th>
                            <th class="thead-th" style="width: 200px;">연락처</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="m" items="${ list }">
                        <tr>
                            <td class="tbody-td" id="memberNo">${ m.memberNo }</td>
                            <td class="tbody-td">${ m.deptName }</td>
                            <td class="tbody-td">${ m.jobName }/${ m.position }</td>
                            <td class="tbody-td">${ m.name }</td>
                            <td class="tbody-td">${ m.rrn }</td>
                            <td class="tbody-td">${ m.address }</td>
                            <td class="tbody-td">${ m.phone }</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <script>
                //한행 클릭시 실행할 함수
                $(function(){
                	$("tbody>tr").click(function(){
                		location.href = 'detailAllMember.me?memberNo=' + $(this).children("#memberNo").text();
                	})
                })
            </script>
	<br><br>
            <div id="paging-area">
                <div id="paging-area2" align="center">
                
                    <!--페이징바 영역-->
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            </c:when>
                            
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="selectAll.me?cpage=${ pi.currentPage - 1 }&deptName=${ loginUser.deptName }&memberNo=${loginUser.memberNo}">이전</a></li>
                            </c:otherwise>
                        </c:choose>
                        
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item"><a class="page-link" href="selectAll.me?cpage=${ p }&deptName=${ loginUser.deptName }&memberNo=${loginUser.memberNo}">${ p }</a></li>
                        </c:forEach>
                        
                    
                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="selectAll.me?cpage=${ pi.currentPage + 1 }&deptName=${ loginUser.deptName }&memberNo=${loginUser.memberNo}">다음</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>    
            </div>
            


            
        </div>    
            
        

       



             






        
        
    



</body>
</html>