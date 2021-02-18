<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<style>
.oneQuestBox{
    padding: 30px 10px 0px 10px;
    height: auto;
    width: 92%;
    border-bottom: 1px solid silver;
    margin: 0px 30px 0 30px;
}
</style>
<script>

</script>

<p style="font-size: 18px;">
	북마크 <b id="myContCnt">${bookMarkCnt}</b>건
</p>

<!--아직 북마크한 질문이 없는 경우-->
<c:if test="${empty list}">
	<article id="noneQuestBox">
		<div class="noneBox">
			<i class="fa fa-commenting-o"></i>
			<p>아직 북마크한 질문이 없습니다.</p>
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
									<dd class="workkind">
									#${map["WORKKIND_NAME"] }</dd>
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
										<span class="reply">답변<span class="replyNum"> ${map['COMMENT_COUNT']}</span>&nbsp;&nbsp;|&nbsp;
										</span> <span class="readCnt">조회
											${map['QUESTION_VIEW']}&nbsp;&nbsp;|&nbsp;</span> <span
											class="regTime"> <fmt:formatDate
												value="${map['QUESTION_DATE']}" pattern="yyyy-MM-dd" />
										</span>
										<a class="bookmarked"
										href='<c:url value="/indiv/community/delBookMark.do?qstnNo=${map['QUESTION_NO']}"/>'>
										<i class="fa fa-bookmark" aria-hidden="true"></i></a>
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
