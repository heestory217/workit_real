<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivMypage.css'/>" />

<style>
section:nth-child(3) div div div div table tbody tr td a p:hover {
	color: #4C50BB;
	font-weight:  600;
}
</style>

<!-- 상단 바  -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">Applicant Management</a>
                    <span>All Applicant Situation</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 상단 바 -->

<!-- 페이징처리 폼 -->
<form action="<c:url value='/company/ApplicantMng/allApplicant.do'/>" name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>
<!-- 페이징처리 폼 -->

<div style="padding: 80px 0 80px 0;">
	
	<!-- 제목 -->
	<div class="section-title" style="width: 100%;">
		<h2>전체 지원자</h2>
		<div class="container">
			<div class="col-lg-12" style="background: #f4f4ff;padding: 15px;">
				<h6> - 이력서는 지원일로부터 
					<span style="color: red;" >90일 동안 열람 가능</span>합니다.
				</h6>
				<h6 style="margin-top:15px;">
					- 개인회원이 탈퇴하거나 이력서를 삭제한 경우 더 이상 이력서 확인이 불가능합니다.
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
								<col width="34%">
								<col width="33%">
								<col width="33%">
							</colgroup>
							<tr>
								<td class="cart-title">
									<a href="#"><br><br>
										<h2 class="center textColorblue">${CountAllApplicant}</h2>
										<p class="center">전체</p>
									</a>
								</td>
								<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=1'/>"><br><br>
									<h2 class="center textColorblue">${open}</h2>
									<p class="center">열람</p></a>
								</td>
								<td class="cart-title"><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=2'/>"><br><br>
									<h2 class="center textColorblue">${closed}</h2>
									<p class="center">미열람</p></a>
								</td>
								
							</tr>
						</table>
						<table style="border-top: 0;background: whitesmoke;">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<tr>
								<td style="padding: 10px 0 10px 0;">
									<p class="center" style="margin: 0 auto;">심사중 
										<span style="color:#4C50BB;font-weight: 800;">${wait}</span>
									</p>
								</td>
								<td style="padding: 10px 0 10px 0;">
									<p class="center" style="margin: 0 auto;">서류합격 
										<span style="color:#4C50BB;font-weight: 800;">${pass}</span>
									</p>
								</td>
								<td style="padding: 10px 0 10px 0;">
									<p class="center" style="margin: 0 auto;">불합격 
										<span style="color:#4C50BB;font-weight: 800;">${fail}</span>
									</p>
								</td>
								<td style="padding: 10px 0 10px 0;">
									<p class="center" style="margin: 0 auto;">지원취소 
										<span style="color:#4C50BB;font-weight: 800;">${cancel}</span>
									</p>
								</td>
								<td style="padding: 10px 0 10px 0;">
									<p class="center" style="margin: 0 auto;">입사제한 <span style="color:#4C50BB;font-weight: 800;">2</span></p>
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
								<col width="10%">
								<col width="30%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
                               <tr>
                                   <th>분류</th>
                                   <th>채용 공고</th>
                                   <th>고용 형태</th>
                                   <th>이력서</th>
                                   <th>지원 날짜</th>
                               </tr>
                           </thead>
                           <tbody>
								<c:if test="${empty applist }">
	                            	<tr>
	                            		<td colspan="4"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                               </c:if>
                               <c:if test="${!empty applist }">
	                               	<c:forEach var="map" items="${applist }">
										<c:if test="${map['APPLY_FLAG']==1}">
											<tr>
												<td class="cart-title padding-bottom0"><br>
													<p class="center">
														<c:if test="${map['APPLICANTLIST_PAPERCHECK']==1}">
															<button type="button" class="btn btn-outline-success btn-sm" style="cursor: Default;">
																서류합격
															</button>
														</c:if>
														<c:if test="${map['APPLICANTLIST_PAPERCHECK']==2}">
															<button type="button" class="btn btn-outline-danger btn-sm" style="cursor: Default;">
																불합격
															</button>
														</c:if>
														<c:if test="${map['APPLICANTLIST_PAPERCHECK']==3}">
															<button type="button" class="btn btn-outline-warning btn-sm" style="cursor: Default;">
																심사중
															</button>
														</c:if>
														<!--  
														<c:if test="${map['APPLY_FLAG']==2}">
															<button type="button" class="btn btn-outline-secondary btn-sm" style="cursor: Default;">
																지원취소
															</button>
															<c:if test="${map['APPLICANTLIST_PAPERCHECK']==1}">
																<button type="button" class="btn btn-success btn-sm" style="cursor: Default;padding: 10px 2px;"> </button>
															</c:if>
															<c:if test="${map['APPLICANTLIST_PAPERCHECK']==2}">
																<button type="button" class="btn btn-danger btn-sm" style="cursor: Default;padding: 10px 2px;"> </button>
															</c:if>
															<c:if test="${map['APPLICANTLIST_PAPERCHECK']==3}">
																<button type="button" class="btn btn-warning btn-sm" style="cursor: Default;padding: 10px 2px;"> </button>
															</c:if>
														</c:if>
														-->
													</p>
												</td>
												<td class="cart-title padding-bottom0"><br>
													<!-- 제목이 긴 경우 일부만 보여주기 -->
													<a href="<c:url value='/company/ApplicantMng/countUpdate.do?applicantlistNo=${map["APPLICANTLIST_NO"]}'/>">
														<p class="center">
															<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])>=18}">
																${fn:substring(map['RECRUITANNOUNCE_TITLE'], 0,18) } ...
															</c:if>
															<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])<18}">						
																${map['RECRUITANNOUNCE_TITLE']}
															</c:if>
														</p>
													</a>
												</td>
												<td class="cart-title padding-bottom0"><br>
													<p class="center">${map['RECRUITANNOUNCE_SWORKKIND']}</p>
												</td>
												<td class="cart-title padding-bottom0"><br>
													<p class="center">${map['RESUME_TITLE']}</p>
												</td>
												<td class="cart-title padding-bottom0"><br>
													<p class="center">
														<fmt:formatDate value="${map['APPLICANTLIST_DATE']}" pattern="yyyy-MM-dd"/>
													</p>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 페이징 처리 -->
		<c:if test="${i>0}">
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
	    </c:if>
	</section>
</div>
<%@ include file="../../inc/bottom.jsp"%>