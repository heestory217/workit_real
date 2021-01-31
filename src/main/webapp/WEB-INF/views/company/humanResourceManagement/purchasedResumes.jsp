<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<style>
.row i {
	margin: 0 10px;
}
</style>

<!-- 주문완료 페이지 상단 -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">HRM</a>
                    <span>Purchased Resumes</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 주문완료 페이지 상단  끝-->

<section class="blog-section spad">
	<div class="container">
		<div class="row">

			<!-- 제목 -->
			<div class="section-title" style="width: 100%">
				<h4><i class="far fa-file"></i>구매 이력서 상세보기</h4>
			</div>
			<!-- 제목 끝 -->
			
			
			<!-- 본문 시작 -->
			<section class="shopping-cart spad" style="width: 100%; padding:25px 0 10px 0;">
			    <div class="container">
			        <div class="row">
			            <div class="col-lg-12">
			                <div class="cart-table">
			                    <table>
			                   		<colgroup>
										<col style="width:10%;" />
										<col style="width:30%;" />
										<col style="width:15%;" />
										<col style="width:15%;" />
										<col style="width:20%;" />
										<col style="width:10%;" />
									</colgroup>
			                        <thead>
			                            <tr>
			                                <th scope="col">이름</th>
			                                <th scope="col" class="p-name">이력서 제목</th>
			                                <th scope="col">직무</th>
			                                <th scope="col">경력</th>
			                                <th scope="col">가격</th>
			                            </tr>
			                        </thead>
			                        <tbody>
                                       	<!-- 가격 계산을 위한 변수 설정 -->
										<c:set var="subTotalPrice" value="0" />
										<c:set var="discount" value="0" />
										<c:set var="totalPrice" value="0" />
										
				                        <c:if test="${empty list}">
											<tr>
												<td colspan="6" style="padding: 14px 0;">장바구니 내역이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty list}">
			                        		<c:forEach var="map" items="${list}">
					                            <tr>
					                                <td class="p-price" style="padding: 14px 0;">${map['USER_NAME']}</td>
					                                <td class="cart-title" style="padding: 14px 0;">${map['RESUME_TITLE']}</td>
					                                <td class="cart-pic" style="padding: 14px 0;">${map['WORKKIND_NAME']}</td>
					                                <td class="cart-pic" style="padding: 14px 0;">
					                                 	<c:if test="${map['USER_EXPERIENCE']==0}">
						                                	신입
						                                </c:if>
					                                 	<c:if test="${map['USER_EXPERIENCE']!=0}">
						                                	${map['USER_EXPERIENCE']}년
						                                </c:if>
						                            </td>
				                                	<td class="p-price" style="padding: 14px 0;">
					                                	<fmt:formatNumber value="${map['PAIDSERVICE_PRICE']}" pattern="#,###"/>원
					                                	<c:set var="subTotalPrice" value="${subTotalPrice + map['PAIDSERVICE_PRICE']}"/>
	                                				</td>
					                            </tr>
			                            </c:forEach>
			                            </c:if>
			                        </tbody>
			                    </table>
			               <!--  </form> -->
			                </div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</section>
<!-- 본문 끝 -->
<%@ include file="../../inc/bottom.jsp"%>