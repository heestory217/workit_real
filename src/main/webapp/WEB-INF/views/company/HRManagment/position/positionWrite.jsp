<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="positionTop.jsp"%>

<style>
.error {
	color: red;
}
</style>

<script type="text/javascript"  src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/resources/js/position.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('#userId').keyup(function() {
			var userid = $(this).val();

			if (validate_userid(userid)) {
				$.ajax({
					url : "<c:url value='/users/ajaxCheckId.do'/>",
					type : "get",
					data : {
						userid : userid
					},
					success : function(res) {
						var msg = "";
						if (!res) {
							msg = "등록되지 않은 아이디입니다.";
						}
						$('.error:eq(0)').html(msg);
					},
					error : function(xhr, status, error) {
						alert('error! : ' + error);
					}
				});
			} else {
				$('.error:eq(0)').html("아이디는 영문, 숫자, _만 가능합니다.");
			}
		});
	});
</script>

<div class="blog-details-inner">
	<div class="leave-comment" style="padding-top: 0">
		<div class="row">
			<div class="col-lg-6">
				<h4>제안 보내기</h4>
			</div>
			<c:if test="${empty sentUserID}">
				<div class="col-lg-6">
					<c:if test="${!empty param.type}">
						<script type="text/javascript">
							$(function(){
								$("#saveForm").trigger("click");
							});
						</script>
					</c:if>
					<input type="checkbox" id="saveForm"> 
					<input type="hidden" id="loginId" value="${userId}"> 
					<label for="saveForm">양식함에 저장하기 <span class="checkmark"></span></label>
				</div>
				<div class="col-lg-12"style="margin: 10px 0">
					<p id="notice" style="font-size:16px;color:#4C50BB;">
						해당 제안은 양식함에 저장되며, 삭제하는 경우 외에 자동으로 영구 보관됩니다.
					</p>
				</div>
			</c:if>
		</div>
		
		<form name="positionFrm" method="post" class="comment-form" action="<c:url value='/company/HRManagment/positionWrite.do'/>">
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
					<input type="text" name="positionsuggestTitle" id="positionsuggestTitle" placeholder="제목을 입력하세요" maxlength="30">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="positionsuggestPosition" id="positionsuggestPosition" placeholder="포지션을 입력하세요">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="positionsuggestPrice" id="positionsuggestPrice" placeholder="연봉을 입력하세요">
				</div>
				<div class="col-lg-12">
					<span class="error"></span>
					<textarea name="positionsuggestContents" id="positionsuggestContents" placeholder="내용을 입력하세요" maxlength="1000"></textarea>
					<button type="submit" class="site-btn">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="positionBottom.jsp"%>