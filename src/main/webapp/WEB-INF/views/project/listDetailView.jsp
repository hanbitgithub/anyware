<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .chat-area{
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.3em;
        width: 1400px;
        height: 650px;
        padding: 10px;
        overflow: auto;
    }
    .input-area{
        width: 1400px;
        height: 40px;
    }
    .input-div{
        width: 1400px;
        position: relative;
        display: inline-block;
    }
    .input{
        width: 1400px;
        height: 40px;
        padding-left: 10px;
        padding-right: 10px;
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.3em;
        box-sizing: border-box;
    }
    .filebtn{
        width: 47px;
        height: 40px;
        font-size: 25px;
        right: 50;
        border: none;
        box-sizing: border-box;
        background-color:transparent;
        position: absolute;
        right: 0;
    }
    .chat-other, .chat-mine{
        display: flex;
        margin-bottom: 10px;
    }
    .chat-mine{
        justify-content:flex-end;
    }
    .chProfileImg{
        width: 50px;
        height: 50px;
        box-sizing: border-box;
        margin-right: 5px;
    }
    .content-other{
        background-color: lightgray;
        border-radius: 0.3em;
        padding: 5px;
        max-width: 700px;
        margin-right: 2px;
    }
    .content-mine{
        background-color: beige;
        border-radius: 0.3em;
        padding: 5px;
        max-width: 700px;
        margin-left: 2px;
    }
    .time-td{
        vertical-align: bottom;
    }
    .time{
        font-size: 10px;
    }
    .writer{
        margin-bottom: 2px;
    }
    .date-div{
        text-align: center;
        margin: 10px;
    }
</style>
</head>
<body>

    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<jsp:include page="../common/listdetailmenu.jsp"></jsp:include>

    <div class="content">
        <b style="font-size: 40px">${ l.listTitle }</b>
        <br><br>

        <div class="chat-area">
            
        </div>

        <br>

        <c:if test="${pj.participation eq 1}">
            <div class="input-area">
                <div class="input-div">
                    <input type="text" class="input" onkeydown="insertListChat();">
                    <button class="filebtn" onclick="openfile();">📂</button>
                    <input type="file" style="display: none;">
                </div>
            </div>
        </c:if>
    </div>
    
    <script>
        function openfile(){
           document.querySelector("input[type=file]").click();
        }

        $(function(){
            selectChatList();
            setInterval(selectChatList, 1000);
            
            $('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
        })
        
        function insertListChat(){
            if(event.keyCode == 13){
                let content = $(".input").val();

                $.ajax({
                url:"insertlchat.ajax",
                data:{chatContent:content
                    , writerNo:${loginUser.memberNo}
                    , listNo:${l.listNo}},
                type:"post",
                success:function(result){
                    if(result == 'success'){
                        $(".input").val("");
                        selectChatList();
                    }
                },
                error:function(){
                    console.log("리스트채팅 작성용 ajax 통신 실패");
                }
            })
            }
        }
        
        function selectChatList(){
            $.ajax({
                url:"chlist.ajax",
                type:"post",
                data:{listNo:${l.listNo}},
                success:function(chlist){
                    let value = "";
                    for(let j=0; j<chlist.length; j++){
                        value += "<div class='date-div'>" + chlist[j].sendDate + "</div>";
                        for(let i=0; i<chlist[j].chatInfo.length; i++){
                            if(chlist[j].chatInfo[i].writerNo == ${loginUser.memberNo}){
                                value += "<table class='chat-mine'>"
                                            + "<tr>"
                                                + "<td class='time-td'>"
                                                    + "<span class='time'>" + chlist[j].chatInfo[i].sendTime + "</span>"
                                                + "</td>"
                                                + "<td>"
                                                    + "<div class='content-mine'>" + chlist[j].chatInfo[i].chatContent + "</div>"
                                                + "</td>"
                                            + "</tr>"
                                        + "</table>";
                            } else {
                                value += "<table class='chat-other'>"
                                            + "<tr>"
                                                + "<td rowspan='2'>"
                                                    + "<img src='" + chlist[j].chatInfo[i].profileUrl + "' class='chProfileImg'>"
                                                + "</td>"
                                                + "<td colspan='2'>";
                                            if(chlist[j].chatInfo[i].deptName == '미정'){
                                                value += "<div class='writer'>" + chlist[j].chatInfo[i].name + "(" + chlist[j].chatInfo[i].jobName + ")</div>";
                                            } else {
                                                value += "<div class='writer'>" + chlist[j].chatInfo[i].name + "(" + chlist[j].chatInfo[i].deptName + "/" + chlist[j].chatInfo[i].jobName + ")</div>";
                                            }
                                            value += "</td>"
                                            + "</tr>"
                                            + "<tr>"
                                                + "<td>"
                                                    + "<div class='content-other'>" + chlist[j].chatInfo[i].chatContent + "</div>"
                                                + "</td>"
                                                + "<td class='time-td'>"
                                                    + "<span class='time'>" + chlist[j].chatInfo[i].sendTime + "</span>"
                                                + "</td>"
                                            + "</tr>"
                                        + "</table>";
                            }
                        }
                    }

                    $(".chat-area").html(value);
                },
                error:function(){
                    console.log("리스트채팅 조회용 ajax 통신 실패");
                }
            })
        }
    </script>

</body>
</html>