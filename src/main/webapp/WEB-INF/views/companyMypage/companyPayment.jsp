<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="companyMypageMenu.jsp"%>

<form action="<c:url value='/companyMypage/companyPayment.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>

<div class="filter-widget">
	<h4 class="fw-title center">결제 내역</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="15%">
						<col width="25%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
						<thead>
                                <tr>
                                	<th>주문번호/<br>결제페이지</th>
                                    <th>결제상품종류</th>
                                    <th>결제금액</th>
                                    <th>결제수단</th>
                                    <th>결제일</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
	                            	<tr>
	                            		<td colspan="5"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                                </c:if>
                                <c:if test="${!empty list }">
                                	<c:forEach var="vo" items="${list }">
										<tr>
											<td class="cart-title padding-bottom0"><br>
												<p class="center"><a href="<c:url value='/shop/paymentComplete.do?orderNo=${vo.orderNo}'/>" class="or-login">${vo.orderNo }</a>
												</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.payName }
												</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center"><fmt:formatNumber value="${vo.orderPay }" pattern="#,###">
													</fmt:formatNumber></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.orderPaykind }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.orderDate }"
													pattern="yyyy-MM-dd"/></p>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 페이징 처리 -->
				<div class="paging col-lg-12 center">
				<!-- 이전블럭 -->	
				 <div class="product__pagination blog__pagination">
				 	<c:if test="${pagingInfo.firstPage>1 }">	
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<i class="fa fa-long-arrow-left"></i>
						</a>
					</c:if>
					
					<!-- 블럭 -->
					<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage }">
							<span id="currentPage" >
								${i}</span>			
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">
								${i}</a>			
						</c:if>
					</c:forEach>
					
					<!-- 다음블럭 -->	
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
							<i class="fa fa-long-arrow-right"></i>
						</a>
					</c:if>
				    </div>
				</div>
</section>

</div></div></div></section>
<!-- Menu include 한것 닫는 태그 -->

<%@ include file="../inc/bottom.jsp"%>