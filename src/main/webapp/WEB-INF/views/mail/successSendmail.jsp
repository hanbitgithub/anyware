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
#innerOuter a{
    color: black;
    font-weight: 600;
    font-size: 15px;
    margin-right: 10px;
}


#innerOuter{
    margin-left: 30px;
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
       <b style="font-size: 18px;">메일쓰기</b>
            <br><br><br><br>
            <div id="innerOuter">
                <h6 style="font-weight: 600; color: #7291f6; font-size: 18px">
                 <img src="resources/images/message.gif" width ="40"> &nbsp;
                메일이 성공적으로 발송 되었습니다.</h6>
               <c:if test="${not empty msg}">
               	<span style="font-size:16px ">${msg}</span>
               </c:if>
                <br><br>
                <table class="table">
                    <tr>
                        <th width="100">받는사람</th>
                        <c:if test="${not empty receivers }">
                       		  <td>${receivers } </td>
                        </c:if>
                    </tr>
                    <c:choose>
	                    <c:when test="${not empty cc }">
	                    	<tr>
		                        <th width="100">참조</th>
		                        <td>${cc }</td>
	                        </tr>
	                     </c:when>
                        	
                     </c:choose>
                     
                </table>

                <div class="btn-area" align="center">
                    <button class="btn btn-primary btn-sm" onclick="location.href='sendForm.em'">메일쓰기</button>
                    <button class="btn btn-primary btn-sm" onclick="location.href='sendbox.em'">메일목록</button>
                </div>
            </div>
        </div>
             

</body>
</html>