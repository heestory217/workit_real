<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="indivMypageMenu.jsp"%>

<form action="<c:url value='/indivMypage/indivPayment.do'/>" 
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
												<a href="#"><p class="center">
												<c:if test="${fn:length(vo.paidserviceName)>=10}">
													${fn:substring(vo.paidserviceName, 0,10) } ...
												</c:if>
												<c:if test="${fn:length(vo.paidserviceName)<10}">						
													${vo.paidserviceName }
												</c:if>
												</p></a>
												<%-- <p class="center">${vo.paidserviceName }</p> --%>
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


<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%@ include file="../inc/bottom.jsp"%>