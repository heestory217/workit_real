<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>

<link rel="stylesheet" href="<c:url value="/resources/admin/assets/libs/css/detail.css"/>" type="text/css">


<section class="blog-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cVo.corpName}</h2>
                        <p>사업 분야 : ${cVo.corpIndustry}<span> - 설립일 : ${cVo.corpStartdate} </span></p>
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
	                        '${cVo.corpName}'<span>
	                        <c:if test="${cVo.corpAvrpay!=0}">
	                        	의 1인당 평균연봉은 </span><fmt:formatNumber value="${cVo.corpAvrpay}" pattern="#,###,###"/> 만원, <br><br>
	                        </c:if>
	                        <c:if test="${cVo.corpPnumber!=1}">
	                        	<span>기업 근로자 수는</span> 총  ${cVo.corpPnumber}명
	                        </c:if>
	                        <c:if test="${!empty cVo.corpKind}">
	                        	<span>인 중소기업 입니다.</span>
	                        </c:if>
	                        <c:if test="${empty cVo.corpKind}">
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
                     	${cVo.corpIntro}
                    </div>
                    <div class="tag-share">
	                    <div class="col-lg-9">
	                        <div class="details-tag">
	                            <ul>
	                                <li><i class="fa fa-tags"></i></li>
	                                <li><a href="http:&#x2F&#x2F${cVo.corpWebaddress}">${cVo.corpWebaddress}</a></li>
	                                <li>${cVo.corpAddress1}</li>
	                                <li>${cVo.corpTel}</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <a href="<c:url value="/admin/users/corp/corpList.do"/>"><button style="float: right;" class="btn btn-primary">기업 목록으로</button></a>
	                    
 <div class="col-lg-12">
<form action="" name="frmPage" method="post" style="clear: both;">
	<input type="hidden" name="currentPage">
</form>

<div>
	<h4 class="fw-title center" >결제 내역</h4>
</div>
<section class="shopping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="cart-table">
					<table>
					<colgroup>
						<col width="25%">
						<col width="20%">
						<col width="20%">
						<col width="15%">
						<col width="20%">
					</colgroup>
						<thead>
                                <tr>
                                    <th>서비스명</th>
                                    <th>시작일</th>
                                    <th>마감일</th>
                                    <th>결제수단</th>
                                    <th>결제금액</th>
                                </tr>
                            </thead>
                            <tbody>
								
	                            	<tr>
	                            		<td colspan="5"><br><br>
	                            			<p>요청하신 결과가 없습니다.</p>
	                            		</td>
	                            	</tr>
                                
                                
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>
</section>

<%@ include file="../../inc/bottom.jsp" %>