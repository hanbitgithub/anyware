<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/dayjs@1.11.7/dayjs.min.js"></script>

</head>
<body>
	<!-- 사이드 바  -->
    <jsp:include page="../common/sidebar.jsp"></jsp:include>
    
    <!-- 스케줄 메뉴바 -->
    <jsp:include page="../common/schedulemenu.jsp"></jsp:include>
    
    <!-- 내용 -->
    <div class="content">
    	<div>
          <h3>연차 신청</h3><br>
        </div>
        
        <div><input id="offCal" type="date" name="offDate"></div><br>
        
        <div id="offDate-div"><b id="offDate"></b>에 연차를 신청하시겠습니까?</div><br>
        
        <button onclick="apply()">신청하기</button>
    </div>
    
    <script>
    	$(function(){
    		$('#offCal').change(function(){
    			$('#offDate').text($('#offCal').val());
    		})
    	})
    	
    	function apply(){
    		var offDate = $('#offCal').val();
    		
    		location.href = 'insertOff.me?apNo='+${loginUser.memberNo}+'&name='+'${loginUser.name}'+'&offDate='+offDate;
    	}
    </script>
    
</body>
</html>