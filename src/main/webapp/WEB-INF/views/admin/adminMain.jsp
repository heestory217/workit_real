<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/top.jsp" %>
<%@ include file="inc/sideMenu.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/adminMain.css'/>" />
<!-- 사이트 방문자, 회원 통계 -->
	<div class="row margin_view">
		<!-- 총 유저 수 -->
		<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<div class="d-inline-block">
						<h5 class="text-muted">총 유저 수</h5>
						개인<h2 class="mb-0"><fmt:formatNumber value="${totalIndivUsers }" pattern="#,###"></fmt:formatNumber> </h2>
						기업<h2 class="mb-0"><fmt:formatNumber value="${totalCorpUsers }" pattern="#,###"></fmt:formatNumber> </h2>
					</div>
					<div
						class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
						<i class="fa fa-user fa-fw fa-sm text-primary"></i>
					</div>
				</div>
			</div>
		</div>
	
		<!-- 총 탈퇴 유저 수 -->
		<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<div class="d-inline-block">
						<h5 class="text-muted">총 탈퇴 유저 수</h5>
						개인<h2 class="mb-0"><fmt:formatNumber value="${totalIndivWithdrawUsers }" pattern="#,###"></fmt:formatNumber> </h2>
						기업<h2 class="mb-0"><fmt:formatNumber value="${totalCorpWithdrawUsers }" pattern="#,###"></fmt:formatNumber> </h2>
					</div>
					<div
						class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
						<i class="fas fa-frown fa-fw fa-sm text-secondary"></i>
					</div>
				</div>
			</div>
		</div>
	
		<!-- 총 방문자 수 -->
		<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<div class="d-inline-block">
						<h5 class="text-muted">총 방문자 수</h5>
						<h2 class="mb-0"><fmt:formatNumber value="${totalVisitor }" pattern="#,###"></fmt:formatNumber> </h2>
					</div>
					<div
						class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
						<i class="fa fa-eye fa-fw fa-sm text-info"></i>
					</div>
				</div>
			</div>
		</div>
	
		<!-- 총 수익 -->
		<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
			<div class="card">
				<div class="card-body">
					<div class="d-inline-block">
						<h5 class="text-muted">총 수익</h5>
						<h2 class="mb-0"><fmt:formatNumber value="${totalPay }" pattern="#,###"></fmt:formatNumber> </h2>
					</div>
					<div
						class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
						<i class="fa fa-money-bill-alt fa-fw fa-sm text-brand"></i>
					</div>
				</div>
			</div>
		</div>
	
	</div>
<!-- total -->

 <c:import url="/admin/main/userCount/userStats.do"/>
 
<!-- ============================================================== -->

<div style="border-bottom: 1px solid #ddd;" class="container-fluid  dashboard-content"">
	<div class="row" style="border-bottom: 1px solid #ddd; margin-bottom: 30px;">
		<c:import url="/admin/main/sales/totalSales.do"/>
	</div>
<!-- 서비스별 월간 총 수익 -->
	<div>
		<c:import url="/admin/main/sales/serviceSales.do"/>
	</div>
</div>

<!-- bootstap bundle js -->
    <script src="<c:url value='/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>
    <!-- slimscroll js -->
    <script src="<c:url value='/resources/admin/assets/vendor/slimscroll/jquery.slimscroll.js'/>"></script>
    <!-- main js -->
    <script src="<c:url value='/resources/admin/assets/libs/js/main-js.js'/>"></script>
    <!-- chart chartist js -->
    <script src="<c:url value='/resources/admin/assets/vendor/charts/chartist-bundle/chartist.min.js'/>"></script>
    <!-- sparkline js -->
    <script src="<c:url value='/resources/admin/assets/vendor/charts/sparkline/jquery.sparkline.js'/>"></script>
    <!-- morris js -->
    <script src="<c:url value='/resources/admin/assets/vendor/charts/morris-bundle/raphael.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/vendor/charts/morris-bundle/morris.js'/>"></script>
    <!-- chart c3 js -->
    <script src="<c:url value='/resources/admin/assets/vendor/charts/c3charts/c3.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/vendor/charts/c3charts/d3-5.4.0.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/vendor/charts/c3charts/C3chartjs.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/libs/js/dashboard-ecommerce.js'/>"></script>

</div>
</div>
</body>
 
</html>