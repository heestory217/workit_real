<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.fa-weixin{
	font-size:20px;
}
</style>
	<p style="font-size: 18px;">
		답변 <b id="myContCnt">${totalCmt}</b>건
	</p>
	<c:if test="${empty cmtList }">
	<article id="noneQuestBox">
		<div class="noneBox">
			<i class="fa fa-commenting-o"></i>
			<p>아직 등록한 답변이 없습니다.</p>
		</div>
	</article>
</c:if>

<!-- 등록한 답변이 존재하는 경우  -->
<c:if test="${!empty cmtList }">
	<article id="questBox">
		<div class="qstnExistBox">
			<c:forEach var="map" items="${cmtList}">
				<div class="questBoxWrap">
					<div class="oneQuestBox">
						<div>
							<a
								href="<c:url value
='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"]}&userNo=${map["USER_NO"] }'/>"
								class="contentArea">
								<dl>
									<dt>
										<span>@ ${userId }</span>
										<span><fmt:formatDate
												value="${map['COMMENTRESPOND_DATE']}" pattern="yyyy-MM-dd" /></span>
									</dt>
									<!-- 답변 내용 -->
									<dd class="qtTitle">	
										<!-- 아이콘 -->
										${map['commentrespondAbout']}
									</dd>

									<!-- 내용 -->
									<dd class="qtContent">
										<span>질문 제목 : ${map['QUESTION_TITLE']}</span>
									</dd>

								</dl>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 답변 반복 끝 -->
			<%@include file="../cmtyPaging.jsp" %>
		</div>
	</article>
</c:if>
			