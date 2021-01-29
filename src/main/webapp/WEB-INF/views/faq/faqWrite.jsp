<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<style>
.fqst {
	padding: 0;
}

input.faqBt.btn.btn-primary.site-btn {
	width: 30px;
	float: right;
}
</style>

<script type="text/javascript">
   $(function() {
      $('#faqTitle').focus();

      $('form[name=faqWrite]').submit(function() {
         if ($('#faqTitle').val().length < 1) {
            alert('제목을 입력하세요');
            $('#faqTitle').focus();
            event.preventDefault();
         } else if($('#faqAbout').val().length < 1) {
            write_go();
            event.preventDefault();
         }
      });
   });

   function write_go() {
      var ckeditor = CKEDITOR.instances['faqAbout'];
      if (ckeditor.getData() == "") {
         alert('내용을 입력 하세요');
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
					<a href="#"><i class="fa fa-home"></i> Home</a> 
					<span>고객센터 ></span>
					<span>FAQs ></span>
					<span>등록</span>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Register Section Begin -->
<div class="spad">
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
				<div class="register-login-section spad fqst">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 offset-lg-3">
								<div class="register-form">
									<h2>FAQ 등록</h2>
								</div>
							</div>
						</div>
					</div>
				</div>

				<form class="checkout-form" name="faqWrite" method="POST"
					action="<c:url value='/faq/faqWrite.do?managerNo=1'/>">
<!-- 					<input type="hidden" id="managerNo" name="managerNo" value="1"> -->
					<div class="col-lg-12">
						<label for="faqTitle">제목<span>*</span></label> 
						<input type="text" id="faqTitle" name="faqTitle">
					</div>
					<div class="col-lg-12">
						<label for="faqAbout">글쓰기<span>*</span></label>
						<textarea class="content" id="faqAbout" name="faqAbout"></textarea>
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
						<input type="submit" value="등록" id="submit_faq" class="faqBt btn btn-primary site-btn" />
					</div>
				</form>

			</div>
		</div>
	</div>
</div>





<%@ include file="../inc/bottom.jsp"%>