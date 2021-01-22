<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="messageTop.jsp"%>

<style>
.cart-table table tr td {
	padding: 14px 0;
	border-bottom: 1px solid #ebebeb;
}
</style>

<!-- 제목 -->
<div class="section-title">
	<c:if test="${empty param.type}">
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
				<th style="margin-left: 5px"><input type="checkbox" id="chkAll"></th>
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
			<!-- 받은쪽지함 & 나에게 보낸 쪽지함 -->
			<c:if test="${empty getList}">
				<tr>
					<td colspan="6">쪽지가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty getList}">
				<c:forEach var="map" items="${getList}">
					<tr>
						<td><input type="checkbox"></td>
						<td>${map['USER_ID']}</td>
						<td style="text-align: left;">
							<!-- 받은 쪽지함 --> 
							<c:if test="${empty param.type}">
								<a href="<c:url value="/message/messageDetail.do?getMessageNo=${map['MESSAGE_NO']}"/>">
									${map['MESSAGE_TITLE']} </a>
							</c:if> 
							<c:if test="${!empty param.type}">
								<!-- 보관함에 저장된 경우 -->
								<c:if test="${param.type == 'important'}">
									<c:if test="${map['USER_ID']!='kim'}">
										<a href="<c:url value="/message/messageDetail.do?getMessageNo=${map['MESSAGE_NO']}"/>">
											${map['MESSAGE_TITLE']} </a>
									</c:if>
									<!-- 보낸쪽지함 -->
									<c:if test="${map['USER_ID']=='kim'}">
										<a href="<c:url value="/message/messageDetail.do?messageNo=${map['MESSAGE_NO']}"/>">
											${map['MESSAGE_TITLE']} </a>
									</c:if>
								</c:if>
								<!-- 나에게 보낸 편지함 -->
								<c:if test="${param.type == 'toMe'}">
									<a href="<c:url value="/message/messageDetail.do?type=toMe&getMessageNo=${map['MESSAGE_NO']}"/>">
										${map['MESSAGE_TITLE']} </a>
								</c:if>
							</c:if>
						</td>
						<td style="text-align: left;">${map['MESSAGE_CONTENT']}</td>
						<td><fmt:formatDate value="${map['MESSAGE_REGDATE']}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 받은쪽지함 -->
		</tbody>
	</table>
</div>

<!-- 버튼 시작 -->
<div class="row">
	<div class="col-lg-6"></div>
	<div class="col-lg-6" align="right">
		<div class="cart-buttons">
			<c:if test="${empty param.type}">
				<a href="#" class="btn btn-primary" style="background: #4C50BB;">보관</a>
				<a href="#" class="btn btn-primary" style="background: #4C50BB;"
					id="reply">답장</a>
			</c:if>
			<a href="#" class="btn btn-primary" style="background: #4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

<!-- 받은쪽지함 부분 끝-->

<%@ include file="messageBottom.jsp"%>