<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* div{border: 1px solid black;} */
    .list-area{
        width: 1200px;
        height: 660px;
        overflow: auto;
    }
    .list{
        border: 2px solid rgb(211, 210, 210);
        border-radius: 0.5em;
        width: 350px;
        height: 130px;
        padding: 10px;
        float: left;
        margin-right: 20px;
        margin-bottom: 20px;
        color: gray;
    }
    .list-name{
        font-size: 25px;
        font-weight: bold;
    }
    .period{
        font-size: 17px;
        font-weight: bold;
    }
    .list span{
        font-size: 17px;
    }

    .essential{
		color: red;
	}
	#name{
		width: 350px;
		margin-left: 10px;
	}
	.btn-area{
		width: 466px;
	}
    input[type=color]{
        margin-top: 10px;
        width: 460px;
        height: 30px;
    }
    .date{
        margin-top: 10px;
        width: 150px;
        text-align: center;
    }

    input[type=checkbox] + label{
        cursor: pointer;
    }
    input[type=checkbox]{
        display: none;
    }
    label{
        width: 25px;
        height: 25px;
        margin-top: 10px;
        margin-right: 10px;
        border-radius: 0.3em;
        vertical-align:middle;
        color: white;
        font-size: 17px;
        text-align: center;
    }

</style>
</head>
<body>

    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
    <jsp:include page="../common/listmenu.jsp"></jsp:include>

    <div class="content">
        <h1>${ pj.projectTitle }</h1>
        <br>
        <div>${ pj.projectContent }</div>
        <br>
        <c:if test="${ pj.participation == 1}">
            <button type="button" class="btn btn-primary addBtn" data-toggle="modal" data-target="#myModal">리스트 추가</button>
        </c:if>
        <br><br>

        <div class="list-area">
        	<c:forEach var="l" items="${ pj.listList }">
                <form action="detail.li" method="post" onclick="submit(this);">
                    <div class="list" style="border-left: 15px solid ${ l.color };">
                        <input type="hidden" name="listNo" value="${ l.listNo }">
                        <div class="list-name">${ l.listTitle }</div>
                        <br>
                        <div class="period">기간</div>
                        <span>${ l.beginDate }</span> - <span>${ l.endDate }</span>
                    </div>
                </form>
        	</c:forEach>
        </div>

        <script>
            function submit(e){
                $(e).submit();
            }
        </script>

	</div>

    <!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">리스트 생성</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<form action="insert.li" method="post" id="addListForm">
                        <input type="hidden" name="projectNo" value="${ pj.projectNo }">
                        <input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
						<div>
							<b>리스트 이름<span class="essential"> *</span></b>
							<input type="text" id="name" name="listTitle" required>
						</div>
						<br>
						<div>
                            <b>기간<span class="essential"> *</span></b><br>
                            <input type="date" required class="date" name="beginDate" required> - <input type="date" required class="date" name="endDate" required>
                        </div>
                        <br>
                        <div>
                            <b>색상<span class="essential"> *</span></b><br>
                            <input type="checkbox" name="color" value="rgb(255, 153, 153)" id="red" onclick="checkOnlyOne(this);">
                            <label for="red" class="check-label"></label>
                            <input type="checkbox" name="color" value="rgb(255, 204, 153)" id="orange" onclick="checkOnlyOne(this);">
                            <label for="orange" class="check-label"></label>
                            <input type="checkbox" name="color" value="rgb(255, 255, 156)" id="gold" onclick="checkOnlyOne(this);">
                            <label for="gold" class="check-label"></label>
                            <input type="checkbox" name="color" value="rgb(176, 247, 162)" id="green" onclick="checkOnlyOne(this);">
                            <label for="green" class="check-label"></label>
                            <input type="checkbox" name="color" value="rgb(153, 204, 255)" id="blue" onclick="checkOnlyOne(this);">
                            <label for="blue" class="check-label"></label>
                            <input type="checkbox" name="color" value="rgb(204, 153, 255)" id="purple" onclick="checkOnlyOne(this);">
                            <label for="purple" class="check-label"></label>
                            <input type="checkbox" name="color" value="rgb(224, 224, 224)" id="gray" onclick="checkOnlyOne(this);">
                            <label for="gray" class="check-label"></label>
                        </div>

                        <script>
                            $(function(){
                                const label = document.querySelectorAll("label");
                                
                                label.forEach(function(lb){
                                    // lb.style.background = lb.getAttribute("for");
                                    lb.style.background = document.getElementById(lb.getAttribute("for")).value;
                                })
                            })

                            function checkOnlyOne(element) {
                                const checkbox = document.getElementsByName("color");
                                const label = document.querySelectorAll("label");
                                
                                checkbox.forEach(function(cb){
                                    cb.checked = false;
                                    
                                })

                                label.forEach(function(lb){
                                    lb.innerText = "";
                                })
                                
                                element.checked = true;
                                element.nextElementSibling.innerText = "✔";
                            }
 
                        </script>

						<br><br>

						<div class="btn-area" align="center">
							<button type="submit" class="btn btn-primary" onsubmit="isChecked();">생성</button>&nbsp;
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>
						
						<script>
                            const addListForm = document.querySelector("#addListForm");
                            addListForm.addEventListener("submit",isChecked);

                            function isChecked(){
                                event.preventDefault();
								const checkbox = document.getElementsByName("color");
                                let count = 0;
                                checkbox.forEach(function(cb){
                                    if(cb.checked == true){
                                        count ++;
                                    }
                                })

                                if(count == 0){
                                    alert("색상을 선택해주세요.");
                                } else {
                                	addListForm.submit();
                                }
							}
						</script>

					</form>
				</div>
		
			</div>
		</div>
      

</body>
</html>