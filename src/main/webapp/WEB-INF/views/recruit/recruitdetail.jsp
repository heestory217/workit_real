<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<head>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
</head>
<style>
a#corpinfo {
    display: inline;
    font-weight: 800;
    color: #4c50bb;
}

.tab-item .nav li {
    width: 33%;
}

.tab-item .nav li a {
    width: 100%;
    text-align: center;
}

.inside {
    width: 25%;
    float: left;
}
.half {
    float: left;
    width: 50%;
}
.icons{
    float: right;
}

</style>
<script type="text/javascript">
	$(function(){
		$('#editclick').click(function(){
			var confirm_test = confirm("채용공고 수정은 이후 관리자 허가 이후에 그 내용이 반영되며 그전에는 채용공고는 대기상태로 변합니다. 공고를 수정하시겠습니까?");
			if ( confirm_test == true ) {
				window.location.href = 'http://localhost:9090/workit/recruit/recruitedit.do?recruitannounceNo=${RecruitannounceVO.recruitannounceNo}';
		    } else if ( confirm_test == false ) {
		    	event.preventDefault();
		    }
		});

		$('#deleteclick').click(function(){
			var confirm_test = confirm("채용공고 삭제는 추가적인 관리자 승인없이 바로 삭제됩니다. 정말로 채용공고를 삭제하게시겠습니까?");
			if ( confirm_test == true ) {
				window.location.href = 'http://localhost:9090/workit/recruit/recruitdelete.do?recruitannounceNo=${RecruitannounceVO.recruitannounceNo}';
		    } else if ( confirm_test == false ) {
		    	event.preventDefault();
		    }
		});

		$('adclick').click(function(){
			window.location.href = 'http://localhost:9090/workit/index.do';
		});

		$('#corpinfo').click(function(){
			window.location.href = 'http://localhost:9090/workit/company/corp/corpDetail.do?corpNo=${CorpVO.corpNo}';
		});

		$('#applicant').click(function(){
			window.location.href = 'http://localhost:9090/workit/index.do';
		});

	});
</script>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        <input type="hidden" id="recruitannounceNo" name="recruitannounceNo" value="${RecruitannounceVO.recruitannounceNo}">
                        	<!-- 기업 로고 이미지 -->
                        	<img src="<c:url value='/pd_images/${CorpVO.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;margin-left: 65px;">
                        	<!-- 기업 로고 이미지 -->
                        	<div class="icons">
	                        	<i class="fa fa-bookmark-o" aria-hidden="true" style="margin-right: 20px;"></i>
	                        	<i class="fa fa-share-alt" aria-hidden="true"></i>
                        	</div>
                            <h2>
                            	<c:if test="${d<0}">
                          			 [채용 마감]
                          		</c:if>
                          		${RecruitannounceVO.recruitannounceTitle}
                           	</h2>
                            <p>
                            	등록일 : <span><fmt:formatDate value="${RecruitannounceVO.recruitannounceStartdate}" pattern="yyyy년 MM월 dd일"/>&nbsp; | </span>
                           		<c:if test="${d>=0}">
                          			 &nbsp; 마감일 : <span> D-${d}</span>
                           		</c:if>
                           		<c:if test="${d<0}">
                          			 &nbsp; 채용 마감
                           		</c:if>

                         	</p>
                        </div>
                        <!-- <div class="blog-detail-title"> -->

                       <c:forEach var="imgList" items="${imgList }" begin="0" end="0">
			                    <div class="blog-large-pic">
			                        <img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
			                    </div>
                       	</c:forEach>
                        <div class="posted-by" style="margin-top: 40px;">
                            <div class="pb-pic">
                               <a href="#" id="corpinfo"><img src="<c:url value='/pd_images/${CorpVO.corpImgurl }'/>" alt="" style="width: 50%;"></a>
                            </div>
                            <div class="pb-text">
                                   <h5><a href="#" id="corpinfo">${CorpVO.corpName}</a> | ${CorpVO.corpIndustry }</h5>
                                <p style="margin-top: 20px;">
			                        <c:if test="${CorpVO.corpAvrpay!=0}">
			                        	1인당 평균연봉은<fmt:formatNumber value="${CorpVO.corpAvrpay}" pattern="#,###,###"/> 만원,
			                        </c:if>
			                        <c:if test="${CorpVO.corpPnumber!=1}">
			                        	기업 근로자 수는 총  ${CorpVO.corpPnumber}명
			                        </c:if>
			                        <c:if test="${!empty CorpVO.corpKind}">
			                        	인 중소기업 입니다.
			                        </c:if>
			                        <c:if test="${empty CorpVO.corpKind}">
			                        	입니다.
			                        </c:if>
		                        </p>
                            </div>
                        </div>

                        <div class="product-tab"style="padding-top: 40px;">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">채용 정보</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">채용 조건</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">지원하기</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-12">
                                            <h5>상세 요강</h5>
                                            	<p>${RecruitannounceVO.recruitannounceWorkkind}</p>
                                            <h5>주요 업무</h5>
                                            	<p>${RecruitannounceVO.recruitannounceWork}</p>
                                           	<div>
                                           		<div class="inside">
	                                            <h5><i class="fa fa-bullseye" aria-hidden="true"></i> 포지션</h5>
	                                            	<p>${cwvo}</p>
                                            	</div>
                                            	<div class="inside">
	                                            <h5><i class="fa fa-id-card-o" aria-hidden="true"></i> 고용 형태</h5>
		                          					<p>${RecruitannounceVO.recruitannounceSworkkind}</p>
	                          					</div>
	                          					<div class="inside">
	                                            <h5><i class="fa fa-money" aria-hidden="true"></i> 급여</h5>
	                           						<p>${RecruitannounceVO.recruitannounceSpay}원</p>
                           						</div>
                           						<div class="inside">
	                                            <h5><i class="fa fa-map-marker" aria-hidden="true"></i> 근무지</h5>
	                           						<p>${cwa}</p>
                           						</div>
                         					</div>
                         					<div>
	                         					<div class="half">
		                                            <h5><i class="fa fa-comments" aria-hidden="true"></i> 채용 과정</h5>
		                                            	<p>${RecruitannounceVO.recruitannounceHirestep}</p>
	                                           	</div>

	                                           	<div class="half">
		                                            <h5><i class="fa fa-calendar" aria-hidden="true"></i> 채용 마감일</h5>
			                          					<p><fmt:formatDate value="${RecruitannounceVO.recruitannounceEnddate}" pattern="yyyy년 MM월 dd일"/>
				                          					<c:if test="${d>=0}">
							                          			 &nbsp; 마감일 : <span> D-${d}</span>
							                           		</c:if>
							                           		<c:if test="${d<0}">
							                          			 &nbsp; 채용공고가 마감되었습니다.
							                           		</c:if>
						                           		</p>
					                           		</div>
				                           		</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <h5>경력</h5>
	                                            <c:if test="${RecruitannounceVO.recruitannounceWantedcarrer==0}">
					                            	<p>신입</p>
					                            </c:if>
					                            <c:if test="${RecruitannounceVO.recruitannounceWantedcarrer>0}">
					                            	<p>${RecruitannounceVO.recruitannounceWantedcarrer}년 이상</p>
					                            </c:if>
                                                <h5>필수 요구 언어</h5>
				                            	<p>${lang}</p>
				                            	<h5>그 외 요구 언어</h5>
				                            	<p>${RecruitannounceVO.recruitannounceSkill}</p>
					                            <h5>우대사항</h5>
					                            <p>${RecruitannounceVO.recruitannounceUpcheckcarrer}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-3" role="tabpanel">
                               		<div class="row">
                                       <div class="col-lg-12">
                                       		<c:if test="${sessionScope.user_corpcheck==1}">
                                       		<!-- 지원하기 페이지 임포트 -->
                                       		</c:if>
                                       		<c:if test="${sessionScope.user_corpcheck==2}">
                                       		 	<div class="emptyImg" style="border: 1px solid #bbb; margin: 60px 0px; border-style: dashed; border-radius: 20px; text-align: center;">
												 	<img src='<c:url value='/resources/img/empty2.jpg'/>' style="width: 10%;margin-top: 60px;">
												 	<a href="<c:url value='/company/ApplicantMng/applicantByRecruit.do?recruitannounceNo=${RecruitannounceVO.recruitannounceNo }'/>"><h6 style="font-weight: 600; color: #666; margin-top: 40px; margin-bottom: 20px;">지원자 목록 바로가기</h6></a>
											 	</div>
                                       		</c:if>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
						<div class="tag-share">
							<div class="col-lg-9">
								<div class="details-tag" style="margin-top: 10px;">
									<ul>
										<li><i class="fa fa-tags"></i></li>
										<li><a href="http:&#x2F&#x2F${CorpVO.corpWebaddress}">${CorpVO.corpWebaddress}</a></li>
										<li>${CorpVO.corpAddress1}</li>
										<li>${CorpVO.corpTel}</li>
									</ul>
								</div>
							</div>
							<c:if test="${sessionScope.userNo==RecruitannounceVO.userNo}">
								<div style="float: right;">
									<button type="button" class="site-btn" id="editclick"
										name="editclick">공고수정 요청</button>
									<button type="button" class="site-btn" id="deleteclick"
										name="editclick">공고삭제</button>
								</div>
							</c:if>
						</div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
<%@ include file="../inc/bottom.jsp" %>
