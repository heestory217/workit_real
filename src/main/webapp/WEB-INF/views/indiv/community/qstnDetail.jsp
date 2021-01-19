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
	
	.BoxWrap{
		border:solid 1px silver;
		padding:50px;
		width:100%;
		height:500px;
		
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
	
	.tit > p{
		font-size:25px;
		color: black;
		margin-top:20px;
	}
	
	.qnaSpB{
		font-size:40px;
		color:#4c50bb;
		margin-right:15px;
	}
	
	
	.cont > p{
		margin: 30px 17px;
		font-size:18px;
		color:black;
	}
	
	
	.cellBx{
		margin-bottom:0px;
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
					<article id="questBox">
						<div class="BoxWrap">
							<div class="tit">
								<p><i class="icoQ_on qnaSpB">Q</i>고등학교 졸업 예정자 입니다. 질문드립니다.</p>
							</div>
							<div class="cont">
	                            <p>제가 고등학교 졸업예정자인데 여기 회사가 군면제되는거죠? 그리고 혹시 기숙사 있는지 알 수 있을까요?<br/></p>
							</div>
							<div class="cellBx">
								 <span class="cell">조회 13</span><span class="cell">23분 전 작성</span>
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