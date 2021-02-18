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

.qaBt, .qaDelBt, .qaRpyBt {
    margin: 0 3px;
   	float: left;
   	padding: 11px 24px;
}

span#qaspan {
    display: block;
    float: left;
    margin: 30px 0 0 0;
}

input#userPassword {
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

		if ($('#userPassword').val()<1) {
			alert('비밀번호를 입력하세요');
			$('#userPassword').focus();
			event.preventDefault();
		} else{
			if (result) {
				$("form").attr("action","<c:url value='/qna/qnaDelete.do'/>")
			} else {
				alert('삭제 취소하였습니다');
				return false;
			}
		}
	});
	
	$('.qaBt').click(function(){
		var result = confirm('수정하시겠습니까?');
		var userPassword=$('#userPassword').val();

		if ($('#userPassword').val()<1) {
			alert('비밀번호를 입력하세요');
			$('#userPassword').focus();
			event.preventDefault();
		} else{
			if (result) {
		location.href='qnaUpdate.do?qaNo=${qaVo.qaNo}&userPassword='+userPassword;
			} else {
				alert('수정 취소하였습니다');
				return false;
			}
		}
		
	});
	
	$('.qaRpyBt').click(function(){
		var result = confirm('답변하시겠습니까?');
		
			if (result) {
				location.href="qnaReply.do?qaNo=${qaVo.qaNo}";
			} else {
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
			<form class="checkout-form" name="frm1" method="post">
					<input type="hidden" id="qaNo" name="qaNo" value="${qaVo.qaNo}">
					<input type="hidden" name="qaOrderno" value="${qaVo.qaOrderno}"/>
					<input type="hidden" name="qaGroupno" value="${qaVo.qaGroupno}"/>
					
					<input type="hidden" name="qaWriter" value="${sessionScope.userId }">
					
					<div class="place-order">
						<div class="order-total">
							<ul class="order-table">
								<li class="fw-normal">제목 <span>${qaVo.qaTitle }</span></li>
								<li class="fw-normal">작성일 
								<span><fmt:formatDate value="${qaVo.qaDate }" pattern="yyyy-MM-dd"/> </span></li>
								<li class="fw-normal">작성자 <span>${qaVo.qaWriter }</span></li>
							</ul>
							<div class="content">
								${qaVo.qaAbout }
							</div>
						</div>
					</div>
					<div class="group-input gi-check col-lg-12 pwWarp" style="clear: both;">
						<c:if test="${!empty sessionScope.userId && sessionScope.userNo != 999}">
							<div class="gi-more pwBox">
								<span id="qaspan">수정/삭제 시 비밀번호를 입력하세요 </span>
								<input type="text" id="userPassword" name="userPassword" placeholder="회원비밀번호를 입력하세요">
							</div>
						</c:if>
						<div class="order-btn faqBtWarp">
							<c:if test="${!empty sessionScope.userId && sessionScope.userNo != 999 }">
								<button type="button" class="site-btn place-btn qaBt">수정</button>
								<button type="submit" class="site-btn place-btn qaDelBt">삭제</button>
							</c:if>
							<c:if test="${sessionScope.userNo eq 999 }">
								<!-- 매니저 답변 달기 버튼 -->
								<button type="button" class="site-btn place-btn qaRpyBt">답변</button>
							</c:if>
						</div>
					</div>
			</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>