<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="inc/top.jsp" %>
<%@ include file="inc/sideMenu.jsp" %>
<div style="border-bottom: 1px solid #ddd;" class="container-fluid  dashboard-content"">
	<div class="row">
				<c:import url="/admin/main/sales/totalSales.do"/>
	</div>
	<div>
		<c:import url="/admin/main/sales/serviceSales.do"/>
	</div>
</div>

<%@ include file="inc/bottom.jsp" %>