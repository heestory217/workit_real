<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<head>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
</head>
<script type="text/javascript">
	$(function(){
		$('#userid').focus();
		
		
		$('#login').click(function(){
			var htp1=true;
			var htp2=true;
			
			$("#call1").text("");
			$("#call2").text("");
			$('.infobox').each(function(idx, item){
				if($("#userId").val().length<1){
					$("#call1").text("      아이디를 입력하세요");
					$("#userId").focus();
					htp1=false;
				}
				
				if($("#password").val().length<1){
					$("#call2").text("      비밀번호를 입력하세요");
					$("#password").focus();
					htp2=false;
				}
			});
			
			var userId=$('#userId').val();
			var password=$('#password').val();
			var savepass;
			$("input[name='savepass']:checked").each(function(i) {
				savepass=$(this).val();
		    })
			
			if(htp1 && htp2){
				$.ajax({
		            type : "get",
		            url:"<c:url value='/users/loginajax.do'/>",
		            data: {userId:userId, password:password, savepass:savepass},
		            success: function(data) {
		                if(data == 1){
		                	location.href="/workit/index.do";
		                }else if(data == 2){
		                	$("#call2").text("      "+$(this).prev().text() +"잘못된 비밀번호입니다");
		                }else{
		                	$("#call1").text("      "+$(this).prev().text() +"존재하지 않는 아이디입니다");
		                }
		            }
				});
			}	
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
                        <form name="frmLogin">
                            <div class="group-input">
                                <label for="username">아이디<span class="call" id="call1" style="cursor:hand;color:red"></span></label>
                                <input type="text" id="userId" class="infobox" name="userId" value="${cookie.ck_userid.value }">
                            </div>
                            <div class="group-input">
                                <label for="pass">비밀번호<span class="call" id="call2" style="cursor:hand;color:red"></span></label>
                                <input type="password" id="password" class="infobox" name="userPassword">
                            </div>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="save-pass">
                                        아이디 저장하기
                                        <input type="checkbox" id="save-pass" name="savepass"
                                            <c:if test="${!empty cookie.ck_userid }">
												checked="checked"
											</c:if>
                                        >
                                        <span class="checkmark" id="save-pass" name="savepass"></span>
                                    </label>
                                    <a href="#" class="forget-pass">아이디나 비밀번호를 잊으셨나요?</a>
                                </div>
                            </div>
                                                    <button
                         type="button" class="site-btn login-btn" id='login' name='login'>로그인</button>
                        <div class="switch-login">
                        </form>
                            <a href="./register.do" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Form Section End -->
<%@ include file="../inc/bottom.jsp" %>