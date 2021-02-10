<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/indivSearch.css'/>" />

<script type="text/javascript">
	$(function(){
		$('#ExploreBtn').click(function(){
			if($('#workkindNo option:selected').val()=="X"){
				alert('직무를 선택하세요.');
				$('#workkindNo').focus();
				event.preventDefault();
			}else{
				location.href="/workit/indivSearch/indivExploreWorkkind.do?workkindno="+$('#workkindNo option:selected').val();
			}
		});
	});
</script>
<!-- Latest Blog Section Begin -->
<section class="latest-blog spad margin_left_right_150">
<div class="center">
	<select name="workkindNo" id="workkindNo" class="col-lg-5 searchSelectbox">
		<option disabled selected value="X">직무를 선택하세요</option>
		<c:if test="${!empty wlist }">
			<c:forEach var="wvo" items="${wlist }">
				<option value="${wvo.workkindNo }"
					<c:if test="${wvo.workkindNo == wselected}">
						selected="selected"
					</c:if>
				>${wvo.workkindName }</option>
			</c:forEach>
		</c:if>
	</select>
	<input type="button" value="검색" id="ExploreBtn">
	<br><br><br>
</div>
	
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
							<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${vo.recruitannounceNo }'/>"> 
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