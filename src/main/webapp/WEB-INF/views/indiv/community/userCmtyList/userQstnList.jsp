<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--아직 등록한 질문이 없는 경우-->   

<p style="font-size: 18px;">
	질문 <b id="myContCnt">${totalRecord }</b>건
</p>
<c:if test="${empty qstnList}">
	<article id="noneQuestBox">
		<div class="noneBox">
			<i class="fa fa-commenting-o"></i>
			<p>아직 등록한 질문이 없습니다.</p>
		</div>
	</article>
</c:if>

<!-- 질문 목록 : 등록한 질문이 존재하는 경우  -->
<c:if test="${!empty qstnList }">
	<article id="questBox">
		<div class="qstnExistBox">
			<c:forEach var="map" items="${qstnList }">
				<div class="questBoxWrap">
					<div class="oneQuestBox">
						<div>
							<a
								href="<c:url value
='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"]}&userNo=${map["USER_NO"] }'/>"
								class="contentArea">
								<dl>
									<!-- 제목 -->
									<dt class="qtTitle">
										<i class="fa fa-quora"></i><span>${map['QUESTION_TITLE']}</span>
									</dt>

									<!-- 내용 -->
									<dd class="qtContent">${map['questionAbout']}</dd>

									<!-- 답변, 조회수, 작성시간 -->
									<dd class="cellBx">
										<span class="reply">답변<span class="replyNum">
												0</span>&nbsp;&nbsp;|&nbsp;
										</span> <span class="readCnt">조회
											${map['QUESTION_VIEW']}&nbsp;&nbsp;|&nbsp;</span> <span
											class="regTime"> <fmt:formatDate
												value="${map['QUESTION_DATE']}" pattern="yyyy-MM-dd" />
										</span>
									</dd>
								</dl>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 질문 반복 끝 -->
			<%@include file="../cmtyPaging.jsp" %>
		</div>
	</article>
</c:if>
						