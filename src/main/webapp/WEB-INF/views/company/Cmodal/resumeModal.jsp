<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade" id="seeResume" tabindex="-1" role="dialog" aria-labelledby="seeResumeLabel" aria-hidden="true">
	<div class="modal-dialog" style="max-width:560px;">
		<!-- Modal content-->
		<div class="modal-content" style="width: 560px; overflow-x: auto; overflow-y: auto;">
			<div class="modal-header">
			 	<h5 class="modal-title" id="seeResumeLabel">서비스 소개</h5>
 				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				 	<span aria-hidden="true">×</span>
			 	</button>
			</div>
			<div class="modal-body" style="padding:20px">
				<div class="modalservice">
					<h1><img src="<c:url value='/resources/img/icon_resume.png'/>">이력서 열람 서비스</h1>
					<h3>기업회원이 지원자의 이력서 열람권을 구매하는 유료서비스</h3>
					<h2>유능한 인재 영입을 원하는 기업회원 여러분!</h2>
					<h3>맞춤조건에 따라 회사가 원하는 지원자를 탐색하고,<br>
						이력서 구매를 통해 <strong>지원자의 상세이력</strong>을 확인해보세요.<br><br>
						이력서 확인 후, 영입하고 싶은 인재를 발견했다면<br>
						해당 지원자에게 직접 입사를 제안할 수 있습니다.
					</h3>
				</div>
				<div class="modalserviceContent" style="text-align: center;">
					<button type="button" class="btn btn-default" data-dismiss="modal">이력서 탐색하기</button>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 5px 10px !important;">닫기</button>
			</div>
		</div>
	</div>
</div>