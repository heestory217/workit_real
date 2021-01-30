<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/indivSearch.css'/>" />

<!-- Latest Blog Section Begin -->
<section class="latest-blog spad margin_left_right_150">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>
						<p>검색어 : ${param.keyword }, 검색되었습니다.</p>
					</h2>
				</div>
			</div>
		</div>
		<c:if test="${empty list }">
			<br><div class="center size_150 lightgray"><i class="fas fa-search"></i></div><br>
			<div class="center"><p>검색 결과가 없습니다.</p></div>
		</c:if>
		<div class="row">
			<!-- 반복시작 -->
			<c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }">
					<div class="col-lg-4 col-md-6 padding_20">
						<div class="single-latest-blog">
							<a href="<c:url value='/index.do'/>"> 
								<img src="<c:url value='/pd_images/${vo.corpImgurl }'/>" alt="로고존재하지않을때 임시이미지를 넣어야합니다.">
								<div class="latest-text">
									<div class="tag-list">
										<div class="tag-item">
											<i class="fa fa-calendar-o"></i> 
											<fmt:formatDate value="${vo.recruitannounceEnddate }"
												pattern="yyyy-MM-dd"/>
										</div>
										<div class="tag-item">
											<i class="fas fa-search"></i> ${vo.workkindName }
										</div>
									</div>
									<h4>
										<b>${vo.corpName }</b>
									</h4>
									<p>
										<c:if test="${fn:length(vo.recruitannounceTitle)>=20}">
											${fn:substring(vo.recruitannounceTitle, 0, 20) } ...
										</c:if>
										<c:if test="${fn:length(vo.recruitannounceTitle)<20}">						
											${vo.recruitannounceTitle }
										</c:if>
									</p>
									<p class="margin_bottom_0 gray">
										<i class="fas fa-building"></i> ${vo.areaAdd1 } · ${vo.areaAdd2 }
									</p>
									<p class="margin_bottom_0 gray">
										<i class="fas fa-pencil-alt"></i> ${vo.languageName } · ${vo.recruitannounceScarrer }
									</p>
									<p class="margin_bottom_0 gray">
										<i class="fas fa-dollar-sign"></i> ${vo.recruitannounceSpay }
									</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</c:if> 
			<!-- 반복 끝 -->
			<!-- 반복시작 -->
			<%-- <div class="col-lg-4 col-md-6 padding_20">
				<div class="single-latest-blog">
					<a href="<c:url value='/index.do'/>"> 
						<img src="<c:url value='/resources/img/latest-1.jpg'/>" alt="">
						<div class="latest-text">
							<div class="tag-list">
								<div class="tag-item">
									<i class="fa fa-calendar-o"></i> 2021-02-19
								</div>
								<div class="tag-item">
									<i class="fas fa-search"></i> 자바 개발자
								</div>
							</div>
							<h4>
								<b>예시 : 패스트캠퍼스</b>
							</h4>
							<p>B회사 JAVA프로그래머 채용</p>
							<p class="margin_bottom_0">
								<i class="fas fa-building"></i> 서울 · 도봉구
							</p>
							<p class="margin_bottom_0">
								<i class="fas fa-pencil-alt"></i> JAVA · 경력 1년 이상
							</p>
							<p class="margin_bottom_0">
								<i class="fas fa-dollar-sign"></i> 연 2600만
							</p>
						</div>
					</a>
				</div>
			</div>  --%>
			<!-- 반복 끝 -->
		</div>
	</div>

</section>
<!-- Latest Blog Section End -->

<%@ include file="../inc/bottom.jsp"%>