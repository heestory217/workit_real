<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 기업 subTop -->
 <div class="col-lg-8 col-md-8">
     <div class="advanced-search">
         <div class="input-group">
             <input type="text" placeholder="이력서를 직군, 언어, 이름으로 검색" id="searckKeyword" value="${param.searchKeyword }">
          	 <button type="button" id="searchBtn" onclick="search()"><i class="ti-search"></i></button>
         </div>
     </div>
 </div>
<div class="col-lg-2 text-right col-md-2">
     <ul class="nav-right">
     	<!-- 쪽지함 : 아이콘 바꿔야함 -->
         <li class="heart-icon">
             <a href="#">
                 <i class="fa fa-envelope-o" aria-hidden="true"></i>
                 <!-- 안읽은 메시지 갯수 표현: <span>1</span>  : 최대값 표현 : +99 -->
             </a>
         </li>
     	<!-- 장바구니 -->
         <li class="cart-icon">
             <a href="#">
                 <i class="icon_bag_alt"></i>
                 <span>3</span>
             </a>
             <div class="cart-hover">
                 <div class="select-items">
                     <table>
                         <tbody>
                         <!-- 장바구니에 담은 이력서 최대 3개 반복 -->
                             <tr>
                                 <td class="si-pic"><img src="img/select-product-1.jpg" alt=""></td>
                                 <td class="si-text">
                                     <div class="product-selected">
                                         <p>이력서 제목 자리</p>
                                         <h6>직무, 경력, 언어 자리</h6>
                                     </div>
                                 </td>
                                 <td class="si-close">
                                     <i class="ti-close"></i>
                                 </td>
                             </tr>
                         <!-- 장바구니에 담은 이력서 반복끝 -->
                         </tbody>
                     </table>
                 </div>
                 <div class="select-total">
                     <span>total:</span>
                     <h5>합계금액자리:원</h5>
                 </div>
                 <div class="select-button">
                     <a href="<c:url value='/shop/shoppingCart.do'/>" class="primary-btn view-card">장바구니 보러가기</a>
                     <a href="#" class="primary-btn checkout-btn">바로 결제하기</a>
                 </div>
             </div>
         </li>
     </ul>
 </div>
 </div>
 </div>
 </div>
  <!-- 네비게이션 시작-->
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>직군별 탐색</span>
                        <ul class="depart-hover">
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=서버 개발자'/>">서버 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=웹 개발자'/>">웹 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=자바 개발자'/>">JAVA 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=프론트엔드 개발자'/>">프론트엔드 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=안드로이드 개발자'/>">안드로이드 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=IOS 개발자'/>">iOS 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=빅데이터 엔지니어'/>">빅데이터 엔지니어</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=소프트웨어 엔지니어'/>">소프트웨어 엔지니어</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=머신러닝 엔지니어'/>">머신러닝 엔지니어</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=유니티 개발자'/>">유니티 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=Node.js 개발자'/>">Node.js 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=C,C++ 개발자'/>">C,C++ 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=VR 엔지니어'/>">VR 엔지니어</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="<c:url value='/corpSearch.do'/>">이력서 탐색</a></li>
                        <li><a href="#">구매 이력서</a></li>
                        <li><a href="#">포지션 제안</a></li>
                        <li><a href="#">기업 관리</a>
                            <ul class="dropdown">
                                <li><a href="<c:url value='/company/corp/corpDetail.do?corpNo=${corpNo}'/>">기업 정보</a></li>
                                <li><a href="#">채용 공고</a></li>
                            </ul>
                        </li>
                        <li><a href="#">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="#">회원 정보 수정</a></li>
                                <li><a href="#">결제 내역</a></li>
                            </ul>
                        </li>
                        <li><a href="#">서비스 안내</a></li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
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
    <script type="text/javascript">
    	function search(){
	    	var searchKeyword = document.getElementById("searckKeyword").value;
    		location.href="/workit/corpSearch.do?searchKeyword="+searchKeyword;
    	}
    </script>