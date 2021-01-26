<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function pageFunc(curPage) {
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>
<!-- 페이징 처리를 위한 form  -->
<form action="<c:url value='/indiv/community/myProfile.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage"> <input type="hidden"
		name="userNo" value="${userNo}"> <input type="hidden"
		name="questionNo" value="${param.questionNo}">
</form>

<!-- 페이징 처리 -->
	
<div class="paging col-lg-12">
	<!-- 이전블럭 -->	
	 <div class="product__pagination blog__pagination">
	 	<c:if test="${pagingInfo.firstPage>1 }">	
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
				<i class="fa fa-long-arrow-left"></i>
			</a>
		</c:if>
		
	<!-- [1][2][3][4][5][6][7][8][9][10] -->		
	<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
		<c:if test="${i==pagingInfo.currentPage }">
			<span id="currentPage" >
				${i}</span>			
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				${i}</a>			
		</c:if>
	</c:forEach>
	
	<!-- 다음블럭 -->	
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
			<i class="fa fa-long-arrow-right"></i>
		</a>
	</c:if>
    </div>			    
</div>