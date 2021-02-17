<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script> 
/* $('.carousel').carousel({ 
	interval: 4000  //기본 5초
})  */
</script>
<style>
	#searchImg{
		border-radius:10px;
		width:270px;
		height:180px;
	}
	
	.userName{
		color:#8566fa;
	}
	
	#divBx{
		width:290px;
	}
	
	#corpArea{
		font-size: 14px; 
		color: #989898;
	}
</style>

<div class="container containDiv">
	<p class="announceTit">
		<span class="userName">${sessionScope.userName}</span>님을 위한 맞춤 채용 공고
	</p>
	<!-- 슬라이드 시작 -->
	<c:if test="${!empty customList}">
		<div class="row">
			<c:forEach var="map" items="${customList}">
				<div class="col-lg-3 col-md-6 d-inline-block w-25">
					<div class="single-latest-blog" id="divBx">
						<a
							href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>">
							<img id="searchImg"
							src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
							onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
							<div class="corpInfoWrap">
								<div class="tag-list"
									style="margin-bottom: 0px; overflow: hidden;">
									<span class="field"> ${map['RECRUITANNOUNCE_TITLE'] } </span><br>
									<div class="tag-item" id="corpName">${map['CORP_NAME'] }
									</div>
								</div>
								<p class="margin_bottom_0" id="corpArea">${map['AREA_ADD1'] }
									· ${map['AREA_ADD2'] }</p>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	<!-- 슬라이드 끝 -->
</div>
