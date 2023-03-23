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

    .reject, .accept, .cancle{
        display: none;
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
	                            <c:when test="${ m.jobName eq '대표이사'}">
	                                <li><span class="file" onclick="addpp(this);">대표이사 ${ m.name }</span><input type="hidden" value="${ m.memberNo }"></li>
	                            </c:when>
	                            <c:when test="${ m.jobName eq '부사장' }">
	                                <li><span class="file" onclick="addpp(this);">부사장 ${ m.name }</span><input type="hidden" value="${ m.memberNo }"></li>
	                            </c:when>
                        	</c:choose>
                        </c:forEach>

                        <c:forEach var="d" items="${ dList }">
                        	<li class="closed"><span class="folder">${ d.deptName }</span>
                        	<ul>
	                            <c:forEach var="m" items="${ mList }">
	                                <c:choose>
	                                	<c:when test="${ m.deptName eq d.deptName }">
	                                		<li><span class="file" onclick="addpp(this);">${ m.name }(${ m.jobName })</span><input type="hidden" value="${ m.memberNo }"></li>
	                                	</c:when>
	                                </c:choose>
	                            </c:forEach>
                            </ul>
                        </c:forEach>

                        <li class="closed"><span class="folder">기타</span>
                        <ul>
                            <c:forEach var="m" items="${ mList }">
                            	<c:if test="${ m.jobName ne '대표이사' and m.jobName ne '부사장' and m.deptName eq '미정' }">
                            		<li><span class="file" onclick="addpp(this);">${ m.name }(${ m.jobName })</span><input type="hidden" value="${ m.memberNo }"></li>
                            	</c:if>
                            </c:forEach>
                        </ul>
                        
                    </ul>
                </li>
            </ul>
        </div>

        <script>
            $(function(){
                show();
            })

            function show(){
                if(${ pj.participation } == 1){
                    $(".cancle").show();
                    $(".accept").show();
                    $(".reject").show();
                }
            }

            function addpp(e){
                if(${ pj.participation } == 0){
                    alert("권한이 없습니다.");
                    return;
                }

                let memNo = $(e).next().val();
                let count = 0;

                let ppset = $(".pp-set");
                ppset.each(function(){
                    if($(this).children("input[type=hidden]").val() == memNo){
                        alert("이미 프로젝트에 포함된 인원입니다.");
                        count++;
                    }
                })

                let req = $(".request-list input[type=hidden]");
                req.each(function(){
                    if($(this).val() == memNo){
                        alert("이미 참여 요청한 인원입니다.");
                        count++;
                    }
                })

                if(count == 0){
                    $.ajax({
                            url:"addparticipant.ajax",
                            data:{projectNo:${ pj.projectNo }
                                , memberNo:memNo},
                            success:function(result){
                                        if(result != 'fail'){
                                            let value = "";
                                            value += "<div class='pp-set'>"
                                                        + "<input type='hidden' name='memberNo' value=" + result.memberNo + ">";
                                            if(result.deptName == '미정'){
                                                value += "<div class='pp-name'>" + result.name + "(" + result.jobName + ")<span class='cancle'>✕</span></div>";
                                            } else {
                                                value += "<div class='pp-name'>" + result.name + "(" + result.deptName + "/" + result.jobName + ")<span class='cancle'>✕</span></div>";
                                            }
                                            value += "</div>";

                                            $(".pp-list").append(value);
                                            show();
                                        }
                                    },
                                error:function(){
                                    console.log("참여인원 추가용 ajax 통신 실패");
                                    }
                            })
                }
            }
        </script>

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
                    <c:forEach var="p" items="${ pList }">
                        <c:if test="${ p.status eq 1 }">
                            <div class="pp-set">
                                <input type="hidden" name="memberNo" value="${ p.memberNo }">
                                <c:choose>
                                    <c:when test="${ p.deptName == '미정'}">
                                        <div class="pp-name">${ p.name }(${ p.jobName })<span class="cancle">✕</span></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="pp-name">${ p.name }(${ p.deptName }/${ p.jobName })<span class="cancle">✕</span></div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <div class="request">
                <div class="menu-list">참여 요청</div>
                <div class="request-wrap">
                    <table class="request-list">
                        <c:forEach var="p" items="${ pList }">
                            <c:if test="${ p.status eq 2 }">
                                <tr>
                                    <c:choose>
                                        <c:when test="${ p.deptName == '미정'}">
                                            <td class="re-name">${ p.name }(${p.jobName})</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="re-name">${ p.name }(${p.deptName}/${p.jobName})</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td><input type="hidden" value="${ p.memberNo }"></td>
                                    <td class="accept-td"><button class="accept">수락</button></td>
                                    <td class="reject-td"><button class="reject">거절</button></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
                
            </div>
        </div>

        <script>
            $(document).on("click", ".cancle", function(){
                let ppset = $(this).parent().parent();
                $.ajax({
                    url:"deletepp.ajax",
                    data:{memberNo:$(this).parent().prev().val()
                        , projectNo:${pj.projectNo}},
                    success:function(result){
                        console.log(result);
                        if(result == 'success'){
                            ppset.remove();
                        } else if(result == 'owner'){
                            alert("방장은 삭제할 수 없습니다.");
                        } else {
                            alert("참여 인원 삭제 실패");
                        }
                    },
                    error:function(){
                        console.log("참여자 delete용 ajax 통신 실패");
                    }
                })
            })

            $(document).on("click", ".accept", function(){
                let acceptNo = $(this).parent().prev().children().val();
                let tr = $(this).parent().parent();
                
                $.ajax({
                    url:"acceptpp.ajax",
                    data:{projectNo:${ pj.projectNo }
                        , memberNo:acceptNo},
                    success:function(result){
                        if(result != 'fail'){
                            tr.remove();
                            let value = "";
                            value += "<div class='pp-set'>"
                                        + "<input type='hidden' name='memberNo' value=" + result.memberNo + ">";
                            if(result.deptName == '미정'){
                                value += "<div class='pp-name'>" + result.name + "(" + result.jobName + ")<span class='cancle'>✕</span></div>";
                            } else {
                                value += "<div class='pp-name'>" + result.name + "(" + result.deptName + "/" + result.jobName + ")<span class='cancle'>✕</span></div>";
                            }
                            value += "</div>";

                            $(".pp-list").append(value);
                            show();
                        }
                    },
                    error:function(){
                        console.log("참여요청 수락용 ajax 통신 실패");
                    }
                })
            })

            $(document).on("click", ".reject", function(){
                let rejectNo = $(this).parent().prev().prev().children().val();
                let tr = $(this).parent().parent();
                console.log("dd");
                
                $.ajax({
                    url:"rejectpp.ajax",
                    type : "POST",
                    data:{projectNo:${ pj.projectNo }
                        , memberNo:rejectNo},
                    success:function(result){
                        if(result == 'success'){
                            tr.remove();
                        }
                    },
                    error:function(){

                    }
                })
            })
        </script>

    </div>

</body>
</html>
