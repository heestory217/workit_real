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
	
	#category select{
	    margin-right: 5px;
	    border: none;
	    outline: none;
	    height: 43px;
	    padding: 10px 5px;
	    margin-left: 18px;
	}
	
	#category{
		padding:0px;
	}
	
	.active:not(li){
		display: none;
	}
	
	
	.active > td:hover{
		background-color: white;
	}
	
	[name=faqAbout]{
	    width: 100%;
	    resize: none;
	    outline: none;
	    border: none;
	    height: 350px;
	    padding:10px;
	}

	[name=faqAbout]::-webkit-scrollbar {
	  width:8px;
	}
	
	[name=faqAbout]::-webkit-scrollbar-thumb {
	  border-radius: 5px;
	  background-color: silver;
	}
	
	.titColor{
		background-color: #efeff6;
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
			 alert('[선택삭제]를 클릭하기 전에\n삭제할 글을 먼저 선택하세요.');
			 return false;
		 }
		
		 $('form[name=frmList]').prop('action','<c:url value="/admin/fa/multiDel.do"/>');
		 $('form[name=frmList]').submit();
	});
	
	var contextPath="/workit";
	//공지 등록창
	$('#writeBtn').click(function(){
		open(contextPath+"/admin/fa/faWrite.do?manager=${sessionScope.managerNo}","write",
				"width=700, height=520, left=500, top=140, location=no, resizable=no");
	});
	
	var no="${vo.faqNo }"; 
	$('#record'+no).click(function(){
		$(this).addClass('.titColor');
	});
	
	
});

//수정창
function editFunc(faqNo){
	open("/workit/admin/fa/faDetail.do?faqNo="+faqNo,"edit",
		"width=630, height=520, left=500, top=140, location=no, resizable=no");
}

function showCont(faqNo){
	$('#'+faqNo).toggle();
}

</script>

<div class="col-lg-12">
	<br><div class="section-block">
		<h3 class="section-title center">FAQ</h3>
	</div><br>
	
	<form action="<c:url value='/admin/fa/faList.do'/>"
		name="frmPage" method="post">
		<input type="hidden" name="currentPage">
		<input type="hidden" name="searchCondition" 
			value="${param.searchCondition }">
		<input type="hidden" name="searchKeyword"
			value="${param.searchKeyword }">
	</form> 

	<form action="<c:url value='/admin/fa/faList.do'/>"
		name="frmList" method="post">
		<input type="button" id="delBtn" value="선택 삭제" class="notcie-Btn float_left margin_right_5">
  	 	<div class="input-group input-search inputSearchbox float_right">
			<select name="searchCondition" class="margin_right_5">
	            <option value="faq_title"
	             <c:if test="${param.searchCondition == 'faqTitle'}">
                     selected="selected"
                 </c:if>
	            >제목</option>
	            <option value="faq_about"
	             <c:if test="${param.searchCondition == 'faqAbout'}">
                     selected="selected"
                 </c:if>
	            >내용</option>
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
		<div id="test"></div>
		<table class="table table-hover">
		<colgroup>
			<col width="5%">
			<col width="60%">
			<col width="15%">
			<col width="10%">
			<col width="10%">
		</colgroup>
			<thead>
				<tr class="center">
					<th scope="col">
						<input type="checkbox" name="chkAll">
					</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty faqList }">
		            <tr class="center">
			            <td colspan="6"><br><br>
			            	<p>요청하신 결과가 없습니다.</p><br>
			            </td>
		            </tr>
	            </c:if>
	            <c:if test="${!empty faqList }">
	            
	            	<!-- 글이 있는 경우 반복 시작-->
	            	<c:set var="n" value="0"/>
	            	<c:forEach var="vo" items="${faqList }">
	            		<tr class="center">
	            			<td><input type="checkbox" name="flist[${n}].faqNo" 
								value="${vo.faqNo}" id="chkbox">
							</td>
	            			<td class="font ${vo.faqNo}" style="text-align:left">
		            			<a onClick="showCont(${vo.faqNo })" href="#">${vo.faqTitle }</a></td>
	            			<td class="font"><fmt:formatDate value="${vo.faqDate }" pattern="yyyy-MM-dd"/></td>
	            			<td><a class="hoverColor" href="#" id="editBtn"
	            			onClick="editFunc(${vo.faqNo})"
	            			><i class="fa fa-check"></i> 수정</a></td>
	            			<td><a class="hoverColor" href
	            	="<c:url value='/admin/fa/faqDelete.do?faqNo=${vo.faqNo}'/>"
	            			onClick="if(!confirm('정말 삭제하시겠습니까?')){return false;}"><i class="fa fa-check"></i> 삭제</a></td>
	            		</tr>
	            		<tr class="active" id="${vo.faqNo }">
	            			<td colspan="6">
	            				<textarea name="faqAbout" readonly="readonly">${vo.faqAbout}</textarea>
	            			</td>
	            		</tr>
	            		<c:set var="n" value="${n+1}"/>	
	            	</c:forEach>
            	<!-- 반복 끝 -->	
	            </c:if>
			</tbody>
		</table>
	</div> <!-- table -->
</form>
<input type="button" id="writeBtn" value="FA등록" class="float_right notcie-Btn margin_right_5">

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