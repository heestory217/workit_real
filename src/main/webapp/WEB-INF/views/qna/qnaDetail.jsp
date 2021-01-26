<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
.fqst {
	padding: 0;
}

.faqBtWarp{
   	float: right;
   	margin-top: 20px;
}

.qaBt, .qaDelBt {
    margin: 0 3px;
   	float: left;
}

span#qaspan {
    display: block;
    float: left;
    margin: 30px 0 0 0;
}

input#qaPassword {
    width: 240px;
    float: left;
    margin: 25px 0 0px 10px;
    height: 33px;
}
</style>

<script type="text/javascript">

$(function(){
	$('.qaDelBt').click(function(){
		var result = confirm('삭제하시겠습니까?');

		if ($('#qaPassword').val()<1) {
			alert('비밀번호를 입력하세요');
			$('#qaPassword').focus();
			event.preventDefault();
		} else{
			if (result) {
				alert('선택한 글을 삭제하였습니다');
				location.href='<c:url value="/qna/qnaDelete.do?qaNo=${qaVo.qaNo }"/>';
			} else {
				alert('삭제 취소하였습니다');
				return false;
			}
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
					<c:import url="/common/cusServiceNav.do"></c:import>
				</div>
			</div>
            
            <!-- 제목 -->
            <div class="col-lg-9 order-1 order-lg-2">
				<div class="container">
					<div class="register-form">
						<h2>Q&A상세정보</h2>
					</div>
				</div>
				
			<!-- content -->
			<form class="checkout-form" action="<c:url value='/qna/qnaUpdate.do'/>" >
					<input type="hidden" id="qaNo" name="qaNo" value="${qaVo.qaNo}">
					<input type="hidden" name="userNo" value="${qaVo.userNo }">
<%-- 					<input type="hidden" name="qaWriter" value="${sessionScope.userId }"> --%>
					<div class="place-order">
						<div class="order-total">
							<ul class="order-table">
								<li class="fw-normal">제목 <span>${qaVo.qaTitle }</span></li>
								<li class="fw-normal">작성일 
								<span><fmt:formatDate value="${qaVo.qaDate }" pattern="yyyy-MM-dd"/> </span></li>
							</ul>
							<div class="content">
								${qaVo.qaAbout }
							</div>
						</div>
					</div>
					<div class="group-input gi-check col-lg-12 pwWarp" style="clear: both;">
						<div class="gi-more pwBox">
							<span id="qaspan">수정/삭제 시 비밀번호를 입력하세요 </span>
							<input type="password" id="qaPassword" 
								name="qaPassword" placeholder="회원비밀번호를 입력하세요">
						</div>
						<div class="order-btn faqBtWarp">
							<button type="submit" class="site-btn place-btn qaBt">수정</button>
							<button type="button" class="site-btn place-btn qaDelBt">삭제</button>
						</div>
					</div>
					
			</form>
				
			</div>
			
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>