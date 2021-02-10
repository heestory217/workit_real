<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Work IT | 개발자를 위한 취업 사이트</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/themify-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/elegant-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/slicknav.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
    
    <!-- Js Plugins -->
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.countdown.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.zoom.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.dd.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/main.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</head>
<section class="blog-details spad" style="padding-bottom: 20px;padding-top: 50px;">
<div class="container">
<div class="row">
<div class="col-lg-12">
	<!-- 반복 -->	
	<c:if test="${empty crVoList}">
	 	현재 채용중인 공고가 없습니다.
	</c:if>
	<c:if test="${!empty crVoList}">
		<c:forEach var="crVo" items="${crVoList }">
			<div class="blog-details-inner">
			<div class="posted-by" style="margin-bottom: 30px;">
			<div class="pb-pic">
			<img src="<c:url value='/pd_images/${crVo.corpImgurl }'/>" style="width: 60px;">
			</div>
				<div class="pb-text">
			<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${crVo.recruitannounceNo }'/>">
				    <h5>${crVo.recruitannounceTitle }</h5>
			 </a>
				<p>
				   연봉 : ${crVo.recruitannounceSpay }만원 &nbsp;&nbsp;&nbsp;
				   언어 : ${crVo.recruitannounceSkill } &nbsp;&nbsp;&nbsp;
				   지원자격 : ${crVo.recruitannounceWantedcarrer }년 이상
				</p>
			 </div>
			</div>
			</div>
		</c:forEach>
	</c:if>
		
	<!-- 반복 끝 -->
</div>
</div>
</div>
</section>