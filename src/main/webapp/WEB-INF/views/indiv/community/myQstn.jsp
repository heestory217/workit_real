<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		padding:3px;
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
		background-color: #4c50bb;
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
	    padding: 40px 10px;
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
		font-size:16px;
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
	}
	
	.questBoxWrap:hover{
		background-color: #f5f7ff;;
	}
	
	.paging{
		clear:both;
	}
	
	.cellBx > span{
		float:left;
	}

	.cellBx > span{
		font-size:13px;	
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
	
</style>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<title>커뮤니티게시판</title>
</head>
<body>
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
		        <h5 class="card-title" style="color:white">인기질문</h5>
		        <p class="card-text" style="color:white">지금 가장 관심받는 커리어 질문은?</p>
		        <span class="card-text" style="color:white">yyyy-mm-dd일 기준</span>
		        <div id="moreQuestBtn"><a href="#">인기질문 더보기</a></div>
		      </div>
		    </div>
		  </div>
		  <!-- 두번째 -->
		  <div class="col-sm-3 popQstnCard">
		    <div class="card">
		      <div class="card-body">
		        <p class="card-title">@silver</p>
		        <p class="card-text">이력서 자기소개서 작성 팁이 궁금합니다. </p>
		      </div>
		    </div>
		  </div>
		  <!-- 세번째 -->
		  <div class="col-sm-3 popQstnCard">
		    <div class="card">
		      <div class="card-body">
		        <p class="card-title">@hong</p>
		        <p class="card-text">현재 직무에 대해서 필요한 스펙이 있을까요?</p>
		      </div>
		    </div>
		  </div>
		  <!-- 네번째 -->
		  <div class="col-sm-3 popQstnCard">
		    <div class="card">
		      <div class="card-body">
		        <p class="card-title">@gildong</p>
		        <p class="card-text">이력서 열람 후 보통 언제 연락이 오나요 ?</p>
		      </div>
		    </div>
		  </div>
		</div>	
		</article>
		</div>
	</div>
</section>
	<div style="clear:both;"></div>
</div>

</body>
</html>


<%@ include file="../../inc/bottom.jsp" %>