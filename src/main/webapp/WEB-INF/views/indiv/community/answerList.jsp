<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>    

<style type="text/css">
	.divCmty{
		width: 1140px;/*1104px*/
		margin:0 auto;
		margin-bottom:30px;
	}
	
	section{
		float:left; 
		margin-left:30px;
		margin-top:40px;
	}
	
	.title{
		font-size: 22px;
	}
	
	
	#content{
		width:800px;
	}
	
	#questBox{
		border-top:1px solid silver;
		border-left:1px solid silver;
		border-right:1px solid silver;
		border-bottom:1px solid silver;
		clear:both;
	}
	
	.oneQuestBox{
	    padding: 30px 10px 40px 10px;
	    height: auto;
	    width: 92%;
	    border-bottom: 1px solid silver;
	    margin: 0px 30px 0 30px;
	}
	
	.NoneQuestBox{
	    padding: 150px 10px;
	    height: 430px;
	    width: 92%;
	    margin: 0px 30px 0 30px;
	    text-align: center;
	    color:silver;
	}
	
	.NoneQuestBox>p{
		font-size:16px
	}
	
    .fa-commenting-o {
		font-size: 57px;
		color: silver;
	}
	.qtTitle{
		font-size: 19px;
		color:black;
		font-weight:lighter;
	}

	.qtContent{
		font-size:17px;
		color:#5f5f5f;
	}
	
	.fa-quora{
		font-size:22px;
		color:#4c50bb;	
		margin-right: 5px;
	}
	
	.workkind{
		margin: 0 0 18px 0;
	    font-size: 13px;
	    background-color: #c0c0c059;
	    width: max-content;
	}
	
	dd{
		margin-top:20px;
	}
	
	.cellBx{
		color:gray;
	}
	
	.replyNum{
		color:black;
		font-weight:bold;
	}
	
	.paging{
		height:100px;
		text-align:center;
		clear:both;
	    padding: 25px 0;
	}
	
	.questBoxWrap:hover{
		background-color: #f5f7ff;;
	}
	
	.cellBx > span{
		float:left;
	}
	
	.cellBx > .bookmark{
		float:right;
		font-size:25px;
		padding-bottom: 20px;
	}
	
	.cellBx > span{
		font-size:14px;	
	}
	
	a.answerBoard{
		font-weight: bold;
		color:#4c50bb !important;
	}
	
	
	/* 페이징처리 */
	.product__pagination a,
		.blog__pagination a,
		#currentPage {
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 1px solid #b2b2b2;
		font-size: 14px;
		color: #b2b2b2;
		font-weight: 700;
		line-height: 28px;
		text-align: center;
		-webkit-transition: all, 0.3s;
		-moz-transition: all, 0.3s;
		-ms-transition: all, 0.3s;
		-o-transition: all, 0.3s;
		transition: all, 0.3s;
		margin-right: 0;
	}
		
	.product__pagination a:hover,
	.blog__pagination a:hover,
	#currentPage {
		background: #4C50BB;
		border-color: #4C50BB;
		color: #ffffff;
	}
		
	.product__pagination a:last-child,
	.blog__pagination a:last-child {
		margin-right: 0;
	}
	
	.selectMenu{
		float: right;
	    font-size: 14px;
	    margin: 15px 10px 5px;
	}
	
	.selected{
		color:#4C50BB;
	}
	
	.fa-check{
		margin-right:3px;
	}
	
	/* 인기 있는 질문 */
		
	#moreQuestBtn{
		width:148px;
		height:25px;
		margin:5px 0 5px 0;
		padding-left:5px;
		border:1px solid white;
		background-color:white;
		border-radius: 80px / 80px;
		text-align: center;
    	padding-bottom: 25px;
	}
	
	#moreQuestBtn a{
		font-size: 12px;
		color:blue;
	}
	
	.first-card{
		/* background-color: #4c50bb; */
		background:linear-gradient(45deg, #8965f9, #656AFA, #787bdc, #9765f9);
		color:white;
	}
	 
	a{
		color:#4c50bb;
	}
	
	.popQstnCard{
		padding-left:0px;
		width:150px;
		height:215px;
		float:left;
	}
	
	#popularQuest{
		margin-top:30px;
		padding:0;
    	margin-left: 15px;
	}
	
	
	.card{
		width:100%;
		height:100%;
	}
		
	.fa-crown{
		color:#ffda24;
		margin-right:5px;
	}
	
	.card-workkind{
		margin-bottom:0px;
	    font-size: 13px;
	    width: max-content;
	    color:#adadad;
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
			<div class="top-title-wrap">
				<p class="title">답변하기</p>
			</div>
			
			<!-- 자주 묻는 질문  -->
			<article id="popularQuest">
				<div class="row">
				  <div class="col-sm-3 popQstnCard">
				    <div class="card first-card">
				      <div class="card-body">
				        <h5 class="card-title" style="color:white;height:15%">
				        	<i class="fas fa-crown"></i>인기질문
				        </h5>
				        <p class="card-text" style="color:#ffffffc7;height:25%;font-size:17px">
				        	지금 가장 관심받는 커리어 질문은?</p>
				        <p class="card-text" style="color:#ffffff99;height:20%;font-size:13px">
				        <jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy.MM.dd" var="today" />
							<c:out value="${today}"/>기준</p>
				        <div id="moreQuestBtn" style="height:10%">
				        <a href="<c:url value='/indiv/community/popularList.do'/>">
				    	    인기질문 더보기</a></div>
				      </div>
				    </div>
				  </div>
				  <!-- 인기 있는 질문 반복 -->
				  	<c:forEach var="map" items="${popQstnList }" varStatus="status">
					  <div class="col-sm-3 popQstnCard">
				  	  <c:set var="cnt" value="${status.count}"/>
					  <c:if test="${cnt==1 }">
					    <div class="card" style="border:1px solid #4fd6ff;">
					  </c:if>
					  <c:if test="${cnt==2 }">
					    <div class="card" style="border:1px solid #4fffae;">
					  </c:if>
					  <c:if test="${cnt==3 }">
					    <div class="card" style="border:1px solid #f5b57e;">
					  </c:if>
					      <div class="card-body" >
					  <a href="<c:url value='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"] }'/>">
					      	<div style="height:20%">
					        	<p class="card-title" style="font-size: 18px;color:#4C4747">@${map['USER_ID'] }</p>
					        </div>
					        <div style="height:60%">
					        	<p class="card-text" style="font-size:16px;color:#4C4747">${map['QUESTION_TITLE'] }</p>
					        </div>
					        <div style="height:20%">
					        	<p class="card-workkind"> #${map['WORKKIND_NAME'] } </p>
					        </div>
						 	</a>
					     </div>
					    </div>
					  </div>
			 	 	</c:forEach>
			  	</div>
		  	</article>
			
			
			
			
			<div class="selectMenu">
				<a href="<c:url value='/indiv/community/answerList.do?type=1'/>"
					<c:if test="${param.type==1 }">class="selected"</c:if>
					<c:if test="${param.type!=1 }">style="color:#4C4747"</c:if>>
				<i class="fa fa-check"></i>최신순&nbsp; | &nbsp; </a>
				<a href="<c:url value='/indiv/community/answerList.do?type=2'/>"
					<c:if test="${param.type==2 }">class="selected"</c:if>
					<c:if test="${param.type!=2 }">style="color:#4C4747"</c:if>>
				<i class="fa fa-check"></i>추천순&nbsp; | &nbsp; </a>
				<a href="<c:url value='/indiv/community/answerList.do?type=3'/>"
					<c:if test="${param.type==3}">class="selected"</c:if>
					<c:if test="${param.type!=3 }">style="color:#4C4747"</c:if>>
				<i class="fa fa-check"></i>답변적은순  </a>
			</div>
			
			<form action="<c:url value='/indiv/community/answerList.do?type=${param.type }'/>" 
					name="frmPage" method="post">
				<input type="hidden" name="currentPage">
			</form>
			
				<!-- 답변 글이 없는 경우 -->
				<c:if test="${empty qstnListByWorkkind}">
				<article id="questBox">
					<div class="NoneQquestBoxWrap">
						<div class="NoneQuestBox">
							<i class="fa fa-commenting-o"></i><br>
							<p>답변 가능한 질문이 없습니다.</p>
						</div>
					</div>
				</article>
				</c:if>
				
				<!-- 글 반복 시작 -->
				<c:if test="${!empty qstnListByWorkkind }">
				<article id="questBox">
					<c:forEach var="map" items="${qstnListByWorkkind }">
				<a href
		="<c:url value='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"] }'/>"
							class="contentArea">
				<div class="questBoxWrap">
				<div class="oneQuestBox">
					<div>							
						
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
									<span class="reply">답변 <span class="replyNum"> ${map['COMMENT_COUNT']}</span>&nbsp;&nbsp;|&nbsp;</span>
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
						</div>					
						</div>
					</a>
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