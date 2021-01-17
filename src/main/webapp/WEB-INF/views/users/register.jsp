<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>Register</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">이름 *</label>
                                <input type="text" id="username">
                            </div>
                            <div class="group-input">
                                <label for="userid">아이디 *</label>
                                <input type="text" id="userid">
                            </div>
                            <div class="group-input">
                                <label for="pwd">비밀번호 *</label>
                                <input type="text" id="pwd">
                            </div>
                            <div class="group-input">
                                <label for="con-pwd">비밀번호 확인 *</label>
                                <input type="text" id="con-pwd">
                            </div>
                            <div class="group-input">
                                <label for="email">이메일 *</label>
                                <input type="text" id="email">
                            </div>
                            <div class="group-input">
                                <label for="zipcode">우편번호 *</label>
                                <input type="text" id="zipcode">
                            </div>
                            <div class="group-input">
                                <label for="address">상세주소 *</label>
                                <input type="text" id="address">
                            </div>
                            <div class="group-input">
                                <label for="workkind">희망직무 *</label>
                                <input type="text" id="workkind">
                            </div>
                            <div class="group-input">
                                <label for="userexp">경력 *</label>
                                <input type="text" id="userexp">
                            </div>
                            
                            <button type="submit" class="site-btn register-btn">REGISTER</button>
                        </form>
                        <div class="switch-login">
                            <a href="./login.html" class="or-login">Or Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
    
<%@ include file="../inc/bottom.jsp" %>