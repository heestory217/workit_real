<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivMypage.css'/>" />

<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a> <span>Mypage</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<h4 class="fw-title">마이페이지</h4>
						<ul class="filter-catagories">
							<li><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=3 '/>">지원현황</a></li>
							<li><a href="<c:url value='/indivMypage/indivBookmark.do '/>">북마크목록</a></li>
							<li><a href="<c:url value='/indivMypage/indivPayment.do '/>">결제내역</a></li>
							<li><a href="<c:url value='/indivMypage/indivPosition.do '/>">포지션제안</a></li>
							<li><a href="<c:url value='/indivMypage/indivMypageEdit.do '/>">회원정보수정</a></li>
							<c:if test="${sessionScope.user_corpcheck!=3}">
								<li><a href="<c:url value='/users/withdraw.do '/>">회원탈퇴</a></li>
                    		</c:if>
						</ul>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
