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
<script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/js/check.js"/>" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/a86f09c0f4.js" crossorigin="anonymous"></script>

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

.rs-item {
    border: 1px solid #ddd;
    padding: 15px;
    margin: 0 0 10px 0;
    position: relative;
    height: 54px;
}
.checkout-form label {
    color: #252525;
    font-size: 16px;
    margin-bottom: -2px;
}
input#rs-check {
    width: 15px;
    float: left;
    margin-right: 10px;
    margin-top: -12px;
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

.atta-warp {
    height: 186px;
    overflow: auto;
    padding: 5px;
}
</style>
<script type="text/javascript">
$(function(){
// 	$('form[name=rpfrm]').submit(function(){
// 		if ($('#rs-check').is(":checked").length>1) {
// 			alert('이력서는 하나만 선택하셔야합니다');
// 			event.preventDefault();
// 		} else if ($('#rs-check').is(":checked").length==0) {
// 			alert('이력서를 선택하셔야합니다');
// 			event.preventDefault();
// 		}
// 	});
	
	
		$('form[name=rpfrm]').submit(function() {
			var len =$('input:checkbox[id="rs-check"]:checked').length;

			if (len > 1) {
				alert('이력서는 하나만 선택하셔야합니다');
				return false;
			} else if (len == 0) {
				alert('이력서를 선택하셔야합니다');
				return false;
			} else{
				alert('지원하시겠습니까?');
			}
		});

	});
</script>
</head>

<!-- http://localhost:9090/workit/recruit/recruitdetail.do?recruitannounceNo=3
	여기에 include 하기
	recvo => 공고번호 여기 있음
 -->

<body>
	<section class="checkout-section spad" id="warp2" style="padding-left: 14%;padding-right: 13%;">
		<div class="container">
			<form action="<c:url value='/recruit/recruitdetail.do'/>" 
				class="checkout-form" name="rpfrm" method="POST">
				<div class="row">
					<div class="place-order">
						<div class="order-total">
							<div class="info-warp">
								<p class="liinfo">지원정보</p>
								<ul class="order-table">
									<li class="fw-normal">이름 <span>${userVo.userName }</span></li>
									<li class="fw-normal">이메일<span>${userVo.userEmail1}@${userVo.userEmail2 }</span></li>
									<li class="fw-normal">연락처<span>${userVo.userHp1}-${userVo.userHp2}-${userVo.userHp3 }</span></li>
								</ul>
							</div>
							<div class="payment-check">
								<div class="atta">첨부파일</div>
								<div class="atta-warp">
									<!-- 반복  -->
									<c:forEach var="rVo" items="${rlist}">
										<c:if test="${rVo.resumeResumeopencheck =='2'}">
											<div class="rs-item">
												<label for="rs-check"> ${rVo.resumeTitle }
													<input type="checkbox" id="rs-check" name="resumeNo" value="${rVo.resumeNo }"> 
												</label>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
							<input type="hidden" name="recruitannounceNo" value="${param.recruitannounceNo }"/>
							<input type="hidden" name="userNo" value="${userVo.userNo}"/>
							<div class="order-btn">
								<button type="submit" class="site-btn place-btn" id="applyBt">지원하기</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

</body>
</html>