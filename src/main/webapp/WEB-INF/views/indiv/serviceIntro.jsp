<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
	#showReview{
		width:100%;
		height:140px;
		background:linear-gradient(45deg, #8965f9, #656AFA, #787bdc, #9765f9);
		color:white;
		overflow: hidden;
		padding:20px 30px 20px;
	}

	#reviewIcon{
		float:left;
		font-size: 30px;
	    padding: 5px 0px 5px 10px;
	}	
</style>

<!-- 
<div class="instagram-photo" style="background: #6856C3;" >
	<div class="container">
		<img style="max-height: 210px;" alt="배너" src="<c:url value="/resources/img/membership_banner_bg.png"/>">
	</div>
</div>

<div class="container" style="left: 25%; position: absolute; top: 29%;">
	<p style="font-size: 20px; color: white;">멤버십 <span style="-webkit-text-emphasis-style: dot;">기간별</span> 혜택</p>
	<h3 style="font-weight: 600; color: white;">worker의 솔직 <span style="color: gold;">기업리뷰</span> 열람권!</h3>
</div>
 -->

<!-- 리뷰 보러가기 -->
<div class="instagram-photo" id="showReview" >
	<div class="container containDiv">
		<p style="font-size: 20px; color: white; padding-left: 10%;">멤버십 <span style="-webkit-text-emphasis-style: dot;">기간별</span> 혜택</p>
		<h3 style="color: white; padding-left: 10%;">
			<i id="reviewIcon" class="fas fa-user-friends" style="padding-right: 20px;"></i> 
			worker들의 솔직 기업리뷰 열람권
		</h3>
	</div>
</div>
	
<!-- 본문 -->
<div class="container">
본문!
</div>

<%@ include file="../inc/bottom.jsp"%>