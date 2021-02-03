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
	
	.qstnReplyCnt>b{
		color:#4c50bb;
		font-weight:600;
	}
	
	.fa-question{
        font-size: 9px;
	    border: 0.8px solid gray;
	    color: #a7a7a7;
	    padding: 2px;
	    position: relative;
	    cursor: pointer;
	    float: left;
	    margin-top: 13px;
	}
	
	.toggleBx{
		border: 0.8px solid gray;
	    width: 286px;
	    font-size: 13px;
	    background: #f4f3ff;
	    padding: 6px;
	    position: absolute;
 	    margin-left: 60px;
	}
	
	.answerBoard{
	    float: left;
	    margin-right: 0px;
	    padding-right: 5px;
	}
</style>
<script type="text/javascript">
	$(function(){
			$('.toggleBx').hide();
		$('.fa-question').click(function(){
			$('.toggleBx').toggle();
		});
	});
</script>
<!-- 커뮤니티 게시판, 사이드 메뉴 바 -->
<aside style="float:left">
    <div id="container">
		<!-- side nav  -->
			<div id="leftNav">
			<div id="questionBtn">
			<c:if test="${empty sessionScope.userNo }">
				<a href="<c:url value='/users/login.do'/>">
			</c:if>
			<c:if test="${!empty sessionScope.userNo }">
				<a href="<c:url value='/indiv/community/qstnWrite.do'/>">
			</c:if>
				<i class="fa fa-pencil"></i>&nbsp;질문하기</a>
			</div>
			<div class="myInfoSec">
			
				<!-- 로그인 안한 경우 -->
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
				
				<!-- 로그인한 경우 -->
				<c:if test="${!empty sessionScope.userNo}">
				<a class="myInfo" href
		="<c:url value='/indiv/community/myProfile.do?userNo=${sessionScope.userNo }&type=1'/>">
					<div id="userInfo">
						<i class="fa fa-user-circle userProfImg"></i><br>
						<span class="nickname">${sessionScope.userId }</span><br>
						<span class="qstnReplyCnt">질문 <b>${totalRecord }</b> 답변 <b>${totalCmt}</b> </span>
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
					<li class="sideNav"><div><a class="nav-link answerBoard" href
				="<c:url value='/indiv/community/answerList.do?type=1'/>">
						답변하기</a><i class="fa fa-question"></i></div></li>
				</ul>
				<div class="toggleBx">
					<span>
					답변하기 게시판은 회원 가입시 선택하신<br>직무를 기준으로 질문이 조회됩니다. 
					</span>
				</div>
			</div>
		</div>
</aside>