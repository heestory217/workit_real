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
		border:1px solid silver;
	}
	
	.oneQuestBox{
	    padding: 40px 10px;
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
		background-color: #f5f7ff;
	}
	
	#noneQuestBox{
		clear:both;
		height: 400px;
		text-align:center;
		border:1px solid silver;
	}
	
	.paging{
		clear:both;
	}
	
	.cellBx > span{
		float:left;
	}
	
	.cellBx > .bookmark{
		float:right;
		font-size:30px;
		padding-bottom: 20px;
	}
	
	.allQstn{
		color:#4c50bb;
		font-weight:bold;
	}
	
	.cellBx > span{
		font-size:13px;	
	}
	
	article{
		margin-bottom:30px;
	}
	
	.tabMenuWrap{
		height: 50px;
	    background-color:#f3f3f3;
		width:100%;
		border:1px solid silver;
	}
	
	
	.tabMenuWrap >div{
		float:left;
		width:25%;
		height:100%;
		text-align:center;
		padding-top:12px;
		background-color:#f3f3f3;
	}
	
	.tabMenuWrap >div:hover{
		background-color:#4c50bb;
		color:white;
		
	}
	
	#comntTab{
		border-right:1px solid silver;
		border-left:1px solid silver;
	}

	#bMarkTab{
		border-left:1px solid silver;
	}
	
	.fa-commenting-o{
	    font-size: 57px;
    	color: silver;
	}
	

	#myContCnt{
		color:#4c50bb;
	}
	
	.noneBox{
		padding:150px 0;
	}
	
	/* 임시 프로필 이미지  */
	
	#profile{
		height:150px;
		border:1px solid silver;
		background-color: #f5f7ff;
		padding:35px;
	}
	
	.imgBox {
    width: 80px;
    height: 80px; 
    border-radius: 70%;
    overflow: hidden;
	}
	
	.profilePic {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
</style>
</head>
<body>
<div class="divCmty">
<!-- asdie : 사이드 메뉴바 -->
<%@ include file="cmtyNavbar.jsp" %>	
 	
<section>
	<div id="container">
		<div id="content" class="AllQuestList">
			<article id="profile">
				<div class="imgBox" style="background: #BDBDBD;">
					<a>
				    <img class="profilePic" src
				="<c:url value='/resources/img/banner-1.jpg'/>">
					</a>
				</div>
			</article>

			<article id="tabMenu">
				<div class="tabMenuWrap">
					<div id="qstnTab"><a>질문</a></div>
					<div id="comntTab"><a>답변</a></div>
					<div id="replyTab"><a>댓글</a></div>
					<div id="bMarkTab"><a>북마크</a></div>
				</div>
			</article>
			
			<!--글 목록 : 아직 등록한 질문이 없는 경우-->
			<p style="font-size:18px;">질문 <b id="myContCnt">0건</b></p>
			<article id="noneQuestBox">
				<div class="noneBox">		
					<i class="fa fa-commenting-o"></i>					
					<p>아직 등록한 질문이 없습니다.</p>						
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