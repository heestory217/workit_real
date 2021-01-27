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


<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-2">
                    <div class="register-form">
                        <h2>채용공고</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">제목</label>
                                <input type="text" id="username">
                            </div>
                            <!-- 마감일 -->
                            <div class="group-input">
                                <label for="pass">요약-채용형태</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input">
                                <label for="pass">요약-경력</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input">
                                <label for="pass">요약-급여</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input">
                                <label for="pass">요약-기술</label>
                                <input type="text" id="pass">
                            </div>
                            
                            <div class="leave-comment">
	                            <div class="col-lg-9 offset-lg-3">
	                            <label for="last">채용형태</label>
	                                <textarea placeholder="Messages"></textarea>
	                            </div>
	                            <div class="col-lg-9">
	                            <label for="last">주요업무</label>
	                                <textarea placeholder="Messages"></textarea>
	                            </div>
	                            <!-- 자격요건 -->
	                            <div class="col-lg-9">
	                            <label for="last">우대사항</label>
	                                <textarea placeholder="Messages"></textarea>
	                            </div>
                            </div>
                            <!-- 직무 -->
                            <!-- 요구 언어 -->
                            <!-- 근무지 -->
                            
                            <div class="group-input">
                                <label for="pass">채용절차</label>
                                <input type="text">
                            </div>
                            <div class="group-input">
                                <label for="pass">기타</label>
                                <input type="text">
                            </div>
                            <div class="group-input">
                                <label for="pass">회사링크</label>
                                <input type="text">
                            </div>
                            <button type="submit" class="site-btn register-btn">공고등록 요청</button>
                        </form>
                        <div class="switch-login col-lg-6">
                            <a href="./login.html" class="or-login">Or Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="../inc/bottom.jsp" %>