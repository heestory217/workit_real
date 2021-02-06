<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>

<link rel="stylesheet" href="<c:url value="/resources/admin/assets/libs/css/detail.css"/>" type="text/css">


<section class="blog-details spad" style="padding-top: 30px; padding-bottom: 54px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" style="border-bottom: 1px solid #ddd;">
				<div class="blog-details-inner">
					<div class="blog-detail-title">
						<img src="<c:url value='/pd_images/${cVo.corpImgurl }'/>"
							style="width: 50px; margin-bottom: 20px;"><br>
						<h2>${cVo.corpName}</h2>
						<p>
							사업 분야 : ${cVo.corpIndustry}<span> - 설립일 :
								${cVo.corpStartdate} </span>
						</p>
					</div>
					<c:if test="${!empty imgList}">
						<c:forEach var="imgList" items="${imgList }" begin="0" end="0">
							<div class="blog-large-pic">
								<img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
							</div>
						</c:forEach>
					</c:if>
					<div class="blog-detail-desc">
						<p></p>
					</div>
					<div class="blog-quote">
						<p style="font-size: 2.2em; text-align: center;">
							'${cVo.corpName}'<span> <c:if test="${cVo.corpAvrpay!=0}">
	                        	의 1인당 평균연봉은 </span>
							<fmt:formatNumber value="${cVo.corpAvrpay}" pattern="#,###,###" />
							만원, <br> <br>
							</c:if>
							<c:if test="${cVo.corpPnumber!=1}">
								<span>기업 근로자 수는</span> 총  ${cVo.corpPnumber}명
	                        </c:if>
							<c:if test="${!empty cVo.corpKind}">
								<span>인 중소기업 입니다.</span>
							</c:if>
							<c:if test="${empty cVo.corpKind}">
								<span>입니다.</span>
							</c:if>
						</p>
					</div>
					<div class="blog-more">
						<div class="row">
							<c:if test="${!empty imgList}">
								<c:forEach var="imgList" items="${imgList }" begin="1" end="3">
									<div class="col-sm-4">
										<img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="blog-detail-desc">${cVo.corpIntro}</div>
					<div class="tag-share" style="float: left; margin-top: 0px;">
						<div class="col-lg-9" style="max-width: 100%; margin-top: 10px;">
							<div class="details-tag">
								<ul style="padding-left: 0px;">
									<li><i class="fa fa-tags"></i></li>
									<li><a href="http:&#x2F&#x2F${cVo.corpWebaddress}">${cVo.corpWebaddress}</a></li>
									<li>${cVo.corpAddress1}</li>
									<li>${cVo.corpTel}</li>
								</ul>
							</div>
						</div>
					</div>
					<a href="<c:url value="/admin/users/corp/corpList.do"/>">
						<button style="float: right;" class="btn btn-primary">
						기업	목록</button>
					</a>
				</div>
			</div>
		</div>
	</div>
</section>

<form action="<c:url value='/companyMypage/companyPayment.do'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>

<div class="filter-widget" style="clear: both;">
	<h2 style="text-align: center;">결제 내역</h2>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table style="width: 80%; margin: 0 auto;">
					<colgroup>
						<col width="25%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
						<col width="20%">
					</colgroup>
						<thead>
                                <tr>
                                	<th>결제상품</th>
                                    <th>결제금액</th>
                                    <th>결제수단</th>
                                    <th>결제일</th>
                                    <th>세부정보</th>
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
												<p class="center">
												<c:if test="${fn:length(vo.payName)>=10}">
													${fn:substring(vo.payName, 0,10) } ...
												</c:if>
												<c:if test="${fn:length(vo.payName)<10}">						
													${vo.payName }
												</c:if>
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
											<td class="cart-title padding-bottom0"><br>
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
												</c:if>
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


<%@ include file="../../inc/bottom.jsp" %>