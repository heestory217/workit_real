<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#corpSearchBtn').click(function(){
			open("/workit/company/corp/searchCorpname.do?corpName="+$('#corpName').val(), "chk",
			"width=600,height=900,left=0,top=0,location=yes,resizable=yes");
		});
		
      $('#corpStardate').datepicker({
          dateFormat : 'yy-mm-dd',
          changeYear : true,
          dayNamesMin : ['일','월','화','수','목','금','토'],
          monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
       });
	});
</script>
<div class="container">
    <form class="checkout-form" method="POST" enctype="multipart/form-data"
    		action="<c:url value='/company/corp/corpWrite.do'/>">
        <div class="row">
            <div class="col-lg-9 offset-lg-2">
   				<div class="section-title">
					<h2>기업 	등록</h2>
				</div>
                <div class="row">
                        <input type="text" name="userNo" value="${sessionScope.userNo}">
             	   <div class="col-lg-12">
                        <label for="corpName">법인명<span>*</span></label>
                        <input type="text" id="corpName" name="corpName">
                        <p>*기업의 법인명을 검색하면 자동으로 정보가 완성 됩니다.</p>
                        <input type="button" id="corpSearchBtn" value="검색"></input>
                   </div>
                    <div class="col-lg-12">
                        <label for="corpImgurl">로고이미지<span>*</span></label>
                        <input type="file" id="fileimg" name="fileimg">
       	            </div>
					<div class="col-lg-6">
                        <label for="corpHeadname">기업 대표자 성명<span>*</span></label>
                        <input type="text" id="corpHeadname" name="corpHeadname">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpCorpaddnumber">사업자 등록 번호<span>*</span></label>
                        <input type="text" id="corpCorpaddnumber" name="corpCorpaddnumber">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpPnumber">기업 종업원 수<span>*</span></label>
                        <input type="text" id="corpPnumber" name="corpPnumber">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpAvrpay">기업1인 평균 급여 금액<span>*</span></label>
                        <input type="text" id="corpAvrpay" name="corpAvrpay">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpAddress1">기업 주소<span>*</span></label>
                        <input type="text" id="corpAddress1" class="street-first" name="corpAddress1">
                        <input type="text" id="corpAddress2" name="corpAddress2">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpZipcode">우편번호</label>
                        <input type="text" id="corpZipcode" name="corpZipcode">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpWebaddress">기업 홈페이지 URL</label>
                        <input type="text" id="corpWebaddress" name="corpWebaddress">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpIndustry">기업 주요 사업명<span>*</span></label>
                        <input type="text" id="corpIndustry" name="corpIndustry">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpKind">중소기업 여부<span>*</span></label>
                        <input type="text" id="corpKind" name="corpKind">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpTel">기업 전화 번호<span>*</span></label>
                        <input type="text" id="corpTel" name="corpTel">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpStardate">기업 설립 일자<span>*</span></label>
                        <input type="text" id="corpStardate" name="corpStardate">
                    </div>
					<div class="col-lg-12">
                    	<label for="corpIntro">기업 소개<span>*</span></label>
                    	<textarea class="content" id="corpIntro" name="corpIntro"></textarea><br><br>
						<script type="text/javascript">
							CKEDITOR.replace('corpIntro',	{height : 400});
						</script>
                    </div>
					<button class="site-btn register-btn" type="submit">기업 등록</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../../inc/bottom.jsp"%>