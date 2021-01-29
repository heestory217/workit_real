<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	font-size:18px;
	color:gray;
}

.regdate{
	font-size:16px;
	font-weight:lighter;
	color:gray;
}

.questionTitle{
	font-size: 15px;
    color: #5f5f5f
}

.cmntAbout{
	font-size: 20px;
    color: black;
    font-weight: lighter;
}
</style>

<script type="text/javascript">
function pageFunc(curPage) {
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>
    
<!-- 페이징 처리를 위한 form  -->
<form action="<c:url value='/indiv/community/myProfile.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"> 
	<input type="hidden" name="userNo" value="${userNo}"> 
</form>




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
	<article id="cmntBox">
		<div class="qstnExistBox">
			<c:forEach var="map" items="${cmtList}">
				<div class="questBoxWrap">
					<div class="oneCmntBox">
						<div>
							<a
								href="<c:url value
='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"]}&userNo=${map["USER_NO"] }'/>"
								class="contentArea">
								<dl>
									<dt>
										<i class="far fa-comment-dots"></i>&nbsp;&nbsp;
										<span class="userName">@${userId }</span>
										<span class="regdate">&nbsp;<fmt:formatDate
												value="${map['COMMENTRESPOND_DATE']}" pattern="yyyy-MM-dd" /></span>
									</dt>
									<!-- 답변 내용 -->
									<dd class="cmntAbout">	
										${map['commentrespondAbout']}
									</dd>

									<!-- 내용 -->
									<dd class="questionTitle">
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
			