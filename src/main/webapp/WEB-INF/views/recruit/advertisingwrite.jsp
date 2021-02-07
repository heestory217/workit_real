<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../inc/top.jsp"%>

<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/workit/index.do"><i class="fa fa-home"></i> Home</a>
						<a href="<c:url value='/recruit/recruitlist.do'/>">Advertising</a>
                    	<span>Application</span>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Breadcrumb Section Begin -->

<section class="blog-section spad">
	<div class="container">
		<div class="row">
			<div style="width: 100%;text-align: center;">
				<div class="blog-details-inner">
					<div class="leave-comment" style="padding-top: 0">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<!-- 
								<div class="tag-share" style="border-bottom: 0; padding-bottom: 20px; margin-top: 0px;padding: inherit;">
			                        <div class="details-tag">
			                            <ul>
			                                <li><i class="fa fa-tags"></i></li>
			                                <li style="color:#4C50BB;">채용공고 광고 등록/연장</li>
			                            </ul>
			                        </div>
		                    	</div>
		                    	 -->
								<form name="ADFrm" action="<c:url value='/shop/checkOut.do?recruitannounceNo=${selectadverinfoVO.recruitannounceNo}'/>" method="POST">
		                            <div style="text-align: center;">
			                            <h4>${selectadverinfoVO.recruitannounceTitle}</h4>
			                            <select id="paidserviceNo" name="paidserviceNo" style="width:30%;height: 40px;">
	                           				<option value=7>광고1급7일</option>
	                              			<option value=8>광고1급15일</option>
	                         		        <option value=9>광고1급30일</option>
	                                        <option value=10>광고2급7일</option>
	                                        <option value=11>광고2급15일</option>
	                                        <option value=12>광고2급30일</option>
	                          			</select>
		                           		<br>
			                            <input type="hidden" id="recruitannounceNo" name="recruitannounceNo" value="${selectadverinfoVO.recruitannounceNo}">
			                            <c:if test="${adverpaynowchek==0}">
					                        <button type="submit" class="site-btn register-btn" style="margin-top: 20px;width:30%;;"
					                        	id='recruitask' name='recruitask'>광고 요청
				                        	</button>
			                       		</c:if>
				                        <c:if test="${adverpaynowchek==1}">
					                        <p style="margin-top: 20px;font-weight: bold;">사용중인 상품명 : ${selectadverinfoVO.productName}</p>
					                        <p style="font-weight: bold;">
					                        	<c:if test="${!empty selectadverinfoVO.adverEnddate}">
						                        	<span>종료일 : <fmt:formatDate value="${selectadverinfoVO.adverEnddate}" pattern="yyyy/MM/dd"/></span>
					                        	</c:if>
				                        	</p>
					                        <input type="hidden" id="paidserviceenddate" name="paidserviceenddate" value="${RecruitannounceVO.adverEnddate}">
				                            <button type="submit" class="site-btn register-btn" style="width:30%;"
					                            	id='recruitask' name='recruitask' style="">광고 연장 요청
			                            	</button>
				                        </c:if>
			                         </div>
		                        </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="../inc/bottom.jsp"%>