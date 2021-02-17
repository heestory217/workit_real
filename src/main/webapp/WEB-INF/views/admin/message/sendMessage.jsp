<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html style="overflow:hidden">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/bootstrap/css/bootstrap.min.css'/>">
    <link href="<c:url value='/resources/admin/assets/vendor/fonts/circular-std/style.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/libs/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/fontawesome/css/fontawesome-all.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/chartist-bundle/chartist.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/morris-bundle/morris.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/charts/c3charts/c3.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/admin/assets/vendor/fonts/flag-icon-css/flag-icon.min.css'/>">
    <title>Work IT - 관리자 페이지</title>
</head>

<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	function cancle(){
		window.close();
	}
	
	function send(){
		if(!$('#contents').val()){
			alert('반려 사유를 입력해주세요.');
			event.preventDefault();
		}else{
			var params = $("#msgSendFrm").serialize();
			$.ajax(
			{
				url :"<c:url value='/admin/message/sendMessageAjax.do'/>",
				type:"POST",
				data : params,
				async: false,
				success : function(res)
						{
							if(res==1){
								alert("반려사유 쪽지가 전송되었습니다.");
								window.close();
							}else{
								alert("반려사유 쪽지 전송에 실패했습니다.");
								window.close();
							}
						}
			});
			event.preventDefault();
		}
	}
</script>

<body>
<div class="container-fluid dashboard-content">
	<div class="row">
	    <div class="col-xl-10">
	        <div class="page-section" id="overview">
	            <div class="row">
	                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	                    <h2>반려 사유 쪽지 전송</h2>
	                    <ul class="list-unstyled arrow">
	                        <li>반려 사유는 구체적이고 명확하게 작성해주세요.</li>
	                        <li>메시지 받는 회원을 다시 한번 확인해주세요.</li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <div class="row">
	            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	                <div class="card">
	                    <div class="card-body">
	                        <form id="msgSendFrm" method="POST">
	                            <div class="form-group">
	                                <label for="corpName" class="col-form-label">받는 기업</label>
	                                <input id="corpName" type="text" class="form-control" value="${corpName}" readonly>
	                                <input id="userNo" type="hidden" class="form-control" value="${userNo}" name="getUserNo">
	                                <label for="msgTitle" class="col-form-label">제목</label>
	                                <input id="msgTitle" type="text" class="form-control" name="messageTitle" maxlength="30" style="margin-bottom: 10px;" value="${corpName}의 기업 등록이 반려 되었습니다." readonly >
                                    <label for="exampleFormControlTextarea1">반려 사유</label>
                                    <textarea class="form-control" id="contents" rows="5" maxlength="1000" name="messageContent"></textarea>
                                </div>
	                                <a href="#" class="btn btn-outline-primary" onclick="cancle()">취소</a>
	                                <a href="#" class="btn btn-primary" onclick="send()">전송</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>