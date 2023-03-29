<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>

*{
    padding: 0;
    margin: 0;
   
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    
}
button[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #7291f6;
    margin-top: 10px;
	border:none;
	padding: 5px 10px;
	border-radius: 10px;
	
}

input[type="text"]{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
 
    border-radius: 6px;
    background-color: #F8F8F8;
	border:none;
}



</style>
</head>
<body>
	<div class="login-wrapper" align="center">
	<div align="center">
			<img src="resources/images/로고2.png" alt="" width="300px">
			<div><input type="text" name="memberNo" id="memberNo" placeholder="사원번호를 입력해주세요"></div>
			
			
	</div>
	<div align="center">
			<br>
			<div><input type="text" name="memberId" id="memberId" placeholder="아이디를 입력해주세요"></div>
			
			<div><button type="submit" onclick="submit1();">비밀번호 찾기</button></div>
	</div>
	<br><br>
	<div align="center" id="message" style="display: none;"><b>이메일로 인증코드를 전송했습니다</b></div>
	
	<div align="center">
		
			<div><input type="text" name="code" id="code" placeholder="전송 받은 코드를 입력해주세요"></div>
			
			<div><button type="submit" id="submit2">인증코드 전송</button></div>
			
	</div> 	
	<br><br>
	<div align="center" id="checkCodeAsk" style="display: none;"><b>인증번호를 입력해주세요</b></div>
	<div align="center" id="newPwd-div" style="display: none;">
		<div><input type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호를 입력해주세요"></div>
		<div><input type="password" name="checkPwd" id="checkPwd"  placeholder="다시 비밀번호를 입력해주세요"></div>
		
		<div><button type="submit" id="submit3">비밀번호 변경하기</button></div>
	</div>
	
	</div>
	<div align="center" id="alert" style="display: none;"><b>비밀번호가 변경되었습니다</b></div>
	<script>
		
		function submit1(){
			if($('#memberNo').val().trim().length > 0 && $('#memberId').val().trim().length > 0){
				var memberNo = $('#memberNo').val();
				var memberId = $('#memberId').val();
				let code1;
				$.ajax({
					url:"searchPwd.me",
					data:{memberNo:memberNo,
						  memberId:memberId
					},
					
					success:function(returnCode){
						code1 = returnCode;
						$('#message').css('display', 'block');
					},error:function(){
						console.log("인증 번호 전송 실패");
					}
				})
				
						$('#submit2').click(function(){
							console.log("되나?");
							if($('#code').val().trim().length > 0){
								console.log("되나2");
								var code2 = $('#code').val();
								console.log("code2 : " + code2);
								checkCode(code1, code2);
							}else{
								$('#checkCodeAsk').css('display', 'block');
								
							}
						})
			}else{
				alert("사원번호 또는 아이디를 입력해주세요");
			}
		}
		
		function checkCode(code1, code2){
			console.log("오나");
			console.log(code1);
			console.log(code2);
			
			if(code1 == code2){
				$('#newPwd-div').css('display', 'block');
				var memberNo;
				var newPwd;
				var checkPwd;
				$('#submit3').click(function(){
					if($('#newPwd').val().trim().length > 0 && $('#checkPwd').val().trim().length > 0){
						 memberNo = $('#memberNo').val();
						 newPwd = $('#newPwd').val();
						 checkPwd = $('#checkPwd').val();
						console.log("newPwd : " + newPwd);
						console.log("checkPwd : " + checkPwd);
						if(newPwd == checkPwd){
							$.ajax({
								url:"makeNewPwd.me",
								data:{memberNo:memberNo,
								      newPwd:newPwd,
								      
								},
								success:function(result){
									if(result > 0){
										console.log("성공??");
										console.log(result);
										$('#alert').css('display', 'block');
									}
									
								},error:function(){
									console.log("비밀번호 변경 실패");
								}
							})
						}else{
							alert("비밀번호가 서로 일치하지 않습니다");
						}
					}
				})
				
			}
		}
	</script>
	
	
	
</body>
</html>