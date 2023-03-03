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
#btn-area a{
    color: black;
    font-weight: 600;
    font-size: 15px;
    margin-right: 10px;
}
#btn-area a:hover{
 color: #7c7c7c;
 text-decoration: none;
}

#send textarea{
    width: 1200px;
    border: 1px solid rgb(202, 202, 201);
    border-radius: 5px;
    padding: 20px 30px;
}

#send-area{
    margin-left: 50px;
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
          <b style="font-size: 18px;">보낸메일함</b>
          <br><br>

            <div id="send-area">
                <div id="btn-area">
                    <a href=""><img src="resources/images/send (1).png"width="20"> 답장</a>
                    <a href=""><img src="resources/images/next.png"width="20"> 전달</a>
                    <a href=""><img src="resources/images/delete.png"width="20"> 휴지통</a>
                    <a href=""><img src="resources/images/no-spam.png"width="20"> 스팸차단</a>
                    <a href=""><img src="resources/images/back.png"width="20"> 목록으로</a>
                    
                </div>
                <br>
                <div>
                    <table id="send"style="font-size: 15px;" >
                        <tr>
                            <th colspan="2" height="40px" style="font-size: large;"><span>⭐</span> 
                            견적서 요청드립니다. </th>
                            
                        </tr>
                        <tr>
                            <td colspan="2"  height="30px" style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2023-02-23 14:12:30</td>
                        </tr>
                        <tr>
                            <th width="120" height="40px">보낸사람</th>
                            <td>유한빛(hanbit@naver.com)</td>
                        </tr>
                        <tr>
                            <th  width="120" height="40px">받는사람</th>
                            <td>김강순(kim@naver.com)</td>
                        </tr>
                    <!--<c:if test="참조가 있을때만 보임">
                         <tr>
                            <th  width="120" height="35px">참조</th>
                            <td>김강순(kim@naver.com)</td>
                        </tr>
                        </c:if>
						--> 
                        <tr>
                            <th height="40px">첨부파일</th>
                            <td>
                                첨부파일이 없습니다. 
                            </td>
                          
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <hr>
                                <textarea rows="20">안녕하세요.  김강순대리님 ㅡㅡ
견적서 빨랑주세요 
                                </textarea>
                            </td>
                        </tr>
                        
                       

                    </table>
                   
                    

                </div>

            </div>

            
        </div>
	
	

</body>
</html>