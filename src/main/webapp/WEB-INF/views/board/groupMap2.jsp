<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="UTF-8">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {packages:["orgchart"]});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
	var data = new google.visualization.DataTable();
	data.addColumn('string', 'Name');
	data.addColumn('string', 'Manager');
	data.addColumn('string', 'ToolTip');
	
	
	data.addRows([
	  [{'v':'Mike', 'f':'Mike<div style="color:red; font-style:italic">President</div>'},
	   '', 'The President'],
	  [{'v':'Jim', 'f':'Jim<div style="color:red; font-style:italic">Vice President</div>'},
	   'Mike', 'VP'],
	  ['Alice', 'Mike', ''],
	  ['Bob', 'Jim', 'Bob Sponge'],
	  ['Carol', 'Bob', '']
	]);
	

	// Create the chart.
	var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
	// Draw the chart, setting the allowHtml option to true for the tooltips.
	chart.draw(data, {'allowHtml':true});
  }
  
  
  function selectMemberList(){
	  $.ajax({
		  url:"list.grp",
		  data:{no${loginUser.memberNo}},
		  success:function(list){
			  console.log(list);
			  
		  },error:function(){
			  console.log("ajax 조직도 통신 실패")
		  }
	  })
  }
</script>

 
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
            <input type="text" name="keyword" value="제목으로 검색하기" id="button">
            <button type="submit" id="button">검색</button>
        </form>
		
		<div id="chart_div"></div>
		

	
</div>

	<!-- 모달 -->
	<div class="container">
		<!-- Button to Open the Modal -->
	  
		<!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
			<div class="modal-content">
			
			  <!-- Modal Header -->
			  <div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			  </div>
			  
			  <!-- Modal body -->
			  <div class="modal-body">
				Modal body..
			  </div>
			  
			  <!-- Modal footer -->
			  <div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			  </div>
			  
			</div>
		  </div>
		</div>
		
	  </div>
	
</body>
</html>