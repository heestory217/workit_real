<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../inc/top.jsp"%>

<!-- 포지션제안 페이지 상단 -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">HRM</a>
                    <span>Position Suggest</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 포지션제안 페이지 상단  끝-->

<!-- Blog Section Begin -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
				<div class="blog-sidebar">
					<div class="blog-catagory">
						<h4>분류</h4>
						<ul>
							<li><a href="<c:url value='/company/HRManagment/positionSuggest.do'/>">보낸 제안</a></li>
							<li><a href="<c:url value='/company/HRManagment/positionSuggest.do?type=format'/>">양식함</a></li>
						</ul>
						<hr>
						<!-- 버튼 시작 -->
						<div class="cart-buttons">
							<a href="<c:url value='/company/HRManagment/positionWrite.do'/>"class="primary-btn up-cart" style="width:47.6%;text-align: center;">제안 보내기</a>
							<a href="<c:url value='/company/HRManagment/positionWrite.do?type=format'/>" class="primary-btn continue-shop" style="width:47.6%;text-align: center;">양식 작성</a>
						</div>
						<!-- 버튼 끝 -->
					</div>
				</div>
			</div>
			
			<!-- 보낸 제안 목록 BEGIN -->
			<div class="col-lg-9 order-1 order-lg-2">
				<div class="row">
					<div class="col-lg-12">