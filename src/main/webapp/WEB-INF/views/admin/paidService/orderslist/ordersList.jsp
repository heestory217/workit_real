<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>

<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<style>
.center{
	text-align: center;
}
.textWhite{
	color: white;
}
.myColor{
	border-color: #4C50BB;
	background: #4C50BB;
}
</style>

<div class="col-lg-12">
	<br><br><br><div class="section-block">
		<h3 class="section-title center">유료서비스 조회</h3>
	</div><br>
    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4" style="float: right;">
		<form action="<c:url value='/admin/paidService/orderslist/ordersList.do'/>" 
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		</form>
    </div>
    
	<br><br>
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered first">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
					<col width="10%">
				</colgroup>
					<thead>
						<tr class="center">
							<th>주문번호</th>
							<th>구매자</th>
							<th>구매상품</th>
							<th>결제도구</th>
							<th>쿠폰</th>
							<th>할인금액</th>
							<th>결제금액</th>
							<th>결제일</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty list }">
			            <tr class="center">
					            <td colspan="8">
					            <br><br>
					            	<p>요청하신 결과가 없습니다.</p>
					            <br>
					            </td>
			            </tr>
	            	</c:if>
	            	<c:if test="${!empty list }">
	            		<c:forEach var="vo" items="${list }">
	            			<tr class="center">
					            <td>${vo.orderNo }</td>
					            <td>${vo.recruitname }</td>
					            <td>${vo.payName }</td>
					            <td>${vo.orderPaykind }</td>
					            <td></td>
					            <td>${vo.orderDiscount }</td>
					            <td>${vo.orderPay }</td>
					            <td><fmt:formatDate value="${vo.orderDate }" pattern="yyyy-MM-dd"/></td>
			            </tr>
	            		</c:forEach>
	            	</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

	<div>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<!-- 이전블럭 -->
				<c:if test="${pagingInfo.firstPage>1 }">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous"
							onclick="pageFunc(${pagingInfo.firstPage-1})">
						<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span>
						</a>
					</li>
				</c:if>
				
				<!-- 블럭 -->
				<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
					<c:if test="${i==pagingInfo.currentPage }">
						<li class="page-item active">
							<a class="page-link" href="#">
							<span id="currentPage"> ${i}</span>
							</a>
						</li>
					</c:if>
					<c:if test="${i!=pagingInfo.currentPage }">
						<li class="page-item">
							<a class="page-link" href="#" onclick="pageFunc(${i})"> ${i}</a>
						</li>
					</c:if>
				</c:forEach>
				
				<!-- 다음블럭 -->
				<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Next" 
							onclick="pageFunc(${pagingInfo.lastPage+1})">
							<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav> 
	</div>
	
	
                 
<%@ include file="../../inc/bottom.jsp" %>