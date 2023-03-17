<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">



<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	/*Now the CSS*/
	* {margin: 0; padding: 0;}

	#tree {
		margin-left: 150px;
	}
	
	#tree ul {
		padding-top: 20px; position: relative;
		
		transition: all 0.5s;
		-webkit-transition: all 0.5s;
		-moz-transition: all 0.5s;
	}
	
	#tree li {
		float: left; text-align: center;
		list-style-type: none;
		position: relative;
		padding: 20px 60px 0 60px;
		
		transition: all 0.5s;
		-webkit-transition: all 0.5s;
		-moz-transition: all 0.5s;
	}
	
	/*We will use ::before and ::after to draw the connectors*/
	
	#tree li::before, #tree li::after{
		content: '';
		position: absolute; top: 0; right: 50%;
		border-top: 1px solid #ccc;
		width: 50%; height: 20px;
	}
	#tree li::after{
		right: auto; left: 50%;
		border-left: 1px solid #ccc;
	}
	
	/*We need to remove left-right connectors from elements without 
	any siblings*/
	#tree li:only-child::after, #tree li:only-child::before {
		display: none;
	}
	
	/*Remove space from the top of single children*/
	#tree li:only-child{ padding-top: 0;}
	
	/*Remove left connector from first child and 
	right connector from last child*/
	#tree li:first-child::before, #tree li:last-child::after{
		border: 0 none;
	}
	/*Adding back the vertical connector to the last nodes*/
	#tree li:last-child::before{
		border-right: 1px solid #ccc;
		border-radius: 0 5px 0 0;
		-webkit-border-radius: 0 5px 0 0;
		-moz-border-radius: 0 5px 0 0;
	}
	#tree li:first-child::after{
		border-radius: 5px 0 0 0;
		-webkit-border-radius: 5px 0 0 0;
		-moz-border-radius: 5px 0 0 0;
	}
	
	/*Time to add downward connectors from parents*/
	#tree ul ul::before{
		content: '';
		position: absolute; top: 0; left: 50%;
		border-left: 1px solid #ccc;
		width: 0; height: 20px;
	}
	
	#tree li a{
		border: 1px solid #ccc;
		padding: 5px 10px;
		text-decoration: none;
		color: #666;
		font-family: arial, verdana, tahoma;
		font-size: 13px;
		display: inline-block;
		 
		border-radius: 5px;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		
		transition: all 0.5s;
		-webkit-transition: all 0.5s;
		-moz-transition: all 0.5s;
	}
	
	/*Time for some hover effects*/
	/*We will apply the hover effect the the lineage of the element also*/
	#tree li a:hover, #tree li a:hover+ul li a {
		background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
	}
	/*Connector styles on hover*/
	#tree li a:hover+ul li::after, 
	#tree li a:hover+ul li::before, 
	#tree li a:hover+ul::before, 
	#tree li a:hover+ul ul::before{
		border-color:  #94a0b4;
	}
#button {
    border-radius: 5px;
    border: 1px solid rgb(221, 221, 221);
    font-size: 14px;
    margin-top: 13px;
}
#user{
	display: inline-block;
	background-color: rgb(247, 247, 247);
    width: 55%;
    height: 300px;
	float: right;
	padding-top: 35px; 
	padding-left: 15px;
}
#user1{
	width: 45%;
    height: 300px;
	display: inline-block;
	text-align: center;
	padding-top: 60px; 
	padding-left: 15px;
}
#name1{
	font-size: small;
	color: #afafaf;
}

</style>    
</head>
<body>
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
	
	<!-- 세부 메뉴 -->
	<jsp:include page="../common/groupMapmenu.jsp"></jsp:include>
	
	<!-- 세부 내용 -->
	<div class="content">
	<p><b>조직도</b></p> 
	<hr>
		<form action="">
            <input type="text" name="keyword" id="button" placeholder="이름으로 검색">
            <button type="submit" id="button">검색</button>
        </form>
	<br>
	<div id="tree">
        <ul>
            <li>
                <a href="#">대표이사</a>
                <ul>
					
                    <li>
                        <a href="#">사장</a>
                        <ul>
                            <li>
                            	<a href="">개발팀</a>
                                <c:forEach var="g" items="${ list }">
                                <c:if test="${ g.deptName eq '개발부' }">
                                <ul>
                                	<a data-toggle="modal" data-target="#myModal" onclick="selectList(${g.memberNo});">
                                	<input type="hidden" name="memberNo" value="${g.memberNo }">
                                	${g.name } ${g.jobName }
                                	</a>
                                </ul>
                                </c:if>    
                                </c:forEach>
                            </li>
                            
                            <li>
                                <a href="">인사팀</a>
								<c:forEach var="g" items="${ list }">
                                <c:if test="${ g.deptName eq '인사부' }">
                                <ul>
                                	<a data-toggle="modal" data-target="#myModal" onclick="selectList(${g.memberNo});">
                                	<input type="hidden" name="memberNo" value="${g.memberNo }">
                                	${g.name } ${g.jobName }
                                	</a>
                                </ul>
                                </c:if>    
                                </c:forEach>
                            </li>
                            
                            <li>
                                <a href="">총무팀</a>
								<c:forEach var="g" items="${ list }">
                                <c:if test="${ g.deptName eq '총무부' }">
                                <ul>
                                	<a data-toggle="modal" data-target="#myModal" onclick="selectList(${g.memberNo});">
                                	<input type="hidden" name="memberNo" value="${g.memberNo }">
                                	${g.name } ${g.jobName }
                                	</a>
                                </ul>
                                </c:if>    
                                </c:forEach>
                            </li>
                            
                            <li>
                                <a>디자인팀</a>
								<c:forEach var="g" items="${ list }">
                                <c:if test="${ g.deptName eq '디자인부' }">
                                <ul>
                                	<a data-toggle="modal" data-target="#myModal" onclick="selectList(${g.memberNo});">
                                	<input type="hidden" name="memberNo" value="${g.memberNo }">
                                	${g.name } ${g.jobName }
                                	</a>
                                </ul>
                                </c:if>    
                                </c:forEach>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
        
    </div>    
    
	  <script>
  	function selectList(memberNo){
		$.ajax({
			url:"modallist.gr",
			data:{no:memberNo},
			success:function(list){
					console.log(list);

				
				let value="";
				for(let i=0; i<list.length; i++){
					let m = list[i];
					value += "<div id='user1'>"	
							+ m.profileUrl + "<br><br><br>"
							+ "<b>" + m.name + "</b>" + "&nbsp;" + m.jobName + "<br>"
							+ "<p id='name1'>" + m.deptName + "&nbsp;" + m.position + "</p>"
							+ "</div>"
							+ "<div id='user'>"
							+ "<b>부서</b>" + "&nbsp;&nbsp;" + m.deptName + "<br><br>"	
							+ "<b>전화번호</b>" + "&nbsp;&nbsp;" + m.phone + "<br><br>"
							+ "<b>이메일</b>" + "&nbsp;&nbsp;" + m.email + "<br><br>"
							+ "<b>주소</b>" + "&nbsp;&nbsp;" + m.address + "<br><br>"
							+ "<b>입사일</b>" + "&nbsp;&nbsp;" + m.enrollDate + "<br><br>"
							+ "</div>";
				}
				$("#modal").html(value);
				
				
			},error:function(){
				console.log("댓글리스트 조회용 ajax 통신 실패");
			}
		})
	}
	  </script>	
	
	
</div>

	<!-- 모달 -->
	<div class="container">
		<!-- Button to Open the Modal -->
	  
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
			
			  <!-- Modal Header -->
			  <div class="modal-header">
				<h4 class="modal-title">사원정보</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			  </div>
			  
			  <!-- Modal body -->
			  <div class="modal-body" id="modal">
			  </div>
			  
			  <!-- Modal footer -->
			  <div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">Close</button>
			  </div>
			  
			</div>
		  </div>
		</div>
		
	  </div>
	  


	  
	
</body>
</html>