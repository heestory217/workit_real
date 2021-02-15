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
                         <li class="breadcrumb-item" style="font-size: initial;">기존 쿠폰을 수정하려면 쿠폰 목록에서 쿠폰명을 클릭하세요.</li>
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
						<col style="width:25%;" />
						<col style="width:25%;" />		
					</colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">#</th>
	                        <th scope="col">쿠폰명</th>
	                        <th scope="col" style="text-align: center;">할인률</th>
	                        <th scope="col" style="text-align: center;">시작일</th>
	                        <th scope="col" style="text-align: center;">종료일</th>
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
			                        <td scope="row" style="font-weight: bold;">${vo.couponNo}</td>
			                        <td><a href="#">${vo.couponName}</a></td>
			                        <td align="center">${vo.couponRate} %</td>
			                        <td align="center"><fmt:formatDate value="${vo.couponStartdate}" type="both" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			                        <td align="center"><fmt:formatDate value="${vo.couponEnddate}" type="both" pattern="yyyy-MM-dd hh:mm:ss"  /></td>
			                    </tr>
							</c:forEach>
						</c:if>
	                </tbody>
	            </table>
	        </div>
	    </div>
	
		<div style="text-align: right;">
			<a href="#" class="btn btn-rounded btn-primary">신규 등록</a>
		</div>
	
		<div class="card" style="margin-top: 30px;">
		    <h5 class="card-header">Management</h5>
		    <div class="card-body">
		        <form id="couponUpdateFrm" action="<c:url value='/admin/paidService/coupon/update.do'/>" method="post">
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
				            <input type="date" required="required" class="form-control" name="couponStartdate" id="couponStartdate">
		                </div>
		            </div>
		            <div class="form-group row">
		                <label class="col-12 col-sm-3 col-form-label text-sm-right">종료일</label>
		                <div class="col-12 col-sm-8 col-lg-6">
				            <input type="date" required="required" class="form-control" name="couponEnddate" id="couponEnddate">
		                </div>
		            </div>
		            <div class="form-group row text-right">
		                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
		                    <button type="submit" class="btn btn-space btn btn-brand">수정</button>
		                    <button class="btn btn-space btn btn-dark">취소</button>
		                </div>
		            </div>
		        </form>
		    </div>
		</div>
	</div>
</div>

<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
 
<script type="text/javascript">
	$(function(){
		
		$('tr td a').each(function(index, item){
			$(this).click(function(){
				$.ajax({
					url:"<c:url value='/admin/paidService/coupon/showInfo.do'/>",
					type:"POST",
					data:{
						couponNo : $(this).parent().prev().html()
					},
					dataType:"json",
					success:function(vo){
						//성공하면 표에 입력
						$('#couponName').val(vo.couponName);
						$('#couponRate').val(vo.couponRate);
						$('#couponStartdate').val(startDate);
						$('#couponEnddate').val(endDate);
					},
					error:function(xhr, status, error){
						alert('error! : '+error);
					}
				});	//ajax
				event.preventDefault();
			});	//click
		});	//each
	});
	
	function getTimestampToDate(timestamp){
	    var date = new Date(timestamp*1000);
	    var chgTimestamp = date.getFullYear().toString()
	        +addZero(date.getMonth()+1)
	        +addZero(date.getDate().toString())
	        +addZero(date.getHours().toString())
	        +addZero(date.getMinutes().toString())
	        +addZero(date.getSeconds().toString());
	    return chgTimestamp;
	}
	function addZero(data){
	    return (data<10) ? "0" + data : data;
	}
	
</script>

<script src="<c:url value='/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/slimscroll/jquery.slimscroll.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/libs/js/main-js.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/datepicker/moment.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/datepicker/tempusdominus-bootstrap-4.js'/>"></script>
<script src="<c:url value='/resources/admin/assets/vendor/datepicker/datepicker.js'/>"></script>
 

<%@ include file="../../inc/bottom.jsp" %>