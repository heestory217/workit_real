<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/adminIndivUsers.css'/>" />
<%@ include file="../inc/sideMenu.jsp"%>


<style>
	.categoryBx{
		height:34px;
	}
	
	.card{
		clear:both;
	}
	
	.font{
		font-weight: bold;
	    color: #3d405c;
    	font-family:'Circular Std Medium';
	}
	
	.notcie-Btn{
	    width: 80px;
	    height: 34px;
	    color: white;
	    background: #4C50BB;
	    border: 1px solid silver;
	    outline:none;
	    cursor: pointer;
	}
	
	.input-group{
		outline: none;
	}
	
	.float_right{
		float:right;
	}
</style>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

$(function(){
	$('input[name=chkAll]').click(function(){
		$('table tbody tr td').find('input[type=checkbox]')
			.prop('checked', this.checked);
		
	});
	
	$('#delBtn').click(function(){
		 var len	
		 	=$('table tbody tr td').find('input[type=checkbox]:checked').length;
		 if(len==0){
			 alert('[선택삭제]를 클릭하기 전에\n삭제할 공지를 먼저 선택하세요.');
			 return false;
		 }
		
		 $('form[name=frmList]').prop('action','<c:url value="/admin/notice/multiDel.do"/>');
		 $('form[name=frmList]').submit();
	});
	
	var contextPath="/workit";
	$('#writeBtn').click(function(){
		/*js이므로 url태그 사용 불가, 4라인에서 변수처리한 contextPath를 사용하여 절대참조로 변경*/
		open(contextPath+"/admin/notice/noticeWrite.do","write",
 			"width=600, height=500, left=800, top=600, location=no, resizable=no");
	});
		
});
	
</script>

<div class="col-lg-12">
	<br><div class="section-block">
		<h3 class="section-title center">공지사항</h3>
	</div><br>

 	<form action="<c:url value='/admin/notice/noticeList.do'/>"
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition }">
		<input type="hidden" name="searchKeyword"
			value="${param.searchKeyword }">
	</form> 

	<form action="<c:url value='/admin/notice/noticeList.do'/>"
		name="frmList" method="post">
		<input type="button" id="delBtn" value="선택 삭제" class="notcie-Btn float_left margin_right_5">
		<div class="input-group input-search inputSearchbox categoryBx float_left">
			<c:if test="${!empty cateList }">
				<select name="classificationNo" class="margin_right_5" id="cate">
					<option value="">분류</option>
					<c:forEach var="cateVo" items="${cateList }">
			            <option value="${cateVo.classificationNo}">
			            ${cateVo.classificationName}</option>
					</c:forEach>
		        </select>
			</c:if>	        
		</div>
		<div class="input-group input-search inputSearchbox float_right">
			<select name="searchCondition" class="margin_right_5">
	            <option value="NOTICE_TITLE"
	             <c:if test="${param.searchCondition == 'NOTICE_TITLE'}">
                     selected="selected"
                 </c:if>
	            >제목</option>
	            <option value="NOTICE_ABOUT"
	             <c:if test="${param.searchCondition == 'NOTICE_ABOUT'}">
                     selected="selected"
                 </c:if>
	            >내용</option>
	            <option value="MANAGER_NAME"
	             <c:if test="${param.searchCondition == 'MANAGER_NAME'}">
                     selected="selected"
                 </c:if>
	            >작성자</option>
	        </select>   
    		<input class="form-control" type="text" placeholder="검색어를 입력해주세요."
    			value="${param.searchKeyword}" name="searchKeyword">
    			<span class="input-group-btn">
    		<button class="btn myColor textWhite" type="submit"><i class="fas fa-search"></i></button></span>
    	</div>
   		<c:if test="${!empty param.searchKeyword }">
		<span class="float_right textMyColor" style="padding:8px;margin-bottom:0px;">
			검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord }  건 검색되었습니다.</span>
		</c:if> 
  	 <br><br>

	<!-- table -->
	<div class="card">
		<table class="table table-hover">
		<colgroup>
			<col width="5%">
			<col width="10%">
			<col width="50%">
			<col width="15%">
			<col width="10%">
			<col width="10%">
		</colgroup>
			<thead>
				<tr class="center">
					<th scope="col"><input type="checkbox" name="chkAll"></th>
					<th scope="col">분류</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty noticeList }">
		            <tr class="center">
			            <td colspan="6"><br><br>
			            	<p>요청하신 결과가 없습니다.</p><br>
			            </td>
		            </tr>
	            </c:if>
	            <c:if test="${!empty noticeList }">
	            
	            	<!-- 글이 있는 경우 반복 시작-->
	            	<c:set var="n" value="0"/>
	            	<c:forEach var="map" items="${noticeList }">
	            		<tr class="center">
	            			<td><input type="checkbox" name="noticeList[${n}].noticeNo" 
								value="${map['NOTICE_NO'] }" id="chkbox">
							</td>
	            			<td class="font">${map['CLASSIFICATION_NAME'] }</td>
	            			<td class="font" style="text-align:left">${map['NOTICE_TITLE'] }</td>
	            			<td class="font"><fmt:formatDate value="${map['NOTICE_DATE'] }" pattern="yyyy-MM-dd"/></td>
	            			<td><a href="#" class="hoverColor"><i class="fa fa-check"></i> 수정</a></td>
	            			<td><a class="hoverColor" href
	            	="<c:url value='/admin/notice/noticeDelete.do?noticeNo=${map["NOTICE_NO"]}'/>"
	            			onClick="if(!confirm('정말 삭제하시겠습니까?')){return false;}"><i class="fa fa-check"></i> 삭제</a></td>
	            		</tr>
	            		<c:set var="n" value="${n+1}"/>	
	            	</c:forEach>
            	<!-- 반복 끝 -->	
	            </c:if>
			</tbody>
		</table>
	</div> <!-- table -->
</form>
<input type="button" id="writeBtn" value="공지등록" class="float_right notcie-Btn margin_right_5">

	<!-- 페이징 처리 -->
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
	<!-- 페이징 처리 끝 -->
	
	
</div>
<%@ include file="../inc/bottom.jsp"%>