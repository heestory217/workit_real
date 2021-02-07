<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivSearch.css'/>" />    
<link rel="stylesheet" href="<c:url value="/resources/css/corpbootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/corpstyle.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">

<style>
	#ShowReview{
		width:100%;
		height:100px;
		background:linear-gradient(45deg, #8965f9, #656AFA, #787bdc, #9765f9);
		color:white;
		overflow: hidden;
		padding:26px;
		border-radius: 11px;
		margin:80px 0;
	}
	
	#reviewLink{
	    float: left;
	    padding:13px 30px 13px 10px;
	    font-size: 20px;
		font-weight:600;
	}
	
	#reviewBtn{
	    float: right;
	    background-color: white;
	    color: #4c50bb;
	    width: 150px;
	    height: 50px;
	    text-align: center;
	    padding: 13px;
	    font-weight: 600;
        border-radius: 8px;
	}

	#reviewIcon{
		float:left;
		font-size: 40px;
	    padding: 5px 0px 5px 10px;
	}	
	
	
	.firstImg, .secondImg, .thirdImg{
	  max-height: 300px;
	  overflow: hidden;
	}
	
	.firstImg img,.secondImg img,.thirdImg img{
	  max-height:initial;
	  margin-top:-15%;
	}
	
	.containDiv{
		margin-top:100px;
	}
	
	.moveDetailBx{
		padding:10px;
		width:300px;
		height:150px;
		border:1px solid white;
		border-radius:8px;
		background: white;
		text-align: left;
		float: right;
	}
	
	.moveDetailBx hr{
		margin:0px;
	}
	
	.goBtn{
		padding:14px;
		color:#4c50bb;
		height:35%;
		font-weight:600;
	}
	
	
	
	.corpName{
		padding:13px;
		height:65%;
	}
	
	.corpName h6{
		color:#4C4747;
	}
	
	.corpName h5{
		color:#424242;
		font-weight: 600;
	}
	
</style>

<!-- 슬라이드 배너 (광고 등록한 회사 보여주기) -->
<div id="banner" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<!-- 슬라이드 쇼 -->
		<div class="carousel-item active firstImg">
			<img class="d-block w-100"
				src="<c:url value='/resources/img/indivMainImg/woman-3190829_1920.jpg'/>"
				alt="First slide">
			<div class="carousel-caption d-none d-md-block">
			<div class="moveDetailBx">
			<div class="corpName">
				<h5>[오늘의 집]</h5>
				<h6>JAVA 프로그래머 채용</h6>
			</div>
			<hr style="margin:0px">
			<div class="goBtn">바로가기 > </div>
			</div>
			</div>
		</div>
		<div class="carousel-item secondImg">
			<img class="d-block w-100"
				src="<c:url value='/resources/img/indivMainImg/business-2717063_1920.jpg'/>"
				alt="Second slide">
		</div>
		<div class="carousel-item thirdImg">
			<img class="d-block w-100"
				src="<c:url value='/resources/img/indivMainImg/buildings-984195_1920.jpg'/>"
				alt="Third slide">
		</div>
		<!-- 슬라이드 쇼 끝 -->
		
		<!-- previous/next button -->
		<a class="carousel-control-prev" href="#banner" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> -->
		</a> <a class="carousel-control-next" href="#banner" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- <span>Next</span> -->
		</a>
		
		<!-- indicator -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
	</div>
	
	<!-- 배너 끝 -->





	<!-- 리뷰 보러가기 -->
	<div class="container containDiv">
		<div id="ShowReview">
			<i id="reviewIcon" class="fas fa-user-circle fa-stack-2px"></i> <i
				id="reviewIcon" class="fas fa-book fa-stack-1px"
				style="padding-left: 10px;"></i> <a id="reviewLink"> 다른 회원들이 작성한
				회사 리뷰를 열람해보세요 </a>
			<div id="reviewBtn">리뷰 보러가기</div>
		</div>
	</div>



	<!-- 채용 마감 임박순 -->
	<%@include file="nearDeadline.jsp"%>

	<!-- 채용 마감 임박순 -->
	<%@include file="newPosting.jsp"%>




