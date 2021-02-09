<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script> 
/* $('.carousel').carousel({ 
	interval: 4000  //기본 5초
})  */
</script>
<style>
	#rcmdImg{
		border-radius:7px;
		height:300px;
		width:100%;
	}
	
	#bgColor{
		background: #8181ff14;
		height:520px;
	}
	
	.bannerContainer{
		padding:50px;
	}
	
	.rcmdBx{
		padding:50px 10px;
	}
</style>
<div id="bgColor">
<div class="container rcmdBx"><p style="font-size:22px;color:#4C4747;font-weight:600">오늘의 추천</p>
<div id="rcmd" class="carousel slide" data-ride="carousel"> 
	<div class="carousel-inner"> 
		<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<div class="row">
					<!-- 첫번째  -->
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/index.do'/>"> <img id="rcmdImg"
							src="<c:url value='/pd_images/'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<P
										style="color: #4C4747; float: left; font-size: 16px; font-weight: bold;">
										JAVA 개발자</P>
									<div class="tag-item"
										style="color: #4C4747; float: right; font-size: 14px; padding-right: 5px;">
										<i class="fa fa-calendar-o" style="color: #4c50bb;"></i> D-19
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> 서울 · 한국
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 1,000,000원
								</p>
							</div>
						</a>
					</div>
					<!-- 두번째  -->
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/index.do'/>"> <img id="rcmdImg"
							src="<c:url value='/pd_images/'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<P
										style="color: #4C4747; float: left; font-size: 16px; font-weight: bold;">
										JAVA 개발자</P>
									<div class="tag-item"
										style="color: #4C4747; float: right; font-size: 14px; padding-right: 5px;">
										<i class="fa fa-calendar-o" style="color: #4c50bb;"></i> D-19
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> 서울 · 한국
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 1,000,000원
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="carousel-item">
				<div class="row">
					<!-- 첫번째  -->
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/index.do'/>"> <img id="rcmdImg"
							src="<c:url value='/pd_images/'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<P
										style="color: #4C4747; float: left; font-size: 16px; font-weight: bold;">
										JAVA 개발자</P>
									<div class="tag-item"
										style="color: #4C4747; float: right; font-size: 14px; padding-right: 5px;">
										<i class="fa fa-calendar-o" style="color: #4c50bb;"></i> D-19
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> 서울 · 한국
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 1,000,000원
								</p>
							</div>
						</a>
					</div>
					<!-- 두번째  -->
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/index.do'/>"> <img id="rcmdImg"
							src="<c:url value='/pd_images/'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<P
										style="color: #4C4747; float: left; font-size: 16px; font-weight: bold;">
										JAVA 개발자</P>
									<div class="tag-item"
										style="color: #4C4747; float: right; font-size: 14px; padding-right: 5px;">
										<i class="fa fa-calendar-o" style="color: #4c50bb;"></i> D-19
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> 서울 · 한국
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 1,000,000원
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="row">
					<!-- 첫번째  -->
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/index.do'/>"> <img id="rcmdImg"
							src="<c:url value='/pd_images/'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<P
										style="color: #4C4747; float: left; font-size: 16px; font-weight: bold;">
										JAVA 개발자</P>
									<div class="tag-item"
										style="color: #4C4747; float: right; font-size: 14px; padding-right: 5px;">
										<i class="fa fa-calendar-o" style="color: #4c50bb;"></i> D-19
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> 서울 · 한국
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 1,000,000원
								</p>
							</div>
						</a>
					</div>
					<!-- 두번째  -->
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/index.do'/>"> <img id="rcmdImg"
							src="<c:url value='/pd_images/'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<P
										style="color: #4C4747; float: left; font-size: 16px; font-weight: bold;">
										JAVA 개발자</P>
									<div class="tag-item"
										style="color: #4C4747; float: right; font-size: 14px; padding-right: 5px;">
										<i class="fa fa-calendar-o" style="color: #4c50bb;"></i> D-19
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> 서울 · 한국
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 1,000,000원
								</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	<!--  슬라이드 쇼 끝 -->
	
	<!-- previous/next button --> 
	<a class="carousel-control-prev" href="#rcmd" data-slide="prev" style="margin-bottom: 95px;margin-left: -50px;"> 
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
	</a> 
	<a class="carousel-control-next" href="#rcmd" data-slide="next" style="margin-bottom: 95px;margin-right: -50px;"> 
		<span class="carousel-control-next-icon" aria-hidden="true"></span> 
	</a> 
</div>
</div>
</div>