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
		margin: 20px;
	}

	
</style>
</head>
<body>

	<div class="menu">
        <div class="name">프로젝트 기획보고서<span data-toggle="modal" data-target="#myModal">⚙️</span></div>
		<br>

		<div class="period">- 기간</div>
		<span>23/02/13</span> - <span>23/02/20</span>
		<br><br>
        
		<div class="todo">- To do list</div>
		<input type="text" id="todo-input" name="" placeholder="할 일 추가" onkeydown="addlist();">
		
		<table id="todo-table">
			<tr>
				<td class="dot">•</td>
				<td class="list-td">
					기획 의도
				</td>
				<td class="done" onclick="done(this);">✔</td>
				<td class="delete" onclick="deletelist(this);">✕</td>
				<td><input type="hidden" value="dd"></td>
			</tr>
			<tr>
				<td class="dot">•</td>
				<td class="list-td">
					유사사이트 분석
				</td>
				<td class="done" onclick="done(this);">✔</td>
				<td class="delete" onclick="deletelist(this);">✕</td>
				<td><input type="hidden" value="dd"></td>
			</tr>
			<tr>
				<td class="dot">•</td>
				<td class="list-td">
					가나다라마바사아자차카타파
				</td>
				<td class="done" onclick="done(this);">✔</td>
				<td class="delete" onclick="deletelist(this);">✕</td>
				<td><input type="hidden" value="dd"></td>
			</tr>
		</table>

		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

		<a class="btn btn-primary" id="back" href="javascript:history.back();">List 목록</a>

		<script>
			function addlist(){
				if(event.keyCode == 13) {
					let input = document.getElementById("todo-input");
					event.preventDefault();
					
					if(input.value == ""){
						alert("내용을 입력해주세요.");
						return;
					}

					let value = "<tr>"
									+ "<td class='dot'>•</td>"
									+ "<td class='list-td'>"
										+ input.value
									+ "</td>"
									+ "<td class='done' onclick='done(this);'>✔</td>"
									+ "<td class='delete' onclick='deletelist(this);'>✕</td>"
									+ "<td><input type='hidden' value='todoNo'></td>"
								+ "</tr>";
					
					$("#todo-table").append(value);
					input.value = "";
				};
			}

			function done(e){
				// ajax로 update하기
				console.log($(e).next().next().children("input").val());
			}

			function deletelist(e){
				// ajax로 delete하기
				console.log($(e).next().children("input").val());
			}

		</script>

	

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
					<form action="">
						<div>
							<b>리스트 이름<span class="essential"> *</span></b>
							<input type="text" id="name" name="">
						</div>
						<br>
						<div>
							<b>기간<span class="essential"> *</span></b><br>
							<input type="date" required class="date"> - <input type="date" required class="date">
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
							<button type="submit" class="btn btn-primary">생성</button>&nbsp;
							<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
						</div>

					</form>
				</div>
		
			</div>
		</div>
	</div>
</body>
</html>