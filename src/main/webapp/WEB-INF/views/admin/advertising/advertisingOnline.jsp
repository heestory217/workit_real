<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sideMenu.jsp" %>

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


<br><br><br>
<div class="section-block">
		<h3 class="section-title center">현재 광고중인 공고 조회</h3>
	</div><br>
<div class="col-lg-12">
<h3 class="section-title">현재 사용중인 1등급 공고 ${fst }/3</h3>
<h3 class="section-title">현재 사용중인 2등급 공고 ${sec }/6</h3>
<br>
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered first">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
					<thead>
						<tr class="center">
							<th>주문번호</th>
							<th>상품명</th>
							<th>공고명</th>
							<th>공고번호</th>
							<th>광고 시작일</th>
							<th>광고 마감일</th>
							<th>공고 상품명</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty fstlist && empty seclist }">
			            <tr class="center">
					            <td colspan="7">
					            <br><br>
					            	<p>현재 등록된 광고가 없습니다.</p>
					            <br>
					            </td>
			            </tr>
	            	</c:if>
	            	<c:if test="${!empty fstlist }">
	            		<c:forEach var="vo" items="${fstlist }">
	            			<tr class="center">
					            <td>${vo.orderNo }</td>
					            <td>${vo.payNames }</td>
					            <td>${vo.recruitNames }</td>
					            <td>${vo.recruitannounceNo }</td>
								<td><fmt:formatDate value="${vo.paidserviceStartdate }" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${vo.paidserviceEnddate }" pattern="yyyy-MM-dd"/></td>
								<td>1등급</td>
			            	</tr>
	            		</c:forEach>
	            	</c:if>
	            	<c:if test="${!empty seclist }">
	            		<c:forEach var="vo" items="${seclist }">
	            			<tr class="center">
					            <td>${vo.orderNo }</td>
					            <td>${vo.payNames }</td>
					            <td>${vo.recruitNames }</td>
					            <td>${vo.recruitannounceNo }</td>
								<td><fmt:formatDate value="${vo.paidserviceStartdate }" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${vo.paidserviceEnddate }" pattern="yyyy-MM-dd"/></td>
								<td>2등급</td>
			            	</tr>
	            		</c:forEach>
	            	</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="col-lg-12">
	<br><br><br><div class="section-block">
		<h3 class="section-title center">광고 신청 조회</h3>
	</div>
    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4" style="float: right;">
	<form action="<c:url value='/admin/advertising/advertisingOnline.do'/>"
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchKeyword"
			value="${param.searchKeyword }">
	</form>
	<form action="<c:url value='/admin/advertising/advertisingOnline.do'/>"
		name="frmSearch" method="post">
		<div class="input-group input-search inputSearchbox"> 
    		<input class="form-control" type="text" placeholder="등급을 입력하세요"
    			value="${param.searchKeyword}" name="searchKeyword">
    			<span class="input-group-btn">
    		<button class="btn myColor textWhite" type="submit"><i class="fas fa-search"></i></button></span>
    	</div>
    </form>
	</div>
	<br>
	<br>
	<br>
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered first">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="25%">
					<col width="20%">
					<col width="15%">
					<col width="10%">
				</colgroup>
					<thead>
						<tr class="center">
							<th>주문번호</th>
							<th>상품명</th>
							<th>공고명</th>
							<th>공고번호</th>
							<th>수락</th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${fst+sec==9 }">
			            <tr class="center">
					            <td colspan="5">
					            <br><br>
					            	<p>현재 모든 광고가 사용중에 있습니다</p>
					            <br>
					            </td>
			            </tr>
	            	</c:if>
	            	<c:if test="${fst+sec==9 && empty list }">
			            <tr class="center">
					            <td colspan="5">
					            <br><br>
					            	<p>현재 광고신청중인 공고가 없습니다</p>
					            <br>
					            </td>
			            </tr>
	            	</c:if>
	            	<c:if test="${fst+sec!=9 && empty list }">
			            <tr class="center">
					            <td colspan="5">
					            <br><br>
					            	<p>맞는 광고가 없습니다.</p>
					            <br>
					            </td>
			            </tr>
	            	</c:if>
	            	<c:if test="${fst+sec!=9 && !empty list }">
	            		<c:forEach var="vo" items="${list }">
	            			<tr class="center">
					            <td>${vo.orderNo }</td>
					            <td>${vo.payNames }</td>
					            <td>${vo.recruitNames }</td>
					            <td>${vo.recruitannounceNo }</td>
								<td>
										<a href="<c:url value='/admin/advertising/advertisingcheck.do?recruitannounceNo=${vo.recruitannounceNo }&check=2&paidserviceNo=${vo.paidserviceNo }'/>" class="btn btn-outline-secondary"> 광고승인 </a>&nbsp;&nbsp;&nbsp;
	                           			<a href="<c:url value='/admin/advertising/advertisingcheck.do?recruitannounceNo=${vo.recruitannounceNo }&check=3&paidserviceNo=${vo.paidserviceNo }'/>" class="btn btn-outline-primary"> 광고반려 </a>
								</td>
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

<%@ include file="../inc/bottom.jsp" %>