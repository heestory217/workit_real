<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/adminIndivUsers.css'/>" />
<%@ include file="../../inc/sideMenu.jsp"%>

<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<div class="col-lg-12">
	<br><div class="section-block">
		<h3 class="section-title center">개인 회원 조회</h3>
	</div><br>
	<div class="card">
		<table class="table table-hover">
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="20%">
			<col width="15%">
			<col width="30%">
			<col width="10%">
			<col width="5%">
		</colgroup>
			<thead>
				<tr class="center">
					<th scope="col">이름</th>
					<th scope="col">아이디</th>
					<th scope="col">이메일</th>
					<th scope="col">전화번호</th>
					<th scope="col">주소</th>
					<th scope="col">가입일</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
		            <tr class="center">
			            <td colspan="7"><br><br>
			            	<p>요청하신 결과가 없습니다.</p><br>
			            </td>
		            </tr>
	            </c:if>
	            <c:if test="${!empty list }">
	            	<c:forEach var="vo" items="${list }">
	            		<tr>
	            			<th class="center">
	            				${vo.userName }
	            			</th>
	            			<th class="center">
	            				${vo.userId }
	            			</th>
	            			<th>
	            				${vo.userEmail1 }@${vo.userEmail2 }
	            			</th>
	            			<th>
	            				${vo.userHp1 } - ${vo.userHp2 } - ${vo.userHp3 }
	            			</th>
	            			<th>
	            				<c:if test="${!empty vo.userZipcode }">
		            				(${vo.userZipcode }) ${vo.userAddress } ${vo.userAddressdetail }
	            				</c:if>
	            			</th>
	            			<th class="center">
	            				<fmt:formatDate value="${vo.userRegdate }"
	            					pattern="yyyy-MM-dd"/>
	            			</th>
	            			<th class="center"><a href="#">탈퇴</a></th>
	            		</tr>
	            	</c:forEach>
	            </c:if>
			</tbody>
		</table>
	</div> <!-- table -->


	<!-- 페이징 처리 -->
	<div>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
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
	<!-- 페이징 처리 끝 -->
	
	<div class="input-group input-search inputSearchbox">
    	<input class="form-control" type="text" placeholder="임시"><span class="input-group-btn">
    	<button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button></span>
    </div>
	
	<form action="<c:url value='/admin/users/indiv/selectIndivUsers.do'/>"
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
	</form>
	
</div>
<%@ include file="../../inc/bottom.jsp"%>