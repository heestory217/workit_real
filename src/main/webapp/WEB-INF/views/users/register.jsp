<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>회원가입</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">이름 *</label>
                                <input type="text" id="username" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="userid">아이디 *</label>
                                <input type="text" id="userid" class="col-lg-8">&nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="col-lg-3">중복 확인</button>
                            </div>
                            <div class="group-input">
                                <label for="pwd">비밀번호 *</label>
                                <input type="password" id="pwd" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="con-pwd">비밀번호 확인 *</label>
                                <input type="password" id="con-pwd" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="email2">이메일 *</label>
                                <input type="text" id="email1" class="col-lg-4">&nbsp;&nbsp;@&nbsp;
					        	<input type="text" id="email2" class="col-lg-4">&nbsp;&nbsp;
                                <select name="email2" id="email3" class="col-lg-3">
                                	<option disabled selected>이메일 목록</option>
						            <option value="naver.com">naver.com</option>
						            <option value="hanmail.net">hanmail.net</option>
						            <option value="nate.com">nate.com</option>
						            <option value="gmail.com">gmail.com</option>
						            <option value="etc">직접입력</option>
					        	</select>
                            </div>
                            <div class="group-input">
                                <label for="zipcode">우편번호 *</label>
                                <input type="text" id="zipcode" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="address">상세주소 *</label>
                                <input type="text" id="address" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="workkind">희망직무 *</label>
                                <input type="text" id="workkind" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="userexp">경력 *</label>
                                <input type="text" id="userexp" class="col-lg-12">
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