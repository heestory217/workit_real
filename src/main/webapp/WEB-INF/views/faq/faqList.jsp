<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>

.fqst {
   padding: 0 0 15px 0;
}

span#listEmpth {
    display: block;
    text-align: center;
    width: 300px;
    margin: 0 auto;
    padding: 14px;
    font-size: 18px;
}

.text{
   height:auto !important;
}
</style>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
   <div class="container">
      <div class="row">
         <div class="col-lg-12">
            <div class="breadcrumb-text">
               <a href="#"><i class="fa fa-home"></i> Home</a> <span>FAQs</span>
            </div>
         </div>
      </div>
   </div>
</div>


<!-- Faq Section Begin -->
<div class="faq-section spad">
   <div class="container">
      <div class="row">

         <!-- nav -->
         <div
            class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
            <div class="filter-widget">
               <c:import url="/common/cusServiceNav.do"></c:import>
            </div>
         </div>

         <div class="col-lg-9 order-1 order-lg-2">
            <div class="register-login-section spad fqst">
               <div class="container">
                  <div class="row">
                     <div class="col-lg-6 offset-lg-3">
                        <div class="register-form section-title">
                           <h2>FAQ 목록</h2>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            
            <c:if test="${empty faqList}">
               <span id="listEmpth">등록된 FAQ가 없습니다</span>
            </c:if>

            <c:if test="${!empty faqList}">
               <c:forEach var="vo" items="${faqList }">
                  <button class="accordion">${vo.faqTitle }</button>
                  <div class="text">
                     <a href="<c:url value='/faq/faqDetail.do?faqNo=${vo.faqNo }'/>">
                        <p style="padding: 10px 10px;">
                  <%      
                        pageContext.setAttribute("newLine", "\n");
                     %>
                     <c:set var="content" 
                        value="${fn:replace(vo.faqAbout, newLine, '<br>')}"/>
                        
                           <c:if test="${fn:length(content)>=170}">
                              ${fn:substring(content, 0, 170) } ... [더보기]
                           </c:if>
                           <c:if test="${fn:length(content)<170}">                  
                              ${content}
                           </c:if>
                        </p>
                     </a>
                  </div>
               </c:forEach>
            </c:if>
            
         </div>
      </div>
   </div>
</div>
<!-- Faq Section End -->

<style>
.accordion {
   background-color: #fff;
   cursor: pointer;
   padding: 3px;
   width: 100%;
   text-align: left;
   outline: none;
   font-size: 15px;
   transition: all 0.5s;
   border: none;
    border-bottom: 2px solid #4C4747;
}

.active, .accordion:hover {
   background-color: #4C50BB;
   color: #fff;
}

.accordion::after {
   content: "\002B";
   color: #777;
   font-weight: bold;
   float: right;
   margin-left: 5px;
   font-size: 25px;
}

.active::after {
   content: "\2212"
}

.text {
   padding: 0 18px;
   background-color: #fff;
   height: 100px;
   overflow: hidden;
   transition: all 0.5s;
   display: none;
   border-bottom: 2px solid #4C4747;
}

.register-login-section.spad.fqst {
    border-bottom: 2px solid #4C4747;
}

</style>
<script type="text/javascript"> 
        $(function() {      
            var acc = $(".accordion"); 
            var i;                         
            for (i = 0; i < acc.length; i++) { 
                acc.eq(i).click(function() { 
//                    acc.removeClass("active"); 
//                    acc.next().css("display","none"); 
                    $(this).toggleClass("active"); 
                    $(this).next().toggle(); 
                })                 
            } 
        }); 
    </script>
<%@ include file="../inc/bottom.jsp"%>