<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		
			<div><input type="text" name="memberNo" id="memberNo" placeholder="사원번호를 입력해주세요"></div>
			<br>
			<div><button type="submit" onclick="submit1()">아이디 찾기</button></div>
	</div>
	
	<div align="center" id="message" style="display: none;"><b>이메일로 인증코드를 전송했습니다</b></div>
	
	<div align="center">
		<form action="" id="checkCodeForm">
			<div><input type="text" name="code" id="code" placeholder="전송 받은 코드를 입력해주세요"></div>
			<br>
			<div><button id="submit2" type="submit">인증코드 전송</button></div>
			
		</form>
	</div>
	
	<script>
		function submit1(){
			if($('#memberNo').val().trim().length > 0){
				var memberNo = $('#memberNo').val();
				$.ajax({
					url:"searchId.me",
					data:{memberNo:memberNo},
					success:function(code1){
						$('#message').css('display', 'block');
					}
				})
			}else{
				alert("사원번호를 입력해주세요");
			}
		}
	</script>
	
	
</body>
</html>