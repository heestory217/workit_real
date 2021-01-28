<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<style>

.faqtitle {
    padding: 0;
}

input.faqBt.btn.btn-primary.site-btn {
    width: 30px;
    float: right;
}
</style>

<script type="text/javascript">
	$(function(){
		$('form[name=faqUpdate]').submit(function(){
			var result = confirm('수정하시겠습니까?');
			
			if ($('#faqTitle').val().length<1) {
				alert('제목을 입력하세요');
				$('#faqTitle').focus();
				event.preventDefault();
			} else if($('#faqAbout').val().length<1){
				contentBox();
				event.preventDefault();
			}else if (result) {
				alert("수정되었습니다")
			} else{
				alert("취소되었습니다")
				event.preventDefault();
			}
		});
	});
	
	function contentBox(){
		var ckeditor = CKEDITOR.instances['faqAbout'];
		
		if (ckeditor.getData()=="") {
			alert('내용을 입력하세요');
			ckeditor.focus();
			return;
		} else {
			document.in_form.submit();
		}
	}
</script>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>FAQs</span>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Register Section Begin -->
<div class="spad fqst">
	<div class="container">
		<div class="row">
			<!-- nav -->
			<div
				class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
				<div class="filter-widget">
					<c:import url="/common/cusServiceNav.do"></c:import>
				</div>
			</div>
            
            <!-- 제목 -->
            <div class="col-lg-9 order-1 order-lg-2">
				<div class="container">
					<div class="register-form">
						<h2>Q&A수정</h2>
					</div>
				</div>

				<form class="checkout-form" name="faqUpdate" method="POST"
					action="<c:url value='/faq/faqUpdate.do'/>">
					<div class="col-lg-12">
						<label for="qaTitle">제목<span>*</span></label> <input type="text"
							id="qaTitle" name="qaTitle" value="${qaVo.qaTitle}"> 
						<input type="hidden" id="qaNo" name="qaNo" value="${qaVo.qaNo}">
					</div>
					<div class="col-lg-12">
						<label for="qaWriter">작성자<span>*</span></label> <input type="text"
							id="qaWriter" name="qaWriter" value="${qaVo.qaWriter}"> 
						<input type="hidden" id="qaNo" name="qaNo" value="${qaVo.qaNo}">
					</div>
					<div class="col-lg-12">
						<label for="faqAbout">글쓰기<span>*</span></label>
						<textarea class="content" id="qaAbout" name="qaAbout">${qaVo.qaAbout }</textarea>
						<br><br>
						<script type="text/javascript">
							CKEDITOR.replace('qaAbout',
							{height : 400});
						</script>
					</div>
					<div class="col-lg-12" style="clear: both;">
						<input type="button" value="목록"
							class="faqBt btn btn-primary site-btn"
							onclick="location.href='<c:url value="/qna/qnaList.do"/>'" /> 
						<input type="submit" value="등록" class="faqBt btn btn-primary site-btn faqsubBt" />
					</div>
				</form>

			</div>

		</div>
	</div>
</div>




<%@ include file="../inc/bottom.jsp"%>