<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="indivMypageMenu.jsp"%>

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
						<col width="25%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
						<col width="20%">
					</colgroup>
						<thead>
                                <tr>
                                    <th>서비스명</th>
                                    <th>시작일</th>
                                    <th>마감일</th>
                                    <th>결제수단</th>
                                    <th>결제금액</th>
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
												<p class="center">${vo.paidserviceName }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.paidserviceStartdate }"
													pattern="yyyy-MM-dd"/></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.paidserviceEnddate }"
													pattern="yyyy-MM-dd"/></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.orderPaykind }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center"><fmt:formatNumber value="${vo.orderPay }" pattern="#,###">
													</fmt:formatNumber></p>
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
</section>


<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%@ include file="../inc/bottom.jsp"%>