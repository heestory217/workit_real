<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sideMenu.jsp" %>

 		<!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
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
            <p>${map['WEBSITEMANAGE_ABOUT']}</p>
        </div>
            
        <div class="email-attachments">
        	<div class="date" style="float: right;">
        		<fmt:formatDate value="${map['WEBSITEMANAGE_DATE']}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
        	</div>
            <div class="title">작성자 : <span>${map['MANAGER_NAME']}</span></div>
        </div>
        
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>실제 사이트에 적용된 사이트 소개문입니다.</strong>
            <a href="#" class="close" data-dismiss="alert" aria-label="Close">
               <span aria-hidden="true">×</span>
            </a>
        </div>

        <div style="float: right;">
		    <a href="#" class="btn btn-primary" style="margin-right: 1rem;">수정하기</a>
        </div>
	                    
                                            
   <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->

<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript"> </script>
<%@ include file="../inc/bottom.jsp" %>