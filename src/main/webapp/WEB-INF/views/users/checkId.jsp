<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find('#userid').val("${param.userid}");
			$(opener.document).find('#chkId').val("Y");	
			self.close();
		});
	});
</script>
</head>
<body>
	<h2>아이디 중복 검사</h2><br>
	<form name="frmId" method="post" action="<c:url value='/users/checkId.do'/>">
		 
		<input type="text" name="userid" id="userid" title="아이디입력" value="${param.userid}">
		<input type="submit"  id="submit" value="아이디 확인">
		
 		<c:if test="${result==EXIST_ID }">
			<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요.</p>
		</c:if>
		<c:if test="${result==NON_EXIST_ID }">
			<input type="button" value="사용하기" id="btUse">
			<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
		</c:if>
	</form>
</body>
</html>