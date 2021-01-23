<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="messageTop.jsp"%>

<style>
	.cart-table table tr td{
		padding: 14px 0;
		border-bottom: 1px solid #ebebeb;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('.cart-table table tbody tr td .ti-close').click(function(){
			if($('#openFlag').html()=='미열람'){
				if(!confirm('해당 쪽지 전송을 취소하시겠습니까?\n쪽지 전송을 취소할 경우, 해당 쪽지는 자동삭제됩니다.')){
					event.preventDefault();
				}
			}else if($('#openFlag').html()=='열람'){
				alert('상대방이 열람한 쪽지는 전송을 취소할 수 없습니다.');
				event.preventDefault();
			}
		});
	});
</script>

<!-- 제목 -->
<div class="section-title">
	<h2>보낸쪽지함</h2>
</div>
<!-- 제목 끝 -->

<!-- 보낸쪽지함 부분 시작-->
<div class="cart-table">
	<table>
		<colgroup>
			<col style="width:5%;" />
			<col style="width:15%;" />
			<col style="width:40%;" />
			<col style="width:15%;" />
			<col style="width:15%;" />		
			<col style="width:5%;" />		
		</colgroup>
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
					<td colspan="7">쪽지가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="map" items="${list}">
					<tr>
						<td><input type="checkbox"></td>
						<td>${map['USER_ID']}</td>
						<td style="text-align:left;">
							<a href="<c:url value="/message/messageDetail.do?messageNo=${map['MESSAGE_NO']}"/>">
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<c:if test="${fn:length(map['MESSAGE_TITLE'])>=30}">
									${fn:substring(map['MESSAGE_TITLE'], 0,30) } ...
								</c:if>
								<c:if test="${fn:length(map['MESSAGE_TITLE'])<30}">						
									${map['MESSAGE_TITLE']}
								</c:if>
							</a>
						</td>
						<td><fmt:formatDate value="${map['MESSAGE_REGDATE']}" pattern="yyyy-MM-dd" /></td>
						<c:if test="${map['GETMESSAGE_READFLAG']==2}">
							<td id="openFlag">미열람</td>
						</c:if>
						<c:if test="${map['GETMESSAGE_READFLAG']==1}">
							<td id="openFlag">열람</td>
						</c:if>
						<td><a href="<c:url value='/message/deleteMsg.do?messageNo=${map["MESSAGE_NO"]}'/>">
								<i class="ti-close" style="cursor: pointer;"></i>
							</a>
						</td>
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
			<a href="#" class="btn btn-primary" style="background:#4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

<!-- 보낸쪽지함 부분 끝-->

<%@ include file="messageBottom.jsp"%>