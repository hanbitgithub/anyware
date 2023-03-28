<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*서브메뉴*/
.menu{
    position: fixed;
    height: 100vh;
    width: 170px;
    font-size: 14px;
    padding: 40px 20px;
    border-right: 1px solid rgb(211, 210, 210);
    font-family: 'Nanum Gothic', sans-serif;
    /* overflow: auto; */
    z-index: 1;
    
}
.menu li{
    margin-top: 5px;
   
}
#mail-area li a:hover{
    color: gray;
    cursor: pointer;
    text-decoration: none;
    
}
#adbook-area>ul>li a:hover{
    color: gray;
    cursor: pointer;
    text-decoration: none;
}

/* 노멀라이징 */

a{
  color: inherit;
  text-decoration:none;
}


</style>
</head>
<body>
 <div class="menu">
            <span style="font-weight: 600; font-size: 18px;">인사관리</span><br><br>
            
            <br><br>
            <div id="mail-area">
                
            <ul>
                <li class="hrOnly" style="display: none;"><a href="regist.me?deptName=${loginUser.deptName}&?deptName=${loginUser.deptName}">신규사원등록</a></li>
                <li class="hrOnly" style="display: none;"><a href="selectOut.me?deptName=${loginUser.deptName}">퇴사자조회</a></li>
                
                <li><a href="attendence.me"}">근태조회</a></li>

            </ul>

            </div>
            <br><br><br>
            
 
    </div>
    <script>
    	$(document).ready(function(){
    		
    		if('${loginUser.deptName}' == '인사부'){
    			$('.hrOnly').show();
    		}
    	});
    </script>
    

</body>
</html>