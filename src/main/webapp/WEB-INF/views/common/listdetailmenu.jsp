<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
	}
	.menu li{
	    margin-top: 5px;
	   
	}

	.name{
		width: 130px;
		font-weight: 600;
		font-size: 19px;
		overflow:hidden;
		height:auto;
		position: relative;
	}
	.period, .todo{
		font-size: 17px;
		font-weight: 600;
	}
	#todo-input{
		width: 130px;
		height: 25px;
		font-size: 13px;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	.dot{
		width: 10px;
	}
	.list-td{
		width: 120px;
		height: 30px;
		/* text-decoration: line-through; */
	}
	.done{
		margin-right: 10px;
		color: green;
		width: 10px;
		height: 25px;
	}
	.delete{
		color: red;
		width: 10px;
		height: 25px;
		font-weight: bold;
	}
	.done:hover, .delete:hover{
		cursor: pointer;
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
        margin-left: 55px;
        width: 352px;
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
	.name span:hover{
		cursor: pointer;
	}

	#back{
		position: absolute;
		top: 800px;
		left: 35px;
	}

	
</style>
</head>
<body>
	<div class="menu">
		<div class="name">${ l.listTitle }<c:if test="${pj.participation eq 1}"><span data-toggle="modal" data-target="#myModal">⚙️</span></c:if></div>
		<br>

		<div class="period">- 기간</div>
		<span>${ l.beginDate }</span> - <span>${ l.endDate }</span>
		<br><br>
        
		<div class="todo">- To do list</div>
		<input type="text" id="todo-input" name="" placeholder="할 일 추가" onkeydown="addlist();">
		
		<table id="todo-table">
			<c:forEach var="td" items="${ l.todoList }">
				<c:if test="${ td.todoNo ne 0 }">
					<tr>
						<td class="dot">•</td>
						<c:choose>
							<c:when test="${ td.finishStatus eq 'Y'}">
								<td class="list-td">
									<s>${ td.todoTitle }</s>
								</td>
							</c:when>
							<c:otherwise>
								<td class="list-td">
									${ td.todoTitle }
								</td>
							</c:otherwise>
						</c:choose>
						<td class="done">✔</td>
						<td class="delete">✕</td>
						<td><input type="hidden" value="${ td.todoNo }"></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>

		<a class="btn btn-primary" id="back" href="detail.pj?projectNo=${pj.projectNo}">List 목록</a>

		<script>
			function addlist(){
				if(event.keyCode == 13) {
					let input = document.getElementById("todo-input");

					if(${ pj.participation } == 0){
						alert("권한이 없습니다.");
						input.value = "";
						return;
					} else {
						// event.preventDefault();
						
						if(input.value.trim().length == 0){
							alert("내용을 입력해주세요.");
							return;
						}

						$.ajax({
							url:"addtodo.ajax",
							data:{listNo:${ l.listNo }
								, tdMemberNo:${ loginUser.memberNo }
								, todoTitle:input.value},
							success:function(todo){
								if(todo.todoNo != 0){
									let value = "<tr>"
													+ "<td class='dot'>•</td>"
													+ "<td class='list-td'>"
														+ todo.todoTitle
													+ "</td>"
													+ "<td class='done'>✔</td>"
													+ "<td class='delete'>✕</td>"
													+ "<td><input type='hidden' value='" + todo.todoNo + "'></td>"
												+ "</tr>";
						
									$("#todo-table").append(value);
									input.value = "";
								}
							},
							error:function(){
								console.log("todo 추가용 ajax 통신 실패");
							}
						})
					}
				};
			}

			$(document).on("click", ".done", function(){
				let todoNo = $(this).next().next().children("input").val();
				let listtd = $(this).prev();
				let title = listtd.text();
				if(${ pj.participation } == 0){
					alert("권한이 없습니다.");
					return;
				} else {
					$.ajax({
						url:"updatetd.ajax",
						data:{todoNo:todoNo
							, length:listtd.children().length},
						success:function(result){
							if(result == 'success'){
								if(listtd.children().length == 1){
									listtd.html(title);
								} else {
									listtd.html("<s>" + title + "<s>");
								}
							}
						}, 
						error:function(){

						}
					})
				}
			})

			$(document).on("click", ".delete", function(){
				let todoNo = $(this).next().children("input").val();
				let tr = $(this).parent();

				if(${ pj.participation } == 0){
					alert("권한이 없습니다.");
					return;
				} else {
					$.ajax({
						url:"deletetd.ajax",
						data:{todoNo:todoNo},
						success:function(result){
							if(result == 'success'){
								tr.remove();
							}
						}, 
						error:function(){
							console.log("할일 삭제용 ajax 통신 실패");
						}
					})
				}
			})

		</script>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title">리스트 수정</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
		
				<!-- Modal body -->
				<div class="modal-body">
					<form action="update.li">
						<input type="hidden" name="listNo" value="${l.listNo}">
						<div>
							<b>리스트 이름<span class="essential"> *</span></b>
							<input type="text" id="name" name="listTitle" value="${ l.listTitle }">
						</div>
						<br>

						<fmt:parseDate value="${ l.beginDate }" var="beginDate" pattern="yy/MM/dd"/>
						<fmt:parseDate value="${ l.endDate }" var="endDate" pattern="yy/MM/dd"/>

						<div>
							<b>기간<span class="essential"> *</span></b><br>
							<input type="date" required class="date" name="beginDate" value="<fmt:formatDate value='${ beginDate }' pattern='yyyy-MM-dd'/>"> - <input type="date" required class="date" name="endDate" value="<fmt:formatDate value='${ endDate }' pattern='yyyy-MM-dd'/>">
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
								const checkbox = document.getElementsByName("color");

								label.forEach(function(lb){
									// lb.style.background = lb.getAttribute("for");
									lb.style.background = document.getElementById(lb.getAttribute("for")).value;
								})

								checkbox.forEach(function(box){
									if(box.value == "${l.color}"){
										box.checked = true;
										$(box).next().text("✔")
									}
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
							<button type="submit" class="btn btn-primary">수정</button>&nbsp;
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>

					</form>
				</div>
		
			</div>
		</div>
	</div>
	
</body>
</html>