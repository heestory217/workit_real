<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>

<div class="container-fluid  dashboard-content">
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
         <div class="page-header">
             <h2 class="pageheader-title"> 쿠폰 관리 </h2>
             <p class="pageheader-text">유료서비스 구매 시 회원이 사용하는 쿠폰을 관리하는 페이지입니다.</p>
             <div class="page-breadcrumb">
                 <nav aria-label="breadcrumb">
                     <ol class="breadcrumb">
                         <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">유료 서비스 관리</a></li>
                         <li class="breadcrumb-item active" aria-current="page">쿠폰 관리</li>
                     </ol>
                 </nav>
             </div>
         </div>
     </div>
	<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	    <div class="card">
	        <h5 class="card-header">목록</h5>
	        <div class="card-body">
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th scope="col">#</th>
	                        <th scope="col">쿠폰명</th>
	                        <th scope="col">할인률</th>
	                        <th scope="col">시작일</th>
	                        <th scope="col">종료일</th>
	                    </tr>
	                </thead>
	                <tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="5">등록된 쿠폰이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty list}">
							<c:forEach var="vo" items="${list}">
			                    <tr>
			                        <th scope="row">${vo.couponNo}</th>
			                        <td>${vo.couponName}</td>
			                        <td>${vo.couponRate} %</td>
			                        <td><fmt:formatDate value="${vo.couponStartdate}" pattern="yyyy-MM-dd" /></td>
			                        <td><fmt:formatDate value="${vo.couponEnddate}" pattern="yyyy-MM-dd" /></td>
			                    </tr>
							</c:forEach>
						</c:if>
	                </tbody>
	            </table>
	        </div>
	    </div>
	
		<div style="text-align: right;">
			<a href="#" class="btn btn-rounded btn-primary">쿠폰 등록</a>
			<a href="#" class="btn btn-rounded btn-brand">쿠폰 수정</a>
			<a href="#" class="btn btn-rounded btn-secondary">쿠폰 삭제</a>
		</div>
	
	</div>	
</div>



<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript"> </script>
<%@ include file="../../inc/bottom.jsp" %>