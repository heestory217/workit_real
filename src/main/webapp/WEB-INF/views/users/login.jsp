<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>로그인</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">사용자의 이름 또는 이메일</label>
                                <input type="text" id="username">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호 *</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="save-pass">
                                        비밀번호 저장하기
                                        <input type="checkbox" id="save-pass">
                                        <span class="checkmark"></span>
                                    </label>
                                    <a href="#" class="forget-pass">비밀번호를 잊으셨나요?</a>
                                </div>
                            </div>
                            <button type="submit" class="site-btn login-btn">로그인</button>
                        </form>
                        <div class="switch-login">
                            <a href="./register.html" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
<%@ include file="../inc/bottom.jsp" %>