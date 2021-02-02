<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/indivSearch.css'/>" />

<!-- Latest Blog Section Begin -->
<section class="latest-blog spad margin_left_right_150">

	<form method="post" action="<c:url value='/indivSearch/indivExplore.do'/>" class="center">
	<label for="areaAdd1">지역1</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="areaAdd1" id="areaAdd1" class="col-lg-5">
		<option value=1000
			<c:if test="${Lselected ==1000}">
				selected="selected"
			</c:if>
		>선택안함</option>
		<c:if test="${!empty Llist }">
			<c:forEach var="Lvo" items="${Llist }">
				<option value="${Lvo.languageNo }"
					<c:if test="${Lvo.languageNo == Lselected}">
						selected="selected"
					</c:if>
				>${Lvo.languageName }</option>
			</c:forEach>
		</c:if>
	</select>
	<label for="languageNo">지역2</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="languageNo" id="languageNo" class="col-lg-5">
		<option value=1000
			<c:if test="${Lselected ==1000}">
				selected="selected"
			</c:if>
		>선택안함</option>
		<c:if test="${!empty Llist }">
			<c:forEach var="Lvo" items="${Llist }">
				<option value="${Lvo.languageNo }"
					<c:if test="${Lvo.languageNo == Lselected}">
						selected="selected"
					</c:if>
				>${Lvo.languageName }</option>
			</c:forEach>
		</c:if>
	</select>
	<label for="languageNo">언어</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="languageNo" id="languageNo" class="col-lg-5">
		<option value=1000
			<c:if test="${Lselected ==1000}">
				selected="selected"
			</c:if>
		>선택안함</option>
		<c:if test="${!empty Llist }">
			<c:forEach var="Lvo" items="${Llist }">
				<option value="${Lvo.languageNo }"
					<c:if test="${Lvo.languageNo == Lselected}">
						selected="selected"
					</c:if>
				>${Lvo.languageName }</option>
			</c:forEach>
		</c:if>
	</select>
	<label for="indivCareer">경력</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="indivCareer" id="indivCareer" class="col-lg-5">
		<option value="1000"
			<c:if test="${Cselected =='1000'}">
				selected="selected"
			</c:if>
		>선택안함</option>
		<option value="0"
			<c:if test="${Cselected =='신입'}">
				selected="selected"
			</c:if>
		>신입</option>
		<option value="1"
			<c:if test="${Cselected =='1'}">
				selected="selected"
			</c:if>
		>1년</option>
		<option value="2"
			<c:if test="${Cselected =='2'}">
				selected="selected"
			</c:if>
		>2년</option>
		<option value="3"
			<c:if test="${Cselected =='3'}">
				selected="selected"
			</c:if>
		>3년</option>
		<option value="4"
			<c:if test="${Cselected =='4'}">
				selected="selected"
			</c:if>
		>4년</option>
		<option value="5"
			<c:if test="${Cselected =='5'}">
				selected="selected"
			</c:if>
		>5년</option>
		<option value="6"
			<c:if test="${Cselected =='6'}">
				selected="selected"
			</c:if>
		>6년</option>
		<option value="7"
			<c:if test="${Cselected =='7'}">
				selected="selected"
			</c:if>
		>7년</option>
		<option value="8"
			<c:if test="${Cselected =='8'}">
				selected="selected"
			</c:if>
		>8년</option>
		<option value="9"
			<c:if test="${Cselected =='9'}">
				selected="selected"
			</c:if>
		>9년</option>
		<option value="10"
			<c:if test="${Cselected =='10'}">
				selected="selected"
			</c:if>
		>10년이상</option>
	</select>
	<input type="submit" value="검색" id="languageBtn">
	</form>
	<br><br><br>
	<div class="container">
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
								<img id="searchImg" src="<c:url value='/pd_images/${vo.corpImgurl }'/>" onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
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
		</div>
	</div>

</section>
<!-- Latest Blog Section End -->

<%@ include file="../inc/bottom.jsp"%>