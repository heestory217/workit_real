<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="companyMypageMenu.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/usersRegister.css'/>" />
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
			}/* else if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			} */else if($('#pwd').val()!=$('#con-pwd').val()){
				alert('비밀번호가 일치하지 않습니다.');
				$('#con-pwd').focus();
				event.preventDefault();
			}else if($('#hp2').val().length<1){
				alert('전화번호를 입력하세요');
				$('#hp2').focus();
				event.preventDefault();
			}else if($('#hp3').val().length<1){
				alert('전화번호를 입력하세요');
				$('#hp3').focus();
				event.preventDefault();
			}/* else if($('#pwd').val()!=${vo.userPassword }){	//디비 비밀번호랑 일치하지않으면 으로 바꾸기
				alert('비밀번호가 일치하지 않습니다.');
				$('#con-pwd').focus();
				event.preventDefault();
			} */else if(!validate_phone($('#hp2').val()) ||
					!validate_phone($('#hp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp2').focus();
				event.preventDefault();				
			}
		});
	});
	
</script>
                    <div class="register-form margin_100">
                    <div class="filter-widget">
                    	<h4 class="fw-title center">회원 정보 수정</h4>
                    </div>
                        <form method="post" action="<c:url value='/companyMypage/companyMypageEdit.do'/>">
                        <input type="hidden" id="userno" name="userNo" value="${vo.userNo}">
                            <div class="group-input">
                                <label for="username">이름 *</label>
                                <input type="text" id="username" class="col-lg-12" name="userName" 
                                	value="${vo.userName}">
                            </div>
                            <div class="group-input">
                                <label for="userid">아이디 *</label>
                                <input type="text" id="userid" class="col-lg-12" name="userId" 
                                	value="${vo.userId}" readonly="readonly">
                            </div>
<!--                             <div class="group-input">
                                <label for="pwd">비밀번호 *</label>
                                <input type="password" id="pwd" class="col-lg-12" name="userPassword">
                            </div> 이건 마이페이지 접근 전에 확인하는 걸로 변경하자-->
                            <div class="group-input">
                                <label for="pwd">비밀번호 *</label>
                                <input type="password" id="pwd" class="col-lg-12" name="userPassword" placeholder="비밀번호 변경이 필요하실 경우 입력해주세요.">
                            </div>
                            <div class="group-input">
                                <label for="con-pwd">비밀번호 확인 *</label>
                                <input type="password" id="con-pwd" class="col-lg-12" placeholder="비밀번호 변경이 필요하실 경우 입력해주세요.">
                            </div>
                            <div class="group-input">
                                <label for="email1">이메일 *</label>
                                <input type="text" id="email1" class="col-lg-12" name="userEmail"
                                	value="${vo.userEmail1}@${vo.userEmail2 }" readonly="readonly">
                            </div>
                            <div class="group-input">
                                <label for="hp1">전화번호</label>
                                <select name="userHp1" id="hp1" class="col-lg-3 mystyle">
						            <option value="010"
						            	<c:if test="${vo.userHp1 =='010'}">
				            				selected="selected"
				            			</c:if>
						            >010</option>
						            <option value="011"
						            	<c:if test="${vo.userHp1 =='011'}">
				            				selected="selected"
				            			</c:if>
						            >011</option>
						            <option value="016"
						            	<c:if test="${vo.userHp1 =='016'}">
				            				selected="selected"
				            			</c:if>
						            >016</option>
						            <option value="017"
						            	<c:if test="${vo.userHp1 =='017'}">
				            				selected="selected"
				            			</c:if>
						            >017</option>
						            <option value="018"
						            	<c:if test="${vo.userHp1 =='018'}">
				            				selected="selected"
				            			</c:if>
						            >018</option>
						            <option value="019"
						            	<c:if test="${vo.userHp1 =='019'}">
				            				selected="selected"
				            			</c:if>
						            >019</option>
					        	</select>
					        	-&nbsp;
                                <input type="text" id="hp2" class="col-lg-4" maxlength="4" name="userHp2"
                                	value="${vo.userHp2 }">
					        	&nbsp;-&nbsp;
                                <input type="text" id="hp3" class="col-lg-4" maxlength="4" name="userHp3"
                                	value="${vo.userHp3 }">
                            </div>
                            <div class="group-input">
                                <label for="zipcode">주소</label>
                                <input type="text" id="zipcode" placeholder="우편번호" class="col-lg-7" name="userZipcode" 
                                	value="${vo.userZipcode }" ReadOnly>
								<input type="button" onclick="execZipcode()" value="우편번호 찾기" class="col-lg-4 site-btn margin_left" ><br><br>
								<input type="text" id="address" placeholder="주소" name="userAddress" 
									value="${vo.userAddress }" ReadOnly><br><br>
								<input type="text" id="detailAddress" placeholder="상세주소" name="userAddressdetail"
									value="${vo.userAddressdetail }"><br><br>
                            </div><br>
                            <button type="submit" class="site-btn register-btn" id="submit">Edit</button>
                        </form>
					</div>
					
<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>

<%-- <input type="text" value="${vo.userEmail1 } " name="userEmail1">
<input type="text" value="${vo.userEmail2 } " name="userEmail1"> --%>

<%@ include file="../inc/bottom.jsp"%>