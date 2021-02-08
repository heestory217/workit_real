<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivSearch.css'/>" />    
<link rel="stylesheet" href="<c:url value="/resources/css/corpbootstrap.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/corpstyle.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" type="text/css">

<style>
	#showReview{
		width:100%;
		height:90px;
		background:linear-gradient(45deg, #8965f9, #656AFA, #787bdc, #9765f9);
		color:white;
		overflow: hidden;
		padding:20px 30px;
		border-radius: 11px;
		margin:20px 0;
	}

	#resumeEditBx{
		width:100%;
		height:90px;
		border:1px solid #4c50bb;
		background:white;
		color:#4c50bb;
		overflow: hidden;
		padding:20px 30px;
		border-radius: 11px;
		margin:20px 0;
	}
	
	#resumeBtn{
	    float: right;
	    background:linear-gradient(45deg, #8965f9, #656AFA, #787bdc, #9765f9);
	    color: white;
	    width: 180px;
	    height: 50px;
	    text-align: center;
	    padding: 13px;
	    font-weight: 600;
        border-radius: 8px;
	}
	
	#resumeIcon{
		float:left;
		font-size: 40px;
	    padding: 5px 0px 5px 10px;
	}	
	
	
	#reviewLink{
	    float: left;
	    padding:13px 30px 13px 10px;
	    font-size: 20px;
		font-weight:lighter;
	}
	
	#reviewBtn{
	    float: right;
	    background-color: white;
	    color: #4c50bb;
	    width: 180px;
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
		margin-top:80px;
	}
	
	.moveDetailBx{
		padding:10px;
		width:300px;
		height:150px;
		border:1px solid white;
		border-radius:8px;
		background: white;
		text-align: left;
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
				<div class="moveDetailBx" style="margin-right:150px;float:right">
				<div class="corpName">
					<h5>[오늘의 집]</h5>
					<h6>JAVA 프로그래머 채용</h6>
				</div>
				<hr style="margin:0px">
				<div class="goBtn">바로가기 <i class="fas fa-angle-right"></i></div>
				</div>
			</div>
		</div>
		<div class="carousel-item secondImg">
			<img class="d-block w-100"
				src="<c:url value='/resources/img/indivMainImg/business-2717063_1920.jpg'/>"
				alt="Second slide">
			<div class="carousel-caption d-none d-md-block">
				<div class="moveDetailBx" style="margin-left:50px;float:left">
				<div class="corpName">
					<h5>[오늘의 집]</h5>
					<h6>JAVA 프로그래머 채용</h6>
				</div>
				<hr style="margin:0px">
				<div class="goBtn">바로가기 <i class="fas fa-angle-right"></i></div>
				</div>
			</div>
		</div>
		<div class="carousel-item thirdImg">
			<img class="d-block w-100"
				src="<c:url value='/resources/img/indivMainImg/buildings-984195_1920.jpg'/>"
				alt="Third slide">
			<div class="carousel-caption d-none d-md-block">
				<div class="moveDetailBx" style="margin-left:50px;float:left">
				<div class="corpName">
					<h5>[오늘의 집]</h5>
					<h6>JAVA 프로그래머 채용</h6>
				</div>
				<hr style="margin:0px">
				<div class="goBtn">바로가기 <i class="fas fa-angle-right"></i></div>
				</div>
			</div>
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
		<div id="showReview">
			<i id="reviewIcon" class="fas fa-user-circle fa-stack-2px"></i> <i
				id="reviewIcon" class="fas fa-book fa-stack-1px"
				style="padding-left: 10px;"></i> <a id="reviewLink"> 다른 회원들이 작성한
				회사 리뷰를 열람해보세요 </a>
			<div id="reviewBtn">리뷰 보러가기</div>
		</div>
	</div>

	<c:if test="${!empty sessionScope.userNo}">
		<!-- 이력서 강화하기 -->
		<div class="container containDiv">
			<div id="resumeEditBx">
				<i id="resumeIcon" class="far fa-edit"
					style="padding-left: 10px;"></i> <a id="reviewLink"> 이력서를 추가·수정하고, 인사담당자에게 직접 면접 제안 받으세요 </a>
				<div id="resumeBtn">이력서 강화하기</div>
			</div>
		</div>
	</c:if>
	
	<!-- 오늘의 추천 -->
	<c:import url="/indiv/todayRcmd.do"/>	

	<!-- 회원 가입시 등록한 직무에 해당하는 채용 공고-->
	<c:if test="${!empty sessionScope.userNo }">
		
	</c:if>

	<!-- 채용 마감 임박순 -->
	<c:import url="/indiv/nearDeadline.do"/>	
	<!-- 신규 채용 회사 -->
	<c:import url="/indiv/newPosting.do"/>	



