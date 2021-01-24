<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/themify-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/elegant-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/slicknav.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
    <style>
	.pi-text{
	  	position: absolute;
		left: 30px;
    	top: 30px;
	}
	</style>

<!-- 채용공고별 이력서 시작 -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="<c:url value='/resources/img/products/women-large.jpg'/>">
                        <h2>채용 공고별<br>지원자 현황</h2>
                        <a href="#">More</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                        	<!-- 클릭시 해당 공고의 채용 공고만 볼 수 있도록 ajax로 처리 -->
                            <li class="active">채용공고1</li>
                            <li>채용공고2</li>
                            <li>채용공고3</li>
                            <li>채용공고4</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                      <!-- 반복처리될 이력서 리스트 포맷 -->
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">3년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>3년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                        <!-- 반복 끝 -->
                        
                        <!-- 구현후 지울것 -->
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">2년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>2년차 웹 개발자의 자소서</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA
                                </div>
                            </div>
                        </div>
                        
                       	<div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">10년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>10년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                        
                        
                       <div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">10년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>10년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                       	
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--채용 공고별 추천 이력서 끝-->
    
    
    
    
    
    <!-- 맞춤이력서 시작 -->
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                        	<!-- 클릭시 해당 공고의 채용 공고만 볼 수 있도록 ajax로 처리 -->
                            <li class="active">채용공고1</li>
                            <li>채용공고2</li>
                            <li>채용공고3</li>
                            <li>채용공고4</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                      <!-- 반복처리될 이력서 리스트 포맷 -->
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">3년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>3년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                        <!-- 반복 끝 -->
                        
                        <!-- 구현후 지울것 -->
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">2년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>2년차 웹 개발자의 자소서</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA
                                </div>
                            </div>
                        </div>
                        
                       	<div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">10년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>10년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                        
                        
                       <div class="product-item">
                            <div class="pi-pic">
                                <img src="<c:url value='/resources/img/paper.jpg'/>">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">10년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>10년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
               <div class="col-lg-3">
                    <div class="product-large set-bg" data-setbg="<c:url value='/resources/img/products/women-large.jpg'/>">
                        <h2>맞춤 이력서<br>추천</h2>
                        <a href="#">More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 맞춤이력서 끝  -->
    
        <!-- Js Plugins -->
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.countdown.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.zoom.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.dd.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/main.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/check.js"/>" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/a86f09c0f4.js" crossorigin="anonymous"></script>