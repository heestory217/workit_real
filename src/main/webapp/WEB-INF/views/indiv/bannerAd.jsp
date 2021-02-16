<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    

<style>

div#banner{
	height:365px;
	position:relative;
	margin-bottom: 100px;
}

#banner>div{
    width: 100%;
    overflow: hidden;
    height: 100%;
    position:relative;
}

.firstImg img, .secondImg img{
	overflow: hidden;
	margin-top:0px;
	position:relative;
	height:100%;
}


.thirdImg img{
	width:100%;
	height:100%;
	object-fit:cover;
    overflow: hidden;
    margin-top: -7%;
    position:relative;
}

.detailBx{
    position: absolute;
    top: 180px;
}


</style>



<div id="banner" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<!-- 슬라이드 쇼 -->
			<c:forEach var="map" items="${firAdList }" varStatus="status">
			<c:if test="${status.index==0}">
			<div class="carousel-item active firstImg">
				<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>">
				<img class="d-block w-100"
					src="<c:url value='/resources/img/indivMainImg/todayHouse_banner.jpg'/>"
					alt="First slide">
					<div class="carousel-caption d-none d-md-block detailBx" id="firstBx">
						<div class="moveDetailBx" >
							<div class="corpName">
								<h5>${map['CORP_NAME']}</h5><br>
								<h6 style="font-size:14px">
								<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])>=25}">
										${fn:substring(map['RECRUITANNOUNCE_TITLE'],0,25) } ...
								</c:if>
								<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])<25}">						
									${map['RECRUITANNOUNCE_TITLE'] }
								</c:if>	
							</h6>
							</div>
							<hr style="margin: 0px">
							<div class="goBtn">
								바로가기 <i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</a>
			</div>
			</c:if>
			<c:if test="${status.index==1}">
				<div class="carousel-item secondImg">
					<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>">
					<img class="d-block w-100"
						src="<c:url value='/resources/img/indivMainImg/naver_banner.jpg'/>"
						alt="Second slide">
					<div class="carousel-caption d-none d-md-block detailBx" id="secondBx">
						<div class="moveDetailBx">
						<div class="corpName">
							<h5>${map['CORP_NAME'] }</h5><br>
							<h6 style="font-size:14px">
								<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])>=25}">
										${fn:substring(map['RECRUITANNOUNCE_TITLE'],0,25) } ...
								</c:if>
								<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])<25}">						
									${map['RECRUITANNOUNCE_TITLE'] }
								</c:if>	
							</h6>
						</div>
						<hr style="margin:0px">
						<div class="goBtn">바로가기 <i class="fas fa-angle-right"></i></div>
						</div>
					</div>
					</a>
				</div>
			</c:if>
			<c:if test="${status.index==2}">
				<div class="carousel-item thirdImg">
					<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>">
					<img class="d-block w-100"
						src="<c:url value='/resources/img/indivMainImg/kakao_banner.jpg'/>"
						alt="Third slide">
					<div class="carousel-caption d-none d-md-block detailBx" id="thirdBx">
						<div class="moveDetailBx">
						<div class="corpName">
							<h5>${map['CORP_NAME'] }</h5><br>
							<h6 style="font-size:14px">
								<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])>=25}">
										${fn:substring(map['RECRUITANNOUNCE_TITLE'],0,25) } ...
								</c:if>
								<c:if test="${fn:length(map['RECRUITANNOUNCE_TITLE'])<25}">						
									${map['RECRUITANNOUNCE_TITLE'] }
								</c:if>	
							</h6>
						</div>
						<hr style="margin:0px">
						<div class="goBtn">바로가기 <i class="fas fa-angle-right"></i></div>
						</div>
					</div>
					</a>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<!-- 슬라이드 쇼 끝 -->
		<!-- prev/next -->
		<a class="carousel-control-prev bannerIcon" href="#banner" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <!-- <span>Previous</span> -->
		</a> <a class="carousel-control-next bannerIcon" href="#banner" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <!-- <span>Next</span> -->
		</a>
		
		<!-- indicator -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
</div>


<script>

</script>
