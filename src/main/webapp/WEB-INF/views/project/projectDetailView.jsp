<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        border: 1px solid black;
        border-radius: 0.3em;
        width: 350px;
        height: 130px;
        padding: 10px;
        float: left;
        margin-right: 20px;
        margin-bottom: 20px;
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

</style>
</head>
<body>

    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
    <jsp:include page="../common/listmenu.jsp"></jsp:include>

    <div class="content">
        <h1>[개발]프로젝트1</h1>
        <br>
        <div>이 프로젝트는 무슨 프로젝트일까용?</div>
        <br>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">리스트 추가</button>
        <br><br>

        <div class="list-area">
			<div class="list" onclick="location.href='detail.li'">
				<div class="list-name">프로젝트 기획보고서</div>
                <br>
                <div class="period">기간</div>
                <span>23/02/19</span> - <span>23/02/20</span>
			</div>
			<div class="list">
				<div class="list-name">UI 설계보고서</div>
                <br>
                <div class="period">기간</div>
                <span>23/02/20</span> - <span>23/02/27</span>
			</div>
            <div class="list">
				<div class="list-name">DB 설계보고서</div>
                <br>
                <div class="period">기간</div>
                <span>23/02/27</span> - <span>23/03/05</span>
			</div>
            <div class="list">
				<div class="list-name">XXXXXX</div>
                <br>
                <div class="period">기간</div>
                <span>23/02/19</span> - <span>23/02/20</span>
			</div>
            <div class="list">
				<div class="list-name">XXXXXXXX</div>
                <br>
                <div class="period">기간</div>
                <span>23/02/19</span> - <span>23/02/20</span>
			</div>
		</div>
        
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
                            <input type="checkbox" name="color" value="red" id="red" onclick="checkOnlyOne(this);">
                            <label for="red" class="check-label"></label>
                            <input type="checkbox" name="color" value="orange" id="orange" onclick="checkOnlyOne(this);">
                            <label for="orange" class="check-label"></label>
                            <input type="checkbox" name="color" value="gold" id="gold" onclick="checkOnlyOne(this);">
                            <label for="gold" class="check-label"></label>
                            <input type="checkbox" name="color" value="green" id="green" onclick="checkOnlyOne(this);">
                            <label for="green" class="check-label"></label>
                            <input type="checkbox" name="color" value="blue" id="blue" onclick="checkOnlyOne(this);">
                            <label for="blue" class="check-label"></label>
                            <input type="checkbox" name="color" value="indigo" id="indigo" onclick="checkOnlyOne(this);">
                            <label for="indigo" class="check-label"></label>
                            <input type="checkbox" name="color" value="purple" id="purple" onclick="checkOnlyOne(this);">
                            <label for="purple" class="check-label"></label>
                        </div>

                        <script>
                            $(function(){
                                const label = document.querySelectorAll("label");

                                label.forEach(function(lb){
                                    lb.style.background = lb.getAttribute("for");
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