<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#userEmailID').keyup(function(){
				if($("#userEmailID").val().length<1){
					$("#call1").text("      이메일을 입력하세요");
				}else if(!isMail($("#userEmailID").val())){
					$("#call1").text("      올바른 이메일 형식을 입력하세요");
				}else if(isMail($("#userEmailID").val())){
					$("#call1").text("");
				}else{
					$("#userEmailID").text("");
				}
		});
		
		$('#userEmailPWD').keyup(function(){
			if($("#userEmailPWD").val().length<1){
				$("#call3").text("      이메일을 입력하세요");
			}else if(!isMail($("#userEmailPWD").val())){
				$("#call3").text("      올바른 이메일 형식을 입력하세요");
			}else if(isMail($("#userEmailPWD").val())){
				$("#call3").text("");
			}else{
				$("#userEmailPWD").text("");
			}
		});
		
		$('#findID').click(function(){
			if($("#userEmailID").val().length<1){
				return false;
			}else if(!isMail($("#userEmailID").val())){
				return false;
			}
			$('form[name=frmFindId]').submit()
		});
		
		$('#findPwd').click(function(){
			if($("#userEmailPWD").val().length<1){
				return false;
			}else if(!isMail($("#userEmailPWD").val())){
				return false;
			}else if(!$("#userId")){
				return false;
			}
			$('form[name=frmFindPwd]').submit()
		});
	});
	
	function isMail(useremail){
		var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

		if(!reg_email.test(useremail)) {                            
	          return false;         
	     }                            
	     else {                       
	          return true;         
	     }
	}
</script>

    <!-- Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>아이디 찾기</h2>
                        <form name="frmFindId" action="<c:url value='/email/findId.do'/>">
                            <div class="group-input">
                                <label for="username">이메일<span class="call" id="call1" style="cursor:hand;color:red"></span></label>
                                <input type="text" id="userEmailID" class="infobox" name="userEmail">
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
                     <form name="frmFindPwd" action="<c:url value='/email/findPwd.do'/>" method="post">
                         <div class="group-input">
                             <label for="userId">아이디<span class="call" id="call2" style="cursor:hand;color:red"></span></label>
                             <input type="text" id="userId" name="userId">
                         </div>
                         <div class="group-input">
                             <label for="userEmailPWD">이메일<span class="call" id="call3" style="cursor:hand;color:red"></span></label>
                             <input type="text" id="userEmailPWD" class="infobox" name="userEmail">
                         </div>
                      <button type="button" class="site-btn login-btn" id='findPwd' name='findPwd'>비밀번호 이메일 발송</button>
                     </form>
                     </div>
                 </div>
             </div>
         </div>
      </div>
    <!-- Section End -->
<%@ include file="../inc/bottom.jsp" %>