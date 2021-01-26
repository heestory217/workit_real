<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="indivMypageMenu.jsp"%>

<div class="filter-widget">
	<h4 class="fw-title center">포지션 제안</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="30%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
						<thead>
                                <tr>
                                    <th>제목</th>
                                    <th>제안포지션</th>
                                    <th>제안연봉</th>
                                    <th>제안날짜</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
	                            	<tr>
	                            		<td colspan="4"><br><br>
	                            			<p>제안받은 포지션이 없습니다.</p>
	                            		</td>
	                            	</tr>
                                </c:if>
                                <c:if test="${!empty list }">
                                	<c:forEach var="vo" items="${list }">
										<tr>
											<td class="cart-title padding-bottom0"><br>
												<a href="#"><p class="center">${vo.positionsuggestTitle }</p></a>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.positionsuggestPosition }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center"><fmt:formatNumber value="${vo.positionsuggestPrice }" pattern="#,###">
													</fmt:formatNumber></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
											<p class="center">
												<fmt:formatDate value="${vo.positionsuggestRegdate }"
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
</section>

<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%@ include file="../inc/bottom.jsp"%>