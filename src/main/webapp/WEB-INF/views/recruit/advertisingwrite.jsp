<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채용공고 광고 등록/연장</title>

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
    
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=ADFrm]').submit(function(){
			self.close();
			send();
		});
	});

	function send() {
		opener.document.ADFrm.paidserviceNo.value = document.ADFrm.paidserviceNo.value;
		opener.document.ADFrm.recruitannounceNo.value = document.ADFrm.recruitannounceNo.value;
		opener.document.ADFrm.paidserviceenddate.value = document.ADFrm.paidserviceenddate.value;
	}
</script>
</head>

<body>
<section class="blog-section spad" style="padding: 10%;height: 328px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
				<div class="blog-details-inner">
					<div class="leave-comment" style="padding-top: 0">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<div class="tag-share" style="border-bottom: 0; padding-bottom: 20px; margin-top: 0px;">
			                    <div class="col-lg-9">
				                        <div class="details-tag">
				                            <ul>
				                                <li><i class="fa fa-tags"></i></li>
				                                <li style="color:#4C50BB;">채용공고 광고 등록/연장</li>
				                            </ul>
				                        </div>
			                    	</div>
			                    </div>
								
								<form name="ADFrm" action="" method="POST">
		                            <div style="text-align: center;">
			                            <h4>${selectadverinfoVO.recruitannounceTitle}</h4>
			                            <select id="paidserviceNo" name="paidserviceNo" style="width: -webkit-fill-available;height: 40px;">
	                           				<option value=7>광고1급7일</option>
	                              			<option value=8>광고1급15일</option>
	                         		        <option value=9>광고1급30일</option>
	                                        <option value=10>광고2급7일</option>
	                                        <option value=11>광고2급15일</option>
	                                        <option value=12>광고2급30일</option>
	                          			</select>
		                            </div>
		                            <input type="hidden" id="recruitannounceNo" name="recruitannounceNo" value="${selectadverinfoVO.recruitannounceNo}">
		                            <c:if test="${adverpaynowchek==0}">
				                        <button type="submit" class="site-btn register-btn" style="margin-top: 20px;width: -webkit-fill-available;"
				                        	id='recruitask' name='recruitask'>공고등록 요청
			                        	</button>
		                       		</c:if>
			                        <c:if test="${adverpaynowchek==1}">
				                        <h4>사용중인 상품명:${selectadverinfoVO.productName}<span style="float:right">종료일:
				                        <fmt:formatDate value="${selectadverinfoVO.adverEnddate}" pattern="yyyy/MM/dd"/></span></h4>
				                        <input type="hidden" id="paidserviceenddate" name="paidserviceenddate" value="${RecruitannounceVO.adverEnddate}">
			                            <button type="submit" class="site-btn register-btn" style="margin-top: 20px;width: -webkit-fill-available;"
				                            	id='recruitask' name='recruitask' style="">공고연장 요청
		                            	</button>
			                        </c:if>
		                        </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>