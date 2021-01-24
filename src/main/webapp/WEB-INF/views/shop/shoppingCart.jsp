<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">Shop</a>
                    <span>Shopping Cart</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table">
                    <table>
                        <thead>
                            <tr>
                                <th>서비스종류</th>
                                <th class="p-name">유료상품이름</th>
                                <th>가격</th>
                                <!-- 
                                <th>Quantity</th>
                                <th>합계</th>
                                -->
                                <th><i class="ti-close"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="cart-pic first-row">서비스종류</td>
                                <td class="cart-title first-row">
                                  	유료상품이름
                                </td>
                                <td class="p-price first-row">$60.00</td>
                                <!-- 
                                <td class="qua-col first-row">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </div>
                                </td>
                                <td class="total-price first-row">$60.00</td>
                                 -->
                                <td class="close-td first-row"><i class="ti-close"></i></td>
                            </tr>
                            <tr>
                                <td class="cart-pic">서비스종류</td>
                                <td class="cart-title">
                                 	유료상품이름
                                </td>
                                <td class="p-price">$60.00</td>
                               <!--  
                                <td class="qua-col">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input type="text" value="1">
                                        </div>
                                    </div>
                                </td>
                                <td class="total-price">$60.00</td>
                                 -->
                                <td class="close-td"><i class="ti-close"></i></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="cart-buttons">
                            <a href="#" class="primary-btn continue-shop">계속 쇼핑하기</a>
                            <a href="#" class="primary-btn up-cart">장바구니 비우기</a>
                        </div>
                        <div class="discount-coupon">
                            <h6>Coupon Codes</h6>
                            <form action="#" class="coupon-form">
                                <input type="text" placeholder="쿠폰코드를 입력하세요">
                                <button type="submit" class="site-btn coupon-btn">적용</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout">
                            <ul>
                                <li class="subtotal">소계 <span>128,000 원</span></li>
                                <li class="cart-total">합계 <span>128,000 원</span></li>
                            </ul>
                            <a href="#" class="proceed-btn">결  제</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Shopping Cart Section End -->
   
<%@ include file="../inc/bottom.jsp"%>