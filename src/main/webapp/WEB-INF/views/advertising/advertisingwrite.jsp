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

<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="#"><i class="fa fa-home"></i> Home</a> <span>Advertising register</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

<div class="filter-widget">
	<h4 class="fw-title center">광고중인 공고 목록</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
					</colgroup>
						<thead>
                                <tr>
                                	<th>공고명</th>
                                    <th>모집마감일</th>
                                    <th>광고종류</th>
                                    <th>광고마감일</th>
                                    <th>공고링크</th>
                                    <th>수정하기</th>
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
											<td class="cart-title padding-bottom0"><br><!--
												<p class="center">
												<c:if test="${fn:length(vo.payName)>=10}">
													${fn:substring(vo.payName, 0,10) } ...
												</c:if>
												<c:if test="${fn:length(vo.payName)<10}">						
													${vo.payName }
												</c:if>
												</p>-->
											</td>
											<td class="cart-title padding-bottom0"><!--<br>
												<p class="center"><fmt:formatNumber value="${vo.orderPay }" pattern="#,###">
													</fmt:formatNumber></p>-->
											</td>
											<td class="cart-title padding-bottom0"><!--<br>
												<p class="center">${vo.orderPaykind }</p>
											</td>
											<td class="cart-title padding-bottom0"><!--<br>
												<p class="center">
												<fmt:formatDate value="${vo.orderDate }"
													pattern="yyyy-MM-dd"/></p>-->
											</td>
											<td class="cart-title padding-bottom0">
											<!--<br>
												<c:if test="${vo.recruitannounceNo>0}">						
													<p class="center">${vo.recruitname }<br><fmt:formatDate value="${vo.paidservicestartdate }"
													pattern="yyyy-MM-dd"/>~<br><fmt:formatDate value="${vo.paidserviceenddate }"
													pattern="yyyy-MM-dd"/></p>
												</c:if>
												<c:if test="${vo.resumeNo>0}">						
													<p class="center">${vo.resumtitle }/<a href="./companyMypageEdit.do" class="or-login">링크</a></p>
												</c:if>
												<c:if test="${vo.corpreviewNo>0}">
													<p class="center">한줄평<br>${vo.oneline }</p>
												</c:if>-->
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p>발싸</p>
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
	<!-- 페이징 처리 
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
				</div>-->
</section>


<%@ include file="../inc/bottom.jsp"%>