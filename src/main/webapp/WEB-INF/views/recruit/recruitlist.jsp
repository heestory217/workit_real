<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivMypage.css'/>" />

<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<form action="<c:url value='/recruit/recruitlist.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>
<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/workit/index.do"><i class="fa fa-home"></i> Home</a> <span>RecruitannounceList</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->
<div class="filter-widget">
	<h4 class="fw-title center" style="margin-top: 30px;">채용 공고 목록</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="10%">
						<col width="35%">
						<col width="13%">
						<col width="13%">
						<col width="15%">
						<col width="13%">
					</colgroup>
						<thead>
                                <tr>
                                	<th>분류</th>
                                	<th>공고명</th>
                                    <th>마감일</th>
                                    <th>광고상품/승인여부</th>
                                    <th>광고마감일</th>
                                    <th>광고신청/수정</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:if test="${empty list }">
	                            	<tr>
	                            		<td colspan="6"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                                </c:if>
                                <c:if test="${!empty list }">
                                	<c:forEach var="vo" items="${list }">
										<tr>
											<td style="padding-top: 10px; padding-bottom: 10px;">
												<c:if test="${vo.recruitannounceUpcheck==1 }">
													<button type="button" class="btn btn-outline-warning btn-sm" style="cursor: Default;">
														심사중
													</button>
												</c:if>
												<c:if test="${vo.recruitannounceUpcheck==3 }">
													<button type="button" class="btn btn-outline-danger btn-sm" style="cursor: Default;">
														반려
													</button>
												</c:if>
												<c:if test="${vo.recruitannounceUpcheck==2 }">
													<button type="button" class="btn btn-outline-success btn-sm" style="cursor: Default;">
														통과
													</button>
												</c:if>
												<c:if test="${vo.recruitannounceUpcheck==4 }">
													<button type="button" class="btn btn-outline-warning btn-sm" style="cursor: Default;">
														수정중
													</button>
												</c:if>
											</td>
											<td class="cart-title padding-bottom0">
												<p class="center">
												<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${vo.recruitannounceNo}'/>" class="or-login">
												<c:if test="${fn:length(vo.recruitannounceTitle)>=25}">
													${fn:substring(vo.recruitannounceTitle, 0,25) } ...
												</c:if>
												<c:if test="${fn:length(vo.recruitannounceTitle)<25}">						
													${vo.recruitannounceTitle }
												</c:if>
												</a>
												
												</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<fmt:formatDate value="${vo.recruitannounceEnddate }"
													pattern="yyyy/MM/dd"/></p>
											</td>
											<td class="cart-title padding-bottom0"><br>
											<p class="center">
												<c:if test="${vo.productName==null }" >
												-
												</c:if>
												<c:if test="${vo.productName!=null }" >
												${vo.productName }
												</c:if>
												<br>
												<c:if test="${vo.adCheck==1 }" >
												[심사중]
												</c:if>
												<c:if test="${vo.adCheck==2 }" >
												[통과]
												</c:if>
												<c:if test="${vo.adCheck==3 }" >
												[거절]
												</c:if>
												</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
												<c:if test="${vo.adverEnddate==null }" >
												-
												</c:if>
												<c:if test="${vo.adverEnddate!=null }" >
												<fmt:formatDate value="${vo.adverEnddate }"
													pattern="yyyy/MM/dd"/>
												</c:if>
												</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
											<p class="center">
												<c:if test="${vo.productName==null }" >
													<a href="<c:url value='/recruit/advertisingwrite.do?recruitannounceNo=${vo.recruitannounceNo}'/>" class="or-login">[광고등록]</a>
												</c:if>
												<c:if test="${vo.productName!=null }" >
													<a href="<c:url value='/recruit/advertisingwrite.do?recruitannounceNo=${vo.recruitannounceNo}'/>" class="or-login">[광고연장]</a>
												</c:if>
											</p>
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

				<div class="paging col-lg-12 center">
				 <div class="product__pagination blog__pagination">
				 	<c:if test="${pagingInfo.firstPage>1 }">	
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<i class="fa fa-long-arrow-left"></i>
						</a>
					</c:if>
					
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
					
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
							<i class="fa fa-long-arrow-right"></i>
						</a>
					</c:if>
				    </div>
				</div>
</section>
<br><br><br><br>

<%@ include file="../inc/bottom.jsp"%>