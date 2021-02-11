<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/service.css'/>" />

<!-- 리뷰 보러가기 -->
<div class="instagram-photo" id="showReview" >
	<div class="container containDiv">
		<p style="font-size: 20px; color: white; padding-left: 10px;">멤버십 <span style="-webkit-text-emphasis-style: dot;">기간별</span> 혜택</p>
		<h3 style="color: white;">
			<i id="reviewIcon" class="fas fa-user-friends" style="padding-right: 20px;"></i> 
			worker들의 솔직 기업리뷰 열람권
		</h3>
	</div>
</div>
	
<!-- 본문 -->
<div class="container">
	<div class="membership_config_grid ">
		<h3 style="font-weight: bold;">멤버십</h3>
		<div class="membership_sec_desc">
			기업의 리뷰, 연봉, 면접후기를 확인하세요!
		</div>
	</div>


	<!-- Banner Section Begin -->
	<div class="banner-section spad" style="padding: 0;">
	    <div class="container-fluid">
	        <div class="row">
				<div class="col-lg-4">
					<div class="card_item">
						<button type="button" class="membership_card ">
							<div class="wrap">
								<div class="card_header">
									<div class="membership_card_title">
										<span class="title">7일</span>
									</div>
									<dl class="price_info clearfix">
										<dt class="hide">가격</dt>
										<dd class="price_by_month">3,900원</dd>
									</dl>
								</div>
								<a href="<c:url value='/shop/checkOut.do?paidserviceNo=2'/>">
									<div class="card_bottom">
										<span class="btn_membership_purple false">구매하기</span>
									</div>
								</a>
							</div>
						</button>
					</div>
				</div>
				<div class="col-lg-4">
	                <div class="card_item">
	                	<button type="button" class="membership_card ">
							<div class="wrap">
								<div class="card_header">
									<div class="membership_card_title">
										<span class="title">30일</span>
									</div>
									<dl class="price_info clearfix">
										<dt class="hide">가격</dt>
										<dd class="price_by_month">10,900원</dd>
									</dl>
								</div>
								<a href="<c:url value='/shop/checkOut.do?paidserviceNo=3'/>">
									<div class="card_bottom">
										<span class="btn_membership_purple false">구매하기</span>
									</div>
								</a>
							</div>
						</button>
	                </div>
	            </div>
	            <div class="col-lg-4">
					<div class="card_item">
						<button type="button" class="membership_card ">
							<div class="wrap">
								<div class="card_header">
									<div class="membership_card_title">
										<span class="title">90일</span><span
											class="membership_tag tag_red">BEST</span>
									</div>
									<dl class="price_info clearfix">
										<dt class="hide">가격</dt>
										<dd class="percent">-51%</dd>
										<dd class="price_by_month">월 5,330원</dd>
									</dl>
								</div>
								<div class="card_content">
									<dl class="price_info clearfix">
										<dt class="hide">원가</dt>
										<dd class="original_price">
											<del>32,700원</del>
										</dd>
										<dt class="hide">할인가</dt>
										<dd class="discount_price">총 16,000원</dd>
									</dl>
								</div>
								<a href="<c:url value='/shop/checkOut.do?paidserviceNo=4'/>">
									<div class="card_bottom">
										<span class="btn_membership_purple false">구매하기</span>
									</div>
								</a>
							</div>
						</button>
					</div>
				</div>
	        </div>
	    </div>
	</div>
	<div class="banner-section spad" style="padding: 0; margin-top: 30px;">
	    <div class="container-fluid">
	        <div class="row">
	            <div class="col-lg-4">
					<div class="card_item">
						<button type="button" class="membership_card ">
							<div class="wrap">
								<div class="card_header">
									<div class="membership_card_title">
										<span class="title">1년</span>
									</div>
									<dl class="price_info clearfix">
										<dt class="hide">가격</dt>
										<dd class="percent">-36%</dd>
										<dd class="price_by_month">월 3,500원</dd>
									</dl>
								</div>
								<div class="card_content">
									<dl class="price_info clearfix">
										<dt class="hide">원가</dt>
										<dd class="original_price">
											<del>65,400원</del>
										</dd>
										<dt class="hide">할인가</dt>
										<dd class="discount_price">총 41,900원</dd>
									</dl>
								</div>
								<a href="<c:url value='/shop/checkOut.do?paidserviceNo=5'/>">
									<div class="card_bottom">
										<span class="btn_membership_purple false">구매하기</span>
									</div>
								</a>
							</div>
						</button>
					</div>
				</div>
	            <div class="col-lg-4"></div>
	            <div class="col-lg-4"></div>
	        </div>
	    </div>
	</div>
	<!-- Banner Section End -->
</div>

<div class="membership_section sec_bg_darkgray">
	<div class="container containDiv">
		[이용 안내]<br>
		* 표시된 금액은 부가가치세(VAT) 포함 금액입니다.<br>
		* 결제 시 표기된 서비스 금액의 총 결제금액으로 결제됩니다. (예 : 90일 열람권 15,900원 결제)<br>
		* 구매 기간동안 무제한으로 콘텐츠 열람이 가능합니다.<br>
		* 이용 기간 중 PC, 모바일웹에서 이용 가능합니다. (단, 일부서비스는 PC에서만 가능)<br>
		* 구매 내역 및 정기권은 "My Account/마이페이지-유료 결제 내역"에서 확인할 수 있습니다.<br>
		* 콘텐츠 특성상 실사용 도중 해지 및 이에 따른 환불이 불가능합니다.<br>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>