<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		alert("test");

		$('form[name=frmDate]').submit(function(){
			if($('#startDay').val().length<1){
				alert('시작일을 입력하세요');
				$('#startDay').focus();
				event.preventDefault();
			}else if($('#endDay').val().length<1){
				alert('종료일을 입력하세요');
				$('#endDay').focus();
				event.preventDefault();
			}
		});
	});
</script>

<p>test중 확인용(미완) </p>
<p>${dateSearchVO.startDay } ~ ${dateSearchVO.endDay }까지의 현황입니다.</p>
<p>신규 개인 가입자 : ${totalNewUsers }</p>
<p>신규 기업 가입자 : ${totalNewCorps }</p>
<p>탈퇴 개인 : ${totalWithdrawUsers }</p>
<p>탈퇴 기업 : ${totalWithdrawCorps }</p>
			<form name="frmDate" method="post">
				<!-- 조회기간 include -->
				<%@include file="../../inc/dateTerm.jsp"%>

				<input type="submit" value="조회" class="mybtn">
			</form>
