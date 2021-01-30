<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- 주문완료 페이지 상단 -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">Shop</a>
                    <span>Payment Complete</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 주문완료 페이지 상단  끝-->


<!-- 제목 -->
<div class="section-title">
	<h2>주문완료</h2>
	<h3>주문과 결제가 정상적으로 완료되었습니다 [주문번호 : 32]</h3>
</div>
<!-- 제목 끝 -->

<!-- 본문 시작 -->
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
		                                <td class="cart-pic" style="padding: 14px 0;">
		                                 	<c:if test="${cartVo.userExperience==0}">
			                                	신입
			                                </c:if>
			                                <c:if test="${cartVo.userExperience!=0}">
			                                	${cartVo.userExperience}년
			                                </c:if>
			                            </td>
		                                <td class="p-price" style="padding: 14px 0;">
		                                	<fmt:formatNumber value="${cartVo.paidServicePrice}" pattern="#,###"/>원</td>
		                                	<c:set var="subTotalPrice" value="${subTotalPrice+cartVo.paidServicePrice}"/>
		                            </tr>
                            </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
               <!--  </form> -->
                </div>
			</div>
		</div>
	</div>
</section>
<!-- 본문 끝 -->
<%@ include file="../inc/bottom.jsp"%>