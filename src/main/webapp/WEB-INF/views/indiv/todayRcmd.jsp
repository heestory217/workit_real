<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script> 
/* $('.carousel').carousel({ 
	interval: 4000  //기본 5초
})  */
</script>
<style>
	#rcmdImg{
		border-radius:27px;
		height:300px;
		width:100%;
	}
	
	#bgColor{
		background: #8181ff14;
		height:560px;
    	margin-top: 80px;
	}
	
	.bannerContainer{
		padding:50px;
	}
	
	.rcmdBx{
		padding:50px 10px;
	}
</style>
<div id="bgColor">
<div class="container rcmdBx">
<p class="announceTit">오늘의 추천 공고</p>
<div id="rcmd" class="carousel slide" data-ride="carousel"> 
	<c:if test="${!empty secAdList}">
	<div class="carousel-inner"> 
		<!-- 슬라이드 쇼 -->
			
		<div class="carousel-item active">
			<div class="row">
				<c:forEach var="map" items="${secAdList }" begin="0" end="1">
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
						<img id="rcmdImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"] }'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<span class="field">
										${map['RECRUITANNOUNCE_TITLE'] }</span><br>
									<div class="tag-item" id="corpName">
										${map['CORP_NAME'] }
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> ${map['AREA_ADD1'] } · ${map['AREA_ADD2'] }
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 
									<fmt:formatNumber value="${map['RECRUITANNOUNCE_SPAY'] }" pattern="#,###"/>원
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
				
			<div class="carousel-item">
				<div class="row">
					<c:forEach var="map" items="${secAdList }" begin="2" end="3">
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
						<img id="rcmdImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"] }'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<span class="field">
										${map['RECRUITANNOUNCE_TITLE'] }</span><br>
									<div class="tag-item" id="corpName">
										${map['CORP_NAME'] }
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> ${map['AREA_ADD1'] } · ${map['AREA_ADD2'] }
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 
									<fmt:formatNumber value="${map['RECRUITANNOUNCE_SPAY'] }" pattern="#,###"/>원
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		
			<div class="carousel-item">
				<div class="row">
					<c:forEach var="map" items="${secAdList }" begin="4" end="5">
					<div class="col-lg-6 padding_5 d-inline-block w-25">
						<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
						<img id="rcmdImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"] }'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div style="padding: 10px 5px 0 10px;">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<span class="field">
										${map['RECRUITANNOUNCE_TITLE'] }</span><br>
									<div class="tag-item" id="corpName">
										${map['CORP_NAME'] }
									</div>
								</div>
								<p class="margin_bottom_0 gray"
									style="font-size: 13px; color: #545454;">
									<i class="fas fa-location-arrow"></i> ${map['AREA_ADD1'] } · ${map['AREA_ADD2'] }
								</p>
								<p class="margin_bottom_0 gray"
									style="font-size: 15px; color: #545454;">
									<i class="fas fa-dollar-sign"></i> 
									<fmt:formatNumber value="${map['RECRUITANNOUNCE_SPAY'] }" pattern="#,###"/>원
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</c:if>
	<!--  슬라이드 쇼 끝 -->
	
	<!-- previous/next button --> 
	<a class="carousel-control-prev" href="#rcmd" data-slide="prev" style="margin-bottom: -5px;margin-left: -50px;"> 
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
	</a> 
	<a class="carousel-control-next" href="#rcmd" data-slide="next" style="margin-bottom: -5px;margin-right: -50px;"> 
		<span class="carousel-control-next-icon" aria-hidden="true"></span> 
	</a> 
</div>
</div>
</div>