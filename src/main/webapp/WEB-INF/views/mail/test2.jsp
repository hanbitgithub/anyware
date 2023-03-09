<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
/* ========== 메뉴바 전체(공통) ========== */

.container-fluid .menu-sidebar{
    width:15%;
    min-height: 100vh;
    border-right:2px solid lightgray;
    text-decoration: none;
    color:black;
    background: white;
}

.container-fluid .menu-sidebar h4{
    padding: 1rem;
    font-weight: 600;
}

.container-fluid .menu-sidebar h6{
    margin-left: 27px;
    padding: 0.3rem;
    color:black;
}

a:hover{
    text-decoration: none;
}

.menu-sidebar h6:hover{
    color:slategray;
}

.menu-sidebar{
    padding-top:20px;
}

.container-fluid{
    display:flex;
    padding-left:0px;
}

.insider{
    padding-left:20px;
    margin-bottom: 30px;
}

        /* 아영 */
        h1{
            margin:25px 15px 25px 15px; 
            color:black
        }
        h2{
            font-weight: 600;
            /* margin:25px 15px 25px 15px; */
        }
        /* .searchbar{margin-left:20px;} */
        b{
            font-size:20px; 
            color:black
        }
        .tableOption{
            display:flex; 
            justify-content: space-between;
            margin: 30px 0px 3px 0px;
        }
        .board-content td, table th{
            color:black;
            text-align:center;
        }
        .btn_two_spacing{margin: 0 0 10px 20px}
        .main_width{
            display:flex; 
            align-items: center;
            width:100%;
        }
       .main-list tr{
            cursor: pointer;
        }
        .main-list tbody>tr:hover{
            background:rgb(236, 233, 233);
        }
        

/* =========== 은영 ============== */
.container-fluid .menu-sidebar h2{
    padding-bottom:10px;
    font-weight: 600;
    	background-color:white;
    padding-right:20px;
    color:black;
}

.writeForm{
    display:inline-block;
    width:90%;
    font-size:16px;
    background-color: white;
    border:2px solid #5e7e9b;
}

.container-fluid{
	background-color:white;
    padding-right:20px;
}

.insider h4{
	color: black;
}


/* ========= 주소록 상위 제목 ========= */
.mailListCheck{
    display: inline-block;
    border-color: #cbcbcb;
    border: 1px solid #cbcbcb;
    background-color: #ebebeb;
    padding: 7px 7px 10px;
    border-radius: 0;
    margin:0px 6px 0px 10px;
    font-size: 0;
}

.reply-btn{
    width:100px;
    height:33px;
    background-color:slategray; 
    color:white; 
    border:none;
}

.sub-btn{
    width:100px;
    height:33px;
    border:none;
    background-color:white;
}

.sub-btn:hover{
    background-color:rgba(0, 0, 0, 0.1);
}

/* ======== 개인 주소록 수정 ======== */
#plus-tag{
    margin-left: 27px;
    color:gray;
    cursor:pointer;
}


.address-title{
    display:flex;
    cursor: pointer;
}

.basic-title{
	cursor: pointer;
}

.address-title input[type=text]{
    width:130px;
}

.tag-delete{
    padding-top: 6px;
    margin-left:70px;
}

.tag-modify, .tag-modify:hover{
    color: lightgray;
    margin: 0px 10px;
}

.category-title{
	width:80%;
}

.insertAddBook, .updateAddBook{
    margin-bottom: 10px;
    display:none;
}

.insertAddress, .updateAddress{
    display:flex;
}

.insertAddress span, .updateAddress span{
    width: 70%;
}

.insertAddress input[type=text], .updateAddress input[type=text], #select-addressBook{
    width:90%;
    height: 25px;
}

.update-addBtn span, .update-addBtn a, .update-addBtn a:hover{
    color:black;
    cursor: pointer;
    margin-right:10px;
}

/* ========= 주소록 검색 ========== */

.address-search{
    cursor: pointer;
    margin-left:5px;
    border:none;
    background-color:transparent;
}

.filterHead{
    /* border:1px solid black; */
    height:40px;
}

.searchbar input[type=text]{
    border: 1px solid gray;
    border-radius: 6px;
}

/* ========= 주소록 목록 ========== */

.main-content{
    width:100%;
    color:black;
	margin: 0px 20px;
}

.main-content_indiv{
    width:85%;
    color:black;
    margin: 0px 20px;
}

.second-title h2 { 
    padding-top:20px;
    font-weight:bold;
    color:black;
}

.table>tbody>tr{
	cursor:pointer;
	
}

.second-title>div{ margin-bottom: 10px; font-size:30px;}

.main-list{ height:550px;}

/* ========= 주소록 추가 모달 ========== */

.address-table{
    width:100%;
    margin:0px 20px;
}

.address-table th{text-align: left;}

.insertAddress tr{
    height:60px;
}

.address-table input, .address-table select{
    width:90%;
}

.addBtn{
    font-size:15px;
    width:60px;
    height:35px;
    margin-left:3px;
    background-color: white;
    border:2px solid #5e7e9b;
    border-radius: 5px;
}



</style>
<html>
<head>
<meta charset="UTF-8">

	<!-- css -->
	<link href="${pageContext.request.contextPath}/resources/css/addressBook.css" rel="stylesheet" type="text/css">

<title>개인 주소록</title>
</head>
<body>

	
	<!-- Begin Page Content -->
	<!--Begin of Main Content -->
	<div class="container-fluid" style="display: flex;">
		<nav class="menu-sidebar">

			<div class="insider">
				<h2>주소록</h2>
				<div class="address-btn">
					<button type="button" class="writeForm btn-lg" data-toggle="modal"
						data-target="#add-Address">연락처 추가</button>
				</div>
			</div>

			<div class="insider">
				<h4>주소록 목록</h4>
				<a onclick="postFormSubmit('individualAddress.ad')" class="basic-title"><h6>개인 주소록</h6></a>

				<!--반복문 시작 -->
				<c:choose>
					<c:when test="${not empty glist}">
						<c:forEach var="c" items="${glist}">
							<c:if test="${c.groupName != '개인주소록' and c.memNo == loginUser.memberNo}">
								<div class="address-title" id="addTitle${c.groupNo }">
								
									<!-- =========== 해당 주소록 그룹으로 이동 ============== -->
									<a onclick="postSubmit('indivAddressBook.ad', '${c.groupNo}')"
										class="category-title"><h6>${c.groupNo }</h6></a>
										
									<!--==========주소록 클릭시 수정,삭제 처리하는 dropdown 생성 ==========-->
									<a class="tag-modify" href="#" id="dotDropdown" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
									</a>
									
									<div class="dropdown-list dropdown-menu shadow"
										aria-labelledby="dotDropdown"
										style="margin-left: -180px; margin-top: -10px;">
										
										<!--========== 수정, 삭제 버튼 ==========-->
										<a class="dropdown-item d-flex align-items-center"
											onclick="updateAddBook('${c.groupNo}');"> <span
											class="font-weight-bold">수정하기</span>
											
										</a> <a class="dropdown-item d-flex align-items-center"
											onclick="deleteAddBook('${c.groupNo}');"> <span
											class="font-weight-bold">삭제하기</span>
										</a>
									</div>

								</div>

								<form id="post" action="" method="post">

									<input type="hidden" name="memNo" value="${loginUser.memberNo }">
									<input type="hidden" name="addNo" id="addNo">

								</form>

								<!--========== 주소록 그룹명 수정 처리하는 함수 ==========-->
								<div class="insider updateAddBook" id="update${c.groupNo }">
									<div class="updateAddress">
										<span><input type="text" id="groupName${c.groupNo }" name="addName" value="${c.addName }"></span>
										<div class="update-addBtn">
											<span onclick="updateAddGroup('${c.groupNo}')"><i class="fas fa-check"></i></span> 
											<span onclick="dismissUpdateAdd('${c.groupNo}');"><i class="fas fa-times"></i></span>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 반복문 끝 -->
					</c:when>
				</c:choose>

				<!--========== 주소록 그룹 추가하는 함수 ==========-->
				<div class="insider insertAddBook">
					<div class="insertAddress">
						<span> <input type="text" name="addName" id="addName">
						</span>

						<div class="update-addBtn">
							<a id="insertAddIndiv" onclick="insertAddIndiv();"><i class="fas fa-check"></i></a> 
							<a onclick="dismissInsertAdd();"><i class="fas fa-times"></i></a>
						</div>
					</div>
				</div>

				<div id="plus-tag" onclick="return insertAddBook();">+ 주소록 추가</div>
			</div>

			<script>
		
			// 해당 주소록 그룹으로 이동 처리하는 함수	
				function postSubmit(url, addNo) {
					$("#post").children("#addNo").val(addNo); // hidden값에 반복되는 addNo요소 중 클릭된 요소만 value값에 넣기
					$("#post").attr("action", url).submit();
				}

				// 개인 주소록 수정 클릭시 실행하는 함수
				function updateAddBook(addNo) {
					// 해당 주소록 번호만 들어간 요소 hide, show 이벤트 부여
					$("#addTitle"+addNo).hide();
					$("#update"+addNo).show();
					
				}
				
				// 개인 주소록 수정 처리하는 함수
				function updateAddGroup(addNo){
					
					let name = $("#groupName" + addNo).val();
					console.log($("#groupName" + addNo).val());
					
					
					$.ajax({
						url : "updateIndivAddGroup.ma",
						data : {
							memNo : '${loginUser.memberNo}',
							addNo : addNo,
							addName : name
						},
						success : function(result){
							if(result == 'success'){
								location.reload();
							}
						},
						error : function(){
							console.log("주소록 그룹명 수정 실패");
						}
					})
					
				}

				// 개인 주소록 삭제 처리하는 함수
				function deleteAddBook(addNo) {
					let answer = confirm("주소록을 삭제하면 안에 있는 연락처가 모두 삭제됩니다.\n주소록을 삭제하시겠습니까?");
					
					// 삭제 '확정'시 실행
				 	if(answer == true){
				 		
				 		$.ajax({
				 			url : "deleteAllIndivAddBook.ad",
				 			data : {
				 				memNo : ${loginUser.memberNo},
				 				addNo : addNo
				 			},
				 			success : function(result){
				 				console.log(result);
				 				if(result == 'success'){
					 				alert("주소록을 삭제했습니다.");
					 				location.reload(); // 서버 새로고침
				 				}

				 			},
				 			error : function(){
				 				console.log("실패");
				 			}
				 		})
				 		
				 	}
				}

				// 주소록 그룹명 수정 '취소'시 처리하는 함수
				function dismissUpdateAdd(addNo) {
					$("#update"+addNo).hide();
					$("#addTitle"+addNo).show();
				}

				// 주소록 추가 클릭시 처리하는 함수
				function insertAddBook() {

					// 추가하는 구문 보이도록 처리
					$(".insertAddBook").show();
					
				}
				
				// 주소록 그룹 '추가'시 실행하는 ajax함수
				function insertAddIndiv(){

					if ($("#addName").val().trim() != 0) {

						$.ajax({
							url : "insertAddIndiv.ad",
							data : {
								memNo : '${loginUser.memberNo }',
								addName : $("#addName").val()
							},
							success : function(result) {
								console.log($("#addName").val());
								if (result == "success") {
									location.reload(); // 서버 새로고침
								}
							},
							error : function() {
								alert("주소록을 추가하는데 실패했습니다. 다시 시도해주세요.");
							}

						})
					} else {
						alert("주소록명을 입력해주세요.");
						return false;
					}

				}

				// 주소록 추가 '취소'시 처리하는 함수
				function dismissInsertAdd() {
					$(".insertAddBook").hide();
					$("#addName").val("");
				}
				
		</script>

		</nav>
		<!-- 게시판 영역 -->
		<div class="main-content_indiv">
			<!-- Page Heading -->
			<div class="second-title">
				<h2>개인 주소록</h2>
			</div>

			<div>
				<!-- 
				<button type="button" class="reply-btn">
					<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;메일 작성
				</button>
				 -->
				<button type="button" class="sub-btn" onclick="return deleteAddNum();">
					<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제
				</button>
			</div>
			
			<div class="tableOption">
			<!-- ==================== 연락처 검색 =================== -->
				<form action="searchIndivAdd.ad" method="post">
					<div class="searchbar" align="center">
						<input type="text" name="keyword" placeholder="검색">
						<input type="hidden" name="memNo" value="${loginUser.memberNo }">
						<input type="hidden" name="kind" value="basic">
						<input type="hidden" name="addNo" value="${addNo }">
						<button type="submit" class="address-search"><i class="fas fa-search fa-lg"></i></button>
					</div>
				</form>
			
			<c:choose>
				<c:when test="${empty keyword }">
					<div class="selectOption" style="margin-bottom: 10px">
					<!-- =============== 주소록 정렬 ================== -->
					<form action="individualAddress.ad" id="rangeForm" method="post">
						<input type="hidden" name="memNo" value="${loginUser.memberNo }">
						<input type="hidden" name="addNo" value="${addNo }">
						<select name="range">
							<option value="oldest">오래된순</option>
							<option value="newest">최신순</option>
						</select>
					</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="selectOption" style="margin-bottom: 10px">
					<!-- =============== 주소록 정렬 ================== -->
					<form action="searchIndivAdd.ad" id="rangeSearchForm" method="post">
						<input type="hidden" name="keyword" value="${keyword }">
						<input type="hidden" name="memNo" value="${loginUser.memberNo }">
						<input type="hidden" name="addNo" value="${addNo }">
						<select name="range">
							<option value="oldest">오래된순</option>
							<option value="newest">최신순</option>
						</select>
					</form>
					</div>
				</c:otherwise>
			</c:choose>
			</div>

			<script>
				
				// 주소록 정렬시 실행하는 함수
				$(function(){
					$("select[name=range]").change(function(){
						$("#rangeForm").submit(); // 검색하지 않은 경우
						$("#rangeSearchForm").submit(); // 검색한 경우
					})
					
				})
				
				// 주소록 선택시 선택된 값 유지하는 함수
				$(function(){
					$(".selectOption option").each(function(){
						if( $(this).val() == '${range}'){
							$(this).attr("selected", true);
						}
					})
					
				})
				
			</script>

		

	


	
	
</body>
</html>