<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>  

/*컨텐트 영역*/
.content{
    width: 80%;
    margin-left: 200px;
    margin-top: 50px;
}
#profileImage{border-radius: 100%;margin-left:150px; margin-top: 20px} 
.partLine{border: 0.1px solid rgb(213, 212, 212);}
#employImg-div{float: left; width: 150px; height: 150px;}
#employProfile-div{height: 150px;}
#employProfile-div2{width: 500px; height: 100px; margin-left:400px;  margin-top:70px;} 
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
#submit{margin-left: 80%; width: 120px;}
#leave{margin-top: 1%; margin-left: 90%; width: 120px;background-color: red;color: blanchedalmond;}

</style>
</head>
<body id="body-pd">
   
	<!-- 사이드 바  -->
	<jsp:include page="../common/sidebar.jsp"></jsp:include>
   <!-- 세부 메뉴 -->
	<jsp:include page="../common/memberMenu.jsp"></jsp:include>
	

        <div class="content">
            <b  style="font-size:20px"> ${ m.name }님의 인사관리</b><br>
            <span style="font-size:15px">${ loginUser.name }님이 조회</span>
            <br><br>
            <hr>

            <div id="employImg-div">
                <img id="profileImage" src="<c:out value='${m.profileUrl }' default='resources/images/profile2.jpg' />" type="button" width="100%" height="100%" alt="">
            </div>
            
        
                <div id="employProfile-div" >
                    <div id="employProfile-div2" >
                    	<table>
                    		<tr>
                    			<th width="100" height="50">사원 아이디</th>
                    			<td>${m.memberId }</td>		
                    		<tr>
                    		<tr>
                    			<th  width="100" height="30">사원 이름</th>
                    			<td>${m.name}</td>		
                    		<tr>
                    		
                    	</table>
                    
                    </div>
                </div>
<!-- 
                <div id="employProfile-div00" >
                    <div id="employProfile-div200">
                        <div id="empolyId">사원아이디</div>
                        <div id="empolyName">사원이름 </div>
                    </div>
                </div> -->
                
                 <hr>
                <br>
         <div class="employContent">

            <form action="allMemberUpdate" method="post">
				<input type="hidden" name="memberId" value="${ m.memberId }">
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>출근시간</b></div>
                    <div class="profileContent2">출근시간입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>퇴근시간</b></div>
                    <div class="profileContent2">퇴근시간입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>이번달 근무시간</b></div>
                    <div class="profileContent2">이번달 근무시간 입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>남은 연차 개수</b></div>
                    <div class="profileContent2">남은 연차 개수 입력</div>
                </div>
                <div id="employProfile-div3">
                    <div class="profileContent1"><b>사용한 연차개수</b></div>
                    <div class="profileContent2">사용한 연차 개수 입력</div>
                </div>
        </div>       
                <br><br>
                     <hr>
                    <br>
       			 <div class="employContent">
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>이메일</b></div>
                        <div class="profileContent2">${ m.email }</div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>사원번호</b></div>
                        <div class="profileContent2"><input type="text" name="memberNo" value="${ m.memberNo }"></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>휴대폰</b></div>
                        <div class="profileContent2">${ m.phone }</div>
                    </div>
                    
       		  </div> 
                    <br><br>
                   <hr>
                    <br>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>조직</b></div>
                        <div class="profileContent2"><input type="text" name="" value="qq회사" readonly></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>직급</b></div>
                        <div class="profileContent2"><input type="text" name="jobName" value="${ m.jobName }" ></div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>부서/직책</b></div>
                        <div class="profileContent2">
                        	<input type="text" id="deptInput" value="${ m.deptName }/${ m.position }">
                            <select name="deptName" id="deptName">
                            	<option value="">부서선택</option>
                                <option value="인사부">인사부</option>
                                <option value="총무부">총무부</option>
                                <option value="개발부">개발부</option>
                                <option value="디자인부">디자인부</option>
                            </select>
                            <select name="position" id="position">
                            	<option value="">직책선택</option>
                                <option value="팀장">팀장</option>
                                <option value="팀원">팀원</option>                                
                            </select>
                        </div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>담당업무</b></div>
                        <div class="profileContent2"><input type="text" id="duty" name="duty" value="${ m.duty }" ></div>
                    </div>
                    <script>
                	$(function(){
                		if('${m.duty}'==''){
                			$("#duty").val('미정');
                		}
                	})
                </script>
                
                    <br><br>
                    <hr>
                    <br>
        <div class="employContent">            
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>주소</b></div>
                        <div class="profileContent2">${ m.address }</div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>입사일</b></div>
                        <div class="profileContent2">${ m.enrollDate }</div>
                    </div>
                    <div id="employProfile-div3">
                        <div class="profileContent1"><b>생일</b></div> <!-- 일단 주민번호로 -->
                        <div class="profileContent2">${ m.rrn }</div>
                    </div>
                    <div id="employProfile-div3">
                        
                        <button class="btn btn-primary btn-sm" id="submit" type="submit">정보변경</button>
                        <button type="button" class="btn btn-danger btn-sm"  disabled = 'disabled' id="outMemberBtn">퇴사처리</button>
                    </div>
         </div>       
            </form>
            
           <br>
        <div id="employLeave-div">
          
        </div>
        
        <br><br><br><br><br><br>
			<script>
				if(${loginUser.memberNo} != ${m.memberNo}){					
						$('#outMemberBtn').attr('disabled', false);					
				}else{					
					$('#outMemberBtn').attr('disabled', true);					
				}
			</script>
			
			<script>
				$(function(){
					$('#outMemberBtn').click(function(){
						location.href = 'outMember.me?memberNo='+ ${m.memberNo};
					})
				})
			</script>

            
        </div>    
            
        

       



             






        
        
    



</body>
</html>