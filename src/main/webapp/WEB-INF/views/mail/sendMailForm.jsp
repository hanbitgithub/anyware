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
 
    <!--헤더-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

   <!--summernote-->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

 
   <!--메일쓰기-->
   <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <style>
        /* GOOGLE FONTS */
        @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400');
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

/* VARIABLES CSS */
:root {
    --nav--width: 75px;

    /* Colores */
    --first-color: #ffffff34;
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
.nav a:hover{
	text-decoration: none;
	color:white;
}

.btn-primary{
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
    font-weight: 600;
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
    width: 160px;
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


/*메일*/
#btn-area a {
	color: black;
	font-weight: 600;
	font-size: 15px;
	margin-right: 10px;
}

#btn-area a:hover {
	color: #7c7c7c;
}

#write input[type="text"] {
	border-radius: 5px;
	border: 1px solid rgb(190, 190, 190);
	width: 100%;
	height: 35px;
}

#write-area {
	margin-left: 30px;
}

#state1 {
	width: 1200px;
}

/*드래그드롭*/
.dragAndDropDiv {
	border: 1px dashed #b1b3b4;
	width: 1200px;
	height: 50px;
	color: #7c7c7c;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 20px;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 600px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #3d3d3d;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 12px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>



</head>
<body id="body-pd">
        <div id="side">
        <div class="l-navbar" id="navbar">
         <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="${pageContext.request.contextPath}" class="nav__logo">ANYWARE</a>
                </div>
                <div class="nav__list">
                   
                    <a href="#" class="nav__link">
                        <ion-icon name="person-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">인사</span>
                    </a>


                    <a href="list.em" class="nav__link">
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

                    <a href="#" class="nav__link">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">게시판</span>

                    </a>

                    <a href="#" class="nav__link">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">프로젝트</span>
					</a>

                        
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
            <img src="resources/images/profile.jpg" type="button" width="50px" height="50ps"  class="rounded-circle" alt="Cinque Terre" class=" dropdown-toggle" data-toggle="dropdown">
          
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
                <img src="resources/images/chat-bubble.png" width="30px"  alt="">
                <span class="position-absolute top-15 start-100 translate-middle badge rounded-pill bg-danger">
                  10
                  <span class="visually-hidden">unread messages</span>
                </span>
              </button>
        </div>
       
    </div>
  <!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	

    <script type="text/javascript">
                    $(document).ready(function(){
                        var objDragAndDrop = $(".dragAndDropDiv");
                        
                        $(document).on("dragenter",".dragAndDropDiv",function(e){
                            e.stopPropagation();
                            e.preventDefault();
                            $(this).css('border', '2px solid #7291f6');
                        });
                        $(document).on("dragover",".dragAndDropDiv",function(e){
                            e.stopPropagation();
                            e.preventDefault();
                        });
                        $(document).on("drop",".dragAndDropDiv",function(e){
                            
                            $(this).css('border', '1px dashed #7291f6');
                            e.preventDefault();
                            var files = e.originalEvent.dataTransfer.files;
                        
                            handleFileUpload(files,objDragAndDrop);
                        });
                        
                        $(document).on('dragenter', function (e){
                            e.stopPropagation();
                            e.preventDefault();
                        });
                        $(document).on('dragover', function (e){
                          e.stopPropagation();
                          e.preventDefault();
                          objDragAndDrop.css('border', '1px dashed #7291f6');
                        });
                        $(document).on('drop', function (e){
                            e.stopPropagation();
                            e.preventDefault();
                        });
                        
         
                        $('input[type=file]').on('change', function(e) {
                            var files = e.originalEvent.target.files;
                            handleFileUpload(files,objDragAndDrop);
                        });
                        

                        
                        function handleFileUpload(files,obj)
                        {
                           for (var i = 0; i < files.length; i++) 
                           {
                                var fd = new FormData();
                                fd.append('file', files[i]);
                         
                                var status = new createStatusbar(obj); //Using this we can set progress.
                                status.setFileNameSize(files[i].name,files[i].size);
                                sendFileToServer(fd,status);
                         
                           }
                        }
                        
                        var rowCount=0;
                        function createStatusbar(obj){
                                
                            rowCount++;
                            var row="odd";
                            if(rowCount %2 ==0) row ="even";
                            this.statusbar = $("<div class='statusbar "+row+"'></div>");
                            this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                            this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                            this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                            this.abort = $("<div class='abort'>X</div>").appendTo(this.statusbar);
                            
                            obj.after(this.statusbar);
                         
                            this.setFileNameSize = function(name,size){
                                var sizeStr="";
                                var sizeKB = size/1024;
                                if(parseInt(sizeKB) > 1024){
                                    var sizeMB = sizeKB/1024;
                                    sizeStr = sizeMB.toFixed(2)+" MB";
                                }else{
                                    sizeStr = sizeKB.toFixed(2)+" KB";
                                }
                         
                                this.filename.html(name);
                                this.size.html(sizeStr);
                            }
                            
                            this.setProgress = function(progress){       
                                var progressBarWidth =progress*this.progressBar.width()/ 100;  
                                this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                                if(parseInt(progress) >= 100)
                                {
                                    this.abort.hide();
                                }
                            }
                            
                            this.setAbort = function(jqxhr){
                                var sb = this.statusbar;
                                this.abort.click(function()
                                {
                                    jqxhr.abort();
                                    sb.hide();
                                });
                            }
                        }
                        
                        function sendFileToServer(formData,status)
                        {
                            var uploadURL = "/fileUpload/post"; //Upload URL
                            var extraData ={}; //Extra Data.
                            var jqXHR=$.ajax({
                                    xhr: function() {
                                    var xhrobj = $.ajaxSettings.xhr();
                                    if (xhrobj.upload) {
                                            xhrobj.upload.addEventListener('progress', function(event) {
                                                var percent = 0;
                                                var position = event.loaded || event.position;
                                                var total = event.total;
                                                if (event.lengthComputable) {
                                                    percent = Math.ceil(position / total * 100);
                                                }
                                                //Set progress
                                                status.setProgress(percent);
                                            }, false);
                                        }
                                    return xhrobj;
                                },
                                url: uploadURL,
                                type: "POST",
                                contentType:false,
                                processData: false,
                                cache: false,
                                data: formData,
                                success: function(data){
                                    status.setProgress(100);
                         
                                    //$("#status1").append("File upload Done<br>");           
                                }
                            }); 
                         
                            status.setAbort(jqXHR);
                        }
                        
                    });

                   
                </script>


        <div class="content">
            <b style="font-size: 18px;">메일쓰기</b>
            <br><br>
            <div id="write-area">
                <div id="btn-area">
                    <a href=""><img src="resources/images/send-mail.png" width="25px"> 전송</a>
                    <a href=""><img src="resources/images/refresh.png" width="20px"> 취소</a>
                    <a href=""><img src="resources/images/packing.png" width="25px"> 임시저장</a>
                  
                </div>
                <br>
                <div>
                    <table id="write"style="font-size: 15px;">
                        <tr>
                            <th width="120" height="40px">받는사람</th>
                            <td>
                                <select id="state1" class="multiple form-control" multiple>
                                    <option value="al">김나라</option>
                                    <option value="AK">이빛나</option>
                                    <option value="HI">유한빛</option>
                                    <option value="TN">김현지</option>
                                    <option value="TX">이소민</option>
                                    <option value="FL">성찬호</option>
                                    <option value="UT">김진우</option>
                                    <option value="WY">강똥개</option>
                                </select>
                                <script>
                                $(document).ready(function() {
                                    $('.multiple').select2();
                                });
                                </script>

                            </td>
                        </tr>
                        <tr>
                            <th  width="120" height="40px">참조</th>
                            <td><input type="text" name="" value=""class="form-control"></td>
                        </tr>
                        <tr>
                            <th  width="120" height="40px">제목</th>
                            <td><input type="text" name="" value="" class="form-control"></td>
                        </tr>
                        <tr>
                            <th height="40px">첨부파일</th>
                            <td>
                                <div id="fileUpload" class="dragAndDropDiv" onclick="$('#uploadFile').click();">Drag & Drop Files Here or Browse Files</div>
                                <input type="file" name="fileUpload" id="uploadFile" style="display:none;" multiple/>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <textarea id="summernote" name="editordata"></textarea>
                            </td>
                        </tr>
                        
                       

                    </table>

                    <script>
                        $(document).ready(function() {
                        //여기 아래 부분
                        $('#summernote').summernote({
                              height: 450,                 // 에디터 높이
                              minHeight: null,             // 최소 높이
                              maxHeight: null,             // 최대 높이
                                               // 에디터 로딩후 포커스를 맞출지 여부
                              lang: "ko-KR",					// 한글 설정
                              placeholder: '메일내용을 입력해주세요.'	//placeholder 설정
                              
                        });
                    });


                   
                      </script>
                    

                </div>

            

            </div>

            
        </div>

        





</body>
</html>
