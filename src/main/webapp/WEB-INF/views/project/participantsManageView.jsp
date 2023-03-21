<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 조직도 트리 -->
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<link rel="stylesheet" type="text/css" href="resources/css/treeview/jquery.treeview.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/treeview/screen.css"/>

<style>
    #title{
        font-size: 35px;
        font-weight: bold;
    }

    .search-area, .participant-area{
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.7em;
        width: 630px;
        height: 700px;
        float: left;
        margin-right: 50px;
        padding: 20px;
    }
    .search-area{
        overflow: auto;
    }
    input[type=search]{
        width: 580px;
        height: 40px;
        font-size: 20px;
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.3em;
        padding-left: 5px;
    }
    #browser{
        font-size: 20px;
    }

    .participant{
        width: 580px;
        box-sizing: border-box;
        height: 450px;
    }
    .request{
        width: 580px;
        box-sizing: border-box;
        height: 210px;
    }
    .menu-list{
        font-size: 28px;
        font-weight: bold;
        margin-bottom: 10px;
    }
    .pp-list{
        box-sizing: border-box;
        height: 400px;
        font-size: 17px;
        overflow: auto;
    }
    .pp-name{
        margin-bottom: 5px;
    }
    .cancle{
        color: red;
        font-weight: bold;
        margin-left: 7px;
    }
    .cancle:hover{
        cursor: pointer;
    }
    .request-wrap{
        width: 600px;
        height: 140px;
        overflow: auto;
    }
    .request-list{
        width: 580px;
        box-sizing: border-box;
        font-size: 17px;
    }
    .re-name{
        width: 450px;
        height: 25px;
    }
    .accept-td, .reject-td{
        text-align: right;
    }
    .accept{
        background-color: green;
        color: white;
        border: none;
        border-radius: 0.2em;
        font-size: 13px;
        height: 25px;
        width: 50px;
        font-weight: bold;
    }
    .reject{
        background-color: red;
        color: white;
        border: none;
        border-radius: 0.2em;
        font-size: 13px;
        height: 25px;
        width: 50px;
        font-weight: bold;
    }

    .file:hover{
        cursor: pointer;
    }
</style>
</head>
<body>

    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/listmenu.jsp"></jsp:include>

    <div class="content">
        <div id="title">인원 관리</div>
        <br><br>

        <div class="search-area">
            <input type="search" placeholder="사원 검색">
            <br><br>
            <ul id="browser" class="filetree treeview-famfamfam">
                <li><span class="folder">(주)Anyware</span>
                    <ul>
                        <c:forEach var="m" items="${ mList }">
                        	<c:choose>
	                            <c:when test="${ m.jobName eq '사장'}">
	                                <li><span class="file">사장 ${ m.name } </span></li>
	                            </c:when>
	                            <c:when test="${ m.jobName eq '부사장' }">
	                                <li><span class="file">부사장 ${ m.name } </span></li>
	                            </c:when>
	                            <c:when test="${ m.jobName eq '대표이사' }">
	                                <li><span class="file">대표이사 ${ m.name } </span></li>
	                            </c:when>
                        	</c:choose>
                        </c:forEach>
                        
                        <li class="closed"><span class="folder">인사부</span>
                             <ul>
                                 <li><span class="file">사원1</span></li>
                                 <li><span class="file">사원2</span></li>
                                 <li><span class="file">사원3</span></li>
                                 <li><span class="file">사원4</span></li>
                             </ul>
                        </li>
                        <li class="closed"><span class="folder">총무부</span>
                            <ul>
                                <li><span class="file">사원1</span></li>
                                <li><span class="file">사원2</span></li>
                                <li><span class="file">사원3</span></li>
                                <li><span class="file">사원4</span></li>
                            </ul>
                        </li>
                        <li class="closed"><span class="folder">개발부</span>
                            <ul>
                                <li><span class="file">사원1</span></li>
                                <li><span class="file">사원2</span></li>
                                <li><span class="file">사원3</span></li>
                            </ul>
                        </li>
                        <li class="closed"><span class="folder">기획부</span>
                            <ul>
                                <li><span class="file">사원1</span></li>
                                <li><span class="file">사원2</span></li>
                                <li><span class="file">사원3</span></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <script src="resources/js/treeview/jquery.cookie.js" type="text/javascript"></script>
        <script src="resources/js/treeview/jquery.treeview.js" type="text/javascript"></script>

        <script>
            $(document).ready(function(){
                $("#browser").treeview({
                    toggle: function() {
                        console.log("%s was toggled.", $(this).find(">span").text());
                    }
                });
        
                $("#add").click(function() {
                    var branches = $("<li><span class='folder'>New Sublist</span><ul>" +
                        "<li><span class='file'>Item1</span></li>" +
                        "<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
                    $("#browser").treeview({
                        add: branches
                    });
                });
            });
        </script>

        <div class="participant-area">
            <div class="participant">
                <div class="menu-list">참여 인원</div>
                <div class="pp-list">
                    <div class="pp-name">김현지(개발부/사원)<span class="cancle">✕</span></div>
                    <div class="pp-name">유한빛(개발부/사원)<span class="cancle">✕</span></div>
                    <div class="pp-name">이빛나(개발부/사원)<span class="cancle">✕</span></div>
                    <div class="pp-name">이소민(개발부/사원)<span class="cancle">✕</span></div>
                </div>
            </div>

            <div class="request">
                <div class="menu-list">참여 요청</div>
                <div class="request-wrap">
                    <table class="request-list">
                        <tr>
                            <td class="re-name">성찬호(개발부/사원)</td>
                            <td class="accept-td"><button class="accept">수락</button></td>
                            <td class="reject-td"><button class="reject">거절</button></td>
                        </tr>
                        <tr>
                            <td class="re-name">김진우(개발부/사원)</td>
                            <td class="accept-td"><button class="accept">수락</button></td>
                            <td class="reject-td"><button class="reject">거절</button></td>
                        </tr>
                    </table>
                </div>
                
            </div>
        </div>

    </div>

</body>
</html>
