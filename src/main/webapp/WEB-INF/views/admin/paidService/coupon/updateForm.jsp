<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html>
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css'/>">
    <link href="<c:url value='/resources/admin/assets/vendor/fonts/circular-std/style.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/libs/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/datepicker/tempusdominus-bootstrap-4.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/chartist-bundle/chartist.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/morris-bundle/morris.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/c3charts/c3.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/flag-icon-css/flag-icon.min.css'/>">
    <title>Work IT - 관리자 페이지</title>
    
</head>
<body>

	<div class="card">
	    <h5 class="card-header">수정</h5>
	    <div class="card-body">
	        <form id="couponUpdateFrm" action="<c:url value='/admin/paidService/coupon/update.do'/>" method="post">
	            <div class="form-group row">
	                <label class="col-12 col-sm-3 col-form-label text-sm-right">쿠폰명</label>
	                <div class="col-12 col-sm-8 col-lg-6">
	                    <input type="hidden" name="couponNo" value="${param.couponNo}">
	                    <input type="text" required="required" maxlength="26" value="${vo.couponName}"
	                    	placeholder="쿠폰명은 최대 26자 입력가능합니다" class="form-control" name="couponName" id="couponName">
	                </div>
	            </div>
	            <div class="form-group row">
	                <label class="col-12 col-sm-3 col-form-label text-sm-right">할인율</label>
	                <div class="col-12 col-sm-8 col-lg-6">
	                    <input required="required" type="number" min="0" max="100" value="${vo.couponRate}"
	                    	placeholder="할인율을 입력하세요 (0~100)" class="form-control" name="couponRate" id="couponRate">
	                </div>
	            </div>
	            <div class="form-group row">
	                <label class="col-12 col-sm-3 col-form-label text-sm-right">시작일</label>
	                <div class="col-12 col-sm-8 col-lg-6">
			            <input type="date" required="required" class="form-control" name="start" id="couponStartdate" value="${couponStartdate}">
	                </div>
	            </div>
	            <div class="form-group row">
	                <label class="col-12 col-sm-3 col-form-label text-sm-right">종료일</label>
	                <div class="col-12 col-sm-8 col-lg-6">
			            <input type="date" required="required" class="form-control" name="end" id="couponEnddate" value="${couponEnddate}">
	                </div>
	            </div>
	            <div class="form-group row text-right">
	                <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
	                    <button type="submit" class="btn btn-space btn btn-primary">쿠폰 수정</button>
	                </div>
	            </div>
	        </form>
	    </div>
	</div>

</body>
</html>