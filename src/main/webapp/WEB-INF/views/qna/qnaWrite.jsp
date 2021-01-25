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
      $('#qaTitle').focus();

      $('form[name=qnaWrite]').submit(function() {
         if ($('#qaTitle').val().length < 1) {
            alert('제목을 입력하세요');
            $('#qaTitle').focus();
            event.preventDefault();
         } else if($('#qaAbout').val().length < 1) {
            write_go();
            event.preventDefault();
         }
      });
   });

   function write_go() {
      var ckeditor = CKEDITOR.instances['qaAbout'];
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
					<span>Q&A ></span>
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
				<div class="container">
					<div class="register-form">
						<h2>Q&A 등록</h2>
					</div>
				</div>

				<form class="checkout-form" name="qnaWrite" method="POST"
					action="<c:url value='/qna/qnaWrite.do'/>">
					<input type="hidden" name="qaWriteno" value="${sessionScope.userNo }">
					<input type="hidden" name="qaWriter" value="${sessionScope.userId }">
					<div class="col-lg-12">
						<label for="qaTitle">제목<span>*</span></label> 
						<input type="text" id="qaTitle" name="qaTitle">
					</div>
					<div class="col-lg-12">
						<label for="qaAbout">글쓰기<span>*</span></label>
						<textarea class="content" id="qaAbout" name="qaAbout"></textarea>
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
						<input type="submit" value="등록" id="submit_qna" class="faqBt btn btn-primary site-btn" />
					</div>
				</form>

			</div>
		</div>
	</div>
</div>





<%@ include file="../inc/bottom.jsp"%>