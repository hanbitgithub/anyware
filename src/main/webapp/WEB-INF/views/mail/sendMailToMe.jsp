<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

   
   <!--메일쓰기-->
   <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
   <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

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
	border: 1px solid rgb(190, 190, 190);
	width: 100%;
	height: 35px;
}

#write-area {
	margin-left: 30px;
}

#state1 {
	width: 1200px;
}

/*드래그드롭*/
.dragAndDropDiv {
	border: 1px dashed #b1b3b4;
	width: 1200px;
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
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
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
<body id="body-pd">
    <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
 

    <!-- 세부 메뉴 -->
	<jsp:include page="../common/mailmenu.jsp"></jsp:include>
	
    <!--summernote-->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
   <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

 

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
                    <a href=""><img src="resources/images/send-mail.png" width="25px"> 전송</a>
                    <a href=""><img src="resources/images/refresh.png" width="20px"> 취소</a>
                    <a href=""><img src="resources/images/packing.png" width="25px"> 임시저장</a>
                    <a href=""><img src="resources/images/exchange.png" width="25px"> 내게쓰기</a>
                  
                </div>
                <br>
                <div>
                    <table id="write"style="font-size: 15px;">
                      
                        <tr>
                            <th  width="120" height="40px">제목</th>
                            <td><input type="text" name="" value="" class="form-control"></td>
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
                                <textarea id="summernote" name="editordata"></textarea>
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
                    

                </div>

            

            </div>

            
        </div>

        





</body>
</html>
