<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<style type="text/css">
.row i {
	margin: 0 10px;
}

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
</style>

<script type="text/javascript">
    function pageFunc(curPage){
    	$('input[name=currentPage]').val(curPage);
    	$('form[name=frmPRPage]').submit();
    }
</script>

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

<form action="<c:url value='/company/HRManagment/purchasedResumes.do'/>" name="frmPRPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchPRKeyword" value="${param.searchPRKeyword}">
</form>             
               
<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<!-- 제목 -->
			<div class="section-title" style="width: 100%;">
				<h4 style="font-weight: 700;"><i class="far fa-file"></i>구매 이력서</h4>
				<h6 style="margin-top:15px;">구매 이력서의 상세내용을 확인하려면 
					<span style="color: #4C50BB;">이력서 제목</span>을 클릭하세요.
				</h6>
			</div>
			<!-- 제목 끝 -->
			
			<div class="col-lg-12" style="text-align: right;">
				<div class="search-form">
	                <form action="#" name="PRFrm">
	                	<input type="text" name="searchPRKeyword" placeholder="검색어를 입력하세요" value="${param.searchPRKeyword}">
	                    <button type="submit"><i class="fa fa-search"></i></button>
	                </form>
				</div>
			</div>
			
			<!-- 본문 시작 -->
			<section class="shopping-cart spad" style="width: 100%; padding:25px 0 10px 0;">
			    <div class="container">
			        <div class="row">
			            <div class="col-lg-12">
			                <div class="cart-table" style="margin-bottom: 20px;">
			                    <table>
			                   		<colgroup>
										<col style="width:20%;" />
										<col style="width:40%;" />
										<col style="width:20%;" />
										<col style="width:20%;" />
									</colgroup>
			                        <thead>
			                            <tr>
			                                <th scope="col">이름</th>
			                                <th scope="col" class="p-name">이력서 제목</th>
			                                <th scope="col">직무</th>
			                                <th scope="col">경력</th>
			                            </tr>
			                        </thead>
			                        <tbody>
	                                      	<!-- 가격 계산을 위한 변수 설정 -->
										<c:set var="subTotalPrice" value="0" />
										<c:set var="discount" value="0" />
										<c:set var="totalPrice" value="0" />
										
				                        <c:if test="${empty resumeList}">
											<tr>
												<td colspan="6" style="padding: 14px 0;">구매 내역이 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty resumeList}">
			                        		<c:forEach var="map" items="${resumeList}">
					                            <tr>
					                                <td class="p-price" style="padding: 14px 0;">${map['USER_NAME']}</td>
					                                <td class="cart-title" style="padding: 14px 0;">
	                             	<a href="<c:url value="이력서 상세보기.do?resumeNo=${map['RESUME_NO']}"/>">
	                             		${map['RESUME_TITLE']}
	                          		</a>
				                                	</td>
					                                <td class="cart-pic" style="padding: 14px 0;">${map['WORKKIND_NAME']}</td>
					                                <td class="cart-pic" style="padding: 14px 0;">
					                                 	<c:if test="${map['USER_EXPERIENCE']==0}">
						                                	신입
						                                </c:if>
					                                 	<c:if test="${map['USER_EXPERIENCE']!=0}">
						                                	${map['USER_EXPERIENCE']}년
						                                </c:if>
						                            </td>
					                            </tr>
			                            	</c:forEach>
			                            </c:if>
			                        </tbody>
			                    </table>
			                </div>
						</div>
			                
			            <c:if test="${!empty param.searchPRKeyword}">
				            <div class="col-lg-12" style="text-align: right;">
								<span>검색결과 : ${pagingInfo.totalRecord}건</span>
							</div>
						</c:if>
			                
					</div>
				</div>
			</section>
			<!-- 본문 끝 -->
			
			<!-- 페이징 -->
			<div class="col-lg-12" style="text-align: center;">
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
			<!-- 페이징 -->

		</div>
	</div>
</section>

		
<%@ include file="../../inc/bottom.jsp"%>