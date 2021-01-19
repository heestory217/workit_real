<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<style>
.fqst{
	padding-bottom: 15px;
}

input.faqBt.btn.btn-primary.site-btn {
    width: 30px;
    float: right;
}
</style>

<script type="text/javascript">
	
</script>
<!-- Register Section Begin -->
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

<div class="container">
    <form class="checkout-form" name="faqWrite" method="POST" 
    		action="<c:url value='/faq/faqWrite.do?managerNo=1'/>">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="row">
<!--                     <input type="hidden" id="managerNo" name="managerNo"> -->
                    <div class="col-lg-12">
                        <label for="faqTitle">제목<span>*</span></label>
                        <input type="text" id="faqTitle" name="faqTitle">
                    </div>
                    <div class="col-lg-12">
                    	<label for="faqAbout">글쓰기<span>*</span></label>
                    	<textarea class="content" id="faqAbout" name="faqAbout"></textarea><br><br>
						<script type="text/javascript">
							CKEDITOR.replace('faqAbout',
								{height : 400});
						</script>
                    </div>
                <div class="col-lg-12" style="clear: both;">
					<input type="button" value="목록" class="faqBt btn btn-primary site-btn"
	                    		onclick="location.href='<c:url value="/faq/faqList.do"/>'" />
	                <input type="submit" value="등록" class="faqBt btn btn-primary site-btn"/>
                </div>
                </div>
            </div>
        </div>
    </form>
</div>



<%@ include file="../inc/bottom.jsp"%>