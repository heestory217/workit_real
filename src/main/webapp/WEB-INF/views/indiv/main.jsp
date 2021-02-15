<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivSearch.css'/>" />    

<style>
	.showReview{
		width:100%;
		height:90px;
		background:linear-gradient(45deg, #8965f9, #656AFA, #787bdc, #9765f9);
		color:white;
		overflow: hidden;
		padding:20px 30px;
		border-radius: 11px;
		margin:20px 0;
		cursor: pointer;
	}

	#joinWorkit{
	    height: 125px;
	    padding-left:255px;
	}
	
	#joinImg{
        width: 400px;
	    height: 200px;
	    position: absolute;
	    left: -43px;
	    top: -75px;
	}
	
	#joinBtn{
		margin:19px 20px;
	}
	
	
	#resumeEditBx{
		width:100%;
		height:90px;
		border:1px solid #6e41f7;
		background:white;
		color:#6e41f7;
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
        cursor: pointer;
	}
	
	#resumeIcon{
		float:left;
		font-size: 40px;
	    padding: 5px 0px 5px 10px;
	}	
	
	
	a#reviewLink{
	    float: left;
	    padding:13px 30px 13px 10px;
	    font-size: 20px;
		font-weight:lighter;
	    color: white;
	}
	
	a#resumLink{
	    float: left;
	    padding:13px 30px 13px 10px;
	    font-size: 20px;
		font-weight:lighter;
	    color: #6e41f7;
	}
	
	.mainBtn{
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
	
	#exploreRecruit{
		width: 100%;
	    height: 150px;
	    border: 1px solid #7a19fb;
	    background: white;
	    color: gray;
	    font-weight: 600;
	    overflow: hidden;
	    padding: 30px 60px;
	    border-radius: 11px;
	    margin: 20px 0;
	}
	
	#exploreRecruit a{
	    padding: 13px 30px 10px 160px;
	    font-size: 20px;
	    font-weight: inherit;
	    color: #4C4747;
	}
	
	#exploreImg{
       /*  width: 308px;
	    height: 150px;
	    position: relative;
	    left: 260px;
   	    top: -20px; */
   	    
   	    width: 400px;
	    height: 200px;
	    position: absolute;
	    left: 700px;
	    top: -44px;
	}
	
	#exploreBtn{
	  /*   border: 1px solid #7a19fb;
	    border-radius: 8px;
	    color: #7a19fb;
	    width: 200px;
	    height: 50px;
	    position: absolute;
	    text-align: center;
	    padding: 13px;
	    left: 380px;
	    margin-top: 5px; */
    
        border: 1px solid #7a19fb;
	    border-radius: 8px;
	    color: #7a19fb;
	    width: 200px;
	    height: 48px;
	    position: absolute;
	    text-align: center;
	    padding: 11px;
	    /* float: right; */
	    left: 513px;
	    margin-top: 12px;
	}
	
	.corpInfoWrap{
	    padding: 10px 30px 0 10px;
	}
	
	#exploreBx{
		position:relative;
		margin-top:100px;
		margin-bottom:100px;
		cursor: pointer;
	}
	
	.carousel{
	    height:300px;
	}
	
	
	#banner{
		margin-bottom:130px;
	}
	
	#joinBx{
		position: relative;
	    margin-top: 100px;
	    margin-bottom: 100px;
	    cursor: pointer;
	}
	
</style>

<!-- 슬라이드 배너 (광고 1급 서비스) -->
<div id="banner" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<!-- 슬라이드 쇼 -->
		<div class="carousel-item active firstImg">
			<img class="d-block w-100"
				src="<c:url value='/resources/img/indivMainImg/woman-3190829_1920.jpg'/>"
				alt="First slide">
			<div class="carousel-caption d-none d-md-block">
				<div class="moveDetailBx" style="margin-right:150px;float:right;object-fit:cover;">
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
</div>	
<!-- 배너 끝 -->
	

	<!-- 회원이 아닌 경우, 회원가입 링크 -->
	<c:if test="${empty sessionScope.userNo}">
	<div class="container containDiv"  id="joinBx">
	<img id="joinImg"
		alt="" src="<c:url value='/resources/img/indivMainImg/undraw_Balloons_re_8ymj.svg'/>">
			<div class="showReview" id="joinWorkit">
				<a href="<c:url value='/users/register.do'/>" 
				id="reviewLink"> 
				<b>WORK IT</b> 회원이 아니신가요?<br>
				지금 가입하시고 보다 다양한 서비스를 이용해보세요!
				 </a>
			<div id="joinBtn" class="mainBtn">회원가입 하러가기</div>
		</div>
	</div>
	</c:if>

	<!-- 리뷰 보러가기 -->
	<c:if test="${!empty sessionScope.userNo}">
	<div class="container containDiv">
		<div class="showReview">
			<i id="reviewIcon" class="fas fa-user-circle fa-stack-2px"></i> <i
				id="reviewIcon" class="fas fa-book fa-stack-1px"
				style="padding-left: 10px;"></i>
				<a href="<c:url value='/indiv/serviceIntro.do'/>" 
				id="reviewLink"> 리뷰 열람권을 구매하시고 기업의 리뷰, 연봉, 면접후기를 확인해보세요! 
				 </a>
			<div class="mainBtn" class="reviewBtn">리뷰 보러가기</div>
		</div>
	</div>

	
		<!-- 이력서 강화하기 -->
		<div class="container containDiv">
			<div id="resumeEditBx">
				<i id="resumeIcon" class="far fa-edit"
					style="padding-left: 10px;"></i> 
					<a href="<c:url value='/resumes/resumesList.do'/>" 
					id="resumLink"> 이력서를 작성, 수정하고 인사담당자에게 직접 면접 제안 받으세요 </a>
				<div id="resumeBtn">이력서 강화하기</div>
			</div>
		</div>
	</c:if>
	
	
	<!-- 회원 가입시 등록한 직무에 해당하는 채용 공고-->
	<c:if test="${!empty sessionScope.userNo }">
		<c:import url="/indiv/customPosting.do"/>	
	</c:if>

	<!-- 채용 마감 임박순 -->
	<c:import url="/indiv/nearDeadline.do"/>	
	
	<!-- 신규 채용 회사 -->
	<c:import url="/indiv/newPosting.do"/>	

	<!-- 오늘의 추천(광고 2급 서비스) -->
	<c:import url="/indiv/todayRcmd.do"/>	

	
	<!-- 직군별 탐색 바로가기 -->
	<div class="container" id="exploreBx" >
		<img id="exploreImg"
			alt="" src="<c:url value='/resources/img/indivMainImg/undraw_searching_p5ux.svg'/>">
		<div id="exploreRecruit">
			<a>아직 잘 모르시겠나요? 전체 공고를 살펴 보는 건 어때요?</a><br>
			<div id="exploreBtn">채용공고 탐색 하러가기</div>
		</div>
	</div>
	
<script>
	$(function(){
		$('#exploreBx').click(function(){
			location.href="<c:url value='/indivSearch/indivExplore.do'/>";
		});
		
		$('#reviewBtn').click(function(){
			location.href="<c:url value='/indiv/serviceIntro.do'/>";
		});
		
		$('#joinBtn').click(function(){
			location.href="<c:url value='/users/register.do'/>";
		});
	});

</script>	