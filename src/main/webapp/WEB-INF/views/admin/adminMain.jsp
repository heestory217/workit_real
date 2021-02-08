<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/top.jsp" %>
<%@ include file="inc/sideMenu.jsp" %>
<div class="container-fluid  dashboard-content"">
<!-- 사이트 방문자, 회원 통계 -->



<!-- 월간 총 수익 -->
	<div class="row" style="border-bottom: 1px solid #ddd; margin-bottom: 30px;">
		<c:import url="/admin/main/sales/totalSales.do"/>
	</div>
<!-- 서비스별 월간 총 수익 -->
	<div>
		<c:import url="/admin/main/sales/serviceSales.do"/>
	</div>
</div>

<%@ include file="inc/bottom.jsp" %>