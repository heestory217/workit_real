<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="indivMypageMenu.jsp"%>

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
						<!-- <tr>
							<td><br>
								<h5 class="center">지원 현황</h5>
							</td><td></td><td></td>
						</tr> -->
						<tr>
							<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=3'/>"><br><br>
								<h2 class="center">${applyCount }</h2>
								<p class="center">지원 완료</p></a>
							</td>
							<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=1'/>"><br><br>
								<h2 class="center">${passCount }</h2>
								<p class="center">서류 합격</p></a>
							</td>
							<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=2'/>"><br><br>
								<h2 class="center">${failCount }</h2>
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
												<p class="center">${vo.recruitannounceTitle }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.recruitannounceSworkkind }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.recruitannounceSpay }</p>
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
</section>


<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%@ include file="../inc/bottom.jsp"%>