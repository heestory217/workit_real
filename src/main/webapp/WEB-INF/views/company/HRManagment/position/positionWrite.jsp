<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="positionTop.jsp"%>

<style>
.error {
	color: red;
}
</style>

<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript"  src="<c:url value='/resources/js/position.js'/>"></script>
<script type="text/javascript">
$(function() {
	$('#userId').keyup(function() {
		var userid = $(this).val();
		if (validate_userid(userid)) {
			$.ajax({
				url : "<c:url value='/users/ajaxCheckId.do'/>",
				type : "get",
				data : {
					userid : userid
				},
				success : function(res) {
					var msg = "";
					if (!res) {
						msg = "등록되지 않은 아이디입니다.";
					}
					$('.error:eq(0)').html(msg);
				},
				error : function(xhr, status, error) {
					alert('error! : ' + error);
				}
			});	//AJAX
		} else {
			$('.error:eq(0)').html("아이디는 영문, 숫자, _만 가능합니다.");
		}
	});	//아이디 keyup
	
	$('#getPGForm').click(function(){
		$.ajax({
			url : "<c:url value='/company/HRManagment/getPGForm.do'/>",
			type : "get",
			data : {
				userid : userid
			},
			success : function(res) {
				var msg = "";
				if (!res) {
					msg = "등록되지 않은 아이디입니다.";
				}
				$('.error:eq(0)').html(msg);
			},
			error : function(xhr, status, error) {
				alert('등록된 양식이 없습니다!');
			}	
		});	//AJAX
	});	//양식 불러오기 버튼 click
});

	function write_go() {
		var ckeditor = CKEDITOR.instances['positionsuggestContents'];
		if (ckeditor.getData() == "") {
			alert('내용을 입력 하세요');
			ckeditor.focus();
			return;
		} else {
			document.in_form.submit();
		}
	}


	function execPGForm() {
		var _width = '500';
		var _height = '280';

		// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		var _left = Math.ceil((window.screen.width - _width) / 2);
		var _top = Math.ceil((window.screen.height - _height) / 2);

		window.open('<c:url value="/company/HRManagment/getPSGForm.do"/>', '양식 불러오기', 
				'width=' + _width + ', height=' + _height  + ', left=' + _left + ', top=' + _top);
	}
</script>

<!-- 파라미터 처리를 위한 정보-->
<div style="display: none;">
	<p id="type">${param.type}</p>
</div>

<div class="blog-details-inner">
	<div class="leave-comment" style="padding-top: 0">
		<div class="row">
			<div class="col-lg-12" style="text-align: center;">
				<h4>제안 보내기</h4>
			</div>
			<div class="col-lg-6">
				<c:if test="${!empty param.type}">
					<script type="text/javascript">
						$(function(){
							$("#saveForm").trigger("click");
						});
					</script>
				</c:if>
				<input type="checkbox" id="saveForm"> 
				<input type="hidden" id="loginId" value="${userId}"> 
				<label for="saveForm">양식함에 저장하기 <span class="checkmark"></span></label>
			</div>
			<div class="col-lg-12" style="margin: 10px 0">
				<p id="notice" style="font-size:16px;color:#4C50BB;">
					해당 제안은 양식함에 저장되며, 삭제하는 경우 외에 자동으로 영구 보관됩니다.
				</p>
			</div>
		</div>
		
		<form name="positionFrm" method="post" class="comment-form" action="<c:url value='/company/HRManagment/positionWrite.do'/>">
			<div class="row">
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="userId" id="userId" placeholder="받는 회원 아이디를 입력하세요" >
					<input type="hidden" name="userNo" value="${sessionScope.userNo}">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="positionsuggestTitle" id="positionsuggestTitle" placeholder="제목을 입력하세요" maxlength="30">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="text" name="positionsuggestPosition" id="positionsuggestPosition" placeholder="포지션을 입력하세요">
				</div>
				<div class="col-lg-6">
					<span class="error"></span>
					<input type="number" name="positionsuggestPrice" id="positionsuggestPrice" placeholder="연봉을 입력하세요">
				</div>
				<div class="col-lg-12">
					<span class="error"></span>
					<textarea name="positionsuggestContents" id="positionsuggestContents" placeholder="내용을 입력하세요"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('positionsuggestContents', {
							height : 300
						});
					</script>
					<button type="button" class="site-btn" id="getPGForm" onclick="execPGForm()"
						style="margin-top: 25px;background: white;color: #4C50BB;">양식 불러오기</button>
					<button type="submit" class="site-btn" style="margin-top: 25px;">보내기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="positionBottom.jsp"%>