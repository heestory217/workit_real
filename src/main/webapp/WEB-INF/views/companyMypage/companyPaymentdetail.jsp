<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!DOCTYPE html>
<head>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
</head>
<script type="text/javascript">
	$(function(){

		
	});
</script>
    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                        <input type="hidden" id="recruitannounceNo" name="recruitannounceNo" value="${RecruitannounceVO.recruitannounceNo}">
                            <h2>${RecruitannounceVO.recruitannounceTitle}</h2>
                            <p>등록일 : <span><fmt:formatDate value="${RecruitannounceVO.recruitannounceStartdate}" pattern="yyyy년 MM월 dd일"/></span></p>
                        </div>
                        
                                <!--<div class="tab-pane fade" id="tab-3" role="tabpanel">
                                
                                </div>-->
                            </div>
                        </div>
                    </div>
                        <div class="leave-comment">
                        <c:if test="${sessionScope.user_corpcheck==1}">
                    	<button type="button" class="site-btn" id="applicant" name="applicant">지원하기</button>
                    </c:if>
                    <c:if test="${sessionScope.userNo==RecruitannounceVO.userNo}">
                    	<button type="button" class="site-btn" id="editclick" name="editclick">공고수정 요청</button>
                    	<button type="button" class="site-btn" id="deleteclick" name="editclick">공고삭제</button>
                    	<button type="button" class="site-btn" id="adclick" name="adclick">광고등록</button>
                    </c:if>
                        </div>
                    </div>

    </section>
    <!-- Blog Details Section End -->
<%@ include file="../inc/bottom.jsp" %>