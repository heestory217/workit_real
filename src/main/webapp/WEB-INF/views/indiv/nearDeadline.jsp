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
		border-radius:7px;
		width:270px;
		height:180px;
	}
	
</style>

<div class="container containDiv"><p style="font-size:24px;color:#4C4747;font-weight:600">채용 마감 임박</p>
<div id="demo" class="carousel slide" data-ride="carousel"> 
	<div class="carousel-inner">
	<!-- 슬라이드 쇼 -->
	<c:if test="${!empty list}">
		<div class="carousel-item active">
			<div class="row">
				<c:forEach var="map" items="${list}" begin="0" end="3">
					<div class="col-lg-3 padding_5 d-inline-block w-25">
						<div class="single-latest-blog">
							<a href="<c:url value='/index.do'/>"> 
							<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
								onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								<div style="padding: 10px 5px 0 5px;">
									<div class="tag-list"
										style="margin-bottom: 0px; overflow: hidden;">
										<span
											style="color: #4C4747; font-size:18px; font-weight:bold;">
											${map['RECRUITANNOUNCE_TITLE'] }</span><br>
										<div class="tag-item" style="color: #4C4747; font-size:16px; font-weight:600;">
											${map['CORP_NAME'] }
										</div>
										<div class="tag-item" style="color:#4C4747; font-size:14px;">
											<i class="fa fa-calendar-o" style="color: #4c50bb;"></i>
											<!-- d-day -->
											<c:set var="today" value="<%=new java.util.Date()%>"/>
										 	<fmt:formatDate var="today" value="${today }" pattern="yyyyMMdd" />
									        <fmt:formatDate var="enddate" value="${map['RECRUITANNOUNCE_ENDDATE'] }" pattern="yyyyMMdd" />
									        D-${enddate-today }
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
					<div class="col-lg-3 padding_5 d-inline-block w-25">
						<div class="single-latest-blog">
							<a href="<c:url value='/index.do'/>"> 
							<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
								onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								<div style="padding: 10px 5px 0 5px;">
									<div class="tag-list"
										style="margin-bottom: 0px; overflow: hidden;">
										<span
											style="color: #4C4747; font-size:18px; font-weight:bold;">
											${map['RECRUITANNOUNCE_TITLE'] }</span><br>
										<div class="tag-item" style="color: #4C4747; font-size:16px; font-weight:600;">
											${map['CORP_NAME'] }
										</div>
										<div class="tag-item" style="color:#4C4747; font-size:14px;">
											<i class="fa fa-calendar-o" style="color: #4c50bb;"></i>
											<!-- d-day -->
											<c:set var="today" value="<%=new java.util.Date()%>"/>
										 	<fmt:formatDate var="today" value="${today }" pattern="yyyyMMdd" />
									        <fmt:formatDate var="enddate" value="${map['RECRUITANNOUNCE_ENDDATE'] }" pattern="yyyyMMdd" />
									        D-${enddate-today }
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
					<div class="col-lg-3 padding_5 d-inline-block w-25">
						<div class="single-latest-blog">
							<a href="<c:url value='/index.do'/>"> 
							<img id="searchImg" src="<c:url value='/pd_images/${map["CORP_IMGURL"]}'/>"
								onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								<div style="padding: 10px 5px 0 5px;">
									<div class="tag-list"
										style="margin-bottom: 0px; overflow: hidden;">
										<span
											style="color: #4C4747; font-size:18px; font-weight:bold;">
											${map['RECRUITANNOUNCE_TITLE'] }</span><br>
										<div class="tag-item" style="color: #4C4747; font-size:16px; font-weight:600;">
											${map['CORP_NAME'] }
										</div>
										<div class="tag-item" style="color:#4C4747; font-size:14px;">
											<i class="fa fa-calendar-o" style="color: #4c50bb;"></i>
											<!-- d-day -->
											<c:set var="today" value="<%=new java.util.Date()%>"/>
										 	<fmt:formatDate var="today" value="${today }" pattern="yyyyMMdd" />
									        <fmt:formatDate var="enddate" value="${map['RECRUITANNOUNCE_ENDDATE'] }" pattern="yyyyMMdd" />
									        D-${enddate-today }
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
	<a class="carousel-control-prev" href="#demo" data-slide="prev" style="margin-bottom: 95px;margin-left: -50px;"> 
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
	</a> 
	<a class="carousel-control-next" href="#demo" data-slide="next" style="margin-bottom: 95px;margin-right: -50px;"> 
		<span class="carousel-control-next-icon" aria-hidden="true"></span> 
	</a> 
</div>
</div>
