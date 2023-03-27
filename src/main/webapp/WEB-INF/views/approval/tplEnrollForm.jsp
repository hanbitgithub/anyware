<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	<jsp:include page="../common/appro.jsp"></jsp:include>


	<div class="content">
		<form action="insert.tpl" method="post">
			<div class="bText">&nbsp;제목</div>
			<input style="width: 600px;" type="text" name="tplTitle" placeholder="기안 제목을 입력해주세요.">
			<br><br>
			<textarea id="summernote" class="editor" name="tplContent"></textarea>
			<br>
			<div class="btn-center">
				<button type="submit" class="btn btn-primary">등록</button>
				<button type="reset" class="btn btn-danger">취소</button>
			</div>
			<br><br><br>
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
			
			$('#summernote').summernote({
				lang: 'ko-KR',
				height:600,
				maxHeight: 600,
				minHeight: 600,
				  
				toolbar: [
				    ['fontname', ['fontname']],
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['table', ['table']],
				],
				fontNames: ['Courier New','맑은 고딕','궁서','굴림']
				
			});
			
		});
	</script>
	
</body>
</html>