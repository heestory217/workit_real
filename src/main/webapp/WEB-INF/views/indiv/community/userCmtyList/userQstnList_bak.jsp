<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			<!-- 페이징 처리 -->

			<div class="paging col-lg-12">
				<!-- 이전블럭 -->	
				 <div class="product__pagination blog__pagination">
				 	<c:if test="${pagingInfo.firstPage>1 }">	
						<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
							<i class="fa fa-long-arrow-left"></i>
						</a>
					</c:if>
					
				<!-- [1][2][3][4][5][6][7][8][9][10] -->		
				<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
					<c:if test="${i==pagingInfo.currentPage }">
						<span id="currentPage" >
							${i}</span>			
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<a href="#" onclick="pageFunc(${i})">
							${i}</a>			
					</c:if>
				</c:forEach>
				
				<!-- 다음블럭 -->	
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
					<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
						<i class="fa fa-long-arrow-right"></i>
					</a>
				</c:if>
			    </div>			    
			</div>
			
			
			
			
			
			
		</div>
	</article>
</c:if>
