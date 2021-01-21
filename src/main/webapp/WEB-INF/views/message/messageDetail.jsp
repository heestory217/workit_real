<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="messageTop.jsp"%>

<div class="blog-details-inner">
	<div class="blog-detail-title">
		<h4>
			<i class="fa fa-envelope" style="margin-right: 15px;"></i>
			${map['MESSAGE_TITLE']}
		</h4>
	</div>
	<br>
	<div class="blog-quote" style="margin-left: 10%;width: 80%;">
		<p style="font-size: 15px;">
			
			<i class="fas fa-user" style="margin-right: 15px;"></i>
			<span style="color:#4C50BB;">받은회원 ID : </span>${map['USER_ID']}
			<br>
			<i class="far fa-calendar-alt" style="margin-right: 15px;"></i>
			<span style="color:#4C50BB;">보낸날짜 : </span>
			<fmt:formatDate value="${map['MESSAGE_REGDATE']}" pattern="yyyy-MM-dd HH:mm:ss" />
		</p>
	</div>
	<div class="posted-by" style="margin-left: 10%;width: 80%;">
		<div class="pb-text">
			<p style="font-size: 16px;color:black;">${map['MESSAGE_CONTENT']}</p>
		</div>
	</div>
	<br>
	<div class="blog-detail-title">
		<div style="font-size: 15px;">
			<a href="#" class="prev-blog"> 
				<i class="ti-arrow-left"></i> 
				<span style="margin-left: 10px;margin-right: 25px">이전</span>
			</a> 
			<span><a href="<c:url value='/message/messageBoxSend.do'/>">목록</a></span> 
			<a href="#" class="next-blog"> 
				<span style="margin-right: 10px; margin-left: 25px;">다음</span> 
				<i class="ti-arrow-right"></i>
			</a>
		</div>
	</div>
</div>

<hr>

<!-- 버튼 시작 -->
<div class="row">
	<div class="col-lg-6"></div>
	<div class="col-lg-6" align="right">
		<div class="cart-buttons">
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">답장</a>
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">보관</a>
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

<%@ include file="messageBottom.jsp"%>