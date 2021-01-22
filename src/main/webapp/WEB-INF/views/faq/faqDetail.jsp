<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
.fqst {
	padding: 0;
}

.faqBtWarp{
   	float: right;
}

.faqBt, .faqDelBt {
    margin: 30px 3px;
   	float: left;
}
</style>

<script type="text/javascript">

$(function(){
	$('.faqDelBt').click(function(){
		var result = confirm('삭제하시겠습니까?');
		
		if (result) {
			alert('선택한 글을 삭제하였습니다');
			location.href='<c:url value="/faq/faqDelete.do?faqNo=${faqVo.faqNo }"/>';
		} else {
			alert('삭제 취소하였습니다');
			return false;
		}
	});
});

</script>

<!-- Register Section Begin -->
<div class="spad">
	<div class="container">
		<div class="row">
			<!-- nav -->
			<div
				class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
				<div class="filter-widget">
					<c:import url="/faq/faqNav.do"></c:import>
				</div>
			</div>
			
			<div class="col-lg-9 order-1 order-lg-2">
				<div class="register-login-section spad fqst">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 offset-lg-3">
								<div class="register-form">
									<h2>FAQ 상세보기</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			<form class="checkout-form" action="<c:url value='/faq/faqUpdate.do'/>" >
					<input type="hidden" id="faqNo" name="faqNo" value="${faqVo.faqNo}">
					<div class="place-order">
						<div class="order-total">
							<ul class="order-table">
								<li class="fw-normal">제목 <span>${faqVo.faqTitle }</span></li>
								<li class="fw-normal">작성일 
								<span><fmt:formatDate value="${faqVo.faqDate }" pattern="yyyy-MM-dd"/> </span></li>
							</ul>
							<div class="content">
								${faqVo.faqAbout }
							</div>
						</div>
					</div>
					<div class="order-btn faqBtWarp">
						<button type="submit" class="site-btn place-btn faqBt">수정</button>
						<button type="button" class="site-btn place-btn faqDelBt">삭제</button>
					</div>
			</form>
				
			</div>
			
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>