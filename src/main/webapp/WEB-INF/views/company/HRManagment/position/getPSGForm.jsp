<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제안 양식 불러오기</title>

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
		$('form[name=bringPSGForm]').submit(function(){
			$.ajax({
				url : "<c:url value='/company/HRManagment/getPSGFormDetail.do'/>",
				type : "POST",
				dataType: "json",
				data : "positionsuggestNo="+$('#positionsuggestNo option:selected').val(),
				success : function(res) {
					//res = map
					title = res["POSITIONSUGGEST_TITLE"];
					position = res["POSITIONSUGGEST_POSITION"];
					price = res["POSITIONSUGGEST_PRICE"];
					contents = res["positionsuggestContents"];
					
					send(title,position,price,contents);
				},
				error : function(xhr, status, error) {
					alert('error! : ' + error);
				}
			});	//AJAX
		});
	});

	function send(title,position,price,contents) {
		opener.document.positionFrm.positionsuggestTitle.value = title;
		opener.document.positionFrm.positionsuggestPosition.value = position;
		opener.document.positionFrm.positionsuggestPrice.value = price;
		opener.CKEDITOR.instances.positionsuggestContents.setData(contents);
		self.close();
	}
</script>
</head>

<body>
<section class="blog-section spad" style="padding: 10%;">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
				<div class="blog-details-inner">
					<div class="leave-comment" style="padding-top: 0">
						<div class="row">
							<div class="col-lg-12" style="text-align: center;">
								<h4>양식 선택</h4>
							</div>
							<div class="col-lg-6">
								<form id="bringPSGForm" name="bringPSGForm" method="post" action="#">
									<div class="center">
										
										<select id="positionsuggestNo" style="width: -webkit-fill-available;height: 40px;">
							            	<option disabled selected>제안 양식</option>
	            							<c:forEach var="map" items="${list}">
										        <!-- 제목이 긴 경우 일부만 보여주기 -->
												<c:if test="${fn:length(map['POSITIONSUGGEST_TITLE'])>=30}">
													<option value="${map['POSITIONSUGGEST_NO']}">
														${fn:substring(map['POSITIONSUGGEST_TITLE'],0,30) } ...
													</option>
												</c:if>
												<c:if test="${fn:length(map['POSITIONSUGGEST_TITLE'])<30}">						
													<option value="${map['POSITIONSUGGEST_NO']}">
														${map['POSITIONSUGGEST_TITLE']}
													</option>
												</c:if>
											</c:forEach>
										</select>
										
										<input type="submit" class="site-btn" id="bringForm"
											style="margin-top: 20px;width: -webkit-fill-available;" value="불러오기">
							        </div>
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