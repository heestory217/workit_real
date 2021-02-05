<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="positionTop.jsp"%>

<style>
.error {
	color: red;
}
</style>

<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/resources/js/position.js'/>"></script>

<script type="text/javascript">
	$(function() {
		var contents = $('#contents').html();
		CKEDITOR.instances.positionsuggestContents.setData(contents);
	});

	function write_go() {
		var ckeditor = CKEDITOR.instances['positionsuggestContents'];
		if (ckeditor.getData() == "") {
			alert('내용을 입력 하세요');
			ckeditor.focus();
			return;
		} else {
			document.in_form.submit();
		}
	}
</script>

<!-- 파라미터 처리를 위한 정보-->
<div style="display: none;">
	<p id="type">${param.type}</p>
</div>

<div class="blog-details-inner">
	<div class="leave-comment" style="padding-top: 0">
		<div class="row">
			<div class="col-lg-12" style="text-align: center;">
				<h4>양식 수정하기</h4>
			</div>
		</div>
		
		<form name="positionFrm" method="post" class="comment-form" action="<c:url value='/company/HRManagment/modifyPSG.do'/>">
			<div class="row">
					<span class="error"></span>
					<input type="hidden" name="userId" id="userId" value="${sessionScope.userId}">
					<input type="hidden" name="positionsuggestNo" value="${param.positionsuggestNo}">
					<input type="hidden" name="userNo" value="${sessionScope.userNo}">
					
				<div class="col-lg-12">
					<span class="error"></span>
					<input type="text" name="positionsuggestTitle" id="positionsuggestTitle" 
						placeholder="제목을 입력하세요" maxlength="30" value="${map['POSITIONSUGGEST_TITLE']}">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="positionsuggestPosition" id="positionsuggestPosition" 
						placeholder="포지션을 입력하세요" value="${map['POSITIONSUGGEST_POSITION']}">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="number" name="positionsuggestPrice" id="positionsuggestPrice" 
						placeholder="연봉을 입력하세요" min="0" value="${map['POSITIONSUGGEST_PRICE']}">
				</div>
				<div class="col-lg-12">
					<span class="error"></span>
					<span id="contents" style="display: none;">${map['positionsuggestContents']}</span>
					<textarea name="positionsuggestContents" id="positionsuggestContents" placeholder="내용을 입력하세요"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('positionsuggestContents', {
							height : 300
						});
					</script>
					<button type="submit" class="site-btn" style="margin-top: 25px;">수정하기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="positionBottom.jsp"%>