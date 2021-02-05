<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<head>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
</head>
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
                            <h2>${RecruitannounceVO.recruitannounceTitle}</h2>
                            <p>등록일 : <span><fmt:formatDate value="${RecruitannounceVO.recruitannounceStartdate}" pattern="yyyy년 MM월 dd일"/></span></p>
                        </div>
                        <h4>${CorpVO.corpName}</h4>
                        <c:if test="${d>=0}">
	                        <h1 style="color:blue; float:right;">D-${d}</h1>
                        </c:if>
                        <c:if test="${d<0}">
                            <h1 style="color:red; float:right;">마감</h1>
                        </c:if>
                        <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h3 class="col-lg-7"></h3>
                        <div class="blog-quote">
                            <p>경력 : <span>${RecruitannounceVO.recruitannounceScarrer}</span></p>
                            <p>고용형태 : <span>${RecruitannounceVO.recruitannounceSworkkind}</span></p>
                            <p>급여 : <span>${RecruitannounceVO.recruitannounceSpay}</span></p>
                            <p>스킬 : <span>${RecruitannounceVO.recruitannounceSkill}</span></p>
                            <p>마감일 : <span><fmt:formatDate value="${RecruitannounceVO.recruitannounceEnddate}" pattern="yyyy년 MM월 dd일"/></span></p>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div>
                        <h3 class="col-lg-7">채용 형태</h3>
                        &nbsp;&nbsp;
                        <p>${RecruitannounceVO.recruitannounceWorkkind}</p>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div>
                        <h3 class="col-lg-7">주요 업무</h3>
                        &nbsp;&nbsp;
                        <p>${RecruitannounceVO.recruitannounceWork}</p>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <div class="posted-by">
                            <h4 class="col-lg-7">자격요건</h4>
                            <div class="pb-text">
                            <c:if test="${RecruitannounceVO.recruitannounceWantedcarrer==0}">
                            	<p>신입</p>
                            </c:if>
                             <c:if test="${RecruitannounceVO.recruitannounceWantedcarrer>0}">
                            	<p>경력 ${RecruitannounceVO.recruitannounceWantedcarrer}년 이상</p>
                            </c:if>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <h4 class="col-lg-7">우대사항</h4>
                            <div class="pb-text">
                                <p>${RecruitannounceVO.recruitannounceUpcheckcarrer}</p>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="posted-by">
                            <h4 class="col-lg-7">직무</h4>
                        	<div class="pb-text">
                                <p>${cwvo}</p>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <h4 class="col-lg-7">요구 언어</h4>
                            <div class="pb-text">
                                <p>${lang}</p>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <h4 class="col-lg-7">근무지</h4>
                            <div class="pb-text">
                                <p>${cwa}</p>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h5 class="col-lg-7">채용 절차</h5>
                        <p>${RecruitannounceVO.recruitannounceHirestep}</p>
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h5 class="col-lg-7">기타</h5>
                        <p>${RecruitannounceVO.recruitannounceElse}</p>
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h5 class="col-lg-7">회사 링크</h5>
                        <a href="${RecruitannounceVO.recruitannounceLink}"></a>
                        
                        <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">요약</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">기업 소개</a>
                                </li>
                                <!-- <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">리뷰</a>
                                </li> -->
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                            <p>경력 : <span>${RecruitannounceVO.recruitannounceScarrer}</span></p>
                          					<p>고용형태 : <span>${RecruitannounceVO.recruitannounceSworkkind}</span></p>
                           					<p>급여 : <span>${RecruitannounceVO.recruitannounceSpay}</span></p>
                          					<p>스킬 : <span>${RecruitannounceVO.recruitannounceSkill}</span></p>
                          					<p>마감일 : <span><fmt:formatDate value="${RecruitannounceVO.recruitannounceEnddate}" pattern="yyyy년 MM월 dd일"/></span></p>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <h5>회사명   <span>${CorpVO.corpName}</span> </h5>
                                                <h5>대표  <span>${CorpVO.corpHeadname}</span> </h5>
                                                <p>회사소개 </p>
                                                <p>${CorpVO.corpIntro}</p>
                                                <button type="button" class="site-btn" id="corpinfo" name="corpinfo">회사상세보기</button>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="tab-pane fade" id="tab-3" role="tabpanel">
                                
                                </div>-->
                            </div>
                        </div>
                    </div>
                        <div class="leave-comment">
                        <c:if test="${sessionScope.user_corpcheck==1}">
                    	<button type="button" class="site-btn" id="applicant" name="applicant">지원하기</button>
                    </c:if>
                    <c:if test="${sessionScope.userNo==RecruitannounceVO.userNo}">
                    	<button type="button" class="site-btn" id="editclick" name="editclick">공고수정 요청</button>
                    	<button type="button" class="site-btn" id="deleteclick" name="editclick">공고삭제</button>
                    	<button type="button" class="site-btn" id="deleteclick" name="editclick">공고광고 등록</button>
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