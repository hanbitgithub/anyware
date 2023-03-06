<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<jsp:include page="../common/appro.jsp"></jsp:include>
	
	<div class="content">
		<br>
		<h2>전체 상품 조회</h2>
		<br>
		<table class="list-area table" >
		    <thead>
		        <tr>
		           <th width="5px">번호</th>
		           <th width="170px">제목</th>
		           <th width="30px">기안자</th>
		           <th width="20px">직급</th>
		           <th width="40px">기안일</th>
		           <th width="40px">구분</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<c:choose>
		    		<c:when test="${empty list}">
                        <tr>
                            <td colspan="8"> 조회된 상품이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                    	<c:forEach var="a" items="${list}">
	                        <tr>
	                        	<td>${a.approNo }</td>
	                        </tr>
                        </c:forEach>
                   </c:otherwise>     
                </c:choose>    	
		    </tbody>
		    
		</table>
		
		<br><br>
		
		<ul class="page pagination">
		</ul>
	</div>
	
</body>
</html>