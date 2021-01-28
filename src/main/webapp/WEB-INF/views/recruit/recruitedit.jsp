<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
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
	$(function(){
		
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
                            <!-- 마감일 -->
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
                            
                            <div class="col-lg-12">
		                    	<label for="corpIntro">채용형태</label>
		                    	<textarea id="workhire" name="workhire"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('workhire',	{height : 200});
								</script>
                   			</div>
                            <div class="col-lg-12">
		                    	<label for="corpIntro">주요업무</label>
		                    	<textarea id="workhir" name="workhir"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('workhir',	{height : 200});
								</script>
                   			</div>
                            <div class="group-input">
                                <label for="pass">자격요건</label>
                                <input type="text" id="pass">
                            </div>
                            <div class="group-input">
                                <label for="pass">우대사항</label>
                                <input type="text" id="pass">
                            </div>
                            

                                    <select class="sorting">
                                        <option value="">Default Sorting</option>
                                    </select>
                                    <select class="p-show">
                                        <option value="">Show:</option>
                                    </select>
                            
                            
                            <!-- 직무 -->
                            <!-- 요구 언어 -->
                            <!-- 근무지 -->
                            
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