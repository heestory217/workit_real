<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript">
	
</script>
<!-- Register Section Begin -->
<div class="register-login-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3">
				<div class="register-form">
					<h2>기업 	등록</h2>
					<form>
						<div class="group-input">
							<label for="username">법인명</label>
							<input type="text" id="corpName" name="corpName">
						</div>
						<button class="site-btn register-btn">검색</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
    <form class="checkout-form" name="corpRegi" method="POST" 
    		action="<c:url value='/company/corp/corpWrite.do'/>"
    		enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="row">
                        <input type="hidden" id="corpName" name="corpName">
                    <div class="col-lg-6">
                        <label for="fir">기업 대표자 성명<span>*</span></label>
                        <input type="text" id="corpHeadname" name="corpHeadname">
                    </div>
                    <div class="col-lg-6">
                        <label for="last">사업자 등록 번호<span>*</span></label>
                        <input type="text" id="corpCorpaddnumber" name="corpCorpaddnumber">
                    </div>
                    <div class="col-lg-6">
                        <label for="cun-name">기업 종업원 수<span>*</span></label>
                        <input type="text" id="corpPnumber" name="corpPnumber">
                    </div>
                    <div class="col-lg-6">
                        <label for="cun-name">기업1인 평균 급여 금액<span>*</span></label>
                        <input type="text" id="corpAvrpay" name="corpAvrpay">
                    </div>
                    <div class="col-lg-12">
                        <label for="street">기업주소<span>*</span></label>
                        <input type="text" id="corpAddress1" class="street-first" name="corpAddress1">
                        <input type="text" id="corpAddress2" name="corpAddress2">
                    </div>
                    <div class="col-lg-12">
                        <label for="zip">기업구우편번호</label>
                        <input type="text" id="corpZipcode" name="corpZipcode">
                    </div>
                    <div class="col-lg-12">
                        <label for="town">기업홈페이지URL<span>*</span></label>
                        <input type="text" id="corpWebaddress" name="corpWebaddress">
                    </div>
                    <div class="col-lg-12">
                        <label for="town">기업주요사업명<span>*</span></label>
                        <input type="text" id="corpIndustry" name="corpIndustry">
                    </div>
                    <div class="col-lg-6">
                        <label for="email">기업 전화 번호<span>*</span></label>
                        <input type="text" id="corpTel" name="corpTel">
                    </div>
                    <div class="col-lg-6">
                        <label for="phone">기업 설립 일자<span>*</span></label>
                        <input type="text" id="corpStardate" name="corpStardate">
                    </div>
                    <div class="col-lg-12">
                        <label for="cun">로고이미지<span>*</span></label>
                        <input type="file" id="corpImgurl" name="corpImgurl">
        	            </div>
                    <div class="col-lg-12">
                    	<label for="cun">기업 소개<span>*</span></label>
                    	<textarea class="content" id="content" name="content"></textarea><br><br>
						<script type="text/javascript">
							CKEDITOR.replace('content',
								{height : 400});
						</script>
                    </div>
				<button class="site-btn register-btn" type="submit">기업 등록</button><br><br>
                </div>
            </div>
        </div>
    </form>
</div>



<%@ include file="../../inc/bottom.jsp"%>