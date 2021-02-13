<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.filter-catagories > li:nth-child(2) > a{
	font-weight:bold;
	color:#4c50bb;
	font-size:18px;
}
.tableBx {
	width: 100%;
	height: auto;
	margin: 30px 0;
	clear: both;
	border-top: 1px solid #4C4747;
	border-bottom: 1px solid #4C4747;
}

.listDiv {
	padding: 0px;
}

.searchBx {
	width: 400px;
	float: right;
	margin-left: 478px;
}

.float_right {
	float: right !important;
}

[name=classificationNo] {
	height: 100%;
	border: none;
	outline: none;
}

.center {
	text-align:center;
}

th, select[name=classificationNo] {
	color: #4C4747;
	font-weight: 600;
}

.color {
	background-color: #4c50bb;
}

.form-control:focus {
	border-color: rgba(189, 189, 189, 0.8);
	box-shadow: 0 1px 1px rgba(166, 166, 166, 0.075) inset, 0 0 8px
		rgba(166, 166, 166, 0.6);
	outline: 0 none;
}

#searchBtn:focus{
	border-color:none !important;
	box-shadow:none !important; 
}

.fa-search {
	color: white;
}

.table{
	margin-bottom:0px;
}

select[name=searchCondition]{
    width: 70px;
    border: 1px solid #ced4da;
}

.category{
	text-align: center;
	color:#4c50bb;
}

form[name=frmList]{
    margin-top: 35px; 
}
</style>

<form action="<c:url value='/notice/noticeList.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" 
		value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword"
		value="${param.searchKeyword }">
</form> 

<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>공지사항</span>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="faq-section spad">
	<div class="container">
		<div class="row">

			<!-- nav -->
			<div
				class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
				<div class="filter-widget">
					<c:import url="/common/cusServiceNav.do"></c:import>
				</div>
			</div>

			<div class="col-lg-9 order-1 order-lg-2 listDiv">
				<div class="">
					<div class="container">
						<div class="row">
							<div class="col-lg-6 offset-lg-3">
								<div class="register-form section-title">
									<h2>공지사항</h2>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr> <!-- //////////////////////////////// -->
				<div class="container">
					<div class="row">
						<!-- 검색 -->
					<form action="<c:url value='/notice/noticeList.do'/>"
						name="frmList" method="post">		
						<div class="input-group input-search searchBx float_right">
							<select name="searchCondition" class="margin_right_5">
								<option value="NOTICE_TITLE"
									<c:if test="${param.searchCondition == 'NOTICE_TITLE'}">
				                     selected="selected"
				                 </c:if>>제목</option>
								<option value="NOTICE_ABOUT"
									<c:if test="${param.searchCondition == 'NOTICE_ABOUT'}">
				                     selected="selected"
				                 </c:if>>내용</option>
							</select> 
							<input class="form-control" type="text"
								placeholder="검색어를 입력해주세요." value="${param.searchKeyword}"
								name="searchKeyword"> <span class="input-group-btn">
								<button class="btn color" type="submit" id="searchBtn">
									<i class="fas fa-search"></i>
								</button>
							</span>
						</div>
					</form>
						<!-- table -->
						<div class="tableBx">
							<div id="test"></div>
							<table class="table table-hover">
								<colgroup>
									<col width="15%">
									<col width="70%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr class="center">
										<th scope="col" id="category"><select
											name="classificationNo" class="margin_right_5" id="cate">
												<option value="0">분류</option>
												<option value="1"
													<c:if test="${param.type=='1'}">
														selected="selected"
													</c:if>>공지</option>
												<option value="2"
													<c:if test="${param.type=='2'}">
														selected="selected"
													</c:if>>이벤트</option>
												<option value="3"
													<c:if test="${param.type=='3'}">
														selected="selected"
													</c:if>>안내</option>
										</select></th>
										<th scope="col" class="center">제목</th>
										<th scope="col" class="center">등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty noticeList }">
										<tr class="center">
											<td colspan="3"><br>
											<br>
												<p>요청하신 결과가 없습니다.</p>
												<br>
											</td>
										</tr>
									</c:if>
									<!-- 글이 있는 경우 반복 시작-->
									<c:if test="${!empty noticeList }">
										<c:forEach var="map" items="${noticeList }">
											<tr>
												<td class="category"
													<c:if test="${map['CLASSIFICATION_NAME'] =='공지'}">
														style="font-weight:bold;"													
													</c:if>
												>${map['CLASSIFICATION_NAME'] }</td>
												<td><a href
											="<c:url value='/notice/noticeViewCnt.do?noticeNo=${map["NOTICE_NO"] }'/>">
												${map['NOTICE_TITLE'] }
												</a></td>
												<td><fmt:formatDate value="${map['NOTICE_DATE'] }"
													pattern="yyyy-MM-dd"/>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<!-- 반복 끝 -->
								</tbody>
							</table>
						</div>
						<!-- table -->


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
								<c:forEach var="i" begin="${pagingInfo.firstPage}"
									end="${pagingInfo.lastPage}">
									<c:if test="${i==pagingInfo.currentPage }">
										<span id="currentPage"> ${i}</span>
									</c:if>
									<c:if test="${i!=pagingInfo.currentPage }">
										<a href="#" onclick="pageFunc(${i})"> ${i}</a>
									</c:if>
								</c:forEach>

								<!-- 다음블럭 -->
								<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
									<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})"> <i
										class="fa fa-long-arrow-right"></i>
									</a>
								</c:if>
							</div>
						</div>
						<!-- 페이징 처리 끝 -->
					</div>
				</div>
			</div>


		</div>
	</div>
</div>



<style>

/* 페이징처리 */

.paging{
	text-align: center;
	margin-bottom:50px;
}
.product__pagination a, .blog__pagination a, #currentPage {
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid #b2b2b2;
	font-size: 14px;
	color: #b2b2b2;
	font-weight: 700;
	line-height: 28px;
	text-align: center;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	margin-right: 0;
}

.product__pagination a:hover, .blog__pagination a:hover, #currentPage {
	background: #4C50BB;
	border-color: #4C50BB;
	color: #ffffff;
}

.product__pagination a:last-child, .blog__pagination a:last-child {
	margin-right: 0;
}
</style>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	$(function(){
		$('#cate').change(function(){
			var type=$(this).find('option:selected').val();
			if(type==0){
				location.href="<c:url value='/notice/noticeList.do?type=0'/>";
			}else if(type==1){
				location.href="<c:url value='/notice/noticeList.do?type=1'/>";
			}else if(type==2){
				location.href="<c:url value='/notice/noticeList.do?type=2'/>";
			}else if(type==3){
				location.href="<c:url value='/notice/noticeList.do?type=3'/>";
			}
		});
	});
	
	
	
</script>


<%@ include file="../inc/bottom.jsp"%>