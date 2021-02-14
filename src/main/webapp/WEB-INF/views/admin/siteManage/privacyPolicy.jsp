<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sideMenu.jsp" %>

        <div class="email-head">
            <div class="email-head-subject">
                <div class="title">
                	<a class="active" href="#">
                		<span class="icon"><i class="fas fa-flag"></i></span>
               		</a> 
               		<span style="font-size: 1.4rem; font-weight: bold;">개인정보 처리방침</span>
                </div>
            </div>
            
        </div>
        
        <div class="email-body">
            <p>${map['websitemanageAbout']}</p>
        </div>
            
        <div class="email-attachments">
        	<div class="date" style="float: right;">
        		<fmt:formatDate value="${map['WEBSITEMANAGE_DATE']}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
        	</div>
            <div class="title">작성자 : <span>${map['MANAGER_NAME']}</span></div>
        </div>

        <div style="float: right;">
		    <a href="<c:url value='siteIntroNew.do'/>" class="btn btn-secondary" style="margin: 1rem 1rem 0 0;">신규 등록</a>
		    <a href="<c:url value='siteIntroEdit.do'/>" class="btn btn-primary" style="margin: 1rem 1rem 0 0;">수정하기</a>
        </div>

<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript"> </script>
<%@ include file="../inc/bottom.jsp" %>