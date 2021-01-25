<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<head>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
</head>
<script type="text/javascript">
	$(function(){
		
	});
</script>

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                            <h2>공고 제목</h2>
                            <p>등록일 <span>- May 19, 2019</span></p>
                        </div>
                        <p>사명</p>
                        <div class="blog-large-pic">
                            <img src="img/blog/blog-detail.jpg" alt="">
                        </div>
                        <div>
                        <h3 class="col-lg-7"></h3>
                        <div class="blog-quote">
                            <p>직업설명</p>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div>
                        <h3 class="col-lg-7 offset-lg-1">회사 소개</h3>
                        &nbsp;&nbsp;
                        <p>소개</p>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div>
                        <h3 class="col-lg-7 offset-lg-1">주요 업무</h3>
                        &nbsp;&nbsp;
                        <p>업무</p>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <div class="posted-by">
                            <div class="pb-text">
                            <h4>자격요건</h4>
                                <p>요건</p>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="posted-by">
                        <h4 class="col-lg-7">우대사항</h4>
                            <div class="pb-text">
                                <p>사항</p>
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h5 class="col-lg-7 offset-lg-1">채용과정</h5>
                        <p>과정</p>
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h5 class="col-lg-7 offset-lg-1">기타</h5>
                        <p>기타</p>
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <h5 class="col-lg-7 offset-lg-1">회사링크</h5>
                        <a href="#">링크</a>
                        
                        <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">요약</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">기업 소개</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">리뷰</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                            <p>직무 <br><span>무</span></p>
                                            <p>요구경력 <br><span>력</span></p>
                                            <p>연봉 <br><span>봉</span></p>
                                            <p>기술 <br><span>술</span></p>
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
                                                <h5>회사명</h5>
                                                <p>회사소개 </p>
                                                <h5>대표  <span>대표</span> </h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="leave-comment">
                            <button type="submit" class="site-btn">지원하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!-- Blog Details Section End -->
<%@ include file="../inc/bottom.jsp" %>