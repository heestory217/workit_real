<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="messageTop.jsp"%>
<style>
	.cart-table table tr td{
		padding: 14px 0;
		border-bottom: 1px solid #ebebeb;
	}
</style>

<!-- 제목 -->
<div class="section-title">
	<h2>보낸쪽지함</h2>
</div>
<!-- 제목 끝 -->

<!-- 보낸쪽지함 부분 시작-->
<div class="cart-table">
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="chkAll"></th>
				<th>받는사람</th>
				<th class="p-name">제목</th>
				<!-- <th class="p-name">내용</th> -->
				<th>보낸날짜</th>
				<th>열람여부</th>
				<th>취소</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="7" class="cart-title first-row">쪽지가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="vo" items="${list}">
					<tr>
						<td><input type="checkbox"></td>
						<td>${userId}</td>
						<td style="text-align:left;">
							<a href="<c:url value='/message/messageDetail.do?messageNo=${vo.messageNo}'/>">
								${vo.messageTitle}
							</a>
						</td>
						<td><fmt:formatDate value="${vo.messageRegdate}" pattern="yyyy-MM-dd" /></td>
						<td>열람</td>
						<td><i class="ti-close" style="cursor: pointer;"></i></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>

<!-- 버튼 시작 -->
<div class="row">
	<div class="col-lg-6"></div>
	<div class="col-lg-6" align="right">
		<div class="cart-buttons">
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">보관</a>
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

<!-- 보낸쪽지함 부분 끝-->

<%@ include file="messageBottom.jsp"%>