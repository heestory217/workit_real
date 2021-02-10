<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivMypage.css'/>" />

<style>
.product__pagination a, .blog__pagination a, #currentPage {
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid #b2b2b2;
	font-size: 14px;
	color: #b2b2b2;
	font-weight: 700;
	line-height: 28px;
	text-align: center;
	margin-right: 16px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
}

.product__pagination a:hover, .blog__pagination a:hover, #currentPage {
	background: #4C50BB;
	border-color: #4C50BB;
	color: #ffffff;
}

.product__pagination a:last-child, .blog__pagination a:last-child {
	margin-right: 0;
}

select {
   text-align-last: center;
   text-align: center;
   -ms-text-align-last: center;
   -moz-text-align-last: center;
}

</style>

<script type="text/javascript">
    function pageFunc(curPage){
    	$('input[name=currentPage]').val(curPage);
    	$('form[name=frmPage]').submit();
    }
</script>

<!-- 상단 바  -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="<c:url value='/company/ApplicantMng/applicantByRecruit.do'/>">Applicant Management</a>
                    <span>Prohibited Applicant</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 상단 바 -->

<!-- 페이징처리 폼 -->
<form action="<c:url value='/company/ApplicantMng/prohibit.do'/>" name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>
<!-- 페이징처리 폼 -->

<!-- 본문 시작 -->
<div style="padding: 80px 0 80px 0;">

	<!-- 제목 -->
	<div class="section-title" style="width: 100%;">
		<h2>입사지원제한</h2>
		<div class="container">
			<div class="col-lg-12" style="background: #f4f4ff;padding: 15px;">
				<h6>- 기업이 특정사유로 <span style="color: red;">입사지원을 제한</span>한 회원목록입니다. </h6>
				<h6 style="margin-top:15px;">
					- 제한된 회원의 이력서는 지원목록에서 보이지 않습니다.
				</h6>
			</div>
		</div>
	</div>
	<!-- 제목 끝 -->
	
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="cart-table">
						<table>
							<colgroup>
								<col width="33%">
								<col width="34%">
								<col width="33%">
							</colgroup>
							<thead>
                               <tr>
                                   <th>지원자명</th>
                                   <th>이력서</th>
                                   <th>제한여부</th>
                               </tr>
                           </thead>
                           <tbody>
								<c:if test="${empty list}">
	                            	<tr>
	                            		<td colspan="5"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                               </c:if>
                               <c:if test="${!empty list }">
	                               	<c:forEach var="map" items="${list}">
										<tr>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${map['USER_NAME']}</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">${map['RESUME_TITLE']}</p>
											</td>
											<td class="cart-title padding-bottom0"><br>
												<p class="center">
													<button type="button" class="btn btn-outline-success btn-sm"
	onclick="location.href='<c:url value='/company/ApplicantMng/prohibitCancel.do?prohibitjoinNo=${map["PROHIBITJOIN_NO"]}'/>'">
														제한취소
													</button>
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
		
		<!-- 페이징 -->
		<c:if test="${!empty list }">
			<div class="col-lg-12" style="text-align: center;">
				<div class="product__pagination blog__pagination">
				 	<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<i class="fa fa-long-arrow-left"></i>
						</a>
					</c:if>
					<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
						<c:if test="${i==pagingInfo.currentPage }">
							<span id="currentPage" >${i}</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="pageFunc(${i})">${i}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
						<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
							<i class="fa fa-long-arrow-right"></i>
						</a>
					</c:if>
				</div>
			</div>
		</c:if>
		<!-- 페이징 -->
	    
	</section>
</div>
<!-- 본문 끝 -->

<%@ include file="../../inc/bottom.jsp"%>