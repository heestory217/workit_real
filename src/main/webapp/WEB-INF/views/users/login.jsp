<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#userid').focus();
		
		$('form[name=frmLogin]').submit(function(){
			$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prev().text() +"를 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;
				}
				
			});
		});
	});
</script>
    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>로그인</h2>
                        <form action="<c:url value='/users/logincheck.do'/>" name="frmLogin">
                            <div class="group-input">
                                <label for="username">아이디</label>
                                <input type="text" id="userid" class="infobox" name="userId">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호</label>
                                <input type="password" id="password" class="infobox" name="userPassword">
                            </div>
                            <!-- 
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                <input type="checkbox" id="save-id" name="chkSave"
                           	            	<c:if test="${!empty cookie.ck_userid }">
												checked="checked"
											</c:if>
                                >
                                    <label for="save-pass" for="chkSave">
                                       아이디 저장하기
                                        <span class="checkmark"></span>
                                    </label>
                                    <a href="#" class="forget-pass">아이디나 비밀번호를 잊으셨나요?</a>
                                </div>
                            </div>
                            -->
                            <button type="submit" class="site-btn login-btn">로그인</button>
                        </form>
                        <div class="switch-login">
                            <a href="./register.do" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
<%@ include file="../inc/bottom.jsp" %>