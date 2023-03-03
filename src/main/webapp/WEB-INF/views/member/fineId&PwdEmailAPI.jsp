<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.field {
  margin-bottom: 10px;
}

.field label {
  display: block;
  font-size: 12px;
  color: #777;
}

.field input {
  display: block;
  min-width: 250px;
  line-height: 1.5;
  font-size: 14px;
}

input[type="submit"] {
  display: block;
  padding: 6px 30px;
  font-size: 14px;
  background-color: #4460AA;
  color: #fff;
  border: none
}

#email-area{
	margin-top: 30%;
}
</style>
</head>
<body>
<div id="email-area" align="center">
		<form id="form">
  <div class="field">
    <label for="from_name">관리자 계정</label>
    <input type="text" name="from_name" id="from_name">
  </div>
  <div class="field">
    <label for="to_name">조회 요청 사원</label>
    <input type="text" name="to_name" id="to_name">
  </div>
  <div class="field">
    <label for="message">인증번호</label>
    <input type="text" name="message" id="message">
  </div>
  

  <input type="submit" id="button" value="Send Email" >
</form>

<script type="text/javascript"
  src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

<script type="text/javascript">
  emailjs.init('wXukjH85FjVym_OFs')
</script>
</div>

<script>
const btn = document.getElementById('button');

document.getElementById('form')
 .addEventListener('submit', function(event) {
   event.preventDefault();

   btn.value = 'Sending...';

   const serviceID = 'default_service';
   const templateID = 'template_3ausmmb';

   emailjs.sendForm(serviceID, templateID, this)
    .then(() => {
      btn.value = 'Send Email';
      alert('인증번호를 전송했습니다.');
    }, (err) => {
      btn.value = 'Send Email';
      alert(JSON.stringify(err));
    });
});
</script>
</body>
</html>