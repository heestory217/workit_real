<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>


<style>
.center{
	text-align: center;
}

</style>

<div class="col-lg-12">
	<br><br><br><div class="section-block">
		<h3 class="section-title center">채용공고 조회</h3>
	</div><br><br><br>
	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered first">
				<colgroup>
					<col width="15%">
					<col width="25%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
					<thead>
						<tr class="center">
							<th>회사명</th>
							<th>제목</th>
							<th>등록일</th>
							<th>마감일</th>
							<th>승인 여부</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:if test="${empty list }">
			            <tr class="center">
					            <td colspan="7">
					            <br><br>
					            	<p>요청하신 결과가 없습니다.</p>
					            <br>
					            </td>
			            </tr>
	            	</c:if>
	            	<c:if test="${!empty list }">
	            		<c:forEach var="vo" items="${list }">
	            			<tr class="center">
					            <td>${vo.userNo }</td>
								<td>
									<c:if test="${fn:length(vo.recruitannounceTitle)>=25}">
										${fn:substring(vo.recruitannounceTitle, 0,25) } ...
									</c:if>
									<c:if test="${fn:length(vo.recruitannounceTitle)<25}">						
										${vo.recruitannounceTitle }
									</c:if>
								</td>
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
								<td></td>
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
				<c:if test="${pagingInfo.firstPage>1 }">
					<li class="page-item">
						<a class="page-link" href="#" aria-label="Previous"
							onclick="pageFunc(${pagingInfo.firstPage-1})">
						<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span>
						</a>
					</li>
				</c:if>
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