<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>


<style type="text/css">

.filter-catagories > li:nth-child(1) > a{
	font-weight:bold;
	color:#4c50bb;
	font-size:20px;
}

.product__pagination.blog__pagination {
	text-align: center;
	clear: both;
    padding-top: 20px;
}

.qaWbt {
    width: 100%;
    margin-top: -20px;
}

input.faqBt.btn.btn-primary.site-btn {
    float: right;
}

.product__pagination a, .blog__pagination a, #currentPage {
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid #b2b2b2;
	font-size: 14px;
	color: #b2b2b2;
	font-weight: 700;
	line-height: 28px;
	text-align: center;
	margin-right: 16px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	margin-right: 0px;
}

.product__pagination a:hover, .blog__pagination a:hover, #currentPage {
	background: #4C50BB;
	border-color: #4C50BB;
	color: #ffffff;
}

.product__pagination a:last-child, .blog__pagination a:last-child {
	margin-right: 0;
}

.discount-coupon.serchBox {
	margin: 0 auto;
}

.discount-coupon .coupon-form input {
	/* width: 100%; */
	height: 46px;
	border: 2px solid #ebebeb;
	color: #b2b2b2;
	font-size: 14px;
	padding-left: 20px;
	float: left;
	width: 300px;
	margin: 20px 0 0 5px;
}

input.site-btn.subBt {
	width: 30px;
	/* margin-left: 6px; */
	color: #fff;
}

select.qaSelete {
	float: left;
	margin-top: 23px;
	width: 100px;
}


</style>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
// 	var contextPath="/workit";
// 	$(function(){
// 		$('.pwck').click(function(){
// 				open(contextPath+"/qna/passwordCheck.do?qaNo=${param.qaNo }", "chk",
// 		"width=600,height=320,left=500,top=250,location=yes,resizable=yes");
// 			});
// 	});
</script>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>Q&A</span>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 파라미터 -->
<form action="<c:url value='/qna/qnaList.do'/>"
	name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchCondition" value="${param.searchCondition }">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>

<!-- content -->
<section class="shopping-cart spad">
        <div class="container">
            <div class="row">
            	<!-- nav -->
				<div
					class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
					<div class="filter-widget">
						<c:import url="/common/cusServiceNav.do"></c:import>
					</div>
				</div>
            
            	<!-- list출력 -->
                <div class="col-lg-9 order-1 order-lg-2">
					<div class="container">
						<div class="register-form section-title">
							<h2>Q&A 목록</h2>
						</div>
					</div>
                
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>글번호</th>
                                    <th class="p-name">글제목</th>
                                    <th>작성자</th>
                                    <th>등록일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
		                       <c:if test="${empty qalist }">
		                            <tr>
		                            	<td colspan="5">데이터가 없습니다</td>
	                            	</tr>
		                        </c:if>
	                            <c:if test="${!empty qalist }">
	                            	<c:forEach var="qaVo" items="${qalist }">
	                                <tr>
			                            <td class="cart-pic first-row">${qaVo.qaNo}</td>
			                            
									<!-- 삭제 글인 경우 처리 -->
									<c:if test="${qaVo.qaDeletecheck!='N' }">
										<span style="color:gray">삭제된 글입니다.</span>
									</c:if>
									
									<!-- 삭제글 아닐떄 -->
									<c:if test="${qaVo.qaDeletecheck=='N' }">
			                            <td class="cart-title first-row">
			                            	<!-- 답변글인 경우 re 이미지 보여주기 -->
			                            	<c:if test="${qaVo.qaOrderno > 0 }">
												<c:forEach var="k" begin="1" end="${qaVo.qaOrderno }">
													&nbsp;
												</c:forEach>
												<i class="fas fa-reply fa-rotate-180"></i>
<!-- 												<i class="fas fa-level-up-alt fa-rotate-90"></i> -->
											</c:if>
											
			                            	<!-- 잠금버튼  -->
			                            	<c:if test="${qaVo.qaSecret =='Y' }">
												<span><i class="fa fa-lock" aria-hidden="true">&nbsp;</i></span>		                            	
					                            <a class="pwck" href="<c:url value='/qna/passwordCheck.do?qaNo=${qaVo.qaNo }'/>">
					                            	<c:if test="${fn:length(qaVo.qaTitle) > 13}">
					                               		${fn:substring(qaVo.qaTitle, 0, 13) } ...
					                            	</c:if>
					                            	<c:if test="${fn:length(qaVo.qaTitle) <= 13}">
					                            		${qaVo.qaTitle}
					                            	</c:if>
					                            </a>
			                            	</c:if>
			                            	<c:if test="${qaVo.qaSecret !='Y' }">
					                            <a href="<c:url value='/qna/qnaCount.do?qaNo=${qaVo.qaNo }'/>">
					                            	<c:if test="${fn:length(qaVo.qaTitle) > 13}">
					                               		${fn:substring(qaVo.qaTitle, 0, 13) } ...
					                            	</c:if>
					                            	<c:if test="${fn:length(qaVo.qaTitle) <= 13}">
					                            		${qaVo.qaTitle}
					                            	</c:if>
					                            </a>
			                            	</c:if>
			                            </td>
			                        </c:if>
			                            <td class="first-row">${qaVo.qaWriter}</td>
			                            <td class="first-row">
				                            <fmt:formatDate value="${qaVo.qaDate}" pattern="yyyy-MM-dd" />
			                            </td>
				                        <td class="first-row">${qaVo.qaView}</td>
                                	</tr>
	                                </c:forEach>
	                            </c:if>
                            </tbody>
                        </table>
					</div>
					<!--버튼 -->
					<div class="qaWbt">
						<input type="button" value="문의하기"
							class="faqBt btn btn-primary site-btn"
							onclick="location.href='<c:url value="/qna/qnaWrite.do"/>'" />
					</div>
                    
                    <div class="product__pagination blog__pagination">
						<!-- 이전 블럭 -->
						<c:if test="${paging.firstPage>1 }">
							<a href="#" onclick="pageFunc(${paging.firstPage-1})">
								<i class="fa fa-long-arrow-left"></i>
							</a>
						</c:if>  
						
						<!-- 블럭 -->
						<c:forEach var="i" begin="${paging.firstPage }" end="${paging.lastPage }">
							<c:if test="${i==paging.currentPage }">
								<span id="currentPage" >${i}</span>		
							</c:if>
							<c:if test="${i != paging.currentPage }">
								<a href="#" onclick="pageFunc(${i})">
									${i}
								</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음 페이지 -->
						<c:if test="${paging.lastPage < paging.totalPage }">
							<a href="#" onclick="pageFunc(${paging.lastPage+1})">
								<i class="fa fa-long-arrow-right"></i>
							</a>						
						</c:if>
                    </div>
                    
                    <div class="row">
                    	<div class="discount-coupon serchBox">
                        <form action="<c:url value='/qna/qnaList.do'/>" 
                        	class="coupon-form" method="post" name="frmSearch">
	                        <select class="qaSelete form-control" name="searchCondition">
	                        	<option value="QA_TITLE"
	                            	<c:if test="${param.searchCondition == 'qaTitle'}">
										selected="selected"
								   </c:if>
	                            >제목</option>
	                            <option value="QA_ABOUT" 
	                            	<c:if test="${param.searchCondition == 'qaAbout'}">
										selected="selected"
									</c:if>
	                            >내용</option>
	                            <option value="QA_WRITER"
	                            	<c:if test="${param.searchCondition == 'qaWriter'}">
										selected="selected"
									</c:if>
	                            >작성자</option>
	                        </select>
	                        <input type="text" placeholder="검색어를 입력하세요" class="qaSerch"
	                        	name="searchKeyword" value="${param.searchKeyword }">
	                        <input type="submit" class="site-btn subBt" value="검색"/>
                        </form>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </section>


<%@ include file="../inc/bottom.jsp"%>