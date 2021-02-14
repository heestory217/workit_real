<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp" %>
<%@ include file="../inc/sideMenu.jsp" %>


<div class="row">
    <div class="col-xl-10">
       <div class="row">
           <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
               <div class="page-section" id="overview">
                   <div class="row">
                       <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

        <div class="email-head" id="top">
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
            
        <div class="email-attachments" id="bottom">
        	<div class="date" style="float: right;">
        		<fmt:formatDate value="${map['WEBSITEMANAGE_DATE']}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>
        	</div>
            <div class="title">작성자 : <span>${map['MANAGER_NAME']}</span></div>
        </div>
        
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="col-xl-2 col-lg-2 col-md-6 col-sm-12 col-12">
        <div class="sidebar-nav-fixed">
            <ul class="list-unstyled">
                <li><a href="#" class="">페이지 이동 및 기능</a></li>
                <li><a href="#top" class="" style="margin-right:1rem">Back to Top</a></li>
                <li><a href="#bottom" class="" style="margin-right:1rem">Go to Bottom</a></li>
	         	<li><a href="<c:url value='/admin/siteManage/websiteEdit.do?kind=P&type=N'/>" 
	         		class="btn btn-secondary" style="margin: 1rem 1rem 0 0; color: #fff; background-color: #ff407b;">신규 등록</a>
         		</li>
         		<li>
				    <a href="<c:url value='/admin/siteManage/websiteEdit.do?kind=P&type=E'/>" 
				    class="btn btn-primary" style="margin: 1rem 1rem 0 0; color: #fff; background-color: #5969ff;">수정하기</a>
         		</li>
            </ul>
        </div>
    </div>
    
</div>



<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript"> </script>
<%@ include file="../inc/bottom.jsp" %>