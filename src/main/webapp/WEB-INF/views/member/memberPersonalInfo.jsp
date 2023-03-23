<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<style>
/*컨텐트 영역*/
.enrollMem{margin: auto;}
#profileImage{border-radius: 100%;margin-left:100px; margin-top: 20px} 
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
#changePwd{width: 600px; margin-left: 30%}
#submit,#changePwdButton{margin-left: 80%; width: 120px;}

.changePwd{width: 300px;}
 
</style>
</head>
<body id="body-pd">
 
   <!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
   <!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>

        <div class="content">

            <b style="font-size:20px"> ${ loginUser.name }님의 정보관리</b>
            <br><br>
            <hr>

            <div id="employImg-div">
                  <img id="profileImage" src="<c:out value='${loginUser.profileUrl }' default='resources/images/profile2.jpg'/>"  onclick="$('#profileImgFile').click();" width="100%" height="100%" alt="">
            	<input type="file" id="profileImgFile" style="display:none;">
            </div>
            
        
                <div id="employProfile-div" >
                    <div id="employProfile-div2">
                        <div id="empolyId">${ loginUser.memberId }</div>
                        <div id="empolyName">${ loginUser.name }</div>
                    </div>
                </div>
                <br><br>
               <hr>
               <br>
        <form action="" method="post" id="updateForm">
        	<div id="Id"><input type="hidden" name="memberId" value="${ loginUser.memberId }"></div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>이메일</b></div>
                    <div class="profileContent2"><input type="email" name="email" value="${ loginUser.email}"></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>사원번호</b></div>
                    <div class="profileContent2"><input type="text" id="memberNo" name="memberNo" value="${ loginUser.memberNo }" readonly></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>휴대폰</b></div>
                    <div class="profileContent2"><input type="tel" name="phone" value="${ loginUser.phone }"></div>
                </div>
                
                <div id="employProfile-div3">
                    <button id="changePwdButton" class="btn btn-sm btn-secondary"type="button" data-toggle="modal" data-target="#changePwd">비밀번호변경</button>
                </div>
                
                
                
                <br>
               <hr>
                <br>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>조직</b></div>
                    <div class="profileContent2">qq회사</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>직급</b></div>
                    <div class="profileContent2">&nbsp;${ loginUser.position }</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>부서/직책</b></div>
                    <div class="profileContent2">${ loginUser.deptName }/${ loginUser.jobName }</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>담당업무</b></div>
                    <div class="profileContent2">${ loginUser.duty }</div>
                </div>
                <script>
                	$(function(){
                		if('${loginUser.duty}'==''){
                			$("#duty").val('미정');
                		}
                	})
                </script>
                <br><br>
                <hr>
                <br>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>주소</b></div>
                    <div class="profileContent2" id="address"><input type="text" name="address" value="${ loginUser.address }"></div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>입사일</b></div>
                    <div class="profileContent2">${ loginUser.enrollDate }</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>생일</b></div> <!-- 우선 주민번호로, 추후에 sql문 수정 필요 -->
                    <div class="profileContent2">${ loginUser.rrn }</div>
                </div>
                <div id="employProfile-div3">
                    <button id="submit" class="btn btn-primary btn-sm" type="submit">정보변경</button>
                </div>
                <br><br><br><br><br><br>
        </form>
        	
				<script>
					$(function(){
						$("#submit").click(function(){
							$("#updateForm").attr("action", "memberPersonalUpdate.me").submit();
						})
					})
				</script>

            
        </div>   
        
        <!-- 비밀번호 변경 모달 -->
    <div class="modal fade" id="changePwd" align="center">
     <div class="modal-dialog">
       <div class="modal-content">
   
         <div class="modal-header">
           <h4 class="modal-title">비밀번호 변경</h4>
           <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
   
         <div class="modal-body" align="center">
           <form action="changePwd.me" method="post">
              <input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
              <table>
                 <tr>
                    <td>현재 비밀번호</td>
                    <td><input type="password" name="memberPwd" required></td>
                 </tr>
                 <tr>
                    <td>새 비밀번호</td>
                    <td><input type="password" name="updatePwd" required></td>
                 </tr>
              </table>
              <br>
              <button type="submit" class="btn btn-sm btn-secondary" >비밀번호 변경</button>
             
           </form>
           
         </div>
         
       </div>
     </div>
   </div>
        

       



             






        
        
    



</body>
</html>