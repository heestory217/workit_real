<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">

$(function(){
		$('#updatePwdBtn').click(function(){
			if($("#userId").val().length<1){
				alert('아이디를 입력해주세요');
				$("#userId").focus();
				return false;
			}else if($("#userTemp").val().length<1){
				alert('임시 비밀번호를 입력해주세요');
				$("#userTemp").focus();
				return false;
			}else if($("#userPwd").val().length<1){
				alert('새로운 비밀번호를 입력해주세요');
				$("#userPwd").focus();
				return false;
			}else if($("#cfmUserPwd").val().length<1){
				alert('비밀번호 확인을 입력해주세요');
				$("#cfmUserPwd").focus();
				return false;
			}else if($("#userPwd").val()!=$("#cfmUserPwd").val()){
				alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
				$("#cfmUserPwd").focus();
				return false;
			}
			
			$('form[name=frmUpdatePwd]').submit()
		});
		
	});
</script>
<div class="register-login-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3">
				<div class="login-form">
					<h2>비밀번호 재설정</h2>
					<form name="frmUpdatePwd" action="<c:url value='/users/tempPwdUpdate.do'/>" method="post">
						<div class="group-input">
							<label for="username">아이디 </label>
							<input type="text" id="userId" class="infobox" name="userId">
						</div>
						<div class="group-input">
							<label for="username">임시비밀번호 </label>
							<input type="password" id="userTemp" class="infobox" name="userTemp">
						</div>
						<div class="group-input">
							<label for="username">새로운 비밀번호</label>
							<input type="password" id="userPwd" class="infobox" name="userPwd">
						</div>
						<div class="group-input">
							<label for="username">새로운 비밀번호 확인</label>
							<input type="password" id="cfmUserPwd" class="infobox">
						</div>
						<button type="button" class="site-btn login-btn" id='updatePwdBtn'>비밀번호 재설정</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>