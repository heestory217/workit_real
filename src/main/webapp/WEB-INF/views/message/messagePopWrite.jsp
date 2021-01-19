<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 쓰기 : WORKIT 쪽지</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#notice').css('display', 'none');
					$("#selfMsg").bind(
							"click",
							function() {
								if ($('#selfMsg').is(':checked')) {
									$('.col-lg-6').find('input[name=userId]')
											.attr('placeholder', '1');
									$('#notice').css('display', 'block');
								} else {
									$('.col-lg-6').find('input[name=userId]')
											.attr('placeholder',
													'받는 회원 아이디를 입력하세요');
									$('#notice').css('display', 'none');
								}
							});
				});
	</script>
	<div class="col-lg-9 order-1 order-lg-2">
		<div class="row">
			<div class="col-lg-12">
				<div class="blog-details-inner">
					<div class="leave-comment" style="padding-top: 0">
						<div class="row">
							<div class="col-lg-6">
								<h4>쪽지쓰기</h4>
							</div>
							<div class="col-lg-6">
								<c:if test="${!empty param.type}">
									<script type="text/javascript">
										$(function() {
											$("#selfMsg").trigger("click");
										});
									</script>
								</c:if>
								<input type="checkbox" id="selfMsg"> <label
									for="selfMsg">나에게 쪽지 쓰기 <span class="checkmark"></span>
								</label>
							</div>
							<div class="col-lg-12" style="margin: 10px 0">
								<p id="notice" style="font-size: 16px; color: #4C50BB;">내게 쓴
									쪽지는 내게쓴쪽지함에만 저장되며, 삭제하는 경우 외에 자동으로 영구 보관됩니다.</p>
							</div>
						</div>
						<form name="msgFrm" method="post"
							action="<c:url value='/message/messageWrite.do'/>"
							class="comment-form">
							<div class="row">
								<div class="col-lg-6">
									<!-- 보내는 회원 userNo -->
									<input type="hidden" name="userNo"> <input type="text"
										name="userId" placeholder="받는 회원 아이디를 입력하세요">
								</div>
								<div class="col-lg-6">
									<input type="text" name="messageTitle" placeholder="제목을 입력하세요">
								</div>
								<div class="col-lg-12">
									<textarea name="messageContent" placeholder="쪽지 내용을 입력하세요"></textarea>
									<button type="submit" class="site-btn">보내기</button>
									<button type="button" class="site-btn">취소</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>