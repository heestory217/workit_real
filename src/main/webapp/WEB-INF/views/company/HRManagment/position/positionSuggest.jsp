<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="positionTop.jsp"%>    

<style>
	.cart-table table tr td{
		padding: 14px 0;
		border-bottom: 1px solid #ebebeb;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('#btDel').click(function(){
			var len=$('.cart-table tbody tr td').find('input[type=checkbox]:checked').length;

			if(len==0){
			   alert('먼저 삭제할 쪽지를 선택하세요.');
			   return false;
			}
			            
			$('form[name=frmList]').prop('action', '<c:url value="/company/HRManagment/deleteMultiPosi.do"/>');
			$('form[name=frmList]').submit();
			
		});
	});
</script>

<!-- 제목 -->
<div class="section-title">
	<h2>포지션 제안</h2>
</div>
<!-- 제목 끝 -->

<!-- 보낸 포지션제안 부분 시작-->
<form name="frmList" method="post" 
	action="<c:url value='/company/HRManagment/positionSuggest.do'/>">
	
<div class="cart-table">
	<table>
		<colgroup>
			<col style="width:5%;" />
			<col style="width:10%;" />
			<col style="width:30%;" />
			<col style="width:15%;" />
			<col style="width:15%;" />		
			<col style="width:15%;" />		
			<col style="width:10%;" />		
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" id="chkAll"></th>
				<th>받는사람</th>
				<th>제목</th>
				<th>포지션</th>
				<th>연봉</th>
				<th>날짜</th>
				<th>열람</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="7">보낸 제안이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<!-- 반복시작 -->
				<c:set var="k" value="0"/> 
				<c:forEach var="map" items="${list}">
					<tr>
						<td>
							<input type="checkbox" name="posiItems[${k}].positionsuggestNo" value="${map['POSITIONSUGGEST_NO']}">
						</td>
						<td>${map['USER_ID']}</td>
						<td style="text-align:left;">
							<a href="<c:url value="/company/HRManagment/positionDetail.do?positionsuggestNo=${map['POSITIONSUGGEST_NO']}"/>">
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<c:if test="${fn:length(map['POSITIONSUGGEST_TITLE'])>=30}">
									${fn:substring(map['POSITIONSUGGEST_TITLE'], 0,30) } ...
								</c:if>
								<c:if test="${fn:length(map['POSITIONSUGGEST_TITLE'])<30}">						
									${map['POSITIONSUGGEST_TITLE']}
								</c:if>
							</a>
						</td>
						<td><fmt:formatDate value="${map['POSITIONSUGGEST_REGDATE']}" pattern="yyyy-MM-dd" /></td>
						<c:if test="${map['GETPOSITIONSUGGEST_READFLAG']==2}">
							<td id="openFlag">미열람</td>
						</c:if>
						<c:if test="${map['GETPOSITIONSUGGEST_READFLAG']==1}">
							<td id="openFlag">열람</td>
						</c:if>
					</tr>
					<c:set var="k" value="${k+1}"/>
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
			<a href="#" id="btDel" class="btn btn-primary" style="background:#4C50BB;">삭제</a>
		</div>
	</div>
</div>
<!-- 버튼 끝 -->

</form>
<!-- 보낸 포지션제안 부분 끝-->

<%@ include file="positionBottom.jsp"%>    