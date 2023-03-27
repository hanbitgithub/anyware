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
        <button onclick="cancel()">취소하기</button>
        <br><br>
        <c:choose>
        <c:when test="${not empty list }">
        <div id="table-div" align="center">
                <table id="offTable" style="border: 1px solid black;" >
                    <thead>
                        <tr>
                            <th class="thead-th" style="width: 120px;">연차신청번호</th>
                            <th class="thead-th" style="width: 100px;">이름</th>
                            <th class="thead-th" style="width: 120px;">연차 신청일</th>
                            <th class="thead-th" style="width: 120px;">연차 날짜</th>                            
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="lo" items="${ list }">
                        <tr>
                            <td class="tbody-td" id="dayoffNo">${ lo.dayoffNo }</td>
                            <td class="tbody-td">${ lo.name }</td>
                            <td class="tbody-td">${ lo.applyDate }</td>
                            <td class="tbody-td">${ lo.offDate }</td>
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
    			
    		})
    	})
    </script>
    
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
    	
    	function cancel(){
    		
    		location.href = 'cancelOff.me?apNo='+${loginUser.memberNo}+'&dayoffNo=' + $('#cancelOff').children('#dayoffNo').text();
    	}
    </script>
    
</body>
</html>