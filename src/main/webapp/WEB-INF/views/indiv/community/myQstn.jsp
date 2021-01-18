<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	.title{
		font-size: 22px;
	}
	
	.nullBoxWrap{
		border:solid 1px black;
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
	    background-color: skyblue;
	    border: solid 1px skyblue;
	    width: 140px;
	    height:53px;
	    padding-top: 15px;
	}
	
	.btnWrite{
		color:white;
		text-decoration: none;
	}
	
	#leftNav{
		border:1px solid gray;
		width:200px;
		height: 560px;
	}
	
	
	li a{
		vertical-align:center;
		text-decoration: none;
		color:black;
		margin: 0 10px;
	} 
	
	li a:hover{
		color:skyblue;
	}
	
	#searchBoxNav > input[type=text] {
	    width: 90%;
	    margin: 10px;
	}
	
	#content{
		width:800px;
	}
	
	#top{
		height:200px;
	}
	
	li #searchQuest{
		width: 95%;
	    height: 45px;
	    margin: 5px 5px 5px 5px;
	}
	
	#searchBoxNav hr{
		margin-top:0px;
	}
	
	em{
		color:skyblue;
	}
	
	#moreQuestBtn{
		width:160px;
		height:25px;
		padding:3px;
		margin:5px 0 5px 0;
		padding-left:5px;
		border:1px solid white;
		background-color:white;
		border-radius: 80px / 80px;
	}
	
	#moreQuestBtn a{
		font-size: 12px;
		color:blue;
	}
	
	.first-card{
		background-color: skyblue;
		color:white;
	}
	
	a:hover{
		color:white;
	}
	
	
	#questionBtn{
		width:90%;
		height:50px;
		margin:10px;
		background-color: skyblue;
		text-align: center;
		padding-top: 15px;
	}
	
	#questionBtn a{
		color:white;
		text-decoration: none;
		display: block;
		
	}
	
	.myInfoSec{
		border: 1px solid gray;
	    height: 150px;
	    margin: 10px;
	}
	
	#userInfo{
		text-align: center;
	    padding-top: 55px;
	}
	
	.popQstnCard{
		padding-left:0px;
		width:150px;
		height:200px;
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
</style>


<title>커뮤니티게시판</title>
</head>
<body>
<div class="myQstn">
	<!-- asdie : 사이드 메뉴바 -->
	<%@ include file="cmtyNavbar.jsp" %>	 	
	
	<section style="float:left; margin-left:30px;">
		<div id="container">
			<!-- 메인 : qnaMainWrap,  나의질문 : myQuestion 추가 -->
			<div id="content" class="qnaMainWrap myQuestion devQnaMainLayer">
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
							<a class="btnWrite qnaSpA devQuestionWrite"
								href
				="<c:url value='/community/questRegister.do'/>">
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
				        <h5 class="card-title">인기질문</h5>
				        <p class="card-text">지금 가장 관심받는 커리어 질문은?</p>
				        <span class="card-text">yyyy-mm-dd일 기준</span>
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