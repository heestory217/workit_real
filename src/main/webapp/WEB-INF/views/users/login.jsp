<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#userid').focus();
		
		$('#login').click(function(){
		<!--$('form[name=frmLogin]').submit(function(){-->
			
		$('.infobox').each(function(idx, item){
				if($(this).val().length<1){
					$("#call").text($(this).prev().text() +"를 입력하세요");
					$(this).focus();
					event.preventDefault();
					return false;
				}
			});
		});
			
			var userId=$('#userId').val();
			var password=$('#password').val();
		
			$.ajax({
				type:"post",
				url:"<c:url value='/users/loginajax.do'/>",
				data:{userId:userId, password:password},
				success: function(res){
					if(res==2){
						$("#call").text("잘못된 비밀번호 입니다");
						event.preventDefault();
						return false;
					}else if(res==3){
						$("#call").text("존재하지 않는 아이디 입니다");
						event.preventDefault();
						return false;
					}else if(res==1){
						location.href='./index.do';
					}
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
                                <input type="text" id="userid" class="infobox" name="userId" value="${cookie.ck_userid.value }">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호</label>
                                <input type="password" id="password" class="infobox" name="userPassword">
                            </div>
                            <span class="call" id="call" style="cursor:hand;color:red"></span>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="save-pass">
                                        아이디 저장하기
                                        <input type="checkbox" id="save-pass" name="savepass"
                                            <c:if test="${!empty cookie.ck_userid }">
												checked="checked"
											</c:if>
                                        >
                                        <span class="checkmark"></span>
                                    </label>
                                    <a href="#" class="forget-pass">아이디나 비밀번호를 잊으셨나요?</a>
                                </div>
                            </div>
                            <button type="submit" class="site-btn login-btn" id='login' name='login'>로그인</button>
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