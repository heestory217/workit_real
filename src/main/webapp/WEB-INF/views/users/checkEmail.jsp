<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</script>
</head>
<body>
	<h2 class="center">이메일 인증</h2><br>
	<form name="frmEmail" method="post" action="<c:url value='/users/checkEmail.do'/>">
		<div>
    		<label for="email1">이메일 *</label>
			<input type="text" id="email1" class="col-lg-4" name="userEmail1">&nbsp;&nbsp;@&nbsp;
			<input type="text" id="email2" class="col-lg-4" name="userEmail2">&nbsp;&nbsp;
			<select name="email3" id="email3" class="col-lg-3 mystyle">
            	<option disabled selected>이메일 목록</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="etc">직접입력</option>
			</select>
        </div>
                            
		<input type="submit"  id="submit" value="인증메일 발송"  class="mybtn">
		
 		<c:if test="${result==EXIST_ID }">
			<p class="center">이미 등록된 아이디입니다. 다른 아이디를 입력하세요.</p>
		</c:if>
		<c:if test="${result==NON_EXIST_ID }">
			<input type="button" value="사용하기" id="btUse"  class="mybtn">
			<p class="center">사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>
	</form>
</body>
</html>