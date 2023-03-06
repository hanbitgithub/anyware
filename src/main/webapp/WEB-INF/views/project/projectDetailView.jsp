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
        width: 1400px;
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
    span{
        font-size: 17px;
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
        <button type="button" class="btn btn-primary">리스트 추가</button>
        <br><br>

        <div class="list-area">
			<div class="list">
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

</body>
</html>