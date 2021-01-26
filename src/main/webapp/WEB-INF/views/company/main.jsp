<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<c:url value="/resources/css/corpbootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/corpstyle.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">
    
<!-- Modal -->
<%@ include file="Cmodal/resumeModal.jsp" %>
<%@ include file="Cmodal/adModal.jsp" %>
<%@ include file="Cmodal/reviewDelModal.jsp" %>
<!-- Modal End -->

<!-- 가장 많이 쓰는 언어 검색 -->
    <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="single-banner">
                        <img src="<c:url value='/resources/img/banner-1.jpg'/>">
                        <div class="inner-text">
                            <h4>JAVA 개발자</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="single-banner">
                        <img src="<c:url value="/resources/img/banner-2.jpg"/>">
                        <div class="inner-text">
                            <h4>Python 개발자</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="single-banner">
                        <img src="<c:url value="/resources/img/banner-3.jpg"/>">
                        <div class="inner-text">
                            <h4>JavaScript 개발자</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="single-banner">
                        <img src="<c:url value="/resources/img/banner-3.jpg"/>">
                        <div class="inner-text">
                            <h4>JavaScript 개발자</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 가장 많이 쓰는 언어 검색 끝 -->
	
	<!-- 채용 공고별(최신 4개)/ 맞춤 이력서 추천 : 회사의 최근 채용 공고중 언어/경력과 일치하는 이력서 -->
	<c:import url="/company/CorpRecruitResume.do"/>
	<!-- 채용 공고별 이력서 리스트 끝 -->
	
	<!-- 맞춤 이력서 추천 -->
	<c:import url="/company/CorpRecomResume.do"/>
	<!-- 맞춤 이력서 추천 끝 -->
	
 	<!-- 서비스 소개, 가격정책 -->
 	<section class="pricing-card-area fix" style="margin-bottom: 60px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-8">
                    <div class="section-tittle text-center mb-90">
                        <h2 style="margin-top: 70px;">Work it이 제공하는 서비스</h2>
                        <p>work it은 다음과 같은 서비스를 제공합니다. 좋은 인재를 찾을 수 있도록 돕겠습니다.</p>
                    </div>
                </div>
       	    </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-10">
                    <div class="single-card text-center mb-30">
                        <div class="card-top">
                              <img src="<c:url value='/resources/img/icon_resume.png'/>">
                            <p>이력서 열람 서비스</p>
                        </div>
                        <div class="card-mid">
                            <h4>2,000 원 <span>/ 장 당</span></h4>
                        </div>
                        <div class="card-bottom">
                            <ul>
                                <li>구직자 이력서 정보 열람</li>
                                <li>상세 경력 정보</li>
                                <li>사용 가능 개발언어</li>
                                <li>입사 제안 보내기</li>
                            </ul>
                            <a data-toggle="modal" href="#seeResume" class="borders-btn">서비스 이용하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-10">
                    <div class="single-card text-center mb-30">
                        <div class="card-top">
                            <img src="<c:url value='/resources/img/icon_adv.png'/>">
                            <p>채용공고 광고 서비스</p>
                        </div>
                        <div class="card-mid">
                            <h4>300,000 원 <span>/ 7일</span></h4>
                        </div>
                        <div class="card-bottom">
                            <ul>
                                <li>사이트 메인 상단 (광고1급)</li>
                                <li>7일/15일/30일</li>
                                <li>사이트 메인 하단 (광고2급)</li>
                                <li>7일/15일/30일</li>
                            </ul>
                            <a data-toggle="modal" href="#siteAD" class="borders-btn">서비스 이용하기</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-10">
                    <div class="single-card text-center mb-30">
                        <div class="card-top">
                            <img src="<c:url value='/resources/img/icon_review.png'/>">
                            <p>리뷰 삭제 서비스</p>
                        </div>
                        <div class="card-mid">
                            <h4>100,000 원 <span>/ 개 당</span></h4>
                        </div>
                        <div class="card-bottom">
                            <ul>
                                <li>기업 관련 후기 삭제 서비스</li>
                                <li>면접자 후기</li>
                                <li>재직자 후기</li>
                                <li>퇴사자 후기</li>
                            </ul>
                            <a data-toggle="modal" href="#reviewDel" class="borders-btn">서비스 이용하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 서비스 소개, 가격 정책 끝 -->
    
    