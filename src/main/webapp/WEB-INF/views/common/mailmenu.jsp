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
    width: 160px;
    font-size: 14px;
    padding: 40px 20px;
    border-right: 1px solid rgb(211, 210, 210);
    font-family: 'Nanum Gothic', sans-serif;
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
/* 라이브러리 */
/* 스타일 */

.toggle_menu > ul.active{
  transition: 1s ;
  left: 0;
}

.toggle_menu > ul > li > a {
  display: block;
  height: 30px;
  line-height: 30px;
 
}

.toggle_menu > ul > li > ul{
  height: 0px;
  overflow: hidden;
  transition: 0.3s;
}

.toggle_menu > ul > li > ul > li{
  height: 25%;
}

.toggle_menu > ul > li.active > ul{
  height:100%;
  transition: 0.3s;
} 

.group{
    padding: 0px 20px;
    font-size: 13px;
}


</style>
</head>
<body>
	 <div class="menu">
            <span style="font-weight: 600; font-size: 19px;">메일</span><br><br>
            <a class="btn btn-primary" href="sendForm.em"style="font-size: 13px; font-weight:600; width: 100px;">메일쓰기</a>
            <br><br>
            <div id="mail-area">
                
            <ul>
                <li><a href="list.em">받은메일함</a></li>
                <li><a href="">보낸메일함</a></li>
                <li><a>중요메일함</a></li>
                <li><a>임시저장함</a></li>
                <li>
                    <a>스팸메일함 </a>&nbsp;
                    <a href="#" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="resources/images/bin.png"  width="14px"alt="">
                    </a>
                
                </li>
                <li>
                    <a>휴지통 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="resources/images/bin.png"  width="14px"alt="">
                    </a>
                </li>
               
            </ul>

            </div>
            <br><br>
            <div id="adbook-area" class="toggle_menu">
                <span style="font-weight: 600; font-size: 15px;" >주소록</span><br>

                <ul>
                    <li>
                        <a ><ion-icon name="chevron-down-outline"></ion-icon> 사내주소록</a>
                       
                        <ul class="group">
                            <li><a href="#"> 전체</a></li>
                            <li><a href="#">인사팀</a></li>
                            <li><a href="#">개발팀</a></li>
                            <li><a href="#">총무팀</a></li>
                        </ul>
                    </li>
                    <li>
                        <a><ion-icon name="chevron-down-outline" ></ion-icon> 개인주소록</a>
                        
                        <ul class="group">
                            <li><a href="#">전체 </a>
                               &nbsp;&nbsp;&nbsp;
                                <button style="border:none; border-radius: 5px; width:20px; height: 20px; line-height: 20px;  font-size: 13px;" 
                                title="그룹추가" data-toggle="popover" data-trigger="hover" data-content="Some content">
                                <b>+</b></button>
                            </li>
                            <li><a href="#">거래처1</a></li>
                            <li><a href="#">개미</a></li>
                            
                          
                        </ul>
                    </li>

                </ul>
              
               <script>
                $(document).ready(function(){
                    
                    $(".toggle_menu > ul > li").click(function(){
                        $(this).toggleClass("active");
                    });
                });

               </script>
            </div>
 
    </div>
	
</body>
</html>