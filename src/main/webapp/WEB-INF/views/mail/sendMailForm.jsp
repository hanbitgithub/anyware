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
 
	<!-- select2 -->
	  <!-- Bootstrap CSS -->
  <link rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="resources/css/multi-select.css">

	
  
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
	text-decoration: none;
}

#write input[type="text"] {
	border-radius: 5px;
	border: 1px solid rgb(218, 216, 216);
	width: 100%;
	height: 35px;
}
.email{
    border-radius: 5px;
	border: 1px solid rgb(190, 190, 190);
	width: 97%;
	height: 35px;

}

#write-area {
	margin-left: 30px;
}

/*모달*/
.nav-pills> .nav-item>.active{
	background-color: white;
	color:#7291f6;

}
.nav-pills> .nav-item a{
	color:black;

}

/*tagify*/
.tags-look .tagify__dropdown__item{
  display: inline-block;
  vertical-align: middle;
  border-radius: 3px;
  padding: .3em .5em;
  border: 1px solid #CCC;
  background: #F3F3F3;
  margin: .2em;
  font-size: .85em;
  color: black;
  transition: 0s;
}

.tags-look .tagify__dropdown__item--active{
  color: black;
}

.tags-look .tagify__dropdown__item:hover{
  background: lightyellow;
  border-color: gold;
}

.tags-look .tagify__dropdown__item--hidden {
    max-width: 0;
    max-height: initial;
    padding: .3em 0;
    margin: .2em 0;
    white-space: nowrap;
    text-indent: -20px;
    border: 0;
}


/*드래그드롭*/
.dragAndDropDiv {
	border: 1px dashed #b1b3b4;
	width: 1230px;
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
	background-color: #3b75f5;
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
	background-color:#c0443bd1;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 12px;
	font-weight: normal;
	padding: 3px 10px;
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
                                  /*  this.abort.hide();*/
                                }
                            }
                            
                            this.setAbort = function(jqxhr){
                                var sb = this.statusbar;
                                this.abort.click(function()
                                {
                                	
                                	sb.remove();
                                	/*
                                    jqxhr.abort();
                                    sb.hide();
                                    */
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
                    <a href=""><img src="resources/images/send-mail.png" width="23px"> 전송</a>
                    <a href=""><img src="resources/images/refresh.png" width="22px"> 취소</a>
                    <a href=""><img src="resources/images/packing.png" width="23px"> 임시저장</a>
                    <a href="sendToMe.em"><img src="resources/images/exchange.png" width="23px"> 내게쓰기</a>
                  
                </div>
                <br>
                <div>
                    <table id="write"style="font-size: 15px;">
                        <tr>
                            <th width="120" height="40px">받는사람</th>
                            <td>
                               
                                <script src="https://unpkg.com/@yaireo/tagify"></script>
                                <!--<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>-->
                                <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
                                
                               
                                <input placeholder="" name="receiver" class="email">
                                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addressbook">+</button>
                                <script>
                                
                                
                                var input = document.querySelector('input[name=receiver]')
                                tagify = new Tagify(input, {
                                whitelist: ["유한빛"+"(gksqlcdl93@naver.com)","김정남"+"(gksqlcdl93@naver.com)", "A-0 System", "A+", "A++", "ABAP", "ABC", "ABC ALGOL", "ABSET", "ABSYS", "ACC", "Accent", "Ace DASL", "ACL2", "Avicsoft", "ACT-III", "Action!", "ActionScript", "Ada", "Adenine", "Agda", "Agilent VEE", "Agora", "AIMMS", "Alef", "ALF", "ALGOL 58", "ALGOL 60", "ALGOL 68", "ALGOL W", "Alice", "Alma-0", "AmbientTalk", "Amiga E", "AMOS", "AMPL", "Apex (Salesforce.com)", "APL", "AppleScript", "Arc", "ARexx", "Argus", "AspectJ", "Assembly language", "ATS", "Ateji PX", "AutoHotkey", "Autocoder", "AutoIt", "AutoLISP / Visual LISP", "Averest", "AWK", "Axum", "Active Server Pages", "ASP.NET", "B", "Babbage", "Bash", "BASIC", "bc", "BCPL", "BeanShell", "Batch (Windows/Dos)", "Bertrand", "BETA", "Bigwig", "Bistro", "BitC", "BLISS", "Blockly", "BlooP", "Blue", "Boo", "Boomerang", "Bourne shell (including bash and ksh)", "BREW", "BPEL", "B", "C--", "C++ – ISO/IEC 14882", "C# – ISO/IEC 23270", "C/AL", "Caché ObjectScript", "C Shell", "Caml", "Cayenne", "CDuce", "Cecil", "Cesil", "Céu", "Ceylon", "CFEngine", "CFML", "Cg", "Ch", "Chapel", "Charity", "Charm", "Chef", "CHILL", "CHIP-8", "chomski", "ChucK", "CICS", "Cilk", "Citrine (programming language)", "CL (IBM)", "Claire", "Clarion", "Clean", "Clipper", "CLIPS", "CLIST", "Clojure", "CLU", "CMS-2", "COBOL – ISO/IEC 1989", "CobolScript – COBOL Scripting language", "Cobra", "CODE", "CoffeeScript", "ColdFusion", "COMAL", "Combined Programming Language (CPL)", "COMIT", "Common Intermediate Language (CIL)", "Common Lisp (also known as CL)", "COMPASS", "Component Pascal", "Constraint Handling Rules (CHR)", "COMTRAN", "Converge", "Cool", "Coq", "Coral 66", "Corn", "CorVision", "COWSEL", "CPL", "CPL", "Cryptol", "csh", "Csound", "CSP", "CUDA", "Curl", "Curry", "Cybil", "Cyclone", "Cython", "Java", "Javascript", "M2001", "M4", "M#", "Machine code", "MAD (Michigan Algorithm Decoder)", "MAD/I", "Magik", "Magma", "make", "Maple", "MAPPER now part of BIS", "MARK-IV now VISION:BUILDER", "Mary", "MASM Microsoft Assembly x86", "MATH-MATIC", "Mathematica", "MATLAB", "Maxima (see also Macsyma)", "Max (Max Msp – Graphical Programming Environment)", "Maya (MEL)", "MDL", "Mercury", "Mesa", "Metafont", "Microcode", "MicroScript", "MIIS", "Milk (programming language)", "MIMIC", "Mirah", "Miranda", "MIVA Script", "ML", "Model 204", "Modelica", "Modula", "Modula-2", "Modula-3", "Mohol", "MOO", "Mortran", "Mouse", "MPD", "Mathcad", "MSIL – deprecated name for CIL", "MSL", "MUMPS", "Mystic Programming L"],
                                maxTags: 10,
                                dropdown: {
                                    maxItems: 20,           // <- mixumum allowed rendered suggestions
                                    classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
                                    enabled: 0,             // <- show suggestions on focus
                                    closeOnSelect: false    // <- do not hide the suggestions dropdown once an item has been selected
                                }
                            })  
                                // 태그가 추가되면 이벤트 발생
                                tagify.on('add', function() {
                                  console.log(tagify.value); // 입력된 태그 정보 객체
                                })
                                </script>

                            </td>
                        </tr>
                        <tr>
                            <th  width="120" height="40px">참조</th>
                            <td>
                             
                                <input placeholder="" name="cc"  class="email">
                                <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addressbook">+</button>
                                <script>
                                    var input = document.querySelector('input[name=cc]')
                                    tagify = new Tagify(input, {
                                    whitelist: ["유한빛"+"(gksqlcdl93@naver.com)","김정남"+"(gksqlcdl93@naver.com)", "A-0 System", "A+", "A++", "ABAP", "ABC", "ABC ALGOL", "ABSET", "ABSYS", "ACC", "Accent", "Ace DASL", "ACL2", "Avicsoft", "ACT-III", "Action!", "ActionScript", "Ada", "Adenine", "Agda", "Agilent VEE", "Agora", "AIMMS", "Alef", "ALF", "ALGOL 58", "ALGOL 60", "ALGOL 68", "ALGOL W", "Alice", "Alma-0", "AmbientTalk", "Amiga E", "AMOS", "AMPL", "Apex (Salesforce.com)", "APL", "AppleScript", "Arc", "ARexx", "Argus", "AspectJ", "Assembly language", "ATS", "Ateji PX", "AutoHotkey", "Autocoder", "AutoIt", "AutoLISP / Visual LISP", "Averest", "AWK", "Axum", "Active Server Pages", "ASP.NET", "B", "Babbage", "Bash", "BASIC", "bc", "BCPL", "BeanShell", "Batch (Windows/Dos)", "Bertrand", "BETA", "Bigwig", "Bistro", "BitC", "BLISS", "Blockly", "BlooP", "Blue", "Boo", "Boomerang", "Bourne shell (including bash and ksh)", "BREW", "BPEL", "B", "C--", "C++ – ISO/IEC 14882", "C# – ISO/IEC 23270", "C/AL", "Caché ObjectScript", "C Shell", "Caml", "Cayenne", "CDuce", "Cecil", "Cesil", "Céu", "Ceylon", "CFEngine", "CFML", "Cg", "Ch", "Chapel", "Charity", "Charm", "Chef", "CHILL", "CHIP-8", "chomski", "ChucK", "CICS", "Cilk", "Citrine (programming language)", "CL (IBM)", "Claire", "Clarion", "Clean", "Clipper", "CLIPS", "CLIST", "Clojure", "CLU", "CMS-2", "COBOL – ISO/IEC 1989", "CobolScript – COBOL Scripting language", "Cobra", "CODE", "CoffeeScript", "ColdFusion", "COMAL", "Combined Programming Language (CPL)", "COMIT", "Common Intermediate Language (CIL)", "Common Lisp (also known as CL)", "COMPASS", "Component Pascal", "Constraint Handling Rules (CHR)", "COMTRAN", "Converge", "Cool", "Coq", "Coral 66", "Corn", "CorVision", "COWSEL", "CPL", "CPL", "Cryptol", "csh", "Csound", "CSP", "CUDA", "Curl", "Curry", "Cybil", "Cyclone", "Cython", "Java", "Javascript", "M2001", "M4", "M#", "Machine code", "MAD (Michigan Algorithm Decoder)", "MAD/I", "Magik", "Magma", "make", "Maple", "MAPPER now part of BIS", "MARK-IV now VISION:BUILDER", "Mary", "MASM Microsoft Assembly x86", "MATH-MATIC", "Mathematica", "MATLAB", "Maxima (see also Macsyma)", "Max (Max Msp – Graphical Programming Environment)", "Maya (MEL)", "MDL", "Mercury", "Mesa", "Metafont", "Microcode", "MicroScript", "MIIS", "Milk (programming language)", "MIMIC", "Mirah", "Miranda", "MIVA Script", "ML", "Model 204", "Modelica", "Modula", "Modula-2", "Modula-3", "Mohol", "MOO", "Mortran", "Mouse", "MPD", "Mathcad", "MSIL – deprecated name for CIL", "MSL", "MUMPS", "Mystic Programming L"],
                                    maxTags: 10,
                                    dropdown: {
                                        maxItems: 20,           // <- mixumum allowed rendered suggestions
                                        classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
                                        enabled: 0,             // <- show suggestions on focus
                                        closeOnSelect: false    // <- do not hide the suggestions dropdown once an item has been selected
                                    }
                                })  
                                    // 태그가 추가되면 이벤트 발생
                                    tagify.on('add', function() {
                                    console.log(tagify.value); // 입력된 태그 정보 객체
                                    })
                                    </script>
                            </td>
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

        
               
                
                <!-- Modal -->
                <div class="modal fade" id="addressbook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">주소록</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="container">
                                <br>
                                <!-- Nav tabs -->
                                <ul class="nav nav-pills flex-column flex-sm-row nav-justified" role="tablist">
                                  <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#public">사내주소록</a>
                                  </li>
                                  <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#personal">개인주소록</a>
                                  </li>
                                 
                                </ul>
                              
                                <!-- Tab panes -->
                                <div class="tab-content">
                                  <div id="public" class="container tab-pane active"><br>
                                  
                                    <p>
                                        <select id='pre-selected-options' multiple='multiple'>   
							  
                                            <optgroup label='인사팀'>
                                             <option value='1'>Yoda</option>
                                             <option value='2'>Obiwan</option>
                                           </optgroup>
                                           <optgroup label='개발팀'>
                                             <option value='3'>Palpatine</option>
                                             <option value='4'>Darth Vader</option>
                                           </optgroup>
                                           <optgroup label='총무팀'>
                                             <option value='5'>Palpatine</option>
                                             <option value='6'>Darth Vader</option>
                                           </optgroup>
                                           <optgroup label='기획팀'>
                                             <option value='7'>Palpatine</option>
                                             <option value='8'>Darth Vader</option>
                                           </optgroup>
             
                                             <option value='elem_1'>elem 1</option>
                                             <option value='elem_2'>elem 2</option>
                                             <option value='elem_3'>elem 3</option>
                                             <option value='elem_4'>elem 4</option>
                                             <option value='elem_100'>elem 100</option>
                                           </select>
                                          
                                          
                                           <!-- ends -->
                                           
                                           
                                         
                                  
									  <!-- Bootstrap JavaScript -->
									  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
									  <script src="resources/js/jquery.multi-select.js"></script>
                                           <script type="text/javascript">
                                           // run pre selected options
                                           $('#pre-selected-options').multiSelect();
                                        
             
                                         </script>


                                    </p>
                                  </div>
                                  <div id="personal" class="container tab-pane fade"><br>          
                                    <select id='pre-selected-options2' multiple='multiple'>   
							  
                                        <optgroup label='인사팀'>
                                         <option value='1'>Yoda</option>
                                         <option value='2'>Obiwan</option>
                                       </optgroup>
                                       <optgroup label='개발팀'>
                                         <option value='3'>Palpatine</option>
                                         <option value='4'>Darth Vader</option>
                                       </optgroup>
                                       <optgroup label='총무팀'>
                                         <option value='5'>Palpatine</option>
                                         <option value='6'>Darth Vader</option>
                                       </optgroup>
                                       <optgroup label='기획팀'>
                                         <option value='7'>Palpatine</option>
                                         <option value='8'>Darth Vader</option>
                                       </optgroup>
         
                                         <option value='elem_1'>elem 1</option>
                                         <option value='elem_2'>elem 2</option>
                                         <option value='elem_3'>elem 3</option>
                                         <option value='elem_4'>elem 4</option>
                                         <option value='elem_100'>elem 100</option>
                                       </select>
                                      
                                      
                                       <!-- ends -->
                                       
                                     
                                 
                                      
                                       <script type="text/javascript">
                                       // run pre selected options
                                       
                                       $('#pre-selected-options2').multiSelect();
         
                                     </script>
                                  </div>
                                 
                                </div>
                              </div>
                              







                             <!-- start -->
                             <!--
                             <form action="#">
                                <fieldset>
                                    <input type="text" name="search" value="" id="id_search" placeholder="Search" class="searchable" autofocus />
                                </fieldset>
                            </form>
                            -->
							 
                            <!--
                            <script>

                            $(function () {

                                $('input#id_search').quicksearch('select#pre-selected-options option');

                              $('.searchable').multiSelect({
                            selectableHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='try \"12\"'>",
                            selectionHeader: "<input type='text' class='search-input' autocomplete='off' placeholder='try \"4\"'>",
                            afterInit: function(ms){
                                var that = this,
                                    $selectableSearch = that.$selectableUl.prev(),
                                    $selectionSearch = that.$selectionUl.prev(),
                                    selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
                                    selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

                                that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
                                .on('keydown', function(e){
                                if (e.which === 40){
                                    that.$selectableUl.focus();
                                    return false;
                                }
                                });

                                that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
                                .on('keydown', function(e){
                                if (e.which == 40){
                                    that.$selectionUl.focus();
                                    return false;
                                }
                                });
                            },
                            afterSelect: function(){
                                this.qs1.cache();
                                this.qs2.cache();
                            },
                            afterDeselect: function(){
                                this.qs1.cache();
                                this.qs2.cache();
                            }
                            });
                        })

							  </script>
							  -->
                        
  
							 
							 
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                    </div>
                </div>
            





</body>
</html>
