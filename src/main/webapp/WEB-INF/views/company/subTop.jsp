<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 기업 subTop -->
 <div class="col-lg-8 col-md-8">
     <div class="advanced-search">
         <div class="input-group">
             <input type="text" placeholder="이력서를 직군, 언어, 이름으로 검색" name="searckKeyword">
             <button type="button" id="searchBtn"><i class="ti-search"></i></button>
         </div>
     </div>
 </div>
<div class="col-lg-2 text-right col-md-2">
     <ul class="nav-right">
     	<!-- 쪽지함 : 아이콘 바꿔야함 -->
         <li class="heart-icon">
             <a href="#">
                 <i class="icon_heart_alt"></i>
                 <span>1</span>
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
                         <!-- 장바구니에 담은 이력서 반복 -->
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
                     <a href="#" class="primary-btn view-card">VIEW CARD</a>
                     <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
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
                            <li><a href="#">서버 개발자</a></li>
                            <li><a href="#">웹 개발자</a></li>
                            <li><a href="#">프론트엔드 개발자</a></li>
                            <li><a href="#">안드로이드 개발자</a></li>
                            <li><a href="#">iOS 개발자</a></li>
                            <li><a href="#">데이터 엔지니어</a></li>
                            <li><a href="#">소프트웨어엔지니어</a></li>
                            <li><a href="#">머신러닝 엔지니어</a></li>
                            <li><a href="#">데이터 사이언티스트</a></li>
                            <li><a href="#">시스템 관리자</a></li>
                            <li><a href="#">개발 매니저</a></li>
                            <li><a href="#">더보기     ></a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="#">이력서 탐색</a></li>
                        <li><a href="#">구매 이력서</a></li>
                        <li><a href="#">포지션 제안</a></li>
                        <li><a href="#">기업 관리</a>
                            <ul class="dropdown">
                                <li><a href="#">기업 정보</a></li>
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