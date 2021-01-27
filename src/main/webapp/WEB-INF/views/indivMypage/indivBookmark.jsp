<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="indivMypageMenu.jsp"%>

<form action="<c:url value='/indivMypage/indivBookmark.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>

<div class="filter-widget">
	<h4 class="fw-title center">채용 공고 북마크</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="30%">
						<col width="13%">
						<col width="13%">
						<col width="15%">
						<col width="10%">
						<col width="12%">
						<col width="7%">
					</colgroup>
						<thead>
                                <tr>
                                    <th>채용 공고</th>
                                    <th>시작일</th>
                                    <th>마감일</th>
                                    <th>경력</th>
                                    <th>분야</th>
                                    <th>연봉</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
	                            	<tr>
	                            		<td colspan="7"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                                </c:if>
                                <c:if test="${!empty list }">
                                	<c:forEach var="vo" items="${list }">
										<tr>
											<td class="cart-title padding-bottom0"><br>
												<!-- 제목이 긴 경우 일부만 보여주기 -->
												<a href="#"><p class="center">
												<c:if test="${fn:length(vo.recruitannounceTitle)>=15}">
													${fn:substring(vo.recruitannounceTitle, 0,15) } ...
												</c:if>
												<c:if test="${fn:length(vo.recruitannounceTitle)<15}">						
													${vo.recruitannounceTitle }
												</c:if>
												</p></a>
												<%-- <a href="#"><p class="center">${vo.recruitannounceTitle }</p></a> --%>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.recruitannounceStartdate }"
													pattern="yyyy-MM-dd"/></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.recruitannounceEnddate }"
													pattern="yyyy-MM-dd"/></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.recruitannounceScarrer }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.recruitannounceSworkkind }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${vo.recruitannounceSpay }</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<a href="<c:url value='/indivMypage/indivBookmarkDelete.do?no=${vo.recruitannouncebookmarkNo } '/>"
													onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">
													<p class="center"><i class="ti-close"></i></p></a>
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