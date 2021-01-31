<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- 주문 페이지 상단 -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">Shop</a>
                    <span>Check Out</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 주문 페이지 상단 끝 -->

    <!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="#" class="checkout-form">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="place-order">
                        
                   			<!-- 제목 -->
							<div class="section-title" style="width: 100%">
								<h4>주문 (My Order)</h4>
							</div>
							<!-- 제목 끝 -->
                        
                            <div class="order-total">
                                <ul class="order-table">
                                    <li>구매 서비스<span>합  계</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$60.00</span></li>
                                    <li class="fw-normal">Combination x 1 <span>$120.00</span></li>
                                    <li class="fw-normal">주문금액 <span>$240.00</span></li>
                                   	<!-- 쿠폰적용금액은 총 결제금액에 표시해야 함 -->
                                    <li class="total-price">총 결제 금액 <span>$240.00</span></li>
                                </ul>
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">결   제</button>
                                </div>
                            </div>
                        </div><!-- place-order -->
                        <div class="checkout-content">
                            <input type="text" placeholder="쿠폰 코드를 입력하세요">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

<%@ include file="../inc/bottom.jsp"%>