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
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/chartist-bundle/chartist.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/morris-bundle/morris.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/c3charts/c3.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/flag-icon-css/flag-icon.min.css'/>">
    <title>Work IT - 관리자 페이지</title>
</head>


<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="<c:url value='/admin/adminMain.do'/>"><img alt="mainLogo" src="<c:url value='/resources/img/logo_workit.PNG'/>"> </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="<c:url value='/resources/admin/assets/images/avatar-1.jpg'/>" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                	<c:if test="${!empty sessionScope.managerId }">
					                	<h5 class="mb-0 text-white nav-user-name">${sessionScope.managerName } 관리자 </h5>
					                </c:if>
					                <c:if test="${empty sessionScope.managerId }">
					                	<h5 class="mb-0 text-white nav-user-name">John Abraham </h5>
					                </c:if>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->