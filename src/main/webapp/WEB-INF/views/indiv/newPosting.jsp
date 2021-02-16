<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

</script>
<style>
	
	#searchImg{
		border-radius:10px;
		width:270px;
		height:180px;
	}
	
	#divBx{
		width:290px;
	}
	
	.field{
		color: #4C4747; 
		font-size: 18px; 
		font-weight: bold;
	}
	
	.announceTit{
		font-size:22px;
		color:#4C4747;
		font-weight:600;
	}
</style>

<div class="container containDiv">
<p class="announceTit">신규 채용 회사</p>
<div id="new" class="carousel slide" data-ride="carousel"> 
	<!-- 슬라이드 시작 -->
	<c:if test="${!empty newPostList}">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="row">
					<c:forEach var="map" items="${newPostList}" begin="0" end="3">
						<div class="col-lg-3 d-inline-block w-25">
							<div class="single-latest-blog" id="divBx">
								<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
								<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>" onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
									<div class="corpInfoWrap">
										<div class="tag-list"
											style="margin-bottom: 0px; overflow: hidden;">
											<span class="field">
												${map['RECRUITANNOUNCE_TITLE'] }
											</span><br>
											<div class="tag-item" id="corpName">
												${map['CORP_NAME'] }
											</div>
										</div>
										<p class="margin_bottom_0" id="corpArea">
											${map['AREA_ADD1'] } · ${map['AREA_ADD2'] }
										</p>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		
		
			<div class="carousel-item">
				<div class="row">
					<c:forEach var="map" items="${newPostList}" begin="4" end="7">
						<div class="col-lg-3 d-inline-block w-25">
							<div class="single-latest-blog" id="divBx">
							<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
								<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>" onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
									<div class="corpInfoWrap">
										<div class="tag-list"
											style="margin-bottom: 0px; overflow: hidden;">
											<span class="field">
												${map['RECRUITANNOUNCE_TITLE'] }
											</span><br>
											<div class="tag-item"  id="corpName">
												${map['CORP_NAME'] }
											</div>
										</div>
										<p class="margin_bottom_0" id="corpArea">
											${map['AREA_ADD1'] } · ${map['AREA_ADD2'] }
										</p>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		
		
			<div class="carousel-item">
				<div class="row">
					<c:forEach var="map" items="${newPostList}" begin="8" end="11">
						<div class="col-lg-3 d-inline-block w-25" >
							<div class="single-latest-blog" id="divBx">
								<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
								<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>" onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
									<div class="corpInfoWrap">
										<div class="tag-list"
											style="margin-bottom: 0px; overflow: hidden;">
											<span class="field">
												${map['RECRUITANNOUNCE_TITLE'] }
											</span><br>
											<div class="tag-item"  id="corpName">
												${map['CORP_NAME'] }
											</div>
										</div>
										<p class="margin_bottom_0" id="corpArea">
											${map['AREA_ADD1'] } · ${map['AREA_ADD2'] }
										</p>
									</div>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
	</div>
</c:if>
	
	<!-- 슬라이드 끝 -->
	
	
	<!-- previous/next button --> 
	<a class="carousel-control-prev" href="#new" data-slide="prev" style="margin-bottom: 120px;margin-left: -50px;"> 
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
	</a> 
	<a class="carousel-control-next" href="#new" data-slide="next" style="margin-bottom: 120px;margin-right: -50px;"> 
		<span class="carousel-control-next-icon" aria-hidden="true"></span> 
	</a> 
</div>
</div>
