<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 자주 묻는 질문  -->
<article id="popularQuest">
<div class="row">
  <div class="col-sm-3 popQstnCard">
    <div class="card first-card">
      <div class="card-body">
        <h5 class="card-title" style="color:white">인기질문</h5>
        <p class="card-text" style="color:white">지금 가장 관심받는 커리어 질문은?</p>
        <span class="card-text" style="color:white">yyyy-mm-dd일 기준</span>
        <div id="moreQuestBtn"><a href="#">인기질문 더보기</a></div>
      </div>
    </div>
  </div>
  <!-- 두번째 -->
  	<c:forEach var="map" items="${popQstnList }">
	  <div class="col-sm-3 popQstnCard">
	    <div class="card">
	      <div class="card-body">
	        <p class="card-title">@${map['USER_ID'] }</p>
	        <p class="card-text">${map['QUESTION_TITLE'] }</p>
	      </div>
	    </div>
	  </div>
  	</c:forEach>
  <!-- <!-- 세번째 
  <div class="col-sm-3 popQstnCard">
    <div class="card">
      <div class="card-body">
        <p class="card-title">@hong</p>
        <p class="card-text">현재 직무에 대해서 필요한 스펙이 있을까요?</p>
      </div>
    </div>
  </div>
  네번째
  <div class="col-sm-3 popQstnCard">
    <div class="card">
      <div class="card-body">
        <p class="card-title">@gildong</p>
        <p class="card-text">이력서 열람 후 보통 언제 연락이 오나요 ?</p>
      </div>
    </div>
  </div> -->
</div>	
</article>