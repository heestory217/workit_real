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
		border:solid 1px silver;
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
	
	.userQstn{
		color:#4c50bb;
		font-weight:bold;
	}
</style>


<title>커뮤니티게시판</title>
</head>
<body>
<div class="divCmty">
	<!-- asdie : 사이드 메뉴바 -->
	<%@ include file="cmtyNavbar.jsp" %>	 	
	
	<section>
		<div id="container">
			<!-- 나의질문, 등록한 질문이 없는 경우-->
			<div id="content" class="myQuestion">
				<div class="top-title-wrap">
					<p class="title">나의질문</p>
				</div>
				<article id="questBox">
					<div class="nullBoxWrap">
						<p class="msgBx">
							아직 등록한 질문이 없습니다!<br> 원하는 <em>직무, 기업</em> 선배들에게 커리어 고민을
							질문해보세요.
						</p>
						<div class="btnBx">
							<a class="btnWrite"
								href
				="<c:url value='/indiv/community/qstnWrite.do'/>">
							질문하기</a>
						</div>
					</div>
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
				        <p class="card-title">@eunbi</p>
				        <p class="card-text">면접 연락 못받은 경우</p>
				      </div>
				    </div>
				  </div>
				  <!-- 세번째 -->
				  <div class="col-sm-3 popQstnCard">
				    <div class="card">
				      <div class="card-body">
				        <p class="card-title">@eunbi</p>
				        <p class="card-text">중소기업 원래 이런가요?</p>
				      </div>
				    </div>
				  </div>
				  <!-- 네번째 -->
				  <div class="col-sm-3 popQstnCard">
				    <div class="card">
				      <div class="card-body">
				        <p class="card-title">@eunbi</p>
				        <p class="card-text">중소기업 원래 이런가요?</p>
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