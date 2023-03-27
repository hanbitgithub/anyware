<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>메일쓰기</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


<style>

/*메일*/
#btn-area a {
	color: black;
	font-weight: 600;
	font-size: 15px;
	margin-right: 10px;
}

#btn-area a:hover {
	color: #7c7c7c;
	text-decoration: none;
}

#write input[type="text"] {
	border-radius: 5px;
	border: 1px solid rgb(218, 216, 216);
	width: 100%;
	height: 35px;
}
.email{
    border-radius: 5px;
	border: 1px solid rgb(190, 190, 190);
	width: 97%;
	height: 35px;

}

#write-area {
	margin-left: 30px;
}

  
 input[type=file] {
      font-size: 11px;
      position: absolute;
      left: 0;
      top: 0;
      opacity: 0;
 }
 

/*모달*/
.nav-tabs> .nav-item>.active{
	background-color: white;
	color:#7291f6;
}


.nav-tabs> .nav-item a{
	color:black;

}
.nav-item a:active{
    background-color: #7291f6;
}

/*tagify*/
.tags-look .tagify__dropdown__item{
  display: inline-block;
  vertical-align: middle;
  border-radius: 3px;
  padding: .3em .5em;
  border: 1px solid #CCC;
  background: #F3F3F3;
  margin: .2em;
  font-size: .85em;
  color: black;
  transition: 0s;
}

.tags-look .tagify__dropdown__item--active{
  color: black;
}

.tags-look .tagify__dropdown__item:hover{
  background: lightyellow;
  border-color: gold;
}

.tags-look .tagify__dropdown__item--hidden {
    max-width: 0;
    max-height: initial;
    padding: .3em 0;
    margin: .2em 0;
    white-space: nowrap;
    text-indent: -20px;
    border: 0;
}


/*드래그드롭*/
.dragAndDropDiv {
	border: 1px dashed #b1b3b4;
	width: 1230px;
	height: 50px;
	color: #7c7c7c;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 15px;
	display: table-cell;
}
.file-list{
	text-align: left;
	
}

.filename {
	display: inline-block;
	vertical-align: top;
	margin-top: 3px;
	width: 300px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #3d3d3d;
	width: 100px;
	margin-top: 3px;
	margin-left: 10px;
	margin-right: 5px;
	font-size: 14px;
}

.abort {
	background-color:gray;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 50%;
	border: none;
	display: inline-block;
	color: #fff;
	font-size: 12px;
	font-weight: border;
	padding: 2px 8px;
	cursor: pointer;
	vertical-align: top;
	margin-top: 3px;
}
</style>



</head>
<body>
      <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>

	<!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	
	<!--summernote-->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

	 <!--메일쓰기-->
 
   <!-- select2 -->
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
   <link rel="stylesheet" type="text/css" href="resources/css/multi-select.css">

        <div class="content">
            <b style="font-size: 18px;">메일쓰기</b> 
            <br><br>
            <div id="write-area">
                <div id="btn-area">
                    <a onclick="return sendMail();"><img src="resources/images/send-mail.png" width="23px"> 전송</a>
                    <a href="javascript:history.back(-1);"><img src="resources/images/refresh.png" width="22px"> 취소</a>
                    <a onclick="saveTemp();"><img src="resources/images/packing.png" width="23px"> 임시저장</a>
                    <a href="sendToMeForm.em"><img src="resources/images/exchange.png" width="23px"> 내게쓰기</a>
                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now" />
                	<span id="saveMessage" style="display:none;">임시저장완료 <c:out value="${now}" /></span>
                </div>
                <br>
                
                <script>

				//메일 임시저장 버튼 클릭시 실행하는 함수 
			    let isSaved = false; // 임시저장 여부를 체크하는 변수
				let emNo;

				function saveTemp(){
					
				    let formData = new FormData($("#mailForm")[0]);
		  			    
					    // 제목이 비어있는 경우에 대한 처리
					    if ($("#title").val().trim() == "") {
					        let answer = confirm("제목이 지정되지 않았습니다. 제목 없이 메일을 저장하시겠습니까?");
					        if (!answer) {
					            $("#title").focus();
					            return false;
					        }
					    }
					   if (!isSaved) {
						    $.ajax({
						        url: "save.em",
						        processData: false,
						        contentType: false,
						        type: "POST",
						        data: formData,
						        success: function(result) {
						            if (result > 0) {
						            	emNo = result;
						            	
						            	value="";
						            	value += "<input type='hidden' name='emNo' value='"
						            	      + emNo
						            	      + "'>"
						            	      
						                $("#input").html(value);
						            	      
						            	isSaved = true;
						                $("#saveMessage").show(); // 저장완료 메시지 보이기
						                // 몇 초 뒤에 저장완료 메시지를 자동으로 숨기기
						                setTimeout(function() {
						                	  $("#saveMessage").hide();
						                }, 3000); 
						                 
						               
						            } else {
						                alert("메일을 임시보관함에 저장하는데 실패했습니다.");
						            }
						            console.log("임시저장 ajax 성공");
						        },
						        error: function() {
						            console.log("임시저장 ajax 실패");
						        }
						    })
	
						  } else {
							  
						        $.ajax({
						          url: "updateTemp.em",
						          processData: false,
						          contentType: false,
						          type: "POST",
						          data: formData,
						          success: function(result) {
						            if (result == "success") {
						              $("#saveMessage").show(); // 저장완료 메시지 보이기
						              // 몇 초 뒤에 저장완료 메시지를 자동으로 숨기기
						              setTimeout(function() {
						                $("#saveMessage").hide();
						              }, 3000); // 3초
						            } else {
						              alert("메일을 임시보관함에 저장하는데 실패했습니다.");
						            }
						            console.log("임시저장 ajax 성공");
						          },
						          error: function() {
						            console.log("임시저장 ajax 실패");
						          }
						        })
						      }
					  
				}
				
				</script>
				<script>
				
				// 메일 '전송'시 실행하는 함수
				function sendMail() {
					if ($("#receivers").val().trim() == 0) {
						// 받는 사람 주소 없는 경우
						alert("받는 사람을 입력해 주세요.");
					} else {
						if ($("#title").val().trim() == 0) {
							// 메일 제목이 없는 경우
							let answer = confirm("제목이 지정되지 않았습니다. 제목 없이 메일을 보내시겠습니까?");
							if (answer) {								
								  	$("#mailForm").submit(); // 메일 전송
								
							} else {
								$("#title").focus();
								return false; // 메일 전송 안됨
							}
						}
						// 제목이 입력된 경우
						// 메일 전송
						$("#mailForm").submit();
					}
				}
				
			</script>
    
            <div>
               <form method="post" action="sendMail.em" id="mailForm" enctype="multipart/form-data">
                   	<input type="hidden" name="sender" value="${loginUser.memberId }">
                    <input type="hidden" name="memName" value="${loginUser.name }">
                    <div id="input"></div>
                    <table id="write"style="font-size: 15px;">
                        <tr>
                            <th width="120" height="40px">받는사람</th>
                            <td>
                               
                                <script src="https://unpkg.com/@yaireo/tagify"></script>
                                <!--<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>-->
                                <link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
                                
                               
                                <input type="text" placeholder="" name="receivers" class="email" id="receivers" value="${m.receivers}">
                                <button class="btn btn-primary btn-sm" style="font-weight: bold;" type="button" data-bs-toggle="modal" data-bs-target="#addressbook">+</button>
                                
                            </td>
                        </tr>
                        <tr>
                            <th  width="120" height="40px">참조</th>
                            <td>
                             
                                <input type="text" placeholder="" name="refEmail"  class="email" id="cc">
                                <button class="btn btn-primary btn-sm" type="button"style="font-weight: bold;" data-bs-toggle="modal" data-bs-target="#addressbook">+</button>
                              
                            </td>
                        </tr>
                        
                         <script>
                                //whitelist 값 불러오기
                              
                                $.ajax({
                                	url:"reList.em",
                                	data:{memId : '${loginUser.memberId}'},
                                	success:function(list){
                                		console.log(list);
                                		var whitelist = [];

                                		 for (var i = 0; i < list.length; i++) {
                                		    whitelist.push(list[i].name + ' ' + list[i].memberId + '@anyware.com' );
                                		  }
                                		 var input = document.querySelector('input[name=receivers]')
                                     	tagify1 = new Tagify(input, {
                                         whitelist: whitelist,
                                         maxTags: 10,
                                         dropdown: {
                                             maxItems: 20,           // <- mixumum allowed rendered suggestions
                                             classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
                                             enabled: 0,             // <- show suggestions on focus
                                             closeOnSelect: false    // <- do not hide the suggestions dropdown once an item has been selected
                                         }

                                     	})
                                         tagify1.on('add', function() {
                                        		 console.log(tagify1.value); // 입력된 태그 정보 객체
                                         })		 
                                        	
                                   	 
                                          var input = document.querySelector('input[name=refEmail]')
                                          tagify2 = new Tagify(input, {
                                          whitelist: whitelist,
                                          maxTags: 10,
                                          dropdown: {
                                              maxItems: 20,           // <- mixumum allowed rendered suggestions
                                              classname: "tags-look", // <- custom classname for this dropdown, so it could be targeted
                                              enabled: 0,             // <- show suggestions on focus
                                              closeOnSelect: false    // <- do not hide the suggestions dropdown once an item has been selected
                                          }
                                      })  
                                          // 태그가 추가되면 이벤트 발생
                                          tagify2.on('add', function() {
                                          	console.log(tagify2.value); // 입력된 태그 정보 객체
                                          })  	 
                               
                                		
                                      
                                	}
                                	,error:function(){
                                		console.log("ajax whitelist 값 가져오기 실패 ");
                                	}
                                })
                                
                                
                                
                                </script>
                            
                        
                        
                        <tr>
                            <th  width="120" height="40px">제목</th>
                            <td><input type="text" name="emTitle" id="title" class="form-control"></td>
                        </tr>
                        <tr>
                            <th height="40px">첨부파일</th>
                            <td>
                          	   <div id="fileUpload" class="dragAndDropDiv" onclick="$('#upfile').click();">Drag & Drop Files Here or Browse Files
                         
                          	   </div>
                               <input type="file" name="upfile" id="upfile"   onchange="addFile();" multiple/>
                            	<span class="fileMsg" style="font-size:13px"></span>
							    <div class="dropBox file-list">
									<span class="fileMsg" style="font-size:13px">※ 첨부파일은 최대 5개까지 가능합니다.</span>
								</div>  
                            	
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <textarea id="summernote" name="emContent"></textarea>
                            </td>
                        </tr>
                    </table>
                    
                    <script>

                    $(function (){
                        // 파일 드롭 다운
                        fileDropDown();
                    });
                  
                    
                    function fileDropDown(){
                        var dropZone = $(".dragAndDropDiv");
                        //Drag기능
                        dropZone.on('dragenter',function(e){
                            e.stopPropagation();
                            e.preventDefault();
                            // 드롭다운 영역 css
                            dropZone.css('background-color','#E3F2FC');
                        });
                        dropZone.on('dragleave',function(e){
                            e.stopPropagation();
                            e.preventDefault();
                            // 드롭다운 영역 css
                            dropZone.css('background-color','#FFFFFF');
                        });
                        dropZone.on('dragover',function(e){
                            e.stopPropagation();
                            e.preventDefault();
                            // 드롭다운 영역 css
                            dropZone.css('background-color','#E3F2FC');
                        });
                        dropZone.on('drop',function(e){
                            e.preventDefault();
                            // 드롭다운 영역 css
                            dropZone.css('background-color','#FFFFFF');
                             
                            var dragfiles = e.originalEvent.dataTransfer.files;
                            if(dragfiles != null){
                                if(dragfiles.length < 1){
                                    alert("폴더 업로드 불가");
                                    return;
                                }
                                console.log(dragfiles);
                                addFile(dragfiles);
                            }else{
                                alert("ERROR");
                            }
                        });
                    }
                    
                    </script>
				
                    <script>
                        $(document).ready(function() {
                        //여기 아래 부분
                        $('#summernote').summernote({
                              height: 450,                 // 에디터 높이
                              minHeight: null,             // 최소 높이
                              maxHeight: null,             // 최대 높이
                                               // 에디터 로딩후 포커스를 맞출지 여부
                              lang: "ko-KR",					// 한글 설정
                              placeholder: '메일내용을 입력해주세요.'	//placeholder 설정
                              
                        });
                    });

                      </script>
                    
					</form>
                </div>
			
            </div>
            <script>
         // ---------------- 첨부 파일 ---------------------

			var fileNo = 0; // 첨부파일 번호
			var filesArr = new Array(); // 다중 첨부파일 들어갈 파일 배열

			/* 첨부파일 추가 */
			function addFile(dragfiles) {
				
				// 안내문 삭제
				$(".fileMsg").remove();
				
				var maxFileCnt = 5; // 첨부파일 최대 개수
				var attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
				var remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
				var files = ""; // 현재 선택된 첨부파일 리스트 FileList
				
				
				if(dragfiles !=null){
					files = dragfiles;
				}else{
					files = $('#upfile')[0].files;
				}
				// 첨부파일 개수 확인
				if (files.length > remainFileCnt) {
					alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
					
					fileDataTransfer();
				}else{
					// 파일 배열에 담기
					let currFileArr = Array.from(files); // FileList => Array로 변환
					filesArr = filesArr.concat(currFileArr); // 추가한 fileList에 또 추가할 수 있도록 설정
					
					fileDataTransfer();
				    
				}
				renderingFileDiv(); // 추가 및 삭제할 때 마다 호출해서 index번호 초기화
				
			}
			
			/* 첨부파일 목록 html */
			function renderingFileDiv(){
				
				let htmlData = '';
				console.log(filesArr);
				for(let i=0; i<filesArr.length; i++){
					// i => 삭제할 파일 인덱스 번호
 

					var fileSize = filesArr[i].size; // 파일 사이즈(단위 :byte)
                    
					console.log("fileSize="+fileSize);

                    var sizeStr="";
                    var sizeKB = fileSize/1024;
                    if(parseInt(sizeKB) > 1024){
                        var sizeMB = sizeKB/1024;
                        sizeStr = sizeMB.toFixed(2)+" MB";
                    }else{
                        sizeStr = sizeKB.toFixed(2)+" KB";
                    }
             
					// 목록 추가
					htmlData += '<div id="file' + i + '" class="filebox">';
					htmlData += '<span class="name filename">'+ filesArr[i].name + '</span>';
					htmlData += '<span class="size filesize">'+ sizeStr + '</span>';
					htmlData += '<button type="button" class="delete abort" onclick="deleteFile('+ i + ');">x</button>';
					htmlData += '</div>';
		
				}
				//$(".dragAndDropDiv").removeAttr("onclick")
				$(".file-list").html(htmlData); // change가 발생할 때마다 목록 초기화한 뒤 넣어짐

			}

			/* 첨부파일 삭제 */
			function deleteFile(fileNo) { // 매개변수 : 첨부된 파일 번호(fileNo, i)
			
				console.log(fileNo);
				
				// class="fileMsg"에 있는 문구 삭제
				document.querySelector("#file" + fileNo).remove();
				
			    filesArr.splice(fileNo, 1);	// 해당되는 index의 파일을 배열에서 제거(1 : 한개만 삭제하겠다 라는 의미)				
			    fileDataTransfer();
			    renderingFileDiv();
			}
			
			
			/* 첨부파일 담는 배열 */
			function fileDataTransfer(){
				
				const dataTransfer = new DataTransfer();

			    filesArr.forEach(function(file){ 
			    //남은 배열을 dataTransfer로 처리(Array -> FileList)
			    	dataTransfer.items.add(file); 
			    });
			    
			    $('#upfile')[0].files = dataTransfer.files;	//제거 처리된 FileList를 돌려줌
			}
							
		</script>
            
            
  
            
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha/js/bootstrap.min.js"></script>
		<script src="resources/js/jquery.multi-select.js"></script>
            
        </div>
   
	<!-- Modal -->
	<div class="modal fade" id="addressbook" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">주소록</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					 <!-- Nav tabs -->
               <ul class="nav nav-tabs flex-column flex-sm-row nav-justified" style="height:45px" role="tablist">
                 <li class="nav-item">
                   <a class="nav-link active" data-toggle="tab" href="#companyAd" style="color:black;">사내주소록</a>
                 </li>
                 <li class="nav-item">
                   <a class="nav-link" data-toggle="tab" href="#personalAd" style="color:black;">개인주소록</a>
                 </li>
                
               </ul>

             
               <!-- Tab panes -->
               <div class="tab-content">
                 
                 <div id="companyAd" class="container tab-pane active">
                 <div><b>수신자</b></div>
                 	<select id='pre-selected-options' multiple='multiple'>

						<c:forEach items="${memberList}" var="member">
							<optgroup label="${member.deptName}">
								<c:forEach items="${member.email}" var="member">
									<option value="${member}">${member}</option>
								</c:forEach>
							</optgroup>
						</c:forEach>
					</select>
					
					<div><b>참조자</b></div>
                 	<select id='pre-selected-options-cc' multiple='multiple'>

						<c:forEach items="${memberList}" var="member">
							<optgroup label="${member.deptName}">
								<c:forEach items="${member.email}" var="member">
									<option value="${member}">${member}</option>
								</c:forEach>
							</optgroup>
						</c:forEach>
					</select>
					<script type="text/javascript">
                          // run pre selected options
                          $('#pre-selected-options').multiSelect();
                          $('#pre-selected-options-cc').multiSelect();
                    </script>
					
                  
                 </div>
                 <div id="personalAd" class="container tab-pane fade">       
                    <div><b>수신자</b></div>
                   <select id='pre-selected-options2' multiple='multiple'>
						<c:forEach items="${groupList}" var="group">
							<optgroup label="${group.groupName}">
								<c:forEach items="${group.nameMail}" var="member">
									<option value="${member}">${member}</option>
								</c:forEach>
							</optgroup>
						</c:forEach>

					</select>
					<div><b>참조자</b></div>
					 <select id='pre-selected-options2-cc' multiple='multiple'>
						<c:forEach items="${groupList}" var="group">
							<optgroup label="${group.groupName}">
								<c:forEach items="${group.nameMail}" var="member">
									<option value="${member}">${member}</option>
								</c:forEach>
							</optgroup>
						</c:forEach>

					</select>
					
					<script type="text/javascript">
                          // run pre selected options
                          $('#pre-selected-options2').multiSelect();
                          $('#pre-selected-options2-cc').multiSelect();
                    </script>
	                 
	                 
	                   
                
                 </div>
                
               </div>
				

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-sm"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary btn-sm" onclick="addMail();">추가</button>
				</div>
			</div>
		</div>
	</div>
	
			<script>
				function addMail(){
					  var selectedValues = [];
					  var selectedValuesCC = [];
					  $('#pre-selected-options option:selected').each(function() {
					    selectedValues.push($(this).val());
					  });
					  $('#pre-selected-options2 option:selected').each(function() {
						    selectedValues.push($(this).val());
						  });
					  $('#pre-selected-options-cc option:selected').each(function() {
						    selectedValuesCC.push($(this).val());
					  });
					  $('#pre-selected-options2-cc option:selected').each(function() {
						    selectedValuesCC.push($(this).val());
					 });
					  
					  $('#receivers').val(selectedValues.join(', '));
					  $('#cc').val(selectedValuesCC.join(', '));
					 
					  //console.log($("#receivers").val());
					  $('#addressbook').modal('hide');
				}
		
			</script>
			
			






</body>
</html>
