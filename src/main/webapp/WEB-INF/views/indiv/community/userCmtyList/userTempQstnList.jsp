<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!--아직 등록한 질문이 없는 경우-->
<p style="font-size: 18px;">
	임시저장 <b id="myContCnt">${tempCnt}</b>건
</p>

<c:if test="${empty list}">
	<article id="noneQuestBox">
		<div class="noneBox">
			<i class="fa fa-commenting-o"></i>
			<p>임시저장한 질문이 없습니다.</p>
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
='/indiv/community/qstnEdit.do?qstnNo=${map["QUESTION_NO"]}&userNo=${map["USER_NO"] }'/>"
								class="contentArea">
								<dl>
									<!-- 제목 -->
									<dt class="qtTitle">
										<i class="fa fa-quora"></i><span>${map['QUESTION_TITLE']}</span>
									</dt>

									<!-- 내용 -->
									<dd class="qtContent">
										<c:if test="${fn:length(map['questionAbout'])>=150}">
											${fn:substring(map['questionAbout'],0,150) } ...
										</c:if>
										<c:if test="${fn:length(map['questionAbout'])<150}">						
											${map['questionAbout'] }
										</c:if>
									</dd>

									<!-- 답변, 조회수, 작성시간 -->
									<dd class="cellBx">
										<span class="regTime">저장일 : <fmt:formatDate
											value="${map['QUESTION_DATE']}" pattern="yyyy-MM-dd" />
										</span>
										
										<c:if test="${!empty map['WORKKIND_NAME']}">
										<span>&nbsp;&nbsp;|&nbsp; 분야 : <span class="workkind">#${map["WORKKIND_NAME"] }</span>
											<!-- 직무 -->
										</span>
										</c:if>
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
