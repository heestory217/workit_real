<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
 
<head>
	<script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="<c:url value='/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/admin/assets/vendor/fonts/circular-std/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/admin/assets/libs/css/style.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css'/>" rel="stylesheet">
   
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-align: center;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
    }
    </style>
</head>
<script type="text/javascript">
	$(function(){
		$('.infobox').keyup(function(){
			$('.infobox').each(function(idx, item){
				if($("#userId").val().length<1){
					$("#call").text("      아이디를 입력하세요");
				}else{
					$("#call").text("");
				}
				
				if($("#password").val().length<1){
					$("#call").text("      비밀번호를 입력하세요");
				}else{
					$("#call").text("");
				}
			});
		});
		
		$('#login').click(function(){
			var htp1=true;
			var htp2=true;
			
			$("#call").text("");
			$("#call").text("");
			$('.infobox').each(function(idx, item){
				if($("#userId").val().length<1){
					htp1=false;
				}
				if($("#password").val().length<1){
					htp2=false;
				}
			});
			
			var userId=$('#userId').val();
			var password=$('#password').val();
			var savepass;
			$("input[name='savepass']:checked").each(function(i) {
				savepass=$(this).val();
		    })
			/*
			if(htp1 && htp2){
				$.ajax({
		            type : "get",
		            url:"<c:url value='/users/loginajax.do'/>",
		            data: {userId:userId, password:password, savepass:savepass},
		            success: function(core) {
		            	var data=core[0]*1;
		            	
		                if(data == 1){
		                	location.href="/workit/index.do";
		                	alert(core[1]+"님, 로그인되었습니다.");
		                }else if(data == 2){
		                	$("#call").text("      "+$(this).prev().text() +"잘못된 비밀번호입니다");
		                }else{
		                	$("#call").text("      "+$(this).prev().text() +"존재하지 않는 아이디입니다");
		                }
		            }
				});
			}
			*/
			if(!(htp1 || htp2)){
				alert("아이디, 비밀번호를 입력하세요.");
			}
		});
		
	});
</script>
<body>
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><a href="../index.html"><img class="logo-img" src="<c:url value='/resources/img/logo_workit.PNG'/>" alt="logo"></a><span class="splash-description">관리자정보를 입력해 주세요</span></div>
            <div class="card-body">
                <form>
                    <div class="form-group">
                        <input class="form-control form-control-lg infobox" id="userId" name="userId" type="text" placeholder="관리자ID" autocomplete="off" value="${cookie.ck_userid.value }">
                    </div>
                    <div class="form-group">
                        <input class="form-control form-control-lg infobox" id="password" name="password" type="password" placeholder="비밀번호">
                    </div>
                    
                    <div class="form-group">
                        <label class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="save-pass" name="savepass"
                            	<c:if test="${!empty cookie.ck_userid }">
									checked="checked"
								</c:if>
                    >
                    <span class="custom-control-label">아이디저장하기</span>
                        </label>
                    </div>
                    <span class="call" id="call" style="cursor:hand;color:red"></span>
                    <button type="button" class="btn btn-primary btn-lg btn-block" id='login' name='login'>로그인</button>
                </form>
            </div>
            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="#" class="footer-link">새로운 계정생성</a>
                </div>
                <div class="card-footer-item card-footer-item-bordered">
                    <a href="#" class="footer-link">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </div>
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/admin/assets/vendor/bootstrap/js/bootstrap.bundle.js'/>"></script>
</body>
 
</html>