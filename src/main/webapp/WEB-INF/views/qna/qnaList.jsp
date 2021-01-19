<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
	.faqBt{
		background:#4C50BB;
	}
</style>
<script type="text/javascript">

$(function(){
	$()
});

</script>

<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>FAQs</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Faq Section Begin -->
    <div class="faq-section spad">
        <div class="container">
            <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
            	<div class="filter-widget">
	                <h4 class="fw-title">고객센터</h4>
		                <ul class="filter-catagories">
			                <li><a href="#">Q&A</a></li>
			                <li><a href="#">공지사항</a></li>
			                <li><a href="#">FAQ</a></li>
		                </ul>
                </div>
            </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="faq-accordin">
                        <div class="accordion" id="accordionExample">
                        	<c:if test="${!empty faqList}">
                        	<c:forEach var="vo" items="${faqList }">
                            <div class="card">
                                <div class="card-heading active">
                                    <a class="active" data-toggle="collapse" data-target="#collapseOne">
                                       <!-- 제목 -->
                                       ${vo.faqTitle }
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <a class="faqDetail" href="#">
	                                        <p>
		                                       <!-- 내용 -->
		                                       ${vo.faqAbout }
	                                        </p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    
                    <!-- 버튼 -->
                    <div>
                    	<input type="button" value="글쓰기" class="faqBt btn btn-primary site-btn"
                    		onclick="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->
    <%@ include file="../inc/bottom.jsp"%>