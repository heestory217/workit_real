<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script> 
/* $('.carousel').carousel({ 
	interval: 4000  //기본 5초
}) */ 
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
	
	#corpName{
		 color: #4C4747; 
		 font-size:16px; 
		 font-weight:600;
	}
</style>

<div class="container containDiv">
<p class="announceTit">채용 마감 임박</p>
<div id="demo" class="carousel slide" data-ride="carousel"> 
	<div class="carousel-inner">

	<!-- 현재 날짜 계산 -->	
	
	
	
	<!-- 슬라이드 쇼 -->
	<c:if test="${!empty list}">
		<div class="carousel-item active">
			<div class="row">
				<c:forEach var="map" items="${list}" begin="0" end="3">
					<div class="col-lg-3 d-inline-block w-25">
						<div class="single-latest-blog" id="divBx">
						<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
							<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
								onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								<div class="corpInfoWrap">
									<div class="tag-list"
										style="margin-bottom: 0px; overflow: hidden;">
										<span class="field">
											${map['RECRUITANNOUNCE_TITLE'] }</span><br>
										<div class="tag-item" id="corpName">
											${map['CORP_NAME'] }
										</div>
										
										<!-- d-day 계산 -->
										<c:set var="today" value="<%=new java.util.Date()%>"/>
									 	<fmt:formatDate var="today" value="${today }" pattern="yyyy-MM-dd HH:mm:ss" />
									    <c:set var="enddate" value="${map['RECRUITANNOUNCE_ENDDATE'] }"/>
									    <fmt:parseDate value="${today }" var="today" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
										<fmt:parseDate value="${enddate }" var="enddate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${enddate.time / (1000*60*60*24)}" integerOnly="true" var="enddate"/>
										<!--  -->
										<div class="tag-item" style="color:#5a5a5a; font-size:14px;"
											<c:if test="${(enddate-today)==0 }">
												 style="color:#ff3b00;"
											</c:if>>
											<i class="fa fa-calendar-o" style="color: #4c50bb;"></i>
											<c:if test="${(enddate-today)>0 }">
												D-${enddate-today}
											</c:if>
											<c:if test="${(enddate-today)==0 }">
												오늘 마감
											</c:if>
											<!-- d-day 계산 끝 -->
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="carousel-item">
			<div class="row">
				<c:forEach var="map" items="${list}" begin="4" end="7">
					<!-- 첫번째  -->
					<div class="col-lg-3 d-inline-block w-25">
						<div class="single-latest-blog" id="divBx">
						<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
							<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
								onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								<div class="corpInfoWrap">
									<div class="tag-list"
										style="margin-bottom: 0px; overflow: hidden;">
										<span class="field">
											${map['RECRUITANNOUNCE_TITLE'] }</span><br>
										<div class="tag-item" style="color: #4C4747; font-size:16px; font-weight:600;">
											${map['CORP_NAME'] }
										</div>
										<!-- d-day 계산 -->
										<c:set var="today" value="<%=new java.util.Date()%>"/>
									 	<fmt:formatDate var="today" value="${today }" pattern="yyyy-MM-dd HH:mm:ss" />
									    <c:set var="enddate" value="${map['RECRUITANNOUNCE_ENDDATE'] }"/>
									    <fmt:parseDate value="${today }" var="today" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
										<fmt:parseDate value="${enddate }" var="enddate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${enddate.time / (1000*60*60*24)}" integerOnly="true" var="enddate"/>
										<!--  -->
										<div class="tag-item" style="color:#5a5a5a; font-size:14px;"
											<c:if test="${(enddate-today)==0 }">
												 style="color:#ff3b00;"
											</c:if>>
											<i class="fa fa-calendar-o" style="color: #4c50bb;"></i>
											<c:if test="${(enddate-today)>0 }">
												D-${enddate-today}
											</c:if>
											<c:if test="${(enddate-today)==0 }">
												오늘 마감
											</c:if>
											<!-- d-day 계산 끝 -->
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	
		<div class="carousel-item">
			<div class="row">
				<c:forEach var="map" items="${list}" begin="8" end="11">
					<!-- 첫번째  -->
					<div class="col-lg-3 d-inline-block w-25">
						<div class="single-latest-blog" id="divBx">
							<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${map["RECRUITANNOUNCE_NO"] }'/>"> 
							<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
								onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								<div class="corpInfoWrap">
									<div class="tag-list"
										style="margin-bottom: 0px; overflow: hidden;">
										<span class="field">
											${map['RECRUITANNOUNCE_TITLE'] }</span><br>
										<div class="tag-item" id="corpName">
											${map['CORP_NAME'] }
										</div>
										<!-- d-day 계산 -->
										<c:set var="today" value="<%=new java.util.Date()%>"/>
									 	<fmt:formatDate var="today" value="${today }" pattern="yyyy-MM-dd HH:mm:ss" />
									    <c:set var="enddate" value="${map['RECRUITANNOUNCE_ENDDATE'] }"/>
									    <fmt:parseDate value="${today }" var="today" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${today.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
										<fmt:parseDate value="${enddate }" var="enddate" pattern="yyyy-MM-dd"/>
										<fmt:parseNumber value="${enddate.time / (1000*60*60*24)}" integerOnly="true" var="enddate"/>
										<!--  -->
										<div class="tag-item" style="color:#5a5a5a; font-size:14px;"
											<c:if test="${(enddate-today)==0 }">
												 style="color:#ff3b00;"
											</c:if>>
											<i class="fa fa-calendar-o" style="color: #4c50bb;"></i>
											<c:if test="${(enddate-today)>0 }">
												D-${enddate-today}
											</c:if>
											<c:if test="${(enddate-today)==0 }">
												오늘 마감
											</c:if>
											<!-- d-day 계산 끝 -->
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</c:if>
	</div>
	<!--  슬라이드 쇼 끝 -->
	
	<!-- previous/next button --> 
	<a class="carousel-control-prev" href="#demo" data-slide="prev" style="margin-bottom: 120px;margin-left: -50px;"> 
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
	</a> 
	<a class="carousel-control-next" href="#demo" data-slide="next" style="margin-bottom: 120px;margin-right: -50px;"> 
		<span class="carousel-control-next-icon" aria-hidden="true"></span> 
	</a> 
</div>
</div>
