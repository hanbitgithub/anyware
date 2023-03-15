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
	font-size: 20px;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #3b75f5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #dedede;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
	font-size: 14px;
}

.statusbar:nth-child(odd) {
	background: #f6f5f5;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 600px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #3d3d3d;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color:#c0443bd1;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 12px;
	font-weight: normal;
	padding: 3px 10px;
	cursor: pointer;
	vertical-align: top
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


	<script type="text/javascript">
            $(document).ready(function(){
                var objDragAndDrop = $(".dragAndDropDiv");
                
                $(document).on("dragenter",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                    $(this).css('border', '2px solid #7291f6');
                });
                $(document).on("dragover",".dragAndDropDiv",function(e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on("drop",".dragAndDropDiv",function(e){
                    
                    $(this).css('border', '1px dashed #7291f6');
                    e.preventDefault();
                    var files = e.originalEvent.dataTransfer.files;
                
                    handleFileUpload(files,objDragAndDrop);
                });
                
                $(document).on('dragenter', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                $(document).on('dragover', function (e){
                  e.stopPropagation();
                  e.preventDefault();
                  objDragAndDrop.css('border', '1px dashed #7291f6');
                });
                $(document).on('drop', function (e){
                    e.stopPropagation();
                    e.preventDefault();
                });
                
 
                $('input[type=file]').on('change', function(e) {
                    var files = e.originalEvent.target.files;
                    handleFileUpload(files,objDragAndDrop);
                });
                

                
                function handleFileUpload(files,obj)
                {
                   for (var i = 0; i < files.length; i++) 
                   {
                        var fd = new FormData();
                        fd.append('file', files[i]);
                 
                        var status = new createStatusbar(obj); //Using this we can set progress.
                        status.setFileNameSize(files[i].name,files[i].size);
                        sendFileToServer(fd,status);
                 
                   }
                }
                
                var rowCount=0;
                function createStatusbar(obj){
                        
                    rowCount++;
                    var row="odd";
                    if(rowCount %2 ==0) row ="even";
                    this.statusbar = $("<div class='statusbar "+row+"'></div>");
                    this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
                    this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
                    this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
                    this.abort = $("<div class='abort'>X</div>").appendTo(this.statusbar);
                    
                    obj.after(this.statusbar);
                 
                    this.setFileNameSize = function(name,size){
                        var sizeStr="";
                        var sizeKB = size/1024;
                        if(parseInt(sizeKB) > 1024){
                            var sizeMB = sizeKB/1024;
                            sizeStr = sizeMB.toFixed(2)+" MB";
                        }else{
                            sizeStr = sizeKB.toFixed(2)+" KB";
                        }
                 
                        this.filename.html(name);
                        this.size.html(sizeStr);
                    }
                    
                    this.setProgress = function(progress){       
                        var progressBarWidth =progress*this.progressBar.width()/ 100;  
                        this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                        if(parseInt(progress) >= 100)
                        {
                          /*  this.abort.hide();*/
                        }
                    }
                    
                    this.setAbort = function(jqxhr){
                        var sb = this.statusbar;
                        this.abort.click(function()
                        {
                        	
                        	sb.remove();
                        	/*
                            jqxhr.abort();
                            sb.hide();
                            */
                        });
                    }
                }
                
                function sendFileToServer(formData,status)
                {
                    var uploadURL = "/fileUpload/post"; //Upload URL
                    var extraData ={}; //Extra Data.
                    var jqXHR=$.ajax({
                            xhr: function() {
                            var xhrobj = $.ajaxSettings.xhr();
                            if (xhrobj.upload) {
                                    xhrobj.upload.addEventListener('progress', function(event) {
                                        var percent = 0;
                                        var position = event.loaded || event.position;
                                        var total = event.total;
                                        if (event.lengthComputable) {
                                            percent = Math.ceil(position / total * 100);
                                        }
                                        //Set progress
                                        status.setProgress(percent);
                                    }, false);
                                }
                            return xhrobj;
                        },
                        url: uploadURL,
                        type: "POST",
                        contentType:false,
                        processData: false,
                        cache: false,
                        data: formData,
                        success: function(data){
                            status.setProgress(100);
                 
                            //$("#status1").append("File upload Done<br>");           
                        }
                    }); 
                 
                    status.setAbort(jqXHR);
                }
                
            });

           
        </script>

      
        <div class="content">
            <b style="font-size: 18px;">메일쓰기</b> 
            <br><br>
            <div id="write-area">
                <div id="btn-area">
                    <a onclick="return sendMail();"><img src="resources/images/send-mail.png" width="23px"> 전송</a>
                    <a href=""><img src="resources/images/refresh.png" width="22px"> 취소</a>
                    <a onclick="saveTemp();"><img src="resources/images/packing.png" width="23px"> 임시저장</a>
                    <a href="sendToMeForm.em"><img src="resources/images/exchange.png" width="23px"> 내게쓰기</a>
                	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="now" />
                	<span id="saveMessage" style="display:none;">임시저장완료 <c:out value="${now}" /></span>
                </div>
                <br>
                
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
                                
                               
                                <input type="text" placeholder="" name="receivers" class="email" id="receivers">
                                <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#addressbook">+</button>
                                
                            </td>
                        </tr>
                        <tr>
                            <th  width="120" height="40px">참조</th>
                            <td>
                             
                                <input type="text" placeholder="" name="refEmail"  class="email" id="cc">
                                <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#addressbook">+</button>
                              
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
                                <div id="fileUpload" class="dragAndDropDiv" onclick="$('#uploadFile').click();">Drag & Drop Files Here or Browse Files</div>
                                <input type="file" name="fileUpload" id="uploadFile" style="display:none;" multiple/>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <textarea id="summernote" name="emContent"></textarea>
                            </td>
                        </tr>
                        
                       

                    </table>
				
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
