<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>

<div class="container-fluid  dashboard-content">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
         <div class="page-header">
             <h2 class="pageheader-title"> 쿠폰 관리 </h2>
             <p class="pageheader-text">유료서비스 구매 시 회원이 사용하는 쿠폰을 관리하는 페이지입니다.</p>
             <div class="page-breadcrumb">
                 <nav aria-label="breadcrumb">
                     <ol class="breadcrumb">
                         <li class="breadcrumb-item" style="font-size: initial;">기존 쿠폰을 수정하려면 수정버튼을 클릭하세요.</li>
                         <li class="breadcrumb-item" style="font-size: initial;">쿠폰 적용을 해제하고 싶을 경우, 수정기능을 이용하여 종료일을 오늘날짜보다 이전날짜로 설정하세요.</li>
                     </ol>
                 </nav>
             </div>
         </div>
     </div>
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	    <div class="card">
	        <h5 class="card-header">목록</h5>
	        <div class="card-body">
	            <table class="table table-hover">
				    <colgroup>
						<col style="width:5%;" />
						<col style="width:30%;" />
						<col style="width:15%;" />
						<col style="width:20%;" />
						<col style="width:20%;" />		
						<col style="width:10%;" />		
					</colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">#</th>
	                        <th scope="col">쿠폰명</th>
	                        <th scope="col" style="text-align: center;">할인률</th>
	                        <th scope="col" style="text-align: center;">시작일</th>
	                        <th scope="col" style="text-align: center;">종료일</th>
	                        <th scope="col" style="text-align: center;">수정</th>
	                    </tr>
	                </thead>
	                <tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="5">등록된 쿠폰이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list}">
							<c:forEach var="vo" items="${list}">
			                    <tr>
			                        <td scope="row" style="font-weight: bold;" id="no">${vo.couponNo}</td>
			                        <td>${vo.couponName}</td>
			                        <td align="center">${vo.couponRate} %</td>
			                        <td align="center"><fmt:formatDate value="${vo.couponStartdate}" type="both" /></td>
			                        <td align="center"><fmt:formatDate value="${vo.couponEnddate}" type="both" /></td>
			                        <td align="center"><a href="#" onclick="execForm(${vo.couponNo})" class="text-primary">수정</a></td>
			                    </tr>
							</c:forEach>
						</c:if>
	                </tbody>
	            </table>
	        </div>
	    </div>
	
		<div class="card" style="margin-top: 30px;">
		    <h5 class="card-header">등록</h5>
		    <div class="card-body">
		        <form id="couponInsertFrm" action="<c:url value='/admin/paidService/coupon/insert.do'/>" method="post">
		            <div class="form-group row">
		                <label class="col-12 col-sm-3 col-form-label text-sm-right">쿠폰명</label>
		                <div class="col-12 col-sm-8 col-lg-6">
		                    <input type="text" required="required" maxlength="26"
		                    	placeholder="쿠폰명은 최대 26자 입력가능합니다" class="form-control" name="couponName" id="couponName">
		                </div>
		            </div>
		            <div class="form-group row">
		                <label class="col-12 col-sm-3 col-form-label text-sm-right">할인율</label>
		                <div class="col-12 col-sm-8 col-lg-6">
		                    <input required="required" type="number" min="0" max="100" 
		                    	placeholder="할인율을 입력하세요 (0~100)" class="form-control" name="couponRate" id="couponRate">
		                </div>
		            </div>
		            <div class="form-group row">
		                <label class="col-12 col-sm-3 col-form-label text-sm-right">시작일</label>
		                <div class="col-12 col-sm-8 col-lg-6">
				            <input type="date" required="required" class="form-control" name="start" id="couponStartdate">
		                </div>
		            </div>
		            <div class="form-group row">
		                <label class="col-12 col-sm-3 col-form-label text-sm-right">종료일</label>
		                <div class="col-12 col-sm-8 col-lg-6">
				            <input type="date" required="required" class="form-control" name="end" id="couponEnddate">
		                </div>
		            </div>
		            <div class="form-group row text-right">
		                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
		                    <button type="submit" class="btn btn-space btn btn-primary">신규 등록</button>
		                    <button type="reset" class="btn btn-space btn btn-dark">취소</button>
		                </div>
		            </div>
		        </form>
		    </div>
		</div>
	</div>
</div>

<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>

<script type="text/javascript">
function execForm(couponNo) {
	var _width = '700';
	var _height = '380';

	var _left = Math.ceil((window.screen.width - _width) / 2);
	var _top = Math.ceil((window.screen.height - _height) / 2);

	window.open('<c:url value="/admin/paidService/coupon/updateForm.do?couponNo='+couponNo+'"/>', '쿠폰 수정', 
			'width=' + _width + ', height=' + _height  + ', left=' + _left + ', top=' + _top);
}
</script>

<script src="<c:url value='/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/slimscroll/jquery.slimscroll.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/libs/js/main-js.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/datepicker/moment.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/datepicker/tempusdominus-bootstrap-4.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/datepicker/datepicker.js'/>"></script>
 

<%@ include file="../../inc/bottom.jsp" %>