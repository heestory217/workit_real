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
	
</style>
</head>
<body>
<div class="divCmty">
<!-- asdie : 사이드 메뉴바 -->
<%@ include file="cmtyNavbar.jsp" %>	
 	
<section>
	<div id="container">
		<!--전체 질문 목록-->
		<div id="content" class="AllQuestList">
			<div class="top-title-wrap">
				<p class="title">전체질문</p>
			</div>
			<article id="questBox">
				<div class="questBoxWrap">
				<div class="oneQuestBox">
					<div>							
						<a href="<c:url value='/indiv/community/qstnDetail.do?qstnNo='/>"
							class="contentArea">
							<dl>
								<!-- 제목 -->
								<dt class="qtTitle">
								<i class="fa fa-quora"></i>
								<span>개발자 진로 고민입니다</span></dt>
								
								<!-- 내용 -->
								<dd class="qtContent">질문 내용<br />....</dd>
								
								<!-- 답변, 조회수, 작성시간 -->
								<dd class="cellBx">
									<span class="reply">답변<span class="replyNum"> 0</span>&nbsp;&nbsp;|&nbsp;</span>
									<span class="readCnt">조회 3&nbsp;&nbsp;|&nbsp;</span>
									<span class="regTime">14분 전  작성</span>
									<div class="bookmark"><i class="fa fa-bookmark-o" aria-hidden="true"></i></div>
								</dd>
							</dl>
						</a>
					</div>					
				</div>
				</div>
				
				<!-- 두번째  질문-->
				<div class="questBoxWrap">
				<div class="oneQuestBox">
					<div>							
						<a href="#" class="contentArea">
							<dl>
								<!-- 제목 -->
								<dt class="qtTitle"><i class="fa fa-quora"></i><span> 근무지가 어디인가요?</span></dt>
								
								<!-- 내용 -->
								<dd class="qtContent">질문 내용<br />....<br />....</dd>
								<!-- 답변, 조회수, 작성시간 -->
								<dd class="cellBx">
									<span class="reply">답변<span class="replyNum">0</span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="readCnt">조회 3&nbsp;&nbsp;|&nbsp;&nbsp;</span>
									<span class="regTime">14분 전  작성</span>
									<div class="bookmark"><i class="fa fa-bookmark-o" aria-hidden="true"></i></div>
								</dd>
							</dl>
						</a>
					</div>					
				</div>
				</div>
				<div class="paging">
				
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