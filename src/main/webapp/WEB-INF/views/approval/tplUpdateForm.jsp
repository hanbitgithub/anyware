<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
		<form method="post">
			<div class="bText">&nbsp;제목</div>
			<select id="tplSelect" name="tplTitle">
				<option>선택</option>
				<c:forEach var="i" begin="0" end="${fn:length(tplList) - 1}" step="1">
					<option value="${tplList[i].tplTitle}"> 
						${tplList[i].tplTitle}
					</option>
				</c:forEach>
			</select>
			<br><br>
			<textarea id="summernote" class="editor" name="tplContent"></textarea>
			<br>
			
			<input type="hidden" name="tplNo">
			
			<div class="btn-center">
				<button type="submit" class="btn btn-primary" formaction="update.tpl">수정</button>
				<button type="submit" class="btn btn-danger" formaction="delete.tpl">삭제</button>
			</div>
			<br><br><br>
		</form>
	</div>
	
	<script>
		$(document).ready(function() {
				
			$("#tplSelect").change(function(){
				
				if( $(this).val() != '선택'){
					
				    const i = $(this).val();
				    
				    $.ajax({
						url:"selectTpl.appro",
						data:{tplTitle:i},
						success:function(approTpl){
							
							$('#summernote').summernote('reset');
							$('#summernote').summernote('pasteHTML', approTpl.tplContent);
							
							$('input[name=tplNo]').val(approTpl.tplNo);
							
						},error:function(){
							
						}
					})
					
				}
				
			});
			
			
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