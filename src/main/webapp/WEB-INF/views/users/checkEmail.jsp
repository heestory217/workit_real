<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/usersRegister.css'/>" />
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$(function(){
	   $('#email3').change(function(){
	      if($(this).val()=='etc'){
	         $('#email2').val('');
	         $('#email2').focus();            
	      }else{
	         $('#email2').val($(this).val());
	      }   
	 	});
	   
	   $('#validEmail').click(function(){
			$(opener.document).find('#email1').val($('#email1').val());
			$(opener.document).find('#email2').val($('#email2').val());
			location.href="/workit/email/send.do?email="+$('#email1').val()+"@"+$('#email2').val();
		});
	   
	   $('#close').click(function(){
			self.close();
			$(opener.document).find('#validNum').val(${number});
		});
	});
</script>
</head>
<body>
	<h2 class="center">이메일 인증</h2><br>
	<form name="frmEmail" method="post" action="<c:url value='/users/checkEmail.do'/>">
		<div>
			<input type="text" id="email1" name="email1" class="mystyle padding_left10" 
				value="${param.email1}">&nbsp;&nbsp;@&nbsp;
			<input type="text" id="email2" name="email2" class="mystyle padding_left10" 
				value="${param.email2}">&nbsp;&nbsp;
			<select name="email3" id="email3" class="mystyle width_135 padding_left10">
            	<option disabled selected>이메일 목록</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="etc">직접입력</option>
			</select>
        <input type="button" id="validEmail" class="mybtn" value="인증번호발급"><br>
        </div>
		<c:if test="${result==1 }">
			<div class="center">
				<p class="error"><b>이메일을 전송했습니다. 확인 부탁드립니다.</b></p><br>
        		<input type="button" id="close" class="inputbtn width_300 center lightgray" value="닫기">     
        	</div>               
		</c:if>
		<c:if test="${result==2 }">
			<p class="center error"><b>이메일 전송에 실패했습니다. 다시 시도해주세요.</b></p>
		</c:if>
		
	</form>
</body>
</html>