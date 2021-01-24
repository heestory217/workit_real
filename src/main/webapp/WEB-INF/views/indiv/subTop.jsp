<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 개인 subTop -->
 <div class="col-lg-8 col-md-8">
     <div class="advanced-search">
         <div class="input-group">
             <input type="text" placeholder="채용공고를 직군, 언어, 회사 이름으로 검색" name="searckKeyword">
             <button type="button" id="searchBtn"><i class="ti-search"></i></button>
         </div>
     </div>
 </div>
 <div class="col-lg-2 text-right col-md-2">
     <ul class="nav-right">
         <!-- 쪽지함 -->
         <li class="heart-icon">
             <a href="#">
             	<i class="fa fa-envelope-o" aria-hidden="true"></i>
                 <!-- 안읽은 메시지 갯수 표현: <span>1</span>  : 최대값 표현 : +99 -->
                 
             </a>
         </li>
         <!-- 북마크 -->
         <li class="heart-icon">
             <a href="#">
                 <i class="fa fa-bookmark-o" aria-hidden="true"></i>
             </a>
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
                        <li><a href="#">채용 공고 탐색</a>
                            <ul class="dropdown">
                                <li><a href="#">지역별 탐색</a></li>
                                <li><a href="#">언어별 탐색</a></li>
                                <li><a href="#">경력별 탐색</a></li>
                            </ul>
                        </li>
                        <li><a href="#">이력서</a></li>
                        <li><a href="#">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="<c:url value='/indivMypage/indivMypageEdit.do'/>">회원 정보 수정</a></li>
                                <li><a href="#">채용 지원 현황</a></li>
                                <li><a href="#">포지션 제안 내역</a></li>
                                <li><a href="#">결제 내역</a></li>
                            </ul>
                        </li>
                        <li><a href="<c:url value='/indiv/community/qstnList.do'/>">커뮤니티</a></li>
                        <li><a href="#">서비스 안내</a></li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>