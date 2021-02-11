<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
	color: #4C50BB;
}

.psck_head {
    text-align: center;
}

.psck_btWrap {
    padding-top: 32px;
}

#qaPassword {
    height: 33px;
    border: 2px solid #ebebeb;
    color: #b2b2b2;
    font-size: 14px;
    padding-left: 20px;
    width: 250px;
}

.btn-default {
    color: #ffffff;
    background: #4C50BB;
    border: 1px solid #4C50BB;
    font-size: 14px;
    font-weight: 700;
    text-transform: uppercase;
    padding: 8px 15px 11px;
    cursor: pointer;
}


</style>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('#closeBt').click(function(){
			location.href="<c:url value='/qna/qnaList.do'/>";
		});
	});
</script>

</head>
<body>

	<div class="psckWarp" style="padding: 10px">
		<div class="psck_head">
			<h1>비밀번호를 입력하세요</h1>
			<h4>글을 확인하시려면 등록하실 때 사용하신 비밀번호를 입력하세요</h4>
			<br>
			<form action="<c:url value="/qna/passwordCheck.do"/>" method="post">
				<input type="text" name="qaPassword" id="qaPassword"> 
				<input type="hidden" name="qaNo" id="qaNo" value="${param.qaNo }">
				
				<div class="psck_btWrap" style="text-align: center;">
					<button type="submit" class="btn btn-default" id="okBt">확인</button>
					<button type="button" class="btn btn-default" id="closeBt">닫기</button>
				</div>
			</form>
		</div>

	</div>

</body>
</html>