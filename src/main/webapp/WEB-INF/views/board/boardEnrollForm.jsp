<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<style>
    #category{
        border-top:1px solid rgb(255, 255, 255); 
        border-bottom:1px solid rgb(255, 255, 255); 
        border-right:none; 
        border-left:none; 
        height:30px; 
        width: 100px;
        margin-bottom: 5px;
    }
   #button{
    border-radius: 5px;
    border: 1px solid rgb(219, 219, 219);
    background-color: rgb(255, 255, 255);
   }

</style>    
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/boardmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	
		<p><b>게시글 작성하기</b></p>
        <hr>
        <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
        <input type="hidden" name="boardWriter" value="${loginUser.memberNo }">
		         
        <select id="category" name="category">
            <option value="5">자유게시판</option>
            <option value="6">공지사항</option>
            <option value="1">인사팀</option>
            <option value="2">총무팀</option>
            <option value="3">개발팀</option>
            <option value="4">디자인팀</option>
        </select>
        
	    <input type="text" id="boardTitle" name="boardTitle"
    style="border:1px solid rgb(220, 220, 220); border-right:none; border-left:none; height:50px; width: 100%;"
    placeholder="제목을 입력해주세요" required>

    <textarea id="summernote" name="boardContent"></textarea>
    
    <br>
    <input type="file" name="upfile" style="font-size: small;">

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	    crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script>
	    $(document).ready(function () {
	        $('#summernote').summernote({
	            height: 500,
	            minHeight: 500,
	            maxHeight: 500,
	            lang: "ko-KR",
	            toolbar: [
	                // [groupName, [list of button]]
	                ['fontname', ['fontname']],
	                ['fontsize', ['fontsize']],
	                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
	                ['color', ['forecolor', 'backcolor']],
	                ['table', ['table']],
	                ['para', ['ul', 'ol', 'paragraph']],
	                ['height', ['height']],
	                ['insert', ['picture', 'link', 'video']]
	            ],
	            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
	            fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
	        });
	    });
	</script>

	<br><br>
            <div align="center" style="width:100%">
                <br>
                <button type="submit" id="button">등록하기</button>
                <button id="button">취소하기</button>
                <br><br>
            </div>
	</form>
	</div>
</body>
</html>