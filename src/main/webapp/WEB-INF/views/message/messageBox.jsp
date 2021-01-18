<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="messageTop.jsp"%>


<!-- 제목 -->
<div class="section-title">
	<c:if test="${empty param.type }">
		<h2>받은쪽지함</h2>
	</c:if>
	<c:if test="${!empty param.type }">
		<c:if test="${param.type == 'toMe'}">
			<h2>나에게 쓴 쪽지함</h2>
		</c:if>
		<c:if test="${param.type == 'important'}">
			<h2>쪽지보관함</h2>
		</c:if>
	</c:if>
</div>
<!-- 제목 끝 -->

<!-- 받은쪽지함 부분 시작-->
<div class="cart-table">
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="chkAll"></th>
				<c:if test="${param.type == 'important'}">
					<th>보낸/받는사람</th>
				</c:if>
				<c:if test="${param.type != 'important'}">
					<th>보낸사람</th>
				</c:if>
				<th class="p-name">제목</th>
				<th class="p-name">내용</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="close-td first-row"><input type="checkbox"></td>
				<td class="qua-col first-row">회원1</td>
				<td class="cart-title first-row"><a href="#">안녕하세요 제목1</a></td>
				<td class="cart-title first-row">내용내용1</td>
				<td class="qua-col first-row">2021-01-17</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td class="qua-col">회원2</td>
				<td class="cart-title"><a href="#">안녕하세요 제목2</a></td>
				<td class="cart-title">내용내용2</td>
				<td class="qua-col">2021-01-17</td>
			</tr>
		</tbody>
	</table>
</div>

<!-- 버튼 시작 -->
<div class="row">
	<div class="col-lg-6"></div>
	<div class="col-lg-6" align="right">
		<div class="cart-buttons">
			<c:if test="${empty param.type}">
				<a href="#" class="btn btn-primary" style="background:#4C50BB;">보관</a>
				<a href="#" class="btn btn-primary" style="background:#4C50BB;" id="reply">답장</a>
			</c:if>
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

<!-- 받은쪽지함 부분 끝-->

<%@ include file="messageBottom.jsp"%>