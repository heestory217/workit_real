<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivMypage.css'/>" />

<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/workit/index.do"><i class="fa fa-home"></i> Home</a> <a href="/workit/recruit/recruitlist.do"><i class="fa fa-home"></i> Advertising </a> <span>Advertising register</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-1">
                    <div class="register-form">
                        <h2>채용공고 광고 등록/연장</h2>
                        <br><br><br><br>
                        <form action="<c:url value=''/>" method="POST">
                            <div class="group-input">
	                            <h4>공고명:${selectadverinfoVO.recruitannounceTitle} <select class="col-lg-5 mystyle" id="paidserviceNo" name="paidserviceNo" style="float:right">
		                           				<option value=7>광고1급7일</option>
		                              			<option value=8>광고1급15일</option>
		                         		        <option value=9>광고1급30일</option>
		                                        <option value=10>광고2급7일</option>
		                                        <option value=11>광고2급15일</option>
		                                        <option value=12>광고2급30일</option>
		                            </select></h4>
                            </div>
                            <br><br><br><br>
                            <input type="hidden" id="recruitannounceNo" name="recruitannounceNo" value="${selectadverinfoVO.recruitannounceNo}">
                            <c:if test="${adverpaynowchek==0}">
	                        <button type="submit" class="site-btn register-btn" id='recruitask' name='recruitask'>공고등록 요청</button>
                        </c:if>
                        <c:if test="${adverpaynowchek==1}">
                        <h4>사용중인 상품명:${selectadverinfoVO.productName}<span style="float:right">종료일:<fmt:formatDate value="${selectadverinfoVO.adverEnddate}"
													pattern="yyyy/MM/dd"/></span></h4>
                        <input type="hidden" id="paidserviceenddate" name="paidserviceenddate" value="${RecruitannounceVO.adverEnddate}">
                        <br><br><br><br>
                            <button type="submit" class="site-btn register-btn" id='recruitask' name='recruitask'>공고연장 요청</button>
                        </c:if>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../inc/bottom.jsp"%>