<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
.fqst {
	padding: 0 0 15px 0;
}

.faqBt {
	background: #4C50BB;
	margin: 50px 0;
	float: right;
}

span#listEmpth {
    display: block;
    text-align: center;
    width: 300px;
    margin: 0 auto;
    padding: 14px;
    font-size: 18px;
}

.tableBx{
	width:100%;
	height:auto;
 	margin: 30px 0;	
 	clear:both;
 	border:1px solid gray;
}
/*  */

.listDiv{
	padding:0px;
}

.searchBx{
    width: 400px;
    float:right;
    margin-left: 478px;
}

.float_right{
	float:right !important;
}

[name=classificationNo]{
    height: 100%;
    border: none;
    outline: none;
}

.center{
	text-align:center;
}

th, select[name=classificationNo]{
    color: #4C4747;
    font-weight: 600;
}

</style>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>FAQs</span>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Faq Section Begin -->
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
				<div class="container">
					<div class="row">
						<!-- 검색 -->
						<div class="input-group input-search searchBx float_right">
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
				<th scope="col" id="category">
				<select name="classificationNo" class="margin_right_5" id="cate">
						<option value="0">분류</option>
						<option value="1"
							<c:if test="${param.type=='1'}">
								selected="selected"
							</c:if>
						>공지</option>
						<option value="2"
							<c:if test="${param.type=='2'}">
								selected="selected"
							</c:if>
						>이벤트</option>
						<option value="3"
							<c:if test="${param.type=='3'}">
								selected="selected"
							</c:if>
						>안내</option>
						
		        </select>
				</th>
				<th scope="col" class="center">제목</th>
				<th scope="col" class="center">등록일</th>
			</tr>
		</thead>
		<tbody>
	            <tr class="center">
		            <td colspan="3"><br><br>
		            	<p>요청하신 결과가 없습니다.</p><br>
		            </td>
	            </tr>
            
            	<!-- 글이 있는 경우 반복 시작-->
            	<c:set var="n" value="0"/>
            		<tr class="center">
            			<td></td>
            			<td></td>
            			<td></td>
            		</tr>
            		<c:set var="n" value="${n+1}"/>	
           	<!-- 반복 끝 -->	
		</tbody>
	</table>
</div> <!-- table -->
	
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Faq Section End -->

<style>
.accordion {
	background-color: #fff;
	cursor: pointer;
	padding: 3px;
	width: 100%;
	text-align: left;
	outline: none;
	font-size: 15px;
	transition: all 0.5s;
	border: none;
    border-bottom: 2px solid #4C4747;
}

.active, .accordion:hover {
	background-color: #4C50BB;
	color: #fff;
}

.accordion::after {
	content: "\002B";
	color: #777;
	font-weight: bold;
	float: right;
	margin-left: 5px;
	font-size: 25px;
}

.active::after {
	content: "\2212"
}

.text {
	padding: 0 18px;
	background-color: #fff;
	height: 100px;
	overflow: hidden;
	transition: all 0.5s;
	display: none;
	border-bottom: 2px solid #4C4747;
}

.register-login-section.spad.fqst {
    border-bottom: 2px solid #4C4747;
}

</style>

<%@ include file="../inc/bottom.jsp"%>