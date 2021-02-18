<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<style>

#cmntBox{
    border-top: 1px solid silver;
    border-left: 1px solid silver;
    border-right: 1px solid silver;
    border-bottom: 1px solid silver;
}


.oneCmntBox{
    padding: 22px 10px 0px;
    height: auto;
    width: 92%;
    border-bottom: 1px solid silver;
    margin: 0px 30px 0 30px;
}

.fa-comment-dots{
	color:#4C50BB;
	font-size:22px;
}

.userName{
	font-size:16px;
	color:gray;
}

.regdate{
	font-size:13px;
	font-weight:lighter;
	color:gray;
}

.questionTitle{
	font-size: 15px;
    color: #5f5f5f;
    margin-bottom:20px;
}

.cmntAbout{
	font-size:16px;
    color: black;
    font-weight: lighter;
}

#adoptIcon{
    padding: 3px 0px;
    color: #ff4c08;
    float: right;
    font-size: 15px;
}

.selectedComment{
	margin-top:0px !important;
	overflow: hidden;
}
#adoptCmntCnt{
	color:#ff3c3c;
}
</style>

<p style="font-size: 18px;">
	답변 <b id="myContCnt">${cmntCnt}</b>건 (채택<b id="adoptCmntCnt"> ${AdoptCnt}</b>건)
</p>

<!--답변 목록 : 아직 등록한 답변이 없는 경우-->
<c:if test="${empty list }">
	<article id="noneQuestBox">
		<div class="noneBox">
			<i class="fa fa-commenting-o"></i>
			<p>아직 등록한 답변이 없습니다.</p>
		</div>
	</article>
</c:if>

<!-- 등록한 답변이 존재하는 경우  -->
<c:if test="${!empty list}">
	<article id="cmntBox">
		<div class="qstnExistBox">
			<c:forEach var="map" items="${list}">
				<div class="questBoxWrap">
					<div class="oneCmntBox">
						<div>
							<a
								href="<c:url value
='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"]}&userNo=${map["USER_NO"] }'/>"
								class="contentArea">
								<dl>
									<dt>
										<i class="far fa-comment-dots"></i>&nbsp;&nbsp; <span
											class="userName">@${userId }</span> <span
											class="regdate">&nbsp;<fmt:formatDate
												value="${map['COMMENTRESPOND_DATE']}"
												pattern="yyyy-MM-dd" /></span>
									</dt>
									<!-- 답변 내용 -->
									<dd class="cmntAbout">
										<c:if test="${fn:length(map['commentrespondAbout'])>=50}">
											${fn:substring(map['commentrespondAbout'],0,50) } ...
										</c:if>
										<c:if test="${fn:length(map['commentrespondAbout'])<50}">						
											${map['commentrespondAbout'] }
										</c:if>
									</dd>
									
									
									<!-- 내용 -->
									<dd class="questionTitle">
										<span>질문 제목 : ${map['QUESTION_TITLE']}</span>
									</dd>

									<!-- 채택된 답변인 경우 -->
									<c:if test="${map['COMMENTRESPOND_LIKENUM']==1}">						
										<dd class="selectedComment">
									   		<span id="adoptIcon"><i class="far fa-check-circle"></i>&nbsp;채택된 답변</span>
										</dd>
									</c:if>
								
								</dl>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 답변 반복 끝 -->
		</div>
		<!-- 페이징처리 -->
			<%@include file="../cmtyPaging.jsp" %>
		<!-- 페이징 끝 -->
	</article>
</c:if>


			