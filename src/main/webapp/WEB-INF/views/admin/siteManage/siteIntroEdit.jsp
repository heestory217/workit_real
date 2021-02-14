<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sideMenu.jsp" %>

<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
                                        
  <div class="alert alert-warning alert-dismissible fade show" role="alert" style="margin: 0 auto;padding-top: 1.5rem;">
      <c:if test="${param.type == 'N'}">
	      <strong>등록하기 버튼 클릭 시, 실제 사이트에 즉시 반영됩니다.</strong>
      </c:if>
      <c:if test="${param.type == 'E'}">
	      <strong>수정하기 버튼 클릭 시, 실제 사이트에 즉시 반영됩니다.</strong>
      </c:if>
      <a href="#" class="close" data-dismiss="alert" aria-label="Close" style="padding-top: 1.2rem;">
         <span aria-hidden="true">×</span>
      </a>
  </div>
                                 
<form name="introFrm" action="<c:url value='/admin/siteManage/siteIntroEdit.do'/>" method="post">
   <div class="email-head">
       <div class="email-head-subject">
           <div class="title">
           	<a class="active" href="#">
           		<span class="icon"><i class="fas fa-flag"></i></span>
          		</a> 
          		<span style="font-size: 1.4rem; font-weight: bold;">사이트 소개</span>
           </div>
       </div>
       
   </div>
   
   <div class="email-body">
  		<textarea name="websitemanageAbout" id="websitemanageAbout" placeholder="내용을 입력하세요">
  			${map['websitemanageAbout']}
  		</textarea>
		<script type="text/javascript">
			CKEDITOR.replace('websitemanageAbout', {
				height : 450
			});
		</script>
   </div>
    	
    
	<div class="email-attachments">
		<div class="date" style="float: right;">
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
		</div>
		<input type="hidden" name="type" value="${param.type}">
		<input type="hidden" name="managerNo" value="${managerNo}">
	    <div class="title">작성자 : <span>${managerName}</span></div>
	</div>

	<div style="float: right;">
		<c:if test="${param.type == 'N'}">
			<input type="submit" class="btn btn-primary" style="margin: 1rem 1rem 0 0;" value="등록하기">
		</c:if>
		<c:if test="${param.type == 'E'}">
			<input type="submit" class="btn btn-primary" style="margin: 1rem 1rem 0 0;" value="수정하기">
		</c:if>
	</div>

</form>


<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript"> </script>
<%@ include file="../inc/bottom.jsp" %>