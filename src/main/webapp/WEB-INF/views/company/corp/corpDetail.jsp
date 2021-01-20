<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
<!-- 기업 상세 Section Begin -->
<style type="text/css">
.blog-details-inner .blog-quote p:before {
	display: none
}
.blog-details-inner .blog-quote p span{
	font-size: 20px;
}

.card-text {
 margin-bottom: 35px;
}
   
</style>
<section class="blog-details spad">
    <div class="container">
        <div class="row">
         <c:if test="${cAllVo.corpVo.corpOkcheck==2}">
        	<div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cAllVo.corpVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cAllVo.corpVo.corpName}</h2>
                        <p>${cAllVo.corpVo.corpIndustry}<span> - ${cAllVo.corpVo.corpStardate}</span></p>
                    </div>
               </div>
       	   		<div class="blog-quote">
                  <p style="font-size: 2.2em;text-align: center;">
                  '${cAllVo.corpVo.corpName}'<span>은(는)<br><br> 기업 등록 반려되었습니다.<br><br>쪽지함에서 반려사유를 확인할 수 있습니다.</span>
                  </p>
              </div>
           </div>
        </c:if>
        <c:if test="${cAllVo.corpVo.corpOkcheck==0}">
        	<div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cAllVo.corpVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cAllVo.corpVo.corpName}</h2>
                        <p>${cAllVo.corpVo.corpIndustry}<span> - ${cAllVo.corpVo.corpStardate}</span></p>
                    </div>
               </div>
       	   		<div class="blog-quote">
                  <p style="font-size: 2.2em;text-align: center;">
                  '${cAllVo.corpVo.corpName}'<span>은(는)<br><br> 현재 기업 등록 심사중입니다.</span>
                  </p>
              </div>
           </div>
        </c:if>
        <c:if test="${cAllVo.corpVo.corpOkcheck==1}">
            <div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cAllVo.corpVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cAllVo.corpVo.corpName}</h2>
                        <p>${cAllVo.corpVo.corpIndustry}<span> - ${cAllVo.corpVo.corpStardate}</span></p>
                    </div>
	                    <c:if test="${!empty imgList}">
                        	<c:forEach var="imgList" items="${imgList }" begin="0" end="0">
			                    <div class="blog-large-pic">
			                        <img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
			                    </div>
                        	</c:forEach>
                        </c:if>
                    <div class="blog-detail-desc">
                        <p>
                        </p>
                    </div>
	                    <div class="blog-quote">
	                        <p style="font-size: 2.2em;text-align: center;">
	                        '${cAllVo.corpVo.corpName}'<span>의  1인당 평균연봉은 </span> ${cAllVo.corpVo.corpAvrpay} 만원, <br><br>
	                        <span>기업 근로자 수는</span> 총  ${cAllVo.corpVo.corpPnumber}명
	                        <c:if test="${!empty cAllVo.corpVo.corpKind}">
	                        	<span>의 </span>중소기업<span>입니다.</span>
	                        </c:if>
	                        <c:if test="${empty cAllVo.corpVo.corpKind}">
	                        <span>입니다.</span>
	                        </c:if>
	                        </p>
	                    </div>
                    <div class="blog-more">
                        <div class="row">
                        <c:if test="${!empty imgList}">
                        	<c:forEach var="imgList" items="${imgList }" begin="1" end="3">
	                        	<div class="col-sm-4">
	                                <img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
	                            </div>
                        	</c:forEach>
                        </c:if>
                        </div>
                    </div>
                    <div class="blog-detail-desc">
                     	${cAllVo.corpVo.corpIntro}
                    </div>
                    <div class="tag-share">
                        <div class="details-tag">
                            <ul>
                                <li><i class="fa fa-tags"></i></li>
                                <li><a href="${cAllVo.corpVo.corpWebaddress}">${cAllVo.corpVo.corpWebaddress}</a></li>
                                <li>${cAllVo.corpVo.corpAddress1}</li>
                                <li>${cAllVo.corpVo.corpTel}</li>
                            </ul>
                        </div>
                    </div>
                    <input type="hidden" id="corpNo" value="${cAllVo.corpVo.corpNo}">
                    <input type="hidden" id="corpUserNo" value="${cAllVo.corpVo.userNo}">
					
					<!-- 채용중인 포지션 리스트 -->
                    <c:import url="/company/corp/corpRecruitList.do">
                    	<c:param name="userNo" value="${cAllVo.corpVo.userNo}"></c:param>
                    </c:import>
					<!-- 채용중인 포지션 리스트 끝-->
                    <hr>
					<!-- 기업 리뷰 리스트 인클루드 할거임 -->
					<c:import url="/company/corp/corpReviewList.do">
                    	<c:param name="corpNo" value="${cAllVo.corpVo.corpNo}"></c:param>
                    </c:import>
					<!-- 기업 리뷰 끝 -->
                </div>
            </div>
            </c:if>
        </div>
    </div>
</section>
<!-- 기업 상세 Section End -->

<%@ include file="../../inc/bottom.jsp"%>