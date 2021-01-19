<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/usersRegister.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execZipcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';

                if (data.userSelectedType === 'R') { // 도로명 주소
                    addr = data.roadAddress;
                } else { // 지번주소
                    addr = data.jibunAddress;
                }

                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
	$(function(){
		$('#submit').click(function(){
			if($('#username').val().length<1){
				alert('이름을 입력하세요');
				$('#username').focus();
				event.preventDefault();
			}else if(!validate_userid($('#userid').val())){
				alert('아이디는 영문, 숫자, _만 가능합니다.');
				$('#userid').focus();
				event.preventDefault();				
			}else if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if($('#pwd').val()!=$('#con-pwd').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#con-pwd').focus();
				event.preventDefault();
			}else if(!validate_phone($('#hp2').val()) ||
					!validate_phone($('#hp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp2').focus();
				event.preventDefault();				
			}else if($('#chkId').val() !='Y'){
				alert('아이디 중복확인하세요');
				$('#btnChkId').focus();
				event.preventDefault();
			}
		});
		
	});
	
</script>
    
	<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/workit/index.do"><i class="fa fa-home"></i> Home</a>
                        <span>Register</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section End -->
    
    <!-- Register Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>회원가입</h2>
                        <form method="post" action="<c:url value='/users/usersWrite.do'/>">
                            <div class="group-input">
                                <label for="username">이름 *</label>
                                <input type="text" id="username" class="col-lg-12" name="userName">
                            </div>
                            <div class="group-input">
                                <label for="userid">아이디 *</label>
                                <input type="text" id="userid" class="col-lg-8" name="userId">
                                <input type="button" id="btnChkId" class="col-lg-3 site-btn margin_left" value="중복 확인">
                            </div>
                            <div class="group-input">
                                <label for="pwd">비밀번호 *</label>
                                <input type="password" id="pwd" class="col-lg-12" name="userPassword">
                            </div>
                            <div class="group-input">
                                <label for="con-pwd">비밀번호 확인 *</label>
                                <input type="password" id="con-pwd" class="col-lg-12">
                            </div>
                            <div class="group-input">
                                <label for="email1">이메일 *</label>
                                <input type="text" id="email1" class="col-lg-4" name="userEmail1">&nbsp;&nbsp;@&nbsp;
					        	<input type="text" id="email2" class="col-lg-4" name="userEmail2">&nbsp;&nbsp;
                                <select name="email3" id="email3" class="col-lg-3 mystyle">
                                	<option disabled selected>이메일 목록</option>
						            <option value="naver.com">naver.com</option>
						            <option value="hanmail.net">hanmail.net</option>
						            <option value="nate.com">nate.com</option>
						            <option value="gmail.com">gmail.com</option>
						            <option value="etc">직접입력</option>
					        	</select>
                            </div>
                            <div class="group-input">
                                <label for="hp1">전화번호</label>
                                <select name="userHp1" id="hp1" class="col-lg-3 mystyle">
						            <option value="010">010</option>
						            <option value="011">011</option>
						            <option value="016">016</option>
						            <option value="017">017</option>
						            <option value="018">018</option>
						            <option value="019">019</option>
					        	</select>
					        	-&nbsp;
                                <input type="text" id="hp2" class="col-lg-4" maxlength="4" name="userHp2">
					        	&nbsp;-&nbsp;
                                <input type="text" id="hp3" class="col-lg-4" maxlength="4" name="userHp3">
                            </div>
                            <div class="group-input">
                                <label for="zipcode">주소</label>
                                <input type="text" id="zipcode" placeholder="우편번호" class="col-lg-7" name="userZipcode" ReadOnly>
								<input type="button" onclick="execZipcode()" value="우편번호 찾기" class="col-lg-4 site-btn margin_left" ><br><br>
								<input type="text" id="address" placeholder="주소" name="userAddress" ReadOnly><br><br>
								<input type="text" id="detailAddress" placeholder="상세주소" name="userAddressdetail"><br><br>
                            </div>
                            <div class="group-input">
                                <label for="workkind">희망직무 / 경력 *</label>
                                <select name="workkindNo" id="workkind" class="col-lg-7 mystyle">
						            <option value="1">서버 개발자</option>
						            <option value="2">웹 개발자</option>
						            <option value="3">프론트엔드 개발자</option>
						            <option value="4">자바 개발자</option>
						            <option value="5">안드로이드 개발자</option>
						            <option value="6">IOS 개발자</option>
						            <option value="7">빅데이터 엔지니어</option>
						            <option value="8">파이썬 개발자</option>
						            <option value="9">소프트웨어 엔지니어</option>
						            <option value="10">유니티 개발자</option>
						            <option value="11">Node.js 개발자</option>
						            <option value="12">머신러닝 엔지니어</option>
						            <option value="13">C,C++ 개발자</option>
						            <option value="14">VR 엔지니어</option>
					        	</select>
					        	<select name="userExperience" id="userexp" class="col-lg-4 mystyle margin_left">
						            <option value="0">신입</option>
						            <option value="1">1년</option>
						            <option value="2">2년</option>
						            <option value="3">3년</option>
						            <option value="4">4년</option>
						            <option value="5">5년</option>
						            <option value="6">6년</option>
						            <option value="7">7년</option>
						            <option value="8">8년</option>
						            <option value="9">9년</option>
						            <option value="10">10년이상</option>
					        	</select>
                            </div><br>
                            
                            <button type="submit" class="site-btn register-btn" id="submit">REGISTER</button>
                        </form>
                        <div class="switch-login">
                            <a href="./login.html" class="or-login">Or Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type ="text" name="chkId" id="chkId" style="visibility: hidden;">
    <!-- Register Form Section End -->
    <a href="<c:url value='/email/send.do'/>">
	이메일 발송</a>
<%@ include file="../inc/bottom.jsp" %>