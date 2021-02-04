<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>


<style type="text/css">
	.divCmty{
		width: 1140px;
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
	
	.nullBoxWrap{
		padding :20px;
		width:100%;
		height:300px;
		
	}	
	
	.msgBx{
		margin: 80px 0 30px 0;
		text-align: center;
	}
	
	.btnBx{
		margin: 0 auto;
	    text-align: center;
	    background-color: #4c50bb;
	    border: solid 1px #4c50bb;
	    width: 140px;
	    height:53px;
	    padding-top: 15px;
	}
	
	.btnWrite{
		color:white;
		text-decoration: none;
	}
	
	.btnWrite:hover{
		color:white;
	}
	
	#content{
		width:800px;
	}
	
	em{
		color:#4c50bb;
	}
	
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
	
	/*  */
	
	#questBox{
		border-top:1px solid silver;
		border-left:1px solid silver;
		border-right:1px solid silver;
		border-bottom:1px solid silver;
	}
	
	.oneQuestBox{
	    padding: 30px 10px 40px 10px;
	    height: auto;
	    width: 92%;
	    border-bottom: 1px solid silver;
	    margin: 0px 30px 0 30px;
	}
	
    
	.qtTitle{
		font-size: 20px;
		color:black;
		font-weight:lighter;
	}

	.qtContent{
		font-size:18px;
		color:#5f5f5f;
	}
	
	.fa-quora{
		font-size:22px;
		color:#4c50bb;	
		margin-right: 5px;
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
	    padding: 35px 0;
		clear:both;
	}
	
	.questBoxWrap:hover{
		background-color: #f5f7ff;;
	}
	
	.cellBx > span{
		float:left;
		font-size:14px;	
	}

	.userQstn{
		font-weight: bold;
		color:#4c50bb;
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
	
	.workkind{
		margin: 0 0 18px 0;
	    font-size: 13px;
	    background-color: #c0c0c059;
	    width: max-content;
	}
	
	.card-workkind{
		margin-bottom:0px;
	    font-size: 13px;
	    width: max-content;
	    color:#adadad;
	}
	
	.fa-crown{
		color:#ffda24;
		margin-right:5px;
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
	<c:param name="userNo" value="${userId }"></c:param>
</c:import>	 	
<section>
<div id="container">
	<div id="content" class="myQuestion">
		<div class="top-title-wrap">
			<p class="title">
			<span style="color:#4c50bb">${userId }</span>님의 질문
			</p>
		</div>
		
		<!-- 페이징 처리를 위한 form  -->
		<form action="<c:url value='/indiv/community/myQstn.do'/>" 
				name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="userNo" value="${userNo}">
		</form>
			
		<article id="questBox">
		<!-- 등록한 질문이 없는 경우  -->
		<c:if test="${empty qstnList || empty sessionScope.userNo}">
		<div class="nullBoxWrap">
			<p class="msgBx">
				아직 등록한 질문이 없습니다!<br> 원하는 <em>직무, 기업</em> 을 선택하여 고민을
				질문해보세요.
			</p>
			<div class="btnBx">
				<a class="btnWrite"
					href
		="<c:url value='/indiv/community/qstnWrite.do'/>">
				질문하기</a>
			</div>
		</div>
		</c:if>					
		
		<!-- 회원이 등록한 질문지 존재하는 경우  -->
		<c:if test="${!empty qstnList }">
			<c:forEach var="map" items="${qstnList }">
				<div class="questBoxWrap">
					<div class="oneQuestBox">
						<div>
							<a href="<c:url value='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"]}'/>"
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
									<span class="reply">답변<span class="replyNum">
											0</span>&nbsp;&nbsp;|&nbsp;
									</span> <span class="readCnt">조회 ${map['QUESTION_VIEW']}&nbsp;&nbsp;|&nbsp;</span> <span
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
			</c:if>
		</article>


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
			        <a href="<c:url value='/indiv/community/answerList.do?type=2'/>">
			    	    인기질문 더보기</a></div>
			      </div>
			    </div>
			  </div>
			  <!-- 인기 있는 질문 반복 -->
			  	<c:forEach var="map" items="${popQstnList }" varStatus="status">
				  <div class="col-sm-3 popQstnCard">
			  	  <c:set var="cnt" value="${status.count}"/>
				  <c:if test="${cnt==1 }">
				    <div class="card" style="border:1px solid #5b9dff;">
				  </c:if>
				  <c:if test="${cnt==2 }">
				    <div class="card" style="border:1px solid #934fff;">
				  </c:if>
				  <c:if test="${cnt==3 }">
				    <div class="card" style="border:1px solid #b0dc75;">
				  </c:if>
				      <div class="card-body">
				      <a href="<c:url value='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"] }'/>">
				      	<div style="height:20%">
				        	<p class="card-title" style="font-size:18px;color:#4C4747">@${map['USER_ID'] }</p>
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
	  	</div>
	</div>	
</section>
	<div style="clear:both;"></div>
</div>


<%@ include file="../../inc/bottom.jsp" %>