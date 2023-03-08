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
	    width: 200px;
	    font-size: 14px;
	    padding: 40px 20px;
	    border-right: 1px solid rgb(211, 210, 210);
	    font-family: 'Nanum Gothic', sans-serif;
	}
	.menu li{
	    margin-top: 5px;
	   
	}

	.name{
		width: 170px;
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
		width: 160px;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	.dot{
		width: 10px;
	}
	.list-td{
		width: 120px;
		height: 25px;
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
	
</style>
</head>
<body>
	 <div class="menu">
        <div class="name">기획보고서<span>⚙️</span></div>
		<br>

		<div class="period">- 기간</div>
		<span>23/02/13</span> - <span>23/02/20</span>
		<br><br>
        
		<div class="todo">- To do list</div>
		<input type="text" id="todo-input" name="" placeholder="할 일을 추가해주세요" onkeydown="addlist();">
		
		<table id="todo-table">
			<tr>
				<td class="dot">•</td>
				<td class="list-td">
					기획 의도
				</td>
				<td class="done" onclick="done();">✔</td>
				<td class="delete" onclick="deletelist();">✕</td>
			</tr>
			<tr>
				<td class="dot">•</td>
				<td class="list-td">
					유사사이트 분석
				</td>
				<td class="done">✔</td>
				<td class="delete">✕</td>
			</tr>
			<tr>
				<td class="dot">•</td>
				<td class="list-td">
					가나다라마바사아자차카타파
				</td>
				<td class="done">✔</td>
				<td class="delete">✕</td>
			</tr>
		</table>

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
									+ "<td class='done'>✔</td>"
									+ "<td class='delete'>✕</td>"
								+ "</tr>";
					
					$("#todo-table").append(value);
					input.value = "";
				};
			}

			function done(){

			}

			function deletelist(){

			}
		</script>

    </div>
	
</body>
</html>