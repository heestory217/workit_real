<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Fashi | Template</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/font-awesome.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/themify-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/elegant-icons.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/nice-select.css"/>" type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/jquery-ui.min.css"/>"
	type="text/css">
<link rel="stylesheet"
	href="<c:url value="/resources/css/slicknav.min.css"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"
	type="text/css">

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
<script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/check.js"/>"
	type="text/javascript"></script>
<script src="https://kit.fontawesome.com/a86f09c0f4.js"
	crossorigin="anonymous"></script>

<style type="text/css">
.order-total {
    width: 800px;
    position: relative;
    height: 400px;
}

.checkout-form .place-order .order-total .order-btn .place-btn {
	padding: 13px 40px 11px;
	background: #4C50BB;
	border: none;
}

p.liinfo {
    color: #252525;
    font-size: 14px;
    font-weight: 700;
    margin: 11px 0 37px 0;
}

.atta {
	margin: -20px 0 25px 0;
	color: #252525;
	font-size: 14px;
	font-weight: 700;
}

.pc-item {
	border: 1px solid #ddd;
	padding: 15px;
	margin: 0 0 10px 0;
}

.apply-warp {
	height: 800px;
}

.info-warp {
    float: left;
    width: 45%;
}

.payment-check {
    float: right;
    width: 45%;
    margin-top: 29px;
}
.order-btn {
    width: 100%;
    height: 50px;
    float: left;
    margin: 0 auto;
}
</style>
<script type="text/javascript">
$(function(){
	
	
	
});

</script>
</head>

<!-- http://localhost:9090/workit/recruit/recruitdetail.do?recruitannounceNo=3
	여기에 include 하기
 -->

<body>
	<section class="checkout-section spad" id="warp2">
		<div class="container">
			<form action="#" class="checkout-form">
				<div class="row">
					<div class="place-order">
						<div class="order-total">
							<div class="info-warp">
								<p class="liinfo">지원정보</p>
								<ul class="order-table">
									<li class="fw-normal">이름 <span>$60.00</span></li>
									<li class="fw-normal">이메일<span>$60.00</span></li>
									<li class="fw-normal">연락처<span>$60.00</span></li>
								</ul>
							</div>
							<div class="payment-check">
								<div class="atta">첨부파일</div>
								<div class="atta-warp">
									<div class="pc-item">
										<label for="pc-check"> 이력서 이름 <input type="checkbox"
											id="pc-check" name=""> <span class="checkmark"></span>
										</label>
									</div>
									<div class="pc-item">
										<label for="pc-check"> 이력서 이름 <input type="checkbox"
											id="pc-check" name=""> <span class="checkmark"></span>
										</label>
									</div>
									<div class="pc-item">
										<label for="pc-check"> 이력서 이름 <input type="checkbox"
											id="pc-check" name=""> <span class="checkmark"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="order-btn">
								<button type="submit" class="site-btn place-btn">제출하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

</body>
</html>