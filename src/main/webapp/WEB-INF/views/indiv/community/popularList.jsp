<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>    

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/communityList.css'/>">

<style type="text/css">
	
	.header{
		width:100%;
		height:130px;
		margin-bottom:35px;
		border:1px solid silver;
		background: linear-gradient(45deg, #a565f9, #9773fb, #8c78dc, #9765f9);
	    padding: 35px;
	}
	
	.fa-crown{
	    color: #ffda24;
	    float: left;
	    font-size: 50px;
	    margin: 10px;
	}
	
	.headerTit{
		float:left;
	    padding-top: 5px;
	}
	
	.headerTit>h3, .headerTit>span{
		color:white;
	}
	
	.date{
		color: #ffffff94;
	    float: right;
	    padding: 45px 20px;
	    font-size: 13px;
	}
</style>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>



<div class="divCmty">
<!-- asdie : 사이드 메뉴바 -->
<c:import url="/indiv/community/cmtyNavbar.do">
	<c:param name="userNo" value="${userNo }"></c:param>
</c:import>
 	
<section>
	<div id="container">
		<!--전체 질문 목록-->
		<div id="content" class="AllQuestList">
			<div class="header">
				<div>
					<i class="fas fa-crown"></i>
					<div class="headerTit">
						<h3>인기 질문</h3>
						<span>지금 가장 관심 받는 커리어 질문은?</span>
					</div>
					<div class="date">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
						<c:out value="${today}"/>기준</p>
					</div>
				</div>
				
			</div>
			
			<form action="<c:url value='/indiv/community/popularList.do'/>" 
					name="frmPage" method="post">
				<input type="hidden" name="currentPage">
			</form>
			
				<!-- 질문 없는 경우 -->
				<c:if test="${empty qstnList}">
				<article id="questBox">
					<div class="NoneQquestBoxWrap">
						<div class="NoneQuestBox">
							<i class="fa fa-commenting-o"></i><br>
							<p>등록된 질문이 없습니다.</p>
						</div>
					</div>
				</article>
				</c:if>
			<!-- 질문 반복 시작 -->
				<c:if test="${!empty qstnList }">
				<article id="questBox">
				
				<c:forEach var="map" items="${qstnList }" varStatus="status">
				<div class="questBoxWrap">
				<div class="oneQuestBox">
					<div>							
						<a href
		="<c:url value='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"] }'/>"
							class="contentArea">
							<dl>
								<!-- 직무 -->
								<dd class="workkind">#${map["WORKKIND_NAME"] }</dd>
								<!-- 제목 -->
								<dt class="qtTitle">
								<i class="fa fa-quora"></i><span>${map['QUESTION_TITLE'] }</span></dt>
								
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
									<span class="reply">답변<span class="replyNum"> ${map['COMMENT_COUNT']}</span>&nbsp;&nbsp;|&nbsp;</span>
									<span class="readCnt">조회 ${map['QUESTION_VIEW'] }&nbsp;&nbsp;|&nbsp;</span>
									<span class="regTime">
									
									
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
			</article>
			</c:if>
		</div>
	</div>
</section>
<div style="clear:both;"></div>
</div>

<%@ include file="../../inc/bottom.jsp" %>