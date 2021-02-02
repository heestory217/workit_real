<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
#paidServiceName {
	color: #4C50BB;
	display: inline;
	font-size: inherit;
}
</style>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
//결제
var IMP = window.IMP; 
IMP.init("imp52828174"); 

	$(function(){
		//로드될 때 처리
		var subtotal = $('#subtotal').html();
		var totalPrice = $('#totalPrice').html();
		$('#subtotal').html(numberWithCommas(subtotal));
		$('#totalPrice').html(numberWithCommas(totalPrice));
		$('#removeCoupon').css('display','none');
		
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
						var subtotal = removeComma($('#subtotal').html());	//콤마제거
						var discountAmount = subtotal*res/100;
						var totalPrice = subtotal-discountAmount;
						
						//콤마추가
						discountAmount = numberWithCommas(discountAmount);
						totalPrice = numberWithCommas(totalPrice);
						
						$('#discountAmount').html(discountAmount);
						$('#totalPrice').html(totalPrice);
						
						//percentage 추가 입력
						var str = "("+res+"%)";
						$('#percent').html(str);
					}
				},
				error:function(xhr, status, error){
					alert('해당 쿠폰이 존재하지 않습니다.\n쿠폰코드를 다시 확인해주세요.');
				}
			});	//ajax
			$('#removeCoupon').css('display','inline');
			event.preventDefault();
		});//submit
		
		$('#removeCoupon').click(function(){
			$.ajax({
				url:"<c:url value='/coupon/removeCoupon.do'/>",
				type:"GET",
				dataType:"json",
				success:function(res){
					//쿠폰적용취소하기
					if(res==0){
						var subtotal = removeComma($('#subtotal').html());	//콤마제거
						var discountAmount = 0;
						var totalPrice = subtotal;
						
						//콤마추가
						totalPrice = numberWithCommas(totalPrice);
						
						$('#percent').html('');
						$('#discountAmount').html(discountAmount);
						$('#totalPrice').html(totalPrice);
					}
				},
				error:function(xhr, status, error){
					alert('쿠폰 적용 취소 실패 error:'+error);
				}
			});	//ajax
			$('#couponName').val('');
			$('#removeCoupon').css('display','none');
			event.preventDefault();
		});//click
		
		//결제
		$('#pay').click(function(){
			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),	//필수
			    name : $('#paidServiceName').html(),
			    amount : removeComma($('#totalPrice').html()),	//필수
			    buyer_email : $('#buyer_email').html(),
			    buyer_name : $('#buyer_name').html(),	
			    buyer_tel : $('#buyer_tel').html(),	//필수
			}, function(rsp) {
				if ( rsp.success ) {
				    //결제완료 후 로직처리
				    $.ajax({
						url:"<c:url value='/shop/order.do'/>",
						type:"GET",
						data:{
							orderPaykind : 'card',
							couponName : $('#couponName').val(),
							orderDiscount : removeComma($('#discountAmount').html()),
							orderPay : removeComma($('#totalPrice').html()),
							paidServiceNo : $('#paidServiceNo').html(),
							corpreviewNo : $('#corpreviewNo').html(),
						},
						dataType:"json",
						success:function(res){
							//res 는 orderNo
							if(res>0){								
								//결제 완료 후 주문내역 페이지로 이동
							    alert('결제가 완료되었습니다.');
								location.href="<c:url value='/shop/paymentComplete.do?orderNo="+res+"'/>";	    			
							}
						},
						error:function(xhr, status, error){
							console.log("error="+error);
						}
					});	//ajax
			    } else {
			        var msg = '결제에 실패하였습니다.\n';
			        msg += rsp.error_msg;
				    alert(msg);
			    }
			});
		});	//click 결제
		
	});
	
	//숫자 (#,###) 표현 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//숫자 (#,###) 표현 제거 함수
	function removeComma(x){
		n = parseInt(x.replace(/,/g,""));
		return n;
	}

</script>

<!-- 결제처리를 위한 정보 : 확인하고 display none으로 바꾸기-->
<div style="display: none;">
	<p id="buyer_email">${userEmail}</p>
	<p id="buyer_name">${userName}</p>
	<p id="buyer_tel">${userHp}</p>
	<p id="paidServiceNo">${paidServVo.paidServiceNo}</p>
	<p id="corpreviewNo">${param.corpreviewNo}</p>
</div>

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
                        
                         	<c:if test="${empty cartList and empty param.corpreviewNo}">
	                            <div class="order-total" style="padding-bottom: 22px">
                                   <p style="text-align: center;margin: 0 0 0 0;">주문 요청 내역이 없습니다.</p>
	                            </div>
							</c:if>
							<c:if test="${!empty cartList or !empty param.corpreviewNo}">
	                            <div class="order-total">
	                            
	                                <!-- 가격 계산을 위한 변수 설정 -->
									<c:set var="subTotalPrice" value="0" />
									<c:set var="discount" value="0" />
									<c:set var="totalPrice" value="0" />
									
	                                <ul class="order-table">
	                                    <li>구매 서비스<span>합  계</span></li>
	                                    
											<c:if test="${!empty cartList}">
				                        		<c:forEach var="cartVo" items="${cartList}">
				                                    <li class="fw-normal" style="color: #4C50BB;">
					                        			<!-- 유료서비스 종료 파악을 위한 p -->
				                                    	[<p id="paidServiceName">${paidServVo.paidServiceName}</p>]  
				                                    		${cartVo.resumeTitle}
			                                    		<span style="margin-left: 5px;">원</span>
				                                    	<span>
				                                    		<fmt:formatNumber value="${paidServVo.paidServicePrice}" pattern="#,###"/>
				                                    	</span>
			                                    	</li>
				                               		<c:set var="subTotalPrice" value="${subTotalPrice+paidServVo.paidServicePrice}"/>
				                                </c:forEach>
			                                </c:if>
	                        			<!-- 기업 후기 삭제-->
											<c:if test="${!empty param.corpreviewNo}">
			                                    <li class="fw-normal" style="color: #4C50BB;">
			                                    	[<p id="paidServiceName">${paidServVo.paidServiceName}</p>]  
			                                    		${reviewVo.corpreviewOneline}
		                                    		<span style="margin-left: 5px;">원</span>
			                                    	<span>
			                                    		<fmt:formatNumber value="${paidServVo.paidServicePrice}" pattern="#,###"/>
			                                    	</span>
		                                    	</li>
			                               		<c:set var="subTotalPrice" value="${subTotalPrice+paidServVo.paidServicePrice}"/>
	                                    	</c:if>
		                                
	                                    <li class="fw-normal" style="margin-top:50px;">주문금액 
	                                    	<span style="margin-left: 5px;">원</span>
	                                    	<span id="subtotal">${subTotalPrice}</span>
                                    	</li>
	                                    <li class="fw-normal">할인금액 
	                                        <div style="display: contents;" id="percent"></div>
		                                	<div style="display: contents;">
		                                		<a href="#" id="removeCoupon" class="btn btn-link btn-sm" style="color: red;">취소</a>
		                                	</div>
		                                	<span style="margin-left: 5px;">원</span>
	                                    	<span id="discountAmount">${discount}</span>
                                    	</li>
	                                    <li class="total-price">총 결제 금액 
	                                    	<span style="margin-left: 5px;">원</span>
	                                    	<span id="totalPrice">${subTotalPrice - discount}</span>
                                    	</li>
	                                </ul>
	                                <div class="order-btn">
	                                    <a href="#" id="pay" class="site-btn place-btn">결   제</a>
	                                </div>
                           		</div><!-- order-total -->
	                        </c:if>
                        </div><!-- place-order -->
                    </div>
                </div>
            </form>
            
            <div class="row">
	            <div class="col-lg-4">
	                 <div class="discount-coupon" style="margin-top: 30px;">
	                     <h6>Coupon Codes</h6>
	                     <form name="couponFrm" action="#" class="coupon-form">
	                         <input type="text" id="couponName" placeholder="쿠폰코드를 입력하세요" maxlength="20"
	                         	<c:if test="${!empty param.couponName}">
	                         		value="${param.couponName}"
	                         	</c:if>
	                         >
	                       <!-- 쿠폰이름 그 전에 설정한거 있으면 자동세팅 -->
                         	<c:if test="${!empty param.couponName}">
	                         	<script type="text/javascript">
									$(function(){
										$("#couponSubmit").trigger("click");
									});
								</script>
                         	</c:if>
	                         <button type="submit" class="site-btn coupon-btn" id="couponSubmit">적용</button>
	                     </form>
	                 </div>
	             </div>
            </div>
            
        </div>
    </section>
    <!-- Shopping Cart Section End -->

<%@ include file="../inc/bottom.jsp"%>