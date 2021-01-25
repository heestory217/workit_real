<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(function(){
		$('.cart-table table tbody tr').find('i').click(function(){
			if(!confirm('해당 이력서를 장바구니에서 삭제하시겠습니까?')){
				event.preventDefault();
			}
		});

		$('#clearCart').click(function(){
			if(!confirm('장바구니를 비우시겠습니까?')){
				event.preventDefault();
			}
		});
	});
</script>

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
				<form name="frmCart" method="post" action="<c:url value='/shop/shoppingCart.do'/>">
					<input type="text" name="shoppingcartNo" value="0">
                    <table>
                   		<colgroup>
							<col style="width:15%;" />
							<col style="width:50%;" />
							<col style="width:25%;" />
							<col style="width:15%;" />
						</colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th class="p-name">구매 이력서 제목</th>
                                <th>가격</th>
                                <th><i class="ti-close"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:set var="k" value="0"></c:set>
                            <tr>
                                <td class="cart-pic first-row">${k+1}</td>
                                <td class="cart-title first-row">
                                  	구매 이력서 제목
                                </td>
                                <td class="p-price first-row">$60.00</td>
                                <td class="close-td first-row"><a href="<c:url value='/shop/deleteOne.do'/>"><i class="ti-close"></i></a></td>
                            </tr>
                            <tr>
                                <td class="cart-pic">${k+2}</td>
                                <td class="cart-title">
                                 	구매 이력서 제목
                                </td>
                                <td class="p-price">$60.00</td>
                                <td class="close-td"><a href="#"><i class="ti-close"></i></a></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="cart-buttons">
                            <a href="#" class="primary-btn continue-shop">계속 쇼핑하기</a>
                            <a href="<c:url value='/shop/clearCart.do'/>" class="primary-btn up-cart" id="clearCart">장바구니 비우기</a>
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