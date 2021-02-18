<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="indivMypageMenu.jsp"%>

<form action="<c:url value='/indivMypage/indivMypageSituation.do?type=${param.type} '/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>

<div class="filter-widget">
	<h4 class="fw-title center">지원 현황</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="34%">
						<col width="33%">
						<col width="33%">
					</colgroup>
						<tr>
							<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=3'/>"><br><br>
								<h2 class="center textColorblue">${applyCount }</h2>
								<p class="center">심사중</p></a>
							</td>
							<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=1'/>"><br><br>
								<h2 class="center textColorblue">${passCount }</h2>
								<p class="center">서류 합격</p></a>
							</td>
							<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=2'/>"><br><br>
								<h2 class="center textColorblue">${failCount }</h2>
								<p class="center">불합격</p></a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="35%">
						<col width="20%">
						<col width="25%">
						<col width="20%">
					</colgroup>
						<thead>
                                <tr>
                                    <th>채용 공고</th>
                                    <th>고용 형태</th>
                                    <th>연봉</th>
                                    <th>지원 날짜</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
	                            	<tr>
	                            		<td colspan="4"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                                </c:if>
                                <c:if test="${!empty list }">
                                	<c:forEach var="vo" items="${list }">
										<tr>
											<td class="cart-title padding-bottom0"><br>
												<!-- 제목이 긴 경우 일부만 보여주기 -->
												<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${vo.recruitannounceNo }'/>"><p class="center">
												<c:if test="${fn:length(vo.recruitannounceTitle)>=18}">
													${fn:substring(vo.recruitannounceTitle, 0,18) } ...
												</c:if>
												<c:if test="${fn:length(vo.recruitannounceTitle)<18}">						
													${vo.recruitannounceTitle }
												</c:if>
												</p></a>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.recruitannounceSworkkind }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
													<fmt:formatNumber value="${vo.recruitannounceSpay }" pattern="#,###"></fmt:formatNumber>
												</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.applicantlistDate }"
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


<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%@ include file="../inc/bottom.jsp"%>