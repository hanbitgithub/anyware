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
   <!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>
    
    <!-- 내용 -->
    <div class="content">
    	<div align="center">
          <h3>연차 신청</h3><br>
          <h5>날짜를 선택해주세요</h5>
        </div>
        
        <div align="center"><input id="offCal" type="date" name="offDate"></div><br>
        
        <div id="offDate-div" style="display: none;" align="center">
        <b id="offDate"></b>에 연차를 신청하시겠습니까?
        <br>
        <button onclick="apply()" align="center">신청하기</button>
        <button onclick="cancel()" align="center">취소하기</button>
        </div><br>
        
        
        <br><br>
        <c:choose>
        <c:when test="${not empty list }">
        <div align="center"><b>연차 신청 내역</b></div>
        <div id="table-div" align="center">
                <table id="offTable" style="border: 1px solid black;" >
                    <thead>
                        <tr>
                            <th class="thead-th" style="border: 1px solid black; width: 120px;">연차신청번호</th>
                            <th class="thead-th" style="border: 1px solid black; width: 100px;">이름</th>
                            <th class="thead-th" style="border: 1px solid black; width: 120px;">연차 신청일</th>
                            <th class="thead-th" style="border: 1px solid black; width: 120px;">연차 날짜</th>                            
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lo" items="${ list }">
                        <tr>
                            <td class="tbody-td" id="dayoffNo" style="border: 1px solid gray;">${ lo.dayoffNo }</td>
                            <td class="tbody-td" style="border: 1px solid gray;">${ lo.name }</td>
                            <td class="tbody-td" style="border: 1px solid gray;">${ lo.applyDate }</td>
                            <td class="tbody-td" style="border: 1px solid gray;">${ lo.offDate }</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            </c:when>
            
            </c:choose>
    </div>
    
    <script>
    	$(function(){
    		$('#offTable>tbody>tr').click(function(){
    			$(this).css('background-color', 'yellow');
    			$(this).attr('id','cancelOff');
    			$('#offDate-div').css('display', 'block');
    			
    		})
    	})
    </script>
    
    <script>
    	$(function(){
    		$('#offCal').change(function(){
    			$('#offDate-div').css('display', 'block');
    			$('#offDate').text($('#offCal').val());
    		})
    	})
    	
    	function apply(){
    		var offDate = $('#offCal').val();
    		
    		location.href = 'insertOff.me?apNo='+${loginUser.memberNo}+'&name='+'${loginUser.name}'+'&offDate='+offDate;
    	}
    	
    	function cancel(){
    		
    		location.href = 'cancelOff.me?apNo='+${loginUser.memberNo}+'&dayoffNo=' + $('#cancelOff').children('#dayoffNo').text();
    	}
    </script>
    
</body>
</html>