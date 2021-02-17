<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!--아직 등록한 질문이 없는 경우-->
<p style="font-size: 18px;">
	질문 <b id="myContCnt">${qstnCnt}</b>건
</p>

<c:if test="${empty list}">
	<article id="noneQuestBox">
		<div class="noneBox">
			<i class="fa fa-commenting-o"></i>
			<p>아직 등록한 질문이 없습니다.</p>
		</div>
	</article>
</c:if>

<!-- 질문 목록 : 등록한 질문이 존재하는 경우  -->
<c:if test="${!empty list }">
	<article id="questBox">
		<div class="qstnExistBox">
			<c:forEach var="map" items="${list }">
				<div class="questBoxWrap">
					<div class="oneQuestBox">
						<div>
							<a
								href="<c:url value
='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"]}&userNo=${map["USER_NO"] }'/>"
								class="contentArea">
								<dl>
								
									<!-- 직무 -->
									<dd class="workkind">#${map["WORKKIND_NAME"] }</dd>
									<!-- 제목 -->
									<dt class="qtTitle">
										<i class="fa fa-quora"></i><span>${map['QUESTION_TITLE']}</span>
									</dt>

									<!-- 내용 -->
									<dd class="qtContent">
										<c:if test="${fn:length(map['questionAbout'])>=50}">
											${fn:substring(map['questionAbout'],0,50) } ...
										</c:if>
										<c:if test="${fn:length(map['questionAbout'])<50}">						
											${map['questionAbout'] }
										</c:if>
									</dd>

									<!-- 답변, 조회수, 작성시간 -->
									<dd class="cellBx">
										<span class="reply">답변 <span class="replyNum">
												${map['COMMENT_COUNT']}</span>&nbsp;&nbsp;|&nbsp;
										</span> <span class="readCnt">조회
											${map['QUESTION_VIEW']}&nbsp;&nbsp;|&nbsp;</span> <span
											class="regTime"> 
											
											<!-- 작성일 계산 -->
									<c:set var="today" value="<%=new java.util.Date()%>"/>
								 	<fmt:formatDate var="today" value="${today }" pattern="yyyy-MM-dd HH:mm:ss" />
								    <c:set var="regdate" value="${map['QUESTION_DATE'] }"/>
								    <fmt:parseDate value="${today }" var="today" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:parseNumber value="${today.time}" integerOnly="true" var="today"/>
									<fmt:parseDate value="${regdate }" var="regdate" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:parseNumber value="${regdate.time}" integerOnly="true" var="regdate"/>
									<c:set var="regtime" value="${(today-regdate)/1000 }"/>
									<c:set var="time" value="0"/>
									
									<c:if test="${regtime<60}">
										방금전 작성
									</c:if>
									<c:if test="${regtime>=60}">
										<fmt:parseNumber value="${regtime/60}" integerOnly="true" var="min"/>
									</c:if>
									<c:if test="${min<60}">
										${min}분 전 작성
									</c:if>
									<c:if test="${min>=60 && min<1440}">
										
										<fmt:parseNumber value="${min/60}" integerOnly="true" var="hour"/>
										${hour}시간 전 작성
									</c:if>
									<c:if test="${min>=1440}">
										<fmt:formatDate value="${map['QUESTION_DATE']}" pattern="yyyy-MM-dd"/>
									</c:if>
											
										</span>
									</dd>
								</dl>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 질문 반복 끝 -->
		</div>
		<!-- 페이징처리 -->
			<%@include file="../cmtyPaging.jsp" %>
		<!-- 페이징 끝 -->
		
	</article>
</c:if>
