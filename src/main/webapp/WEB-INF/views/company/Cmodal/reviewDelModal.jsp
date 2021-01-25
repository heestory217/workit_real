<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="reviewDel" tabindex="-1" role="dialog" aria-labelledby="reviewDelLabel" aria-hidden="true">
	<div class="modal-dialog" style="max-width:700px;">
		<!-- Modal content-->
		<div class="modal-content" style="width: 700px; overflow-x: auto; overflow-y: auto;">
			<div class="modal-header">
			 	<h5 class="modal-title" id="reviewDelLabel">서비스 소개</h5>
 				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				 	<span aria-hidden="true">×</span>
			 	</button>
			</div>
			<div class="modal-body" style="padding:20px">
				<div class="modalservice">
					<h1><img src="<c:url value='/resources/img/icon_review.png'/>">리뷰 삭제 서비스</h1>
					<br>
					<h3>기업회원이 사이트에 등록된 기업 후기를 삭제할 수 있는 유료서비스</h3>
					<h2>회사의 브랜드 평판을 좌우하는 기업 생생 리뷰!</h2>
					<h3>WorkIt은 기업회원이 기업 이미지 제고를 위한 활동을<br>
						영위할 수 있도록 기업 리뷰 삭제 서비스를 제공합니다. <br><br>
						기업회원은 사이트에 등록된 실제 기업 후기 중<br>
						회사에 부정적인 영향이 우려되는 리뷰를 삭제할 수 있습니다.
					</h3>
				</div>
				<div class="modalserviceContent" style="text-align: center;">
					<button type="button" class="btn btn-default" data-dismiss="modal" 
						onclick="location.href='<c:url value='/company/corp/corpDetail.do?corpNo=${corpNo}'/>'">기업 리뷰 보러가기</button>
					<br><br>
					<span style="font-size: 16px;">※ Workit은 리뷰 삭제의 경우, 고객(기업회원과 개인회원)간 소통의 중개자이며 운영정책에 따라 운영되고 실제 리뷰삭제에 대한 모든 책임은 리뷰작성 및 삭제 당사자에게 있습니다.</span>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 5px 10px !important;">닫기</button>
			</div>
		</div>
	</div>
</div>