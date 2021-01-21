<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <style type="text/css">
	    .product__pagination a,
		.blog__pagination a,
		#currentPage {
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 1px solid #b2b2b2;
		font-size: 14px;
		color: #b2b2b2;
		font-weight: 700;
		line-height: 28px;
		text-align: center;
		margin-right: 16px;
		-webkit-transition: all, 0.3s;
		-moz-transition: all, 0.3s;
		-ms-transition: all, 0.3s;
		-o-transition: all, 0.3s;
		transition: all, 0.3s;
		}
		
		.product__pagination a:hover,
		.blog__pagination a:hover,
		#currentPage {
			background: #4C50BB;
			border-color: #4C50BB;
			color: #ffffff;
		}
		
		.product__pagination a:last-child,
		.blog__pagination a:last-child {
			margin-right: 0;
		}
    </style>
    
    <script type="text/javascript">
	    function pageFunc(curPage){
	    	$('input[name=currentPage]').val(curPage);
	    	$('form[name=frmPage]').submit();
	    }
    </script>
</head>
<!-- 기업 리뷰 리스트 반복 시작 -->
<body>
<form action="<c:url value='/company/corp/corpDetail.do?corpNo=${param.corpNo}'/>" name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="corpNo" value="${param.corpNo}">
</form>
<c:if test="${!empty reList}">
<c:forEach var="reVo" items="${reList}" >
	
  <div class="col-md-12 mb-3 mb-md-0" style="padding-left: 0px; padding-right: 0px;">
    <div class="card h-100"style="margin-bottom: 30px; margin-top: 60px;">
      <div class="card-body" style="padding: 3.3rem;">
        <div class="d-flex justify-content-between align-items-center" style="margin-bottom: 30px;">
          <div class="d-flex align-items-center"><img class="img-fluid" src="assets/img/gallery/user-3.png" alt="" />
            <div class="flex-1 ms-3">
              <h4 class="mb-0 fs--1 text-1000 fw-medium">${reVo.corpreviewOneline }</h6>
              <p class="fs--2 fw-normal mb-0"><fmt:formatDate value="${reVo.corpreviewDate}" pattern="yyyy년 MM월 dd일"/> </p>
            </div>
          </div>
          <div class="d-flex align-items-center"><span class="text-900 me-3">${reVo.corpreviewRate}</span><svg class="bi bi-star-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FEA250" viewBox="0 0 16 16">
              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"> </path>
            </svg></div>
        </div>
        <h6 style="color: #4C50BB; font-weight: 600;">장점</h6>
        <p class="card-text pt-3">${reVo.corpreviewGook}</p>
        <h6 style="color: #dc143c; font-weight: 600;">단점</h6>
        <p class="card-text pt-3" >${reVo.corpreviewBad}</p>
        <h6 style="font-weight: 600; color: #333;">경영진에게 바라는 점</h6>
        <p class="card-text pt-3" style="margin-bottom: 40px;">${reVo.corpreviewWant}</p>
        <hr style="margin-top: 20px;">
	  		<button type="button" class="btn" style="border-left-width: 0px;padding-left: 0px;padding-right: 0px;color: #999;">리뷰 삭제</button>
	  		</a>
      </div>

    </div>
  </div>
 </c:forEach>
 </c:if>
 
 <div class="col-lg-12">
 <div class="product__pagination blog__pagination">
 	<c:if test="${pagingInfo.firstPage>1 }">	
		<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
			<i class="fa fa-long-arrow-left"></i>
		</a>
	</c:if>
		

	<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
		<c:if test="${i==pagingInfo.currentPage }">
			<span id="currentPage" >
				${i}</span>			
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				${i}</a>			
		</c:if>
	</c:forEach>
	
	
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
			<i class="fa fa-long-arrow-right"></i>
		</a>
	</c:if>
    </div>
</div>
</body>
</html>
<!-- 기업 반복 끝 -->