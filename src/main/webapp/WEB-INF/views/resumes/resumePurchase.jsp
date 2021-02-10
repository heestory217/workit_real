<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Work IT | 이력서 열람권 구매</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">
</head>
   <style>
   body {
    	background-color: #4750d6;
	}
	
	.col-lg-3 {
		float:left;
	}
	
	.product-item .pi-text{
		width:100%;
		left: 30px;
		top: 40px;
		border: 1px solid #4750d6;
		padding: 25px 25px 60px 25px;
		border-radius: 20px;
		background-color: #fff;
	}
	.product-item .pi-pic .sale.pp-sale{
		top: 0px;
	    width: 100%;
	}
	
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
	
	.langTags{
	    border: 1px solid #ebebeb;
	    padding: 5px 5px 5px 10px; 
	    width: max-content;
	    float: left;
	    margin : 5px 5px 5px 0px;
	}
	
	.langName{
	    padding: 5px 5px 0px 5px;
        font-weight: 700;
	}
	
	.wantedArea{
	    background-color: #f2f2f2;
	    border-radius: 35px;
	    text-align: left;
	    padding: 5px 10px;
	    width: fit-content;
	    font-size: 14px;
	    color: #666;
	    float: left;
  		margin: 5px 5px 0px 0px;
	}
	
	select {
	    width: 90%;
	    height: 40px;
	    border: 1px solid #e6e6e6;
	    padding: 10px;
	    display :block;
	}
	.filter-btn {
		font-size: 14px;
		color: #4750d6;
		font-weight: 700;
		background: #FFFFFF;
		padding: 10px 20px;
		border-radius: 2px;
		display: inline-block;
		text-transform: uppercase;
	}
	
	</style>
<body>
<h4 style="text-align: center; margin-top: 40px; color: #fff; font-weight: 600; margin-bottom:20px;">
해당 이력서를 열람하기 위해서는<br>
이력서를 구매해야 합니다.
</h4>
	<div class="container">
		<div class="row">
			<div class="product-list" style="width: 100%;">
				<div class="product-item">
					<div class="pi-text">
						<c:if test="${resumeVo.userExperience eq 0}">
							<div class="catagory-name">신입</div>
						</c:if>
						<c:if test="${resumeVo.userExperience != 0}">
							<div class="catagory-name">${resumeVo.userExperience}년</div>
						</c:if>
						<a>
							<h5>${resumeVo.resumesVo.resumeTitle }</h5>
						</a>
						<!-- 언어 리스트 -->
						<div class="product-price">
							<c:forEach var="lang" items="${resumeVo.langList }">
								${lang.languageName} 
								</c:forEach>
						</div>
						<!-- 희망 근무 지역 리스트 -->
						<div class="areaList">
							<c:forEach var="area" items="${resumeVo.areaList}">
								<h5 class="wantedArea">${area.areaAdd1}${area.areaAdd2}</h5>
							</c:forEach>
						</div>
					</div>
				</div>
				<div>
					<input type="hidden" value="${resumeVo.resumesVo.resumeNo }" id="resumeNo">
					<input type="hidden" value="${userNo}" id="userNo">
					<a class="filter-btn" href="#" id="insertCart" onclick="insertCart('${resumeVo.resumesVo.resumeNo }')">장바구니 담기</a>
					<a class="filter-btn" href="#" style="float: right;" id="purchase" onclick="purchase('${resumeVo.resumesVo.resumeNo }')">이력서 열람 결제</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>" type="text/javascript"></script>
<script type="text/javascript">
function insertResume(no){
	var no = no;
	$.ajax({
			url:"<c:url value='/shop/insertCartAjax.do'/>",
		type:"GET",
		data:{
			resumeNo:no
		},
		dataType:"json",
		async: false,
		success:function(res){
			if(res==1){
				alert('이력서를 장바구니에 담았습니다.');
			}else if(res==2){
				alert('이미 장바구니에 담긴 이력서입니다.');
			}else if(res==3){
				alert('이미 구매한 이력서입니다.');
			}else{
				alert('이력서를 장바구니에 담을 수 없습니다.');
			}
		},
		error:function(xhs, status, error){
			alert('error : '+error);
		}
	});
}
	
function insertCart(resumeNo){
	insertResume(resumeNo);
	window.close();
}

function purchase(resumeNo){
	insertResume(resumeNo);
	window.opener.location.href="/workit/shop/checkOut.do";
	window.close();
}
		
</script>
</html>