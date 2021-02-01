<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/usersRegister.css'/>" />

<!DOCTYPE html>

<head>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
</head>
<style>
input[type=number]::-webkit-outer-spin-button{-webkit-appearance: none;margin: 0;}
input[type=number]::-webkit-inner-spin-button{-webkit-appearance: none;margin: 0;}

</style>

<script type="text/javascript">
function numberMaxLength(e){
    if(e.value.length > 2){
        e.value = e.value.slice(0, 2);
    }
}
	
	
	$(function(){
		var check1=false;
		var core;
		$('.infobox').keyup(function() {
			$('.infobox').each(function(){
				var core=$("#month").val();
				if($("#year").val()>30 || $("#year").val()<21){
					$("#check").text("올바르지 않은 년도입니다.(현재 workit에서 지원하는 최대 지원년도는 2030년입니다)");
					check1=false;
				}else if($("#month").val()>12 || $("#month").val()<1){
					$("#check").text("올바르지 않은 월입니다");
					check1=false;
				}else if((core==2 && ($("#day").val()>28 || $("#day").val()<1)) || 
						((core==4 || core==6 || core==9 || core==11)  && ($("#day").val()>30 || $("#day").val()<1)) ||
						((core==1 || core==3 || core==5 || core==7 || core==8 || core==10 || core==12)  && ($("#day").val()>31 || $("#day").val()<1))){
					$("#check").text("올바르지 않은 날짜입니다");
					check1=false;
				}else{
					$("#check").text("");
					check1=true;
				}
				
			});
		});
		
			//$('.infobox').each(function(idx, item){

			//});
		$('#recruitask').click(function(){
			if($("#recruitannounceTitle").val().length<1){
				$("#finalcheck").text("제목을 입력해주세요");
				return false;
			}else if($("#year").val().length<1 || $("#month").val().length<1 || $("#day").val().length<1){
				$("#finalcheck").text("마감날짜를 입력해 주세요");
				return false;
			}else if($("#recruitannounceSworkkind").val().length<1 || $("#recruitannounceScarrer").val().length<1 || 
					$("#recruitannounceSpay").val().length<1 || $("#recruitannounceSkill").val().length<1){
				$("#finalcheck").text("필수사항을 입력해주세요");
				return false;
			}else{
				$("#finalcheck").text("");
			}
		});
	});
</script>


	<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-1">
                    <div class="register-form">
                        <h2>채용공고</h2>
                        <form action="<c:url value='/recruit/recruitwrite.do'/>" method="POST">
                            <div class="group-input">
                                <label for="username">제목(필수)</label>
                                <input type="text" id="recruitannounceTitle" name="recruitannounceTitle">
                            </div>
                            
                            <div class="group-input">
                                    <label for="pass">모집 종료일(필수)</label>
	                                    <p>20<input type="number" id="year" name="year" class="col-lg-2 infobox" 
	                                    maxlength="2" oninput="numberMaxLength(this);">년
	                                    <input type="number" id="month" name="month" class="col-lg-2 infobox" maxlength="2" 
	                                    oninput="numberMaxLength(this);">월
	                                    <input type="number" id="day" name="day" class="col-lg-2 infobox" maxlength="2" 
	                                    oninput="numberMaxLength(this);">일</p>
	                                    <p style="cursor:hand;color:blue">※년도의 경우 뒤의 두자리만 입력해 주세요</p>
	                                <span class="call" id="check" style="cursor:hand;color:red"></span>
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-채용형태(필수)</label>
                                <input type="text" id="recruitannounceSworkkind" name="recruitannounceSworkkind">
                            </div>
                            <div class="group-input">
                                <label for="pass">요약-경력(필수)</label>
                                <input type="text" id="recruitannounceScarrer" name="recruitannounceScarrer">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-급여(필수)</label>
                                <input type="text" id="recruitannounceSpay" name="recruitannounceSpay">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-기술(필수)</label>
                                <input type="text" id="recruitannounceSkill" name="recruitannounceSkill">
                            </div>
                            
                            <div class="group-input">
		                    	<label for="corpIntro">채용형태</label>
		                    	<textarea id="recruitannounceWorkkind" name="recruitannounceWorkkind"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('recruitannounceWorkkind',	{height : 200});
								</script>
                   			</div>
                   			
                            <div class="group-input">
		                    	<label for="corpIntro">주요업무</label>
		                    	<textarea id="recruitannounceWork" name="recruitannounceWork"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('recruitannounceWork',	{height : 200});
								</script>
                   			</div>
                   			
                            <div class="group-input">
	                            <label for="pass">자격 요건</label>
		                            <select class="col-lg-5 mystyle" id="recruitannounceWantedcarrer" name="recruitannounceWantedcarrer">
		                           				<option value=0>신입</option>
		                              			<option value=1>1년차</option>
		                         		        <option value=2>2년차</option>
		                                        <option value=3>3년차</option>
		                                        <option value=4>4년차</option>
		                                        <option value=5>5년차</option>
		                                        <option value=6>6년차</option>
		                                        <option value=7>7년차</option>
		                                        <option value=8>8년차</option>
		                                        <option value=9>9년차</option>
		                                        <option value=10>10년이상</option>
		                            </select>
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">우대사항</label>
                                <input type="text" id="recruitannounceUpcheckcarrer" name="recruitannounceUpcheckcarrer">
                            </div>
                            
                            <div class="group-input">
                            <label for="pass">요구 직무</label>
                                    <select class="col-lg-5 mystyle" id="workkindNo" name="workkindNo">
                                        <option value=1>서버개발자</option>
                                        <option value=2>웹 개발자</option>
                                        <option value=3>프론트엔드 개발자</option>
                                        <option value=4>자바개발자</option>
                                        <option value=5>안드로이드개발자</option>
                                        <option value=6>IOS 개발자</option>
                                        <option value=7>빅데이터 엔지니어</option>
                                        <option value=8>파이썬 개발자</option>
                                        <option value=9>소프트웨어 엔지니어</option>
                                        <option value=10>유니티 개발자</option>
                                        <option value=11>Node.js 개발자</option>
                                        <option value=12>머신러닝 엔지니어</option>
                                        <option value=13>C,C++ 개발자</option>
                                        <option value=14>VR 엔지니어</option>
                                    </select>
                            </div>
                            
                            <div class="group-input">
                                    <label for="pass">필수 요구 언어</label>
	                                    <select class="col-lg-5 mystyle" id="languageNo" name="languageNo">
	                                    <c:forEach items="${language}" var="langs">
	                                    	<option value="${langs.languageNo}">${langs. languageName}</option>
	                                    </c:forEach>
                                    	</select>
                            </div>                                  
                            
							<div class="group-input">
                                    <label for="pass">요구 근무지</label>
                                    <select class="col-lg-7 mystyle" id="arealistNo" name="arealistNo">
                                        <c:forEach items="${arealist}" var="ho">
	                                    	<option value="${ho.areaNo}">${ho.areaadd1}, ${ho.areaadd2}</option>
	                                    </c:forEach>
                                    </select>
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">채용절차</label>
                                <input type="text" id="recruitannounceHirestep" name="recruitannounceHirestep">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">기타</label>
                                <input type="text" id="recruitannounceElse" name="recruitannounceElse">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">회사링크</label>
                                <input type="text" id="recruitannounceLink" name="recruitannounceLink">
                            </div>
                            <input type="hidden" id="userNo" name="userNo" value="${sessionScope.userNo}">
                            <span class="call" id="finalcheck" name="finalcheck" style="cursor:hand;color:red"></span>
                            <button type="submit" class="site-btn register-btn" id='recruitask' name='recruitask'>공고등록 요청</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="../inc/bottom.jsp" %>