<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style type="text/css">
	#leftNav{
		border:1px solid silver;
		width:213px;
		height: 514px;
	}
	
	.questionBtn{
		display: inline-block;
	}
	
	.fa-pencil{
		font-size:17px;
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
	    padding-top: 30px;
	}
	
	#NoneUserInfo{
		text-align: center;
	    padding-top: 40px;
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
	.fa-user-circle{
		font-size: 40px;
	    color: silver;
	    margin-bottom: 5px;
	}
	
	.nickName{
		font-size:15px;
	}

	.qstnReplyCnt{
		font-size:15px;
		color:gray;
	}
</style>
<script type="text/javascript">
	$(function(){
	});
</script>
<!-- 커뮤니티 게시판, 사이드 메뉴 바 -->
<aside style="float:left">
    <div id="container">
		<!-- side nav  -->
			<div id="leftNav">
			<div id="questionBtn">
				<a href="<c:url value='/indiv/community/qstnWrite.do'/>">
				<i class="fa fa-pencil"></i>&nbsp;질문하기</a>
			</div>
			<div class="myInfoSec">
				<c:if test="${empty sessionScope.userNo}">
				<a class="myInfo" href
		="<c:url value='/users/login.do'/>">
					<div id="NoneUserInfo">
						<i class="fa fa-user-circle"></i><br>
						<span class="noneNickname" style="font-size:13px;">
							<b style="text-decoration: underline;color:#4c50bb;" >로그인</b> 후 질문답변 해보세요!
						</span>
					</div>
				</a>
				</c:if>	
				<c:if test="${!empty sessionScope.userNo}">
				<a class="myInfo" href
		="<c:url value='/indiv/community/myProfile.do?userNick=${cmtyVo.userNicknum}'/>">
					<div id="userInfo">
						<i class="fa fa-user-circle userProfImg"></i><br>
						<span class="nickname">${cmtyVo.userNicknum }</span><br>
						<span class="qstnReplyCnt">질문 0 답변 0 </span>
						<input type="hidden" name="userNicknum" value="${cmtyVo.userNicknum}">
					</div>
				</a>
				</c:if>	
			</div>
				<ul class="nav flex-column">
					<li class="sideNav" id="searchBoxNav">
						<input type="text" name="searchQuest" id="searchQuest" 
							placeholder="질문을 검색하세요" >
						<hr>
					</li>
					<li class="sideNav">
					<c:if test="${empty sessionScope.userNo }">
						<a class="nav-link userQstn" href
				="<c:url value='/users/login.do'/>">
						나의 질문</a><hr>
					</c:if>
					<c:if test="${!empty sessionScope.userNo }">
					<a class="nav-link userQstn" href
			="<c:url value='/indiv/community/myQstn.do?userNo=${sessionScope.userNo }'/>">
					나의 질문</a><hr></c:if></li>
					<li class="sideNav"><a class="nav-link allQstn" href
			="<c:url value='/indiv/community/qstnList.do'/>">
					전체 질문</a><hr></li>
					<li class="sideNav"><a class="nav-link" href="#">답변하기</a><hr></li>
				</ul>
			</div>
		</div>
</aside>