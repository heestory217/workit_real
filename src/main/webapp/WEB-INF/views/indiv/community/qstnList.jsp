<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
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
	}
	
	.oneQuestBox{
	    padding: 40px 10px;
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
		font-size:13px;	
	}
	
	.allQstn{
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

</head>
<body>
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
				<p class="title">전체질문</p>
			</div>
			
			<form action="<c:url value='/indiv/community/qstnList.do'/>" 
					name="frmPage" method="post">
				<input type="hidden" name="currentPage">
			</form>
			
			<!-- 질문 없는 경우 아이콘, 문구 정하기!!! -->
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
					<c:forEach var="map" items="${qstnList }">
									
				<div class="questBoxWrap">
				<div class="oneQuestBox">
					<div>							
						<a href
		="<c:url value='/indiv/community/cntUpdate.do?qstnNo=${map["QUESTION_NO"] }'/>"
							class="contentArea">
							<dl>
								<!-- 제목 -->
								<dt class="qtTitle">
								<i class="fa fa-quora"></i><span>${map['QUESTION_TITLE'] }</span></dt>
								
								<!-- 내용 -->
								<dd class="qtContent">${map['questionAbout'] }</dd>
								
								<!-- 답변, 조회수, 작성시간 -->
								<dd class="cellBx">
									<span class="reply">답변<span class="replyNum"> 0</span>&nbsp;&nbsp;|&nbsp;</span>
									<span class="readCnt">조회 ${map['QUESTION_VIEW'] }&nbsp;&nbsp;|&nbsp;</span>
									<span class="regTime">
										<fmt:formatDate value="${map['QUESTION_DATE']}"
											pattern="yyyy-MM-dd"/>
									</span>
									<div class="bookmark"><i class="fa fa-bookmark-o" aria-hidden="true"></i></div>
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

</body>
</html>
<%@ include file="../../inc/bottom.jsp" %>