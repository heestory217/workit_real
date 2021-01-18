<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>MessageBox</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section End -->

<script type="text/javascript">
$(function() {
	$('.blog-catagory ul li a').click(function(){
		$('.section-title h2').text(($(this).text()));
	});
});
</script>

<!-- 제목 -->
<div class="product-tab">
	<div class="section-title">
		<h2>쪽지함</h2>
	</div>
</div>
<!-- 제목 끝 -->

<!-- Blog Section Begin -->
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
				<div class="blog-sidebar">
					<div class="blog-catagory">
						<h4>분류</h4>
						<ul>
							<li><a href="<c:url value='/message/messageBox.do'/>">받은쪽지함</a></li>
							<li><a href="<c:url value='/message/messageBoxSend.do'/>">보낸쪽지함</a></li>
							<li><a href="#">나에게 쓴 쪽지함</a></li>
							<li><a href="#">쪽지보관함</a></li>
						</ul>
						<hr>
						<!-- 버튼 시작 -->
						<div class="cart-buttons">
							<a href="<c:url value='/message/messageWrite.do'/>"class="primary-btn up-cart" style="width:47.6%;text-align: center;">쪽지 쓰기</a>
							<a href="<c:url value='/message/messageWrite.do?type=toMe'/>" class="primary-btn continue-shop" style="width:47.6%;text-align: center;">내게 쓰기</a>
						</div>
						<!-- 버튼 끝 -->
					</div>
				</div>
			</div>
			
			<!-- 쪽지 목록 BEGIN -->
			<div class="col-lg-9 order-1 order-lg-2">
				<div class="row">
					<div class="col-lg-12">