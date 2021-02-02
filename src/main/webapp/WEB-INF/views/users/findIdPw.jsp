<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('.infobox').keyup(function(){
			$('.infobox').each(function(idx, item){
				if($("#userEmail").val().length<1){
					$("#call1").text("      이메일을 입력하세요");
				}else{
					$("#call1").text("");
				}
			});
		});
		
		$('#findID').click(function(){
			$('form[name=frmFindId]').submit()
		});
		
	});
</script>

    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>아이디 찾기</h2>
                        <form name="frmFindId" action="<c:url value='/email/findId.do'/>">
                            <div class="group-input">
                                <label for="username">이메일<span class="call" id="call1" style="cursor:hand;color:red"></span></label>
                                <input type="text" id="userEmail" class="infobox" name="userEmail">
                            </div>
                         <button type="button" class="site-btn login-btn" id='findID' name='findID'>아이디 이메일 발송</button>
                        </form>
                        </div>
                    </div>
             </div>
      	</div>
		<div class="container">                    
                 <div class="row" style="margin-top: 50px; margin-bottom: 72px;">
                 <div class="col-lg-6 offset-lg-3">
                 <div class="login-form">
                     <h2>비밀번호 찾기</h2>
                     <form name="frmFindPwd">
                         <div class="group-input">
                             <label for="userId">아이디<span class="call" id="call2" style="cursor:hand;color:red"></span></label>
                             <input type="text" id="userId" class="infobox" name="userId">
                         </div>
                         <div class="group-input">
                             <label for="userEmail">이메일<span class="call" id="call3" style="cursor:hand;color:red"></span></label>
                             <input type="text" id="userEmail" class="infobox" name="userEmail">
                         </div>
                      <button type="button" class="site-btn login-btn" id='findPwd' name='findPwd'>비밀번호 이메일 발송</button>
                     </form>
                     </div>
                 </div>
             </div>
         </div>
      </div>
    <!-- Register Form Section End -->
<%@ include file="../inc/bottom.jsp" %>