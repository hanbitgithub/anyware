<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="common/sidebar.jsp"/>
<div class="menu">
            <span style="font-weight: 600; font-size: 15px;">메일</span><br><br>
            <button class="btn btn-primary" style="font-size: 13px; width: 100px;">메일쓰기</button>
            <br><br>
            <div id="mail-area">
                
            <ul>
                <li><a>받은메일함</a></li>
                <li><a>보낸메일함</a></li>
                <li><a>중요메일함</a></li>
                <li><a>임시저장함</a></li>
                <li>
                    <a>스팸메일함 </a>&nbsp;
                    <a href="#" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="bin.png"  width="14px"alt="">
                    </a>
                
                </li>
                <li>
                    <a>휴지통 </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="#" title="비우기" data-toggle="popover" data-trigger="hover" data-content="Some content">
                        <img src="bin.png"  width="14px"alt="">
                    </a>
                </li>
                <li> 
                    <a>메일설정</a>
                </li>

            </ul>

            </div>
            <br><br><br>
            <div id="adbook-area">
                <span style="font-weight: 600;">주소록</span><br><br>
                <ul>
                    <li>

                        <a data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                              <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                              사내주소록
                            </a>
                          
                          <div class="collapse" id="collapseExample">
                            <div class="card card-body">
                                <ul style="font-size: 13px;">
                                    <li>- 전체</li>
                                    <li>- 인사팀</li>
                                    <li>- 개발팀</li>
                                    <li>- 총무팀</li>
                                </ul>
                            </div>
                          </div>
                
                    </li>
                  
                    <li>
                        <a>
                            <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                            개인주소록 </a>&nbsp;
                        <ul style="font-size: 13px;">
                            <li>- 전체 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button style="border:none; border-radius: 5px; width:19px; font-size: 10px;" 
                                 title="그룹추가" data-toggle="popover" data-trigger="hover" data-content="Some content">
                                <b>+</b></button>
                            </li> 
                            <li>- 거래처1 </li>
                            <li>- 거래처2</li>
                            <li></li>
                        </ul>
               
                    </li>
                 
    
                </ul>
    
            </div>
 
    </div>


        <div class="content">
            <b> 받은메일함</b>

		</div>
	

</body>
</html>