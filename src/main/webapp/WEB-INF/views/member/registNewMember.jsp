<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <style>  
.enrollMem{margin: auto;}
#profileImage{border-radius: 100%;margin-left:350px; margin-top: 20px} 
.partLine{border: 0.1px solid rgb(213, 212, 212);;}
#employImg-div{float: left; width: 150px; height: 150px;}
#employProfile-div{margin-left: 30%; width: 150px; height: 150px; }
#employProfile-div2{padding-top: 70%;} 
.profileContent1{float: left; margin-left: 150px; }  
.profileContent2{margin-left: 30%; margin-top: 10px}
input[type="text"]{width:350px; height:30px; border-radius:5px; border:1px solid rgb(213, 212, 212); }
input[type="email"]{width:350px; height:30px; border-radius:5px; border:1px solid rgb(213, 212, 212); }
input[type="password"]{width:350px; height:30px; border-radius:5px; border:1px solid rgb(213, 212, 212); }
input[type="tel"]{width:350px; height:30px; border-radius:5px; border:1px solid rgb(213, 212, 212); }
select{border: 1px solid rgb(213, 212, 212);border-radius: 5px;height: 29px; width: 100px}
#changePwd{margin-left: 90%; width: 120px;}
#submit{margin-left: 80%; width: 120px;}
.modal-open{padding-right: 50px;}

  </style>
</head>
<body id="body-pd">
  <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
   <!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>

        <div class="content">
        	<div class="enrollMem">
            <b style="font-size:20px"> 사원신규등록 </b> &nbsp;&nbsp;
            <span style="font-size:15px">${ loginUser.name }님이 등록</span>
            <br><br>
            <hr>

            <div id="employImg-div">
                <img id="profileImage" src="resources/images/profile2.jpg"  onclick="$('#profileImgFile').click();" width="100%" height="100%" alt="">
            	<input type="file" id="profileImgFile" style="display:none;">
            </div>
            <div id="employProfile-div" >
                <div id="employProfile-div2">
                    <div id="empolyId"></div>
                    <div id="empolyName"></div>
                </div>
            </div>
        
                
                <br><br>
                <hr>
                <br>
        <form action="" id="submitForm">
        	<input type="hidden" name="profileUrl" value="resources/images/images-for-member/defaultProfile.png">
        	
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>이름</b></div>
                    <div class="profileContent2"><input type="text" required name="name" value=""></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>주민번호</b></div>
                    <div class="profileContent2"><input type="text"  required name="rrn" value=""></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>아이디</b></div>
                    <div class="profileContent2"><input type="text" required name="memberId" value=""></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>비밀번호</b></div>
                    <div class="profileContent2"><input type="password"  required name="memberPwd" value=""></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>이메일</b></div>
                    <div class="profileContent2"><input type="email" name="email" value=""></div>
                </div>
                
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>휴대폰</b></div>
                    <div class="profileContent2"><input type="tel" name="phone" value=""></div>
                </div>
                
                <br><br>
                <hr>
                <br>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>조직</b></div>
                    <div class="profileContent2"><input type="text" value="qq회사" ></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>직급</b></div>
                    <div class="profileContent2">
                    	<select name="jobName" id="jobName">
                            	<option value="미정">미정</option>                               
                                <option value="사원">사원</option>
                                <option value="대리">대리</option>
                                <option value="과장">과장</option>
                                <option value="부장">부장</option>
                            </select>
                    </div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>부서/직책</b></div>
                    <div class="profileContent2">
                    	<select name="deptName" id="deptName">
                            	<option value="미정">미정</option>
                                <option value="인사부">인사부</option>
                                <option value="총무부">총무부</option>
                                <option value="개발부">개발부</option>
                                <option value="디자인부">디자인부</option>
                            </select>
                            <select name="position" id="position">
                            	<option value="미정">미정</option>
                                <option value="팀장">팀장</option>
                                <option value="팀원">팀원</option>                                
                            </select>
                    </div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>담당업무</b></div>
                    <div class="profileContent2"><input type="text" name="duty" value="" ></div>
                </div>
                <br><br>
                <hr>
                <br>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>주소</b></div>
                    <div class="profileContent2">
                    	<input type="text" id="address" name="address" value="">
                    	  <button id="findAddressBtn" type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#findAddress">주소찾기</button>
                    	  <br>
                    	<input type="text" id="detailAddress" name="detailAddress" value="" style="width:200px; margin-top:10px;">
                    	<input type="text" id="extraAddress" name="extraAddress" value="" style="width:150px">
                    </div>
                </div>
                
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>입사일</b></div>
                    <div class="profileContent2"><input type="text" name="enrollDate" value="" required placeholder="YYYY-MM-DD 형식으로 입력"></div>
                </div>
                
                <div id="employProfile-div3">
                    <button id="submit" class="btn btn-primary btn-sm"  type="submit">사원등록</button>
                    <br>
                    
                </div>
                <br><br><br><br><br><br>
        </form>
         </div>
                
        </div> 
        
        <script>
        	$(function(){
        		$("#submit").click(function(){
        			$("#submitForm").attr("action", "insert.me").submit();
        		})
        	})
        </script>   
            
 <div class="modal" id="findAddress">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <div class="modal-header">
           <h4 class="modal-title">주소찾기</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <div class="modal-body" align="center">             
              <table>
                 <tr>             
                    <td><input type="text" id="sample6_postcode" placeholder="우편번호"></td>
                 </tr>
                 <tr>
                    <td><input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-sm btn-secondary"  value="우편번호 찾기"><br></td>
                 </tr>
                 <tr>             
                    <td><input type="text" id="sample6_address" placeholder="주소"><br></td>
                 </tr>
                 <tr>
                    <td><input type="text" id="sample6_detailAddress" placeholder="상세주소"></td>
                 </tr>
                 <tr>
                    <td><input type="text" id="sample6_extraAddress" placeholder="참고항목"></td>
                 </tr>
              </table>
              <br>
              <button type="button" class="btn btn-sm btn-secondary" onclick="submitAddress()">주소 입력</button>
           
         </div>
         
         <script>
         	function submitAddress(){
         		$("#address").val($("#sample6_address").val());
         		$("#detailAddress").val($("#sample6_detailAddress").val());
         		$("#extraAddress").val($("#sample6_extraAddress").val());
         		$("#findAddress").modal("hide");
         	}
         </script>
         
         <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("sample6_address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("sample6_detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
   
       </div>
     </div>
   </div>
   
  



             






        
        
    



</body>
</html>