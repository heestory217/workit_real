<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<style type="text/css">
.divCmty {
	width: 1140px; /*1104px*/
	margin: 0 auto;
	margin-bottom: 30px;
}

section {
	float: left;
	margin-left: 30px;
	margin-top: 40px;
}

.title {
	font-size: 22px;
}

#content {
	width: 800px;
}


.oneQuestBox {
	padding: 40px 10px;
	width: 92%;
	border-bottom: 1px solid silver;
	margin: 0px 30px 0 30px;
}

.qtTitle {
	font-size: 20px;
	color: black;
	font-weight: lighter;
}

.qtContent {
	font-size: 18px;
	color: #5f5f5f;
}

.fa-quora {
	font-size: 22px;
	color: #4c50bb;
}

dd {
	margin-top: 20px;
}

.cellBx {
	color: gray;
}

.replyNum {
	color: black;
	font-weight: bold;
}

.paging {
	height: 100px;
	clear: both;
	text-align: center;
}

.questBoxWrap:hover {
	background-color: #f5f7ff;
}

#noneQuestBox {
	clear: both;
	height: 400px;
	text-align: center;
	border: 1px solid silver;
}

.cellBx>span {
	float: left;
	font-size: 14px;
}

.allQstn {
	color: #4c50bb;
	font-weight: bold;
}

article {
	margin-bottom: 30px;
}

.tabMenuWrap {
	height: 50px;
	background-color: #f3f3f3;
	width: 100%;
	border: 1px solid silver;
}

.tabMenuWrap>div {
	float: left;
	width: 25%;
	height: 100%;
	text-align: center;
	padding-top: 12px;
	background-color: #f3f3f3;
}

.tabMenuWrap>div:hover {
	background-color: #4c50bb;
	color: white;
	cursor: pointer;
}

#comntTab {
	border-right: 1px solid silver;
	border-left: 1px solid silver;
}

#bMarkTab {
	border-left: 1px solid silver;
}

.fa-commenting-o {
	font-size: 57px;
	color: silver;
}

#myContCnt {
	color: #4c50bb;
}

/* 임시 프로필 이미지  */
#profile {
	height: 150px;
	border: 1px solid silver;
	background-color: #f5f7ff;
	padding: 35px;
	overflow:hidden;
}

.imgBox {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	float:left;
}

.imgBox>a{
	color:black;
}
	
.profileId{
    float: left;
    height: 100%;
   	margin: 25px;
   	font-size: 20px;
}

.profilePic {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.noneBox{
	padding-top: 160px;
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
		clear:both;
		text-align:center;
		padding:35px 0;
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
	
	.allQstn{
		color:#4c50bb;
		font-weight:bold;
	}
	
	.cellBx > span{
		font-size:13px;	
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
	
	.tab-content.current{
		display: inherit;
	}
	
	.tab-content{
		display: none;
	}
</style>
<script type="text/javascript">
$(function(){
	$('#tabMenu .tabMenuWrap').find('div').click(function(){
		var tab_id=$(this).attr('data-tab');
		
		$('.tabMenuWrap').find('div').removeClass('current');
		$('.tab-content').removeClass('current');
		
		$('#tabMenu .tabMenuWrap').find('div').addClass('current');
		$('#'+tab_id).addClass('current');
		
	});
});


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
			<c:param name="userNo" value="${userNo}"></c:param>
			<c:param name="userId" value="${userId}"></c:param>
		</c:import>

<!-- 페이징 처리를 위한 form  -->
<form action="<c:url value='/indiv/community/myProfile.do'/>" 
		name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="userNo" value="${userNo}">
	<input type="hidden" name="questionNo" value="${param.questionNo}">
</form>
	
<section>
	<div id="container">
		<div id="content" class="AllQuestList">
			<article id="profile">
				<div class="imgBox" style="background: #BDBDBD;overflow:hidden;" >
					<a href="#"><img class="profilePic"
						src="<c:url value='/resources/img/banner-1.jpg'/>"></a>
				</div>
				<div class="profileId">
					<span>${userId }</span>
				</div>
				<div>
				</div>
			</article>

			<!-- 탭 메뉴 -->
			<article id="tabMenu">
				<div class="tabMenuWrap">
					<div id="qstnTab" class="tab-link current" data-tab="tab-1">
						<a href="<c:url value='/indiv/community/myProfile.do?userNo=${userNo }'/>">질문</a>
					</div>
					<div id="comntTab" class="tab-link" data-tab="tab-2">
						<a 
					href="<c:url value='/indiv/community/myComment.do?cmtNo=${cmtNo }'/>">답변</a>
					</div>
					<div id="replyTab">
						<a>댓글</a>
					</div>
					<div id="bMarkTab">
						<a>북마크</a>
					</div>
				</div>
			</article>

			<!--글 목록 : 아직 등록한 질문이 없는 경우-->
					<div id="tab-1" class="tab-content current">
						<p style="font-size: 18px;">
							질문 <b id="myContCnt">${pagingInfo.totalRecord }</b>건
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
									<%@include file="cmtyPaging.jsp" %>
								</div>
							</article>
						</c:if>
						
					</div><!-- 질문 tab목록 -->
					
					
<!--답변 목록 : 아직 등록한 답변이 없는 경우-->
<div id="tab-2" class="tab-content">
	<c:if test="${empty cmtList }">
	<p style="font-size: 18px;">
		답변 <b id="myContCnt">0</b>건
	</p>
		<article id="noneQuestBox">
			<div class="noneBox">
				<i class="fa fa-commenting-o"></i>
				<p>아직 등록한 답변이 없습니다.</p>
			</div>
		</article>
	</c:if>	
</div>
					
					
				</div>

			</div>
		</section>
		<div style="clear: both;"></div>
	</div>

</body>
</html>

<%@ include file="../../inc/bottom.jsp"%>