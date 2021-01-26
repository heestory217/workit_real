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
		
		//쿠폰 적용 
		$('form[name=couponFrm]').submit(function(){
			$.ajax({
				url:"<c:url value='/coupon/couponApply.do'/>",
				type:"GET",
				data:{
					couponName : $('#couponName').val()
				},
				dataType:"json",
				success:function(res){
					//성공하면 할인률 입력
					if(res!=0){
						$('#rate').html(res);
					}
				},
				error:function(xhr, status, error){
					alert('해당 쿠폰이 존재하지 않습니다.\n쿠폰번호를 다시 확인해주세요.');
				}
			});	//ajax
			
			event.preventDefault();
		});//click
	});
</script>

<!-- 장바구니 상단 -->
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
<!-- 장바구니 상단 끝 -->

<!-- 장바구니 본문 -->
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="cart-table">
				<%-- <form name="frmCart" method="post" action="<c:url value='/shop/shoppingCart.do'/>"> --%>
                    <table>
                   		<colgroup>
							<col style="width:10%;" />
							<col style="width:30%;" />
							<col style="width:15%;" />
							<col style="width:15%;" />
							<col style="width:20%;" />
							<col style="width:10%;" />
						</colgroup>
                        <thead>
                            <tr>
                                <th>이름</th>
                                <th class="p-name">이력서 제목</th>
                                <th>직무</th>
                                <th>경력</th>
                                <th>가격</th>
                                <th><i class="ti-close"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                        	<!-- 가격 계산을 위한 변수 설정 -->
							<c:set var="subTotalPrice" value="0" />
							<c:set var="discount" value="0" />
							<c:set var="totalPrice" value="0" />
							
	                        <c:if test="${empty cartList}">
								<tr>
									<td colspan="6" style="padding: 14px 0;">장바구니 내역이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty cartList}">
                        		<c:forEach var="cartVo" items="${cartList}">
									<%-- <input type="text" name="shoppingcartNo" value="${cartVo.shoppingCartNo}"> --%>
		                            <tr>
		                                <td class="p-price" style="padding: 14px 0;">${cartVo.userName}</td>
		                                <td class="cart-title" style="padding: 14px 0;">${cartVo.resumeTitle}</td>
		                                <td class="cart-pic" style="padding: 14px 0;">${cartVo.workkindName}</td>
		                                <td class="cart-pic" style="padding: 14px 0;">${cartVo.userExperience}년</td>
		                                <td class="p-price" style="padding: 14px 0;">
		                                	<fmt:formatNumber value="${cartVo.paidServicePrice}" pattern="#,###"/>원</td>
		                                	<c:set var="subTotalPrice" value="${subTotalPrice+cartVo.paidServicePrice}"/>
		                                <td class="close-td" style="padding: 14px;">
		                                	<a href="<c:url value='/shop/deleteOne.do?shoppingCartNo=${cartVo.shoppingCartNo}'/>">
		                                		<i class="ti-close"></i>
	                                		</a>
                                		</td>
		                            </tr>
                            </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
               <!--  </form> -->
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="cart-buttons">
                            <a href="#" class="primary-btn continue-shop">계속 쇼핑하기</a>
                            <a href="<c:url value='/shop/clearCart.do'/>" class="primary-btn up-cart" id="clearCart">장바구니 비우기</a>
                        </div>
                        <div class="discount-coupon">
                            <h6>Coupon Codes</h6>
                            <form name="couponFrm" action="#" class="coupon-form">
                                <input type="text" id="couponName" placeholder="쿠폰코드를 입력하세요" maxlength="20">
                                <button type="submit" class="site-btn coupon-btn">적용</button>
                            </form>
                        </div>
                    </div>
                    
               		<div id="rate"> <!-- 할인율 자리 --></div>
                    <c:set var="discount" value="${subTotalPrice*(dcRate/100)}"/>
                    <c:set var="totalPrice" value="${subTotalPrice-discount}" />
                    
                     
                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout">
                            <ul>
                                <li class="subtotal">주문금액 <span><fmt:formatNumber value="${subTotalPrice}" pattern="#,###"/> 원</span></li>
                                <li class="subtotal" style="padding-top: 14px;" id="discountAmount">할인금액 
                                	<span><fmt:formatNumber value="${discount}" pattern="#,###"/> 원</span>
                               	</li>
                                <li class="cart-total">총 결제금액 <span><fmt:formatNumber value="${totalPrice}" pattern="#,###"/> 원</span></li>
                            </ul>
                            <a href="#" class="proceed-btn">결  제</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 장바구니 본문 끝 -->
   
<%@ include file="../inc/bottom.jsp"%>