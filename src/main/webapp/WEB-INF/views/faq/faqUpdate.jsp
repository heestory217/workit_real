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

			<div class="col-lg-9 order-1 order-lg-2">
				<div class="register-login-section faqtitle">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 offset-lg-3">
								<div class="register-form ">
									<h2>FAQ 수정</h2>
								</div>
							</div>
						</div>
					</div>
				</div>

				<form class="checkout-form" name="faqUpdate" method="POST"
					action="<c:url value='/faq/faqUpdate.do'/>">
					<div class="col-lg-12">
						<label for="faqTitle">제목<span>*</span></label> <input type="text"
							id="faqTitle" name="faqTitle" value="${faqVo.faqTitle}"> 
						<input type="hidden" id="faqNo" name="faqNo" value="${faqVo.faqNo}">
					</div>
					<div class="col-lg-12">
						<label for="faqAbout">글쓰기<span>*</span></label>
						<textarea class="content" id="faqAbout" name="faqAbout">${faqVo.faqAbout }</textarea>
						<br><br>
						<script type="text/javascript">
							CKEDITOR.replace('faqAbout',
							{height : 400});
						</script>
					</div>
					<div class="col-lg-12" style="clear: both;">
						<input type="button" value="목록"
							class="faqBt btn btn-primary site-btn"
							onclick="location.href='<c:url value="/faq/faqList.do"/>'" /> 
							<input type="submit" value="등록" class="faqBt btn btn-primary site-btn faqsubBt" />
					</div>
				</form>

			</div>

		</div>
	</div>
</div>




<%@ include file="../inc/bottom.jsp"%>