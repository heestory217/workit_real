<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="messageTop.jsp"%>

<style>
.error {
	color: red;
}
</style>

<script type="text/javascript"  src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#notice').css('display','none');
	$("#selfMsg").bind("click",function(){
		if($('#selfMsg').is(':checked')){
			$('.col-lg-6').find('input[name=userId]').attr('disabled',true);
			$('.col-lg-6').find('input[name=userId]').val($('#loginId').val());
			$('#notice').css('display','block');
		}else{
			$('.col-lg-6').find('input[name=userId]').attr('disabled',false);
			$('.col-lg-6').find('input[name=userId]').val('');
			$('.col-lg-6').find('input[name=userId]').attr('placeholder','받는 회원 아이디를 입력하세요');
			$('#notice').css('display','none');
		}
	});	//나한테 보내기 자동설정
	
	//폼 유효성 검사
	$('form[name=msgFrm]').submit(function(){
		if($('#userId').val().length<1){
			$('.error:eq(0)').html('받는 회원 아이디를 입력하세요');
			$('#userId').focus();
			event.preventDefault();
		}else if($('#messageTitle').val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$('#messageTitle').focus();
			event.preventDefault();
		}else if($('#messageContent').val().length<1){
			$('.error:eq(2)').html('쪽지 내용을 입력하세요');
			$('#messageContent').focus();
			event.preventDefault();
		}else if($('.error:eq(0)').html().length>1){
			event.preventDefault();
		}
	});//submit
		
	$('#userId').keyup(function(){
		var userid=$(this).val();
		
		if(validate_userid(userid)){
			$.ajax({
				url:"<c:url value='/users/ajaxCheckId.do'/>",
				type:"get",
				data:{
					userid:userid
				},
				success:function(res){
					var msg="";
					if(!res){  
						msg="등록되지 않은 아이디입니다.";
					}
					$('.error:eq(0)').html(msg);
				},
				error:function(xhr, status, error){
					alert('error! : '  +error);
				}
			});
		}else{
			$('.error:eq(0)').html("아이디는 영문, 숫자, _만 가능합니다.");
		}
	});
	
	$('#messageTitle').keyup(function(){
		if($(this).val().length<1){
			$('.error:eq(1)').html('제목을 입력하세요');
			$(this).focus();
		}else{
			$('.error:eq(1)').html('');
		}
	});
	
	$('#messageContent').keyup(function(){
		if($(this).val().length<1){
			$('.error:eq(2)').html('쪽지 내용을 입력하세요');
			$(this).focus();
		}else{
			$('.error:eq(2)').html('');
		}
	});
	
});
</script>

<div class="blog-details-inner">
	<div class="leave-comment" style="padding-top: 0">
		<div class="row">
			<div class="col-lg-6">
				<h4>쪽지쓰기</h4>
			</div>
			<c:if test="${empty sentUserID}">
				<div class="col-lg-6">
					<c:if test="${!empty param.type}">
						<script type="text/javascript">
							$(function(){
								$("#selfMsg").trigger("click");
							});
						</script>
					</c:if>
					<input type="checkbox" id="selfMsg"> 
					<input type="hidden" id="loginId" value="${userId}"> 
					<label for="selfMsg">나에게 쪽지 쓰기 <span class="checkmark"></span></label>
				</div>
				<div class="col-lg-12"style="margin: 10px 0">
					<p id="notice" style="font-size:16px;color:#4C50BB;">내게 쓴 쪽지는 내게쓴쪽지함에만 저장되며, 삭제하는 경우 외에 자동으로 영구 보관됩니다.</p>
				</div>
			</c:if>
		</div>
		
		<form name="msgFrm" method="post" class="comment-form">
			<div class="row">
				<div class="col-lg-6">
						<span class="error"></span>
						<input type="text" name="userId" id="userId"
							<c:if test="${empty sentUserID}">
								placeholder="받는 회원 아이디를 입력하세요"
							</c:if>
							<c:if test="${!empty sentUserID}">
								value="${sentUserID}"  disabled="disabled"
							</c:if>
						>
					<input type=hidden name="userNo" value="${userNo}"> 
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="messageTitle" id="messageTitle" placeholder="제목을 입력하세요">
				</div>
				<div class="col-lg-12">
					<span class="error"></span>
					<textarea name="messageContent" id="messageContent" placeholder="쪽지 내용을 입력하세요"></textarea>
					<button type="submit" class="site-btn">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="messageBottom.jsp"%>