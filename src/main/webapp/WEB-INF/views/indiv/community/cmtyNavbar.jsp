<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 커뮤니티 게시판, 사이드 메뉴 바 -->
<aside style="float:left">
    <div id="container">
		<!-- side nav  -->
			<div id="leftNav">
				<div id="questionBtn">
				<a href="#">질문하기</a>
			</div>
			<div class="myInfoSec">
				<a href="#" class="myInfo">
					<div id="userInfo">
						<span class="nickname">닉네임</span>
					</div>
				</a>
			</div>
				<ul class="nav flex-column">
					<li class="nav-item" id="searchBoxNav">
						<input type="text" name="searchQuest" id="searchQuest" 
							placeholder="질문을 검색하세요" >
						<hr>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">나의 질문</a><hr></li>
					
					<li class="nav-item"><a class="nav-link" href="#">전체 질문</a><hr></li>
					<li class="nav-item"><a class="nav-link" href="#">답변하기</a><hr></li>
				</ul>
			</div>
		</div>
</aside>