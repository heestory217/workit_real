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

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<script type="text/javascript">
	var pattern = new RegExp(/^[0-9]*$/g);
    return pattern.test(tel);
	
	$(function(){
		$('.infobox').keyup(function() {
			$('.infobox').each(function(){
				if(!pattern.test($("#year").val())){
					$("#call2").text("숫자만 입력해라");
				}
			});
		});
	});
</script>


	<div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 offset-lg-1">
                    <div class="register-form">
                        <h2>채용공고</h2>
                        <form action="#">
                            <div class="group-input">
                                <label for="username">제목</label>
                                <input type="text" id="username">
                            </div>
                            
                            <div class="group-input">
                                    <label for="pass">모집 종료일</label>
	                                    <p><input type="text" id="year" name="year" class="col-lg-3 infobox">년
	                                    <input type="text" id="pass" class="col-lg-1 infobox">월
	                                    <input type="text" id="pass" class="col-lg-1 infobox">일</p>
	                                <span class="call" id="check" style="cursor:hand;color:red"></span>
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-채용형태</label>
                                <input type="text" id="pass">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-경력</label>
                                <input type="text" id="pass">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-급여</label>
                                <input type="text" id="pass">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">요약-기술</label>
                                <input type="text" id="pass">
                            </div>
                            
                            <div class="group-input">
		                    	<label for="corpIntro">채용형태</label>
		                    	<textarea id="workhire" name="workhire"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('workhire',	{height : 200});
								</script>
                   			</div>
                   			
                            <div class="group-input">
		                    	<label for="corpIntro">주요업무</label>
		                    	<textarea id="workhir" name="workhir"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('workhir',	{height : 200});
								</script>
                   			</div>
                   			
                            <div class="group-input">
	                            <label for="pass">자격 요건</label>
		                            <select class="col-lg-5 mystyle">
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
                                <input type="text" id="pass">
                            </div>
                            
                            <div class="group-input">
                            <label for="pass">요구 직무</label>
                                    <select class="col-lg-5 mystyle">
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
	                                    <select class="col-lg-5 mystyle">
	                                        <script type="text/javascript">
	                                    	for(i=1; i<=44; i++){
	                                    		document.write("<option value="+i+">"+i+"</option>"); 
	                                    	}
	                                   		</script>
                                    	</select>
                            </div>                                  
                            
							<div class="group-input">
                                    <label for="pass">요구 근무지</label>
                                    <select class="col-lg-3 mystyle">
                                        <script type="text/javascript">
                                    	for(i=1; i<=12; i++){
                                    		document.write("<option value="+i+">"+i+"</option>"); 
                                    	}
                                    </script>
                                    </select>
                                    <select class="col-lg-3 mystyle">
                                        <script type="text/javascript">
                                    	for(i=1; i<=31; i++){
                                    		document.write("<option value="+i+">"+i+"</option>"); 
                                    	}
                                    </script>
                                    </select>
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">채용절차</label>
                                <input type="text">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">기타</label>
                                <input type="text">
                            </div>
                            
                            <div class="group-input">
                                <label for="pass">회사링크</label>
                                <input type="text">
                            </div>
                            
                            <button type="submit" class="site-btn register-btn">공고등록 요청</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%@ include file="../inc/bottom.jsp" %>