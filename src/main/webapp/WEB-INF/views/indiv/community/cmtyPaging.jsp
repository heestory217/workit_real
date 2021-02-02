<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 페이징 처리 -->

<form action="<c:url value='/indiv/community/myProfile.do?userNo=${userNo}&type=${param.type}'/>" 
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
</form>	

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