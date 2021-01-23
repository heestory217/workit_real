<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="messageTop.jsp"%>

<style>
.cart-table table tr td {
	padding: 14px 0;
	border-bottom: 1px solid #ebebeb;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#btDel').click(function(){
			var len=$('.cart-table tbody tr td').find('input[type=checkbox]:checked').length;
			            //여러개 이므로 배열 length사용 가능
			if(len==0){
			   alert('먼저 삭제할 쪽지를 선택하세요.');
			   return false;
			}
			            
			$('form[name=frmGetList]').prop('action', '<c:url value="/message/deleteMultiGetMsg.do"/>');
			$('form[name=frmGetList]').submit();
			
		});
	});
</script>

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
<form name="frmGetList" method="post" action="<c:url value='/message/messageBox.do'/>">
	
<div class="cart-table">
	<table>
		<colgroup>
			<col style="width:5%;" />
			<col style="width:20%;" />
			<col style="width:35%;" />
			<col style="width:25%;" />
			<col style="width:14%;" />		
		</colgroup>
		<thead>
			<tr>
				<th style="margin-left: 5px"><input type="checkbox" id="chkAll"></th>
				<th>보낸사람</th>
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
				<!-- 반복시작 -->
				<c:set var="k" value="0"/> 
				<c:forEach var="map" items="${getList}">
					<tr>
						<td>
							<input type="checkbox" name="msgItems[${k}].messageNo" value="${map['MESSAGE_NO']}">
						</td>
						<td>${map['USER_ID']}</td>
						<td style="text-align: left;">
							<!-- 받은 쪽지함 --> 
							<c:if test="${empty param.type}">
								<a href="<c:url value="/message/countUpdate.do?getMessageNo=${map['MESSAGE_NO']}"/>">
									<!-- 제목이 긴 경우 일부만 보여주기 -->							
									<c:if test="${fn:length(map['MESSAGE_TITLE'])>=20}">
										${fn:substring(map['MESSAGE_TITLE'], 0,20) } ...
									</c:if>
									<c:if test="${fn:length(map['MESSAGE_TITLE'])<20}">						
										${map['MESSAGE_TITLE']}
									</c:if>
								</a>
							</c:if> 
							<c:if test="${!empty param.type}">
								<!-- 보관함에 저장된 경우 -->
								<c:if test="${param.type == 'important'}">
									<a href="<c:url value="/message/countUpdate.do?getMessageNo=${map['MESSAGE_NO']}"/>">
										<!-- 제목이 긴 경우 일부만 보여주기 -->							
										<c:if test="${fn:length(map['MESSAGE_TITLE'])>=30}">
											${fn:substring(map['MESSAGE_TITLE'], 0,30) } ...
										</c:if>
										<c:if test="${fn:length(map['MESSAGE_TITLE'])<30}">						
											${map['MESSAGE_TITLE']}
										</c:if>
									</a>
								</c:if>
								<!-- 나에게 보낸 편지함 -->
								<c:if test="${param.type == 'toMe'}">
									<a href="<c:url value="/message/messageDetail.do?type=toMe&getMessageNo=${map['MESSAGE_NO']}"/>">
										<!-- 제목이 긴 경우 일부만 보여주기 -->							
										<c:if test="${fn:length(map['MESSAGE_TITLE'])>=30}">
											${fn:substring(map['MESSAGE_TITLE'], 0,30) } ...
										</c:if>
										<c:if test="${fn:length(map['MESSAGE_TITLE'])<30}">						
											${map['MESSAGE_TITLE']}
										</c:if>
									</a>
								</c:if>
							</c:if>
						</td>
						<td style="text-align: left;">
							<!-- 내용이 긴 경우 일부만 보여주기 -->							
							<c:if test="${fn:length(map['MESSAGE_CONTENT'])>=15}">
								${fn:substring(map['MESSAGE_CONTENT'], 0,15) } ...
							</c:if>
							<c:if test="${fn:length(map['MESSAGE_CONTENT'])<15}">						
								${map['MESSAGE_CONTENT']}
							</c:if>
						</td>
						<td><fmt:formatDate value="${map['MESSAGE_REGDATE']}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
					<c:set var="k" value="${k+1}"/>
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
			</c:if>
			<a href="#" id="btDel" class="btn btn-primary" style="background: #4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

</form>
<!-- 받은쪽지함 부분 끝-->

<%@ include file="messageBottom.jsp"%>