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
                    <hr>
					<!-- 채용중인 포지션 인클루드할거임 -->
                    <div class="posted-by">
	                    <div class="pb-pic">
	                    	<img src="<c:url value='/pds_upload/fastcampuslogo_20210118163212484.jpg'/>" style="width: 60px;">
	                   	</div>
                        <div class="pb-text">
                            <a href="#">
                                <h5>프론트엔드 개발자 채용중</h5>
                            </a>
                            <p>
                           		연봉 : 4500만원 &nbsp;&nbsp;&nbsp;
                            	언어 : JavaScript, React &nbsp;&nbsp;&nbsp;
                            	근무지 : 서울시 강남구
                            </p>
                        </div>
                    </div>
					<!-- 채용중인 포지션 끝 -->
                    <hr>
					<!-- 기업 리뷰 리스트 인클루드 할거임 -->
					<c:import url="">
						
					</c:import>
			                 <!--  <div class="col-md-12 mb-3 mb-md-0" style="padding-left: 0px; padding-right: 0px;">
			                    <div class="card h-100">
			                      <div class="card-body" style="padding: 3.3rem;">
			                        <div class="d-flex justify-content-between align-items-center" style="margin-bottom: 30px;">
			                          <div class="d-flex align-items-center"><img class="img-fluid" src="assets/img/gallery/user-3.png" alt="" />
			                            <div class="flex-1 ms-3">
			                              <h4 class="mb-0 fs--1 text-1000 fw-medium">커리어에 큰 욕심이 없다면 행복하게 다닐 수 있을 것 같았던 곳</h6>
			                              <p class="fs--2 fw-normal mb-0">2020-02-04</p>
			                            </div>
			                          </div>
			                          <div class="d-flex align-items-center"><span class="text-900 me-3">4.8</span><svg class="bi bi-star-fill" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FEA250" viewBox="0 0 16 16">
			                              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"> </path>
			                            </svg></div>
			                        </div>
			                        <h6>장점</h6>
			                        <p class="card-text pt-3">코로나바이러스 관련하여 위생 및 직원 건강관리에 신경을 많이 씀. 영업부서는 업무성과에 따라 급여의 인상폭이 높음.</p>
			                        <h6>단점</h6>
			                        <p class="card-text pt-3" >영업부서외의 타부서 지원이 다소 부족함, 영업부서는 영업에 대한 스트레스가 있음.</p>
			                        <h6>경영진에게 바라는 점</h6>
			                        <p class="card-text pt-3">코로나19관련 시대에 다양한 광고상품 개발에 더 투자 부탁드리고, 지금과 마찬가지로 앞으로도 직원 건강과 위생관리에 신경써주시길 바랍니다.</p>
			                      </div>
			                    </div>
			                  </div>
			                   -->
					<!-- 기업 리뷰 끝 -->
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 기업 상세 Section End -->

<%@ include file="../../inc/bottom.jsp"%>