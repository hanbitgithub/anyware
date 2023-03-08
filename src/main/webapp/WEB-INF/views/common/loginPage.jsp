<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
    padding: 0;
    margin: 0;
    border: none;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    
}

.login-wrapper{
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
    
}

#login-form > input{
    width: 100%;
    height: 48px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border-radius: 6px;
    background-color: #F8F8F8;
}
#login-form > input::placeholder{
    color: #D2D2D2;
}
#login-form > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #7291f6;
    margin-top: 10px;
}
#login-form > input[type="checkbox"]{
    display: none;
}
#login-form > label{
    color: #999999;
}
a{
    text-decoration: none;
    color:gray;
    font-size: 12px;
    font-family: 'Roboto', sans-serif;
}


    </style>
</head>
<body>
  <div class="login-wrapper" align="center">
        <div class="logo-area" align="center" >
            <img src="resources/images/로고2.png" alt="" width="300px">
    
        </div>
        
        <form method="post" action="login.me" id="login-form">
            <input type="text" name="memberId" placeholder="Id" required>
            <input type="password" name="memberPwd" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>
        <a>아이디 | 비밀번호 찾기 </a>


    </div> 


</body>
</html>