<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(function(){
		$('#mainSearchBtn').click(function(){
			location.href="/workit/indivSearch/indivKeywordSearch.do?keyword="+$('#mainSearchKeyword').val();
		});
		
	});
	function mainEnter(){
		if (window.event.keyCode == 13) { // 엔터키가 눌렸을 때 
			location.href="/workit/indivSearch/indivKeywordSearch.do?keyword="+$('#mainSearchKeyword').val();
		}
	}
</script>

<!-- 개인 subTop -->
 <div class="col-lg-8 col-md-8">
     <div class="advanced-search">
         <div class="input-group">
             <input type="text" placeholder="채용공고를 직군, 언어, 회사 이름으로 검색" id="mainSearchKeyword" onkeyup="mainEnter()">
             <button type="button" id="mainSearchBtn"><i class="ti-search"></i></button>
         </div>
     </div>
 </div>
 <div class="col-lg-2 text-right col-md-2">
     <ul class="nav-right">
         <!-- 쪽지함 -->
         <li class="heart-icon">
             <a href="<c:url value='/message/messageBox.do'/>">
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
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do?workkindno=1'/>">서버 개발자</a></li>
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do?workkindno=2'/>">웹 개발자</a></li>
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do?workkindno=3'/>">프론트엔드 개발자</a></li>
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do?workkindno=4'/>">자바 개발자</a></li>
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do?workkindno=5'/>">안드로이드 개발자</a></li>
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do?workkindno=6'/>">iOS 개발자</a></li>
                            <li><a href="<c:url value='/indivSearch/indivExploreWorkkind.do'/>">더보기     ></a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="<c:url value='/indivSearch/indivExplore.do'/>">채용 공고 탐색</a></li>
                        <li><a href="<c:url value='/resumes/resumesList.do'/>">이력서</a></li>
                        <li><a href="<c:url value='/indivMypage/indivMypageSituation.do?type=3'/>">마이페이지</a></li>
                        <li><a href="<c:url value='/indiv/community/qstnList.do'/>">커뮤니티</a></li>
                        <li><a href="#">서비스 안내</a></li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>