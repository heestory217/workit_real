<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
.col-lg-12 h4 {
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
}

#policy p {
	font-size: smaller;
}
</style>

<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="<c:url value='/index.do'/>"><i class="fa fa-home"></i> Home</a>
                    <a href="#">Website</a>
                    <span>Terms Of Service</span>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="col-lg-12">
        	<h4>이용약관</h4>
        	<hr>
        	<div id="policy" style="padding: 20px 20px;">
        		${map['websitemanageAbout']}
        	</div>
		</div>
	</div>
</div>



<%@ include file="../inc/bottom.jsp"%>