<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="messageTop.jsp"%>

<!-- 받은쪽지함 부분 시작-->
<div class="cart-table">
	<table>
		<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>보낸사람</th>
				<th class="p-name">제목</th>
				<th class="p-name">내용</th>
				<th>날짜</th>
				<th><i class="ti-close"></i></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="close-td first-row"><input type="checkbox"></td>
				<td class="qua-col first-row">회원1</td>
				<td class="cart-title first-row">안녕하세요 제목1</td>
				<td class="cart-title first-row">내용내용1</td>
				<td class="qua-col first-row">2021-01-17</td>
				<td class="close-td first-row"><i class="ti-close"></i></td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td class="qua-col">회원2</td>
				<td class="cart-title">안녕하세요 제목1</td>
				<td class="cart-title">내용내용2</td>
				<td class="qua-col">2021-01-17</td>
				<td class="close-td"><i class="ti-close"></i></td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 받은쪽지함 부분 끝-->

<%@ include file="messageBottom.jsp"%>