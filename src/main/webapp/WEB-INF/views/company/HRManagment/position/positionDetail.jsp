<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="positionTop.jsp"%>

<style>
.posted-by p {
	font-size: 16px;
	color: black;
}
</style>

<script type="text/javascript">
	$(function(){
		$('.cart-buttons').find('a').click(function(){
			if($(this).html()=='삭제'){
				if(!confirm('해당 제안서를 삭제하시겠습니까?')){
					event.preventDefault();
				}
			}
		});
	});
</script>

<div class="blog-details-inner">
	<div class="blog-detail-title">
		<h4>
			<i class="fas fa-handshake" style="margin-right: 15px;"></i>
			${map['POSITIONSUGGEST_TITLE']}
		</h4>
	</div>
	<br>
	<div class="blog-quote" style="margin-left: 10%;width: 80%;margin-bottom: 40px;">
		<p style="font-size: 15px;">
			<i class="fas fa-user" style="margin-right: 15px;"></i>
			<span style="color:#4C50BB;">받은회원 ID : </span>${map['USER_ID']}
			<br>
			<i class="fas fa-address-card" style="margin-right: 15px;"></i>
			<span style="color:#4C50BB;">제안포지션 : </span>${map['POSITIONSUGGEST_POSITION']}
			<br>
			<i class="fas fa-coins" style="margin-right: 15px;"></i>
			<span style="color:#4C50BB;">제안연봉 : </span>
			<fmt:formatNumber value="${map['POSITIONSUGGEST_PRICE']}" pattern="#,###"/>
			<br>
			<i class="far fa-calendar-alt" style="margin-right: 15px;"></i>
			<span style="color:#4C50BB;">보낸날짜 : </span>
			<fmt:formatDate value="${map['POSITIONSUGGEST_REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss" />
		</p>
	</div>
	<div class="posted-by" style="margin-left: 10%;width: 80%;height: 230px;margin-bottom: 40px;overflow: auto;"> 
		${map['positionsuggestContents']}
	</div>
</div>

<hr>

<!-- 버튼 시작 -->
<div class="row">
	<div class="col-lg-6"></div>
	<div class="col-lg-6" align="right">
		<div class="cart-buttons">
			<c:if test="${empty param.type}">
				<a href="<c:url value='/company/HRManagment/deletePSG.do?positionsuggestNo=${param.positionsuggestNo}'/>" 
					class="btn btn-primary" style="background:#4C50BB;">삭제</a>
			</c:if>
			<c:if test="${!empty param.type}">
				<a href="<c:url value='/company/HRManagment/modifyPSG.do?positionsuggestNo=${param.positionsuggestNo}'/>" 
					class="btn btn-primary" style="background:#4C50BB;">수정</a>
				<a href="<c:url value='/company/HRManagment/deletePSG.do?positionsuggestNo=${param.positionsuggestNo}'/>" 
					class="btn btn-primary" style="background:#4C50BB;">삭제</a>
			</c:if>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

<%@ include file="positionBottom.jsp"%>