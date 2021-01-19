<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="messageTop.jsp"%>

<script type="text/javascript">
$(document).ready(function() {
	$('#notice').css('display','none');
	$("#selfMsg").bind("click",function(){
		if($('#selfMsg').is(':checked')){
			//kim 부분 바꿔줘야함 회원한 유저의 userid로
			$('.col-lg-6').find('input[name=userId]').attr('disabled',true);
			$('.col-lg-6').find('input[name=userId]').val('kim');
			$('#notice').css('display','block');
		}else{
			$('.col-lg-6').find('input[name=userId]').attr('placeholder','받는 회원 아이디를 입력하세요');
			$('#notice').css('display','none');
		}
	});
	
	$("#opt01").click(function(){
        window.open("http://www.nias.go.kr/", 'child', 'width=390, height=390');
	});

});
</script>

<div class="blog-details-inner">
	<div class="leave-comment" style="padding-top: 0">
		<div class="row">
			<div class="col-lg-6">
				<h4>쪽지쓰기</h4>
			</div>
			<div class="col-lg-6">
				<c:if test="${!empty param.type}">
					<script type="text/javascript">
						$(function(){
							$("#selfMsg").trigger("click");
						});
					</script>
				</c:if>
				<input type="checkbox" id="selfMsg"> 
				<label for="selfMsg">나에게 쪽지 쓰기 <span class="checkmark"></span></label>
			</div>
			<div class="col-lg-12"style="margin: 10px 0">
				<p id="notice" style="font-size:16px;color:#4C50BB;">내게 쓴 쪽지는 내게쓴쪽지함에만 저장되며, 삭제하는 경우 외에 자동으로 영구 보관됩니다.</p>
			</div>
		</div>
		<form name="msgFrm" method="post"
			action="<c:url value='/message/messageWrite.do'/>"
			class="comment-form">
			<div class="row">
				<div class="col-lg-6">
					<!-- 보내는 회원 userNo value 값을 현재 로그인한 회원의 userno로 바꿔주어야함 !!-->
					<input type=hidden name="userNo" value="1"> 
					<input type="text" name="userId" placeholder="받는 회원 아이디를 입력하세요">
				</div>
				<div class="col-lg-6">
					<input type="text" name="messageTitle" placeholder="제목을 입력하세요">
				</div>
				<div class="col-lg-12">
					<textarea name="messageContent" placeholder="쪽지 내용을 입력하세요"></textarea>
					<button type="submit" class="site-btn">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="messageBottom.jsp"%>