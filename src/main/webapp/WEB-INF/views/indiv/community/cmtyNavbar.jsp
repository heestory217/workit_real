<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	#leftNav{
		border:1px solid silver;
		width:213px;
		height: 514px;
	}
	
	#questionBtn{
		width:90%;
		height:50px;
		margin:10px;
		background-color: #4c50bb;
		text-align: center;
		padding-top: 15px;
	}
	
	#questionBtn a{
		color:white;
		text-decoration: none;
		display: block;
		
	}
	
	.myInfoSec{
		border: 1px solid #f3f3f3;
	    height: 150px;
	    margin: 10px;
	    background-color: #f3f3f3;
	}
	
	#userInfo{
		text-align: center;
	    padding-top: 55px;
	}
	
	#searchBoxNav > input[type=text] {
	    width: 90%;
	    margin: 10px;
	}
	
	li #searchQuest{
		width: 95%;
	    height: 45px;
	    margin: 5px 5px 5px 5px;
	}
	
	li a{
		vertical-align:center;
		text-decoration: none;
		color:black;
		margin: 0 10px;
	} 
	
	#searchBoxNav hr{
		margin-top:0px;
	}
	
</style>

<!-- 커뮤니티 게시판, 사이드 메뉴 바 -->
<aside style="float:left">
    <div id="container">
		<!-- side nav  -->
			<div id="leftNav">
				<div id="questionBtn">
				<a href="#">질문하기</a>
			</div>
			<div class="myInfoSec">
				<a class="myInfo" href
		="<c:url value='/indiv/community/myProfile.do'/>">
					<div id="userInfo">
						<span class="nickname">닉네임</span>
					</div>
				</a>
			</div>
				<ul class="nav flex-column">
					<li class="sideNav" id="searchBoxNav">
						<input type="text" name="searchQuest" id="searchQuest" 
							placeholder="질문을 검색하세요" >
						<hr>
					</li>
					<li class="sideNav"><a class="nav-link userQstn" href
			="<c:url value='/indiv/community/myQstn.do'/>">
					나의 질문</a><hr></li>
					<li class="sideNav"><a class="nav-link allQstn" href
			="<c:url value='/indiv/community/qstnList.do'/>">
					전체 질문</a><hr></li>
					<li class="sideNav"><a class="nav-link" href="#">답변하기</a><hr></li>
				</ul>
			</div>
		</div>
</aside>