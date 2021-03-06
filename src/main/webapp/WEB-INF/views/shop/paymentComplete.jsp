<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
	.row i{
		margin: 0 10px;
	}
</style>

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

<section class="blog-section spad">
	<div class="container">
		<div class="row">
			

			<!-- 제목 -->
			<div class="section-title" style="width: 100%">
				<h2>주문완료</h2>
				<h5 style="color: #4C50BB;">주문과 결제가 정상적으로 완료되었습니다 [주문번호 : ${param.orderNo}]</h5>
			</div>
			<!-- 제목 끝 -->

			<h4><i class="far fa-list-alt"></i>주문 상세내역</h4>
			
			<!-- 본문 시작 -->
			<section class="shopping-cart spad" style="width: 100%; padding:25px 0 10px 0;">
			    <div class="container">
			        <div class="row">
			            <div class="col-lg-12">
			                <div class="cart-table">
			                    <table>
			                   		<colgroup>
			                   			<c:if test="${!empty list and empty ReviewMap and empty AdMap and empty SeeMap}">
											<col style="width:10%;" />
											<col style="width:30%;" />
											<col style="width:15%;" />
											<col style="width:15%;" />
											<col style="width:20%;" />
											<col style="width:10%;" />
			                   			</c:if>
			                   			<c:if test="${!empty ReviewMap or !empty AdMap}">
											<col style="width:20%;" />
											<col style="width:60%;" />
											<col style="width:20%;" />
			                   			</c:if>
			                   			<c:if test="${!empty SeeMap}">
											<col style="width:25%;" />
											<col style="width:25%;" />
											<col style="width:25%;" />
											<col style="width:25%;" />
			                   			</c:if>
									</colgroup>
			                        <thead>
			                            <tr>
				                   			<c:if test="${!empty list and empty ReviewMap and empty AdMap and empty SeeMap}">
				                                <th scope="col">이름</th>
				                                <th scope="col" class="p-name">이력서 제목</th>
				                                <th scope="col">직무</th>
				                                <th scope="col">경력</th>
				                                <th scope="col">가격</th>
			                                </c:if>
				                   			<c:if test="${!empty ReviewMap}">
				                                <th scope="col">서비스명</th>
				                                <th scope="col">후기 한줄평</th>
				                                <th scope="col">가격</th>
				                   			</c:if>
				                   			<c:if test="${!empty AdMap}">
				                                <th scope="col">서비스명</th>
				                                <th scope="col">채용공고 제목</th>
				                                <th scope="col">가격</th>
				                   			</c:if>
				                   			<c:if test="${!empty SeeMap}">
				                                <th scope="col">서비스명</th>
				                                <th scope="col">서비스 시작일</th>
				                                <th scope="col">서비스 종료일</th>
				                                <th scope="col">가격</th>
				                   			</c:if>
			                            </tr>
			                        </thead>
			                        <tbody>
                                       	<!-- 가격 계산을 위한 변수 설정 -->
										<c:set var="subTotalPrice" value="0" />
										<c:set var="discount" value="0" />
										<c:set var="totalPrice" value="0" />
										
				                        <c:if test="${empty list and empty ReviewMap and empty AdMap and empty SeeMap}">
											<tr>
												<td colspan="6" style="padding: 14px 0;">장바구니 내역이 없습니다.</td>
											</tr>
										</c:if>
										
										<c:if test="${!empty list and empty ReviewMap and empty AdMap and empty SeeMap}">
			                        		<c:forEach var="map" items="${list}">
					                            <tr>
					                                <td class="p-price" style="padding: 14px 0;">${map['USER_NAME']}</td>
					                                <td class="cart-title" style="padding: 14px 0;">${map['RESUME_TITLE']}</td>
					                                <td class="cart-pic" style="padding: 14px 0;">${map['WORKKIND_NAME']}</td>
					                                <td class="cart-pic" style="padding: 14px 0;">
					                                 	<c:if test="${map['USER_EXPERIENCE']==0}">
						                                	신입
						                                </c:if>
					                                 	<c:if test="${map['USER_EXPERIENCE']!=0}">
						                                	${map['USER_EXPERIENCE']}년
						                                </c:if>
						                            </td>
				                                	<td class="p-price" style="padding: 14px 0;">
					                                	<fmt:formatNumber value="${map['PAIDSERVICE_PRICE']}" pattern="#,###"/>원
					                                	<c:set var="subTotalPrice" value="${subTotalPrice + map['PAIDSERVICE_PRICE']}"/>
	                                				</td>
					                            </tr>
			                            	</c:forEach>
			                            </c:if>
			                            
										<c:if test="${!empty ReviewMap}">
				                            <tr>
				                                <td class="p-price" style="padding: 14px 0;">${ReviewMap['PAIDSERVICE_NAME']}</td>
				                                <td style="padding: 14px 0;font-weight: unset;color:black;">${ReviewMap['CORPREVIEW_ONELINE']}</td>
			                                	<td class="p-price" style="padding: 14px 0;">
				                                	<fmt:formatNumber value="${ReviewMap['PAIDSERVICE_PRICE']}" pattern="#,###"/>원
				                                	<c:set var="subTotalPrice" value="${subTotalPrice + ReviewMap['PAIDSERVICE_PRICE']}"/>
                                				</td>
				                            </tr>
			                            </c:if>
			                            
										<c:if test="${!empty AdMap}">
				                            <tr>
				                                <td class="p-price" style="padding: 14px 0;">${AdMap['PAIDSERVICE_NAME']}</td>
				                                <td style="padding: 14px 0;font-weight: unset;color:black;">${AdMap['RECRUITANNOUNCE_TITLE']}</td>
			                                	<td class="p-price" style="padding: 14px 0;">
				                                	<fmt:formatNumber value="${AdMap['PAIDSERVICE_PRICE']}" pattern="#,###"/>원
				                                	<c:set var="subTotalPrice" value="${subTotalPrice + AdMap['PAIDSERVICE_PRICE']}"/>
                                				</td>
				                            </tr>
			                            </c:if>
			                            
										<c:if test="${!empty SeeMap}">
				                            <tr>
				                                <td class="p-price" style="padding: 14px 0;">${SeeMap['PAIDSERVICE_NAME']}</td>
				                                <td style="padding: 14px 0;font-weight: unset;color:black;">
				                                	<fmt:formatDate value="${SeeMap['PAIDSERVICE_STARTDATE']}" type="both"/>
				                                </td>
				                                <td style="padding: 14px 0;font-weight: unset;color:black;">
				                                	<fmt:formatDate value="${SeeMap['PAIDSERVICE_ENDDATE']}" type="both"/>
			                                	</td>
			                                	<td class="p-price" style="padding: 14px 0;">
				                                	<fmt:formatNumber value="${SeeMap['PAIDSERVICE_PRICE']}" pattern="#,###"/>원
				                                	<c:set var="subTotalPrice" value="${subTotalPrice + SeeMap['PAIDSERVICE_PRICE']}"/>
                                				</td>
				                            </tr>
			                            </c:if>
			                            
			                        </tbody>
			                    </table>
			               <!--  </form> -->
			                </div>
						</div>
					</div>
				</div>
			</section>
			
			<!-- 결제 정보 -->
			<h4><i class="far fa-credit-card"></i>결제 정보</h4>
			
			<section class="shopping-cart spad" style="width: 100%; padding:25px 0 10px 0;">
			    <div class="container">
			        <div class="row">
			            <div class="col-lg-12">
			                <div class="cart-table">
			                    <table>
			                   		<colgroup>
										<col style="width:25%;" />
										<col style="width:75%;" />
									</colgroup>
			                        <tbody>
											<tr>
												<td class="cart-title" style="padding: 14px 0 14px 5%;">결제수단</td>
												<td class="cart-title" style="padding: 14px 0;">
													<c:if test="${ordersVo.orderPaykind =='card'}">
														카드
													</c:if>
												</td>
											</tr>			                        
											<tr>
												<td class="cart-title" style="padding: 14px 0 14px 5%;">주문금액</td>
												<td class="cart-title" style="padding: 14px 0;">
													<fmt:formatNumber value="${subTotalPrice}" pattern="#,###"/>원
												</td>
											</tr>			                        
											<tr>
												<td class="cart-title" style="padding: 14px 0 14px 5%;">할인금액</td>
												<td class="cart-title" style="padding: 14px 0;">
													<fmt:formatNumber value="${ordersVo.orderDiscount}" pattern="#,###"/>원
												</td>
											</tr>			                        
											<tr>
												<td class="cart-title" style="padding: 14px 0 14px 5%;font-weight: bold;">총 결제금액</td>
												<td class="cart-title" style="padding: 14px 0;font-weight: bold;">
													<fmt:formatNumber value="${ordersVo.orderPay}" pattern="#,###"/>원
												</td>
											</tr>			                        
									</tbody>
			                    </table>
			               <!--  </form> -->
			                </div>
						</div>
					</div>
				</div>
			</section>
			
		</div>
	</div>
</section>
<!-- 본문 끝 -->
<%@ include file="../inc/bottom.jsp"%>