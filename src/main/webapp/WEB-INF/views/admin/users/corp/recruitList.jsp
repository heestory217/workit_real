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
		<h3 class="section-title center">채용공고 조회</h3>
	</div>
	<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4" style="float: right;">
	<form action="<c:url value='/admin/users/corp/recruitList.do'/>"
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchKeyword"
			value="${param.searchKeyword }">
	</form>
	<form action="<c:url value='/admin/users/corp/recruitList.do'/>"
		name="frmSearch" method="post">
		<div class="input-group input-search inputSearchbox"> 
    		<input class="form-control" type="text" placeholder="공고명을 입력해주세요."
    			value="${param.searchKeyword}" name="searchKeyword">
    			<span class="input-group-btn">
    		<button class="btn myColor textWhite" type="submit"><i class="fas fa-search"></i></button></span>
    	</div>
    </form>
	</div>
	<br>
    
	<br><br>
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered first">
				<colgroup>
					<col width="5%">
					<col width="25%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
					<col width="10%">
				</colgroup>
					<thead>
						<tr class="center">
							<th>공고번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>업체명</th>
							<th>등록일</th>
							<th>마감일</th>
							<th>승인 여부</th>
							<th>승인</th>
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
					            <td><a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${vo.recruitannounceNo }'/>">${vo.recruitannounceNo }</a></td>
								<td>
									<c:if test="${fn:length(vo.recruitannounceTitle)>=25}">
										${fn:substring(vo.recruitannounceTitle, 0,25) } ...
									</c:if>
									<c:if test="${fn:length(vo.recruitannounceTitle)<25}">						
										${vo.recruitannounceTitle }
									</c:if>
								</td>
								<td>${vo.usersNames }</td>
								<td>${vo.corpsNames }</td>
								<td><fmt:formatDate value="${vo.recruitannounceStartdate }" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${vo.recruitannounceEnddate }" pattern="yyyy-MM-dd"/></td>
								<td>
									<c:if test="${vo.recruitannounceUpcheck==1 }">
										[대기중]
									</c:if>
									<c:if test="${vo.recruitannounceUpcheck==2 }">
										[통과]
									</c:if>
									<c:if test="${vo.recruitannounceUpcheck==3 }">
										[반려]
									</c:if>
									<c:if test="${vo.recruitannounceUpcheck==4 }">
										[수정 대기중]
									</c:if>
									</td>
								<td>
									<c:if test="${vo.recruitannounceUpcheck==1 ||  vo.recruitannounceUpcheck==4}">
									<a href="<c:url value='/admin/users/corp/recruitcheck.do?recruitannounceNo=${vo.recruitannounceNo }&check=2'/>" class="btn btn-outline-secondary"> 승인 </a>
	                           		<a href="<c:url value='/admin/users/corp/recruitcheck.do?recruitannounceNo=${vo.recruitannounceNo }&check=3'/>" class="btn btn-outline-primary"> 반려 </a>
									</c:if>
									<c:if test="${vo.recruitannounceUpcheck==2 }">
										<a href="<c:url value='/admin/users/corp/recruitcheck.do?recruitannounceNo=${vo.recruitannounceNo }&check=1'/>" class="btn btn-outline-primary"> 승인취소 </a>
									</c:if>
									<c:if test="${vo.recruitannounceUpcheck==3 }">
										<a href="<c:url value='/admin/users/corp/recruitcheck.do?recruitannounceNo=${vo.recruitannounceNo }&check=1'/>" class="btn btn-outline-secondary"> 반려취소 </a>
									</c:if>
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
                 
<%@ include file="../../inc/bottom.jsp" %>