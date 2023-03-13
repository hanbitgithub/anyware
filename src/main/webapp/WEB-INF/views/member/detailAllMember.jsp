<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS 사이드바 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/styles.css">
    <!--헤더-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* GOOGLE FONTS */
        @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400');
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

/* VARIABLES CSS */
:root {
    --nav--width: 75px;

    /* Colores */
    --first-color: #5d7de6d1;
    --bg-color: #7291f6;
    --sub-color: #f3f2f8;
    --white-color: rgb(248, 248, 248);

    /* Fuente y tipografia */
    --body-font: 'Nanum Gothic', sans-serif;
    --normal-font-size: 1rem;
    --small-font-size: .875rem;

    /* z index */
    --z-fixed: 100;
}

/* BASE */
*, ::before, ::after {
    box-sizing: border-box;
  
}

body {
    position: relative;
    margin: 0;
    padding: 0 0 0 80px;
    font-family: var(--body-font);
    font-size: var(--normal-font-size);
    transition: .5s;
}

h1 {
    margin: 0;
}

ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

a {
    text-decoration: none;
}

.btn{
    background-color:  #7291f6;
    border: none;
}

/* l NAV */
.l-navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: var(--nav--width);
    height: 100vh;
    background-color: var(--bg-color);
    color: var(--white-color);
    padding: 1.5rem 1.1rem 2rem;
    transition: .5s;
    z-index: var(--z-fixed);
}

/* NAV */
.nav {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow: hidden;
}

.nav__brand {
    display: grid;
    grid-template-columns: max-content max-content;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
}

.nav__toggle {
    font-size: 1.25rem;
    padding: .75rem;
    cursor: pointer;
}

.nav__logo {
    color: var(--white-color);
    font-weight: 600;
}

.nav__link {
    display: grid;
    grid-template-columns: max-content max-content;
    align-items: center;
    column-gap: .75rem;
    padding: .75rem;
    color: var(--white-color);
    border-radius: .5rem;
    margin-bottom: 1rem;
    transition: .3s;
    cursor: pointer;
}

.nav__link:hover {
    background-color: var(--first-color);
}

.nav__icon {
    font-size: 1.25rem;
}

.nav_name {
    font-size: var(--small-font-size);
}

/* Expander menu */
.expander {
    width: calc(var(--nav--width) + 8.25rem);
}

/* Add padding body*/
.body-pd {
    padding:0 0 0 13.2rem;
}

/* Active links menu */
.active {
    background-color: var(--first-color);
}



/* Rotate icon */
.rotate {
    transform: rotate(180deg);
    transition: .5s;
}

/*헤더*/
.header{
    height: 20px;
}
.header *{
   float: right;
}
.chat{
    margin-right: 20px;
    margin-top: 20px;
}
.profile{
    margin-right: 50px ;
    margin-top: 10px;
}

/*서브메뉴*/
.menu{
    position: fixed;
    height: 100vh;
    width: 150px;
    font-size: 14px;
    padding: 50px 20px;
    border-right: 1px solid rgb(211, 210, 210);
    font-family: 'Nanum Gothic', sans-serif;
}
.menu li{
    margin-top: 5px;
   
}
#mail-area li:hover{
    color: gray;
    cursor: pointer;
}
#adbook-area>ul>li li:hover{
    color: gray;
    cursor: pointer;
}

/*컨텐트 영역*/
.content{
    width: 80%;
    margin-left: 200px;
    margin-top: 50px;
}
.partLine{border: 1px solid gray;}
#employImg-div{border: 1px solid gray; float: left; width: 150px; height: 150px;}
#employProfile-div{border: 1px solid gray; margin-left: 30%; width: 150px; height: 150px;}
#employProfile-div2{padding-top: 70%;} 
.profileContent1{float: left;}  
.profileContent2{margin-left: 30%;}

#submit{margin-left: 90%; width: 120px;}
#leave{margin-top: 1%; margin-left: 90%; width: 120px;background-color: red;color: blanchedalmond;}
 
    </style>
</head>
<body id="body-pd">
    <div id="side">
        <div class="l-navbar" id="navbar">
         <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">ANYWARE</a>
                </div>
                <div class="nav__list">
                   
                    <a href="#" class="nav__link">
                        <ion-icon name="person-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">인사</span>
                    </a>


                    <a href="#" class="nav__link">
                        <ion-icon name="mail-outline"  class="nav__icon"></ion-icon>
                        <span class="nav_name">메일</span>
                    </a>

                    <a href="#" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">메신저</span>
                    </a>
                    
                    <a href="#" class="nav__link">
                        <ion-icon name="document-text-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">전자결재</span>
                    </a>


                    <a href="#" class="nav__link">
                        <ion-icon name="calendar-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">일정관리</span>
                    </a>

                    
                    <a href="#" class="nav__link">
                        <ion-icon name="time-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">예약</span>
                    </a>

                    <div href="#" class="nav__link">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">게시판</span>

                    </div>

                    <div href="#" class="nav__link">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">프로젝트</span>

                        
                    </div>
                    <a href="#" class="nav__link">
                        <ion-icon name="git-network-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">조직도</span>
                    </a>

                   
                </div>
                <a href="#" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Logout</span>
                </a>
            </div>
        </nav>
    </div>

    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="assets/js/main.js"></script>

    <script>
        /* EXPANDER MENU */
    const showMenu = (toggleId, navbarId, bodyId) => {
    const toggle = document.getElementById(toggleId),
    navbar = document.getElementById(navbarId),
    bodypadding = document.getElementById(bodyId)

    if( toggle && navbar ) {
        toggle.addEventListener('click', ()=>{
            navbar.classList.toggle('expander');

            bodypadding.classList.toggle('body-pd')
        })
    }

  
    }

    showMenu('nav-toggle', 'navbar', 'body-pd')

    /* LINK ACTIVE */
    const linkColor = document.querySelectorAll('.nav__link')
    function colorLink() {
        linkColor.forEach(l=> l.classList.remove('active'))
        this.classList.add('active')
    }
    linkColor.forEach(l=> l.addEventListener('click', colorLink))

    /* COLLAPSE MENU */
    const linkCollapse = document.getElementsByClassName('collapse__link')
    var i

    for(i=0;i<linkCollapse.length;i++) {
        linkCollapse[i].addEventListener('click', function(){
            const collapseMenu = this.nextElementSibling
            collapseMenu.classList.toggle('showCollapse')

            const rotate = collapseMenu.previousElementSibling
            rotate.classList.toggle('rotate')
        });
    }

    </script>

    <div class="header">
        <div class="dropdown profile" style="display: inline-block;">
            <img src="profile.jpg" type="button" width="50px" height="50ps"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
          
            </img>
            <div class="dropdown-menu" style="font-size: 12px;">
              <a class="dropdown-item" href="#">정보수정</a>
              <a class="dropdown-item" href="#">근태관리</a>
              <a class="dropdown-item" href="#">일정관리</a>
              <a class="dropdown-item" href="#">로그아웃</a>
            </div>
          </div>

        <div class="chat position-relative" style="display: inline-block">
            <button type="button" class="position-relative" style="border: none; background-color: white;">
                <img src="chat-bubble.png" width="30px"  alt="">
                <span class="position-absolute top-15 start-100 translate-middle badge rounded-pill bg-danger">
                  10
                  <span class="visually-hidden">unread messages</span>
                </span>
              </button>
        </div>

        
       
    </div>
</div>
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
            <b> ${ m.name }님의 인사관리</b>
            <span>${ loginUser.name }님이 조회</span>
            <br><br>
            <div class="partLine"></div>

            <div id="employImg-div">
                <img src="profile.jpg" type="button" width="100%" height="100%" alt="">
            </div>
            
        
                <div id="employProfile-div" >
                    <div id="employProfile-div2">
                        <div id="empolyId">사원아이디</div>
                        <div id="empolyName">사원이름</div>
                    </div>
                </div>

                <div id="employProfile-div00" >
                    <div id="employProfile-div200">
                        <div id="empolyId">사원아이디00</div>
                        <div id="empolyName">사원이름</div>
                    </div>
                </div>
                <br><br>
                <div class="partLine"></div>
                <br>
         <div class="employContent">

            <form action="" method="post">

                <div id="employProfile-div3">
                    <div class="profileContent1"><b>출근시간</b></div>
                    <div class="profileContent2">출근시간입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>퇴근시간</b></div>
                    <div class="profileContent2">퇴근시간입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>이번달 근무시간</b></div>
                    <div class="profileContent2">이번달 근무시간 입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>남은 연차 개수</b></div>
                    <div class="profileContent2">남은 연차 개수 입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>사용한 연차개수</b></div>
                    <div class="profileContent2">사용한 연차 개수 입력</div>
                </div>
        </div>       
                <br><br>
                    <div class="partLine"></div>
                    <br>
        <div class="employContent">
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>이메일</b></div>
                        <div class="profileContent2"><input type="email" name="" value="${ m.email }"></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>사원번호</b></div>
                        <div class="profileContent2"><input type="text" name="" value="${ m.memberNo }"></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>휴대폰</b></div>
                        <div class="profileContent2"><input type="tel" name="" value="${ m.phone }"></div>
                    </div>
                    
         </div> 
                    <br><br>
                    <div class="partLine"></div>
                    <br>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>조직</b></div>
                        <div class="profileContent2"><input type="text" name="" value="qq회사" readonly></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>직급</b></div>
                        <div class="profileContent2"><input type="text" name="" value="${ m.jobName }" ></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>부서/직책</b></div>
                        <div class="profileContent2"><input type="text" name="" value="${ m.deptName }/${ m.position }" ></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>담당업무</b></div>
                        <div class="profileContent2"><input type="text" id="duty" name="" value="${ m.duty }" ></div>
                    </div>
                    <script>
                	$(function(){
                		if('${m.duty}'==''){
                			$("#duty").val('미정');
                		}
                	})
                </script>
                    <br><br>
                    <div class="partLine"></div>
                    <br>
        <div class="employContent">            
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>주소</b></div>
                        <div class="profileContent2"><input type="text" name="" value="${ m.address }"></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>입사일</b></div>
                        <div class="profileContent2"><input type="text" name="" value="${ m.enrollDate }"></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>생일</b></div>
                        <div class="profileContent2"><input type="text" name="" value="나중에"></div>
                    </div>
                    <div id="employProfile-div3">
                        <button id="submit" type="submit">정보변경</button>
                    </div>
         </div>       
            </form>
        <div id="employLeave-div">
            <button id="leave" type="button">퇴사처리</button>
        </div>


            
        </div>    
            
        

       



             






        
        
    



</body>
</html>