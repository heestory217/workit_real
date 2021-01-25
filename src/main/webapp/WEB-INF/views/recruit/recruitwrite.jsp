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

<!-- Shopping Cart Section Begin -->
    <section class="checkout-section spad">
        <div class="container">
            <form action="#" class="checkout-form">
                <div class="row">
                    <div class="col-lg-6 offset-lg-3">
                        <h4>채용공고 등록</h4>
                        <div class="row">
                            <div class="col-lg-12 offset-lg-3">
                                <label for="fir">제목</label>
                                <input type="text" id="fir">
                            </div>
                            <div class="col-lg-6">
                                <label for="last">요약-채용형태</label>
                                <input type="text" id="last">
                            </div>
                            <div class="col-lg-6">
                                <label for="last">요약-경력</label>
                                <input type="text" id="last">
                            </div>
                            <div class="col-lg-6">
                                <label for="last">요약-급여</label>
                                <input type="text" id="last">
                            </div>
                            <div class="col-lg-12">
                            <label for="last">채용형태</label>
                                <textarea placeholder="Messages"></textarea>
                            </div>
                            <div class="col-lg-6">
                                <label for="last">요약-기술</label>
                                <input type="text" id="last">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun-name">채용절차</label>
                                <input type="text" id="cun-name">
                            </div>
                            <div class="col-lg-12">
                                <label for="cun">회사링크</label>
                                <input type="text" id="cun">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- Shopping Cart Section End -->


<%@ include file="../inc/bottom.jsp" %>