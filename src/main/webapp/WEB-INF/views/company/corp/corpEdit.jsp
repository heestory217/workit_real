<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		
		$('#corpSearchBtn')
				.click(
						function() {
							open(
									"/workit/company/corp/searchCorpname.do?corpName="
											+ $('#corpName').val(), "chk",
									"width=771,height=819,left=0,top=0,location=yes,resizable=yes");
						});

		$('#corpStardate').datepicker(
				{
					dateFormat : 'yymmdd',
					changeYear : true,
					changeMonth : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',	'8월', '9월', '10월', '11월', '12월' ]
				});

		$('form[name=corpfrm]').submit(function() {
				if($.trim($('#corpAvrpay').val())==''){
					$('#corpAvrpay').val(0);
				}
				if(!$("#corpName").val()){
					alert('법인명을 입력하세요.');
					$("#corpName").focus();
					event.preventDefault();
				}else if(!$("#corpHeadname").val()){
					alert('대표자 성명을 입력하세요');
					$("#corpHeadname").focus();
					event.preventDefault();
				}else if(!$("#corpCorpaddnumber").val()){
					alert('사업자 등록번호를 입력하세요');
					$("#corpCorpaddnumber").focus();
					event.preventDefault();
				}else if(!$("#corpPnumber").val()){
					alert('사원수를 입력하세요');
					$("#corpPnumber").focus();
					event.preventDefault();
				}else if(!$("#corpAddress1").val()){
					alert('기업 주소를 입력하세요');
					$("#corpAddress1").focus();
					event.preventDefault();
				}else if(!$("#corpIndustry").val()){
					alert('기업의 주요 사업분야를 입력하세요');
					$("#corpIndustry").focus();
					event.preventDefault();
				}else if(!$("#corpTel").val()){
					alert('기업 전화번호를 입력하세요.');
					$("#corpTel").focus();
					event.preventDefault();
				}else if(!$("#corpStartdate").val()){
					alert('기업 설립일자를 입력하세요');
					$("#corpStartdate").focus();
					event.preventDefault();
				}else if(!$("#corpIntro").val()){
					alert('기업 소개를 입력하세요.');
					$("#corpIntro").focus();
					event.preventDefault();
				}
				
				if($('#fileimg').val()){
					$('#corpImgurl').val("yes");
				}
				if($('#addimg1').val()){
					$('#img1').val("yes");
				}
				if($('#addimg2').val()){
					$('#img2').val("yes");
				}
				if($('#addimg3').val()){
					$('#img3').val("yes");
				}
				if($('#addimg4').val()){
					$('#img4').val("yes");
				}
			});
		});
</script>
<style type="text/css">
h2 {
    margin-top: 60px;
}

input[type=file]{
    border: 0;
	padding-left: 0px;
    padding-top: 11px;
}

.corpImgs{
	width: 48.8%;
    margin: 0 auto;
    margin-bottom: 4px;
}

#imgview{
	margin-bottom: 30px;
}

</style>
<div class="container">
    <form class="checkout-form" method="POST" enctype="multipart/form-data" name="corpfrm"
    		action="<c:url value='/company/corp/corpEdit.do'/>">
        <div class="row">
            <div class="col-lg-9 offset-lg-2">
   				<div class="section-title">
					<h2>기업 	정보 수정</h2>
				</div>
                <div class="row">
                        <input type="text" name="userNo" value="${cVo.userNo}">
                        <input type="text" name="corpNo" value="${cVo.corpNo}">
                        
                        <input type="text" name="oldCorpImgurl" value="${cVo.corpImgurl}">
                        <input type="text" name="oldAddimg1" value="${imgList[0].corpimgUrl}">
                        <input type="text" name="oldAddimg2" value="${imgList[1].corpimgUrl}">
                        <input type="text" name="oldAddimg3" value="${imgList[2].corpimgUrl}">
                        <input type="text" name="oldAddimg4" value="${imgList[3].corpimgUrl}">

                        <input type="text" name="corpImgurl" id="corpImgurl">
                        <input type="text" name="img1" id="img1">
                        <input type="text" name="img2" id="img2">
                        <input type="text" name="img3" id="img3">
                        <input type="text" name="img4" id="img4">
             	   <div class="col-lg-12">
                        <label for="corpName">법인명<span>*</span></label>
                        <input type="text" id="corpName" name="corpName" value="${cVo.corpName}" readonly>
                   </div>
                    <div class="col-lg-12">
                        <label for="corpImgurl">로고이미지<span>*</span></label>
                       	<div>
               	      	<input type="file" id="fileimg" name="fileimg" style="width: 82%;">
               	      	현재 이미지 <img src="<c:url value="/pd_images/${cVo.corpImgurl}"/>" style="width: 50px;">
               	      	</div>
       	            </div>
					<div class="col-lg-6">
                        <label for="corpHeadname">기업 대표자 성명<span>*</span></label>
                        <input type="text" id="corpHeadname" name="corpHeadname" value="${cVo.corpHeadname}">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpCorpaddnumber">사업자 등록 번호<span>*</span></label>
                        <input type="text" id="corpCorpaddnumber" name="corpCorpaddnumber" value="${cVo.corpCorpaddnumber}" readonly>
                    </div>
                    <div class="col-lg-6">
                        <label for="corpPnumber">사원수<span>*</span></label>
                        <input type="text" id="corpPnumber" name="corpPnumber" value="${cVo.corpPnumber}">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpAvrpay">기업 평균연봉</label>
                        <input type="text" id="corpAvrpay" name="corpAvrpay"  placeholder="만원 단위로 입력가능" value="${cVo.corpAvrpay }">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpAddress1">기업 주소<span>*</span></label>
                        <input type="text" id="corpAddress1" class="street-first" name="corpAddress1" value="${cVo.corpAddress1 }">
                        <input type="text" id="corpAddress2" name="corpAddress2" value="${cVo.corpAddress2 }">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpWebaddress">기업 홈페이지 URL</label>
                        <input type="text" id="corpWebaddress" name="corpWebaddress" value="${cVo.corpWebaddress }">
                    </div>
                    <div class="col-lg-12">
                 	<label for="corpIndustry">기업 주요 사업분야<span>*</span></label>
                        <input type="text" id="corpIndustry" name="corpIndustry" value="${cVo.corpIndustry}">
                    </div>
                    <div class="col-lg-12">
                        <label for="corpKind">중소기업 여부</label>
                        <input type="text" id="corpKind" name="corpKind" value="${cVo.corpKind}">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpTel">기업 전화 번호<span>*</span></label>
                        <input type="text" id="corpTel" name="corpTel" value="${cVo.corpTel }">
                    </div>
                    <div class="col-lg-6">
                        <label for="corpStardate">기업 설립 일자<span>*</span></label>
                        <input type="text" id="corpStartdate" name="corpStartdate" value="${cVo.corpStartdate }" readonly>
                    </div>
					<div class="col-lg-12">
                    	<label for="corpIntro">기업 소개<span>*</span></label>
                    	<textarea class="content" id="corpIntro" name="corpIntro">${cVo.corpIntro}</textarea><br><br>
						<script type="text/javascript">
							CKEDITOR.replace('corpIntro',	{height : 400});
						</script>
                    </div>

                    <div class="col-lg-6">
                        <label for="corpImgurl">기업 메인 이미지</label>
               	      	<input type="file" id="addimg1" name="addimg1" multiple>
       	            </div>
       	            <hr>
                    <div class="col-lg-6">
                        <label for="corpImgurl">서브 이미지 1</label>
               	      	<input type="file" id="addimg2" name="addimg2">
       	            </div>
       	             <hr>
                    <div class="col-lg-6">
                        <label for="corpImgurl">서브 이미지 2</label>
               	      	<input type="file" id="addimg3" name="addimg3">
       	            </div>
       	             <hr>
                    <div class="col-lg-6">
                        <label for="corpImgurl">서브 이미지 3</label>
               	      	<input type="file" id="addimg4" name="addimg4">
       	            </div>
       	            <div class="col-lg-12" id="imgview">
	       	            <img class="corpImgs" src="<c:url value="/pd_images/${imgList[0].corpimgUrl}"/>">
	       	            <img class="corpImgs" src="<c:url value="/pd_images/${imgList[1].corpimgUrl}"/>">
	       	            <img class="corpImgs" src="<c:url value="/pd_images/${imgList[2].corpimgUrl}"/>">
	       	            <img class="corpImgs" src="<c:url value="/pd_images/${imgList[3].corpimgUrl}"/>">
       	            </div>
					<button class="site-btn register-btn" type="submit">기업 정보 수정</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../../inc/bottom.jsp"%>