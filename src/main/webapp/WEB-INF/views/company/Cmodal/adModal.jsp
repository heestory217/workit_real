<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.cart-table table tr td {
	padding: 14px 0;
	border-right: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
}

.cart-table table tr th {
	border-right: 1px solid #ebebeb;
}
</style>

<div class="modal fade" id="siteAD" tabindex="-1" role="dialog" aria-labelledby="siteADLabel" aria-hidden="true">
	<div class="modal-dialog" style="max-width:700px;">
		<!-- Modal content-->
		<div class="modal-content" style="width: 700px; overflow-x: auto; overflow-y: auto;">
			<div class="modal-header">
			 	<h5 class="modal-title" id="siteADLabel">서비스 소개</h5>
 				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				 	<span aria-hidden="true">×</span>
			 	</button>
			</div>
			<div class="modal-body" style="padding:20px">
				<div class="modalservice">
					<h1><img src="<c:url value='/resources/img/icon_adv.png'/>">채용공고 광고 서비스</h1>
					<br>
					<h3>기업회원이 홈페이지 메인에 광고를 등록하는 유료서비스</h3>
					<h2>채용공고를 효과적으로 홍보하는 방법</h2>
					<h3>좋은 인재를 얻기 위해서는 적절한 홍보가 필요합니다.<br>
						등록된 채용공고가 많은 지원자의 눈에 띌 수 있도록<br>
						WorkIt은 메인 광고 유료서비스를 제공합니다.
					</h3>
					<h3>
						광고진행은 기업이 등록한 <span>채용공고가 승인된 후에</span><br>
						<strong>메인 광고 일정에 따라</strong> 광고시작일 협의가 이루어집니다.<br>
					</h3>
				</div>
				<div class="modalserviceContent" style="text-align: center;">
					<div class="cart-table">
						<table>
							<colgroup>
								<col style="width: 30%;" />
								<col style="width: 20%;" />
								<col style="width: 20%;" />
								<col style="width: 30%;" />
							</colgroup>
							<thead>
								<tr>
									<th>광고구좌</th>
									<th>등급</th>
									<th>기간</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<!-- css 적용 순위 밀려서 직접 지정해 줌 style="padding-bottom: 14px;" -->
									<td rowspan="3" style="padding-bottom: 14px;">메인상단</td>
									<td rowspan="3" style="padding-bottom: 14px;">1급</td>
									<td style="padding-bottom: 14px;">7일</td>
									<td style="padding-bottom: 14px;">500,000 원</td>
								</tr>
								<tr>
									<td style="padding-bottom: 14px;">15일</td>
									<td style="padding-bottom: 14px;">1,000,000 원</td>
								</tr>
								<tr>
									<td style="padding-bottom: 14px;">30일</td>
									<td style="padding-bottom: 14px;">2,000,000 원</td>
								</tr>
								<tr>
									<td rowspan="3" style="padding-bottom: 14px;">메인하단</td>
									<td rowspan="3" style="padding-bottom: 14px;">2급</td>
									<td style="padding-bottom: 14px;">7일</td>
									<td style="padding-bottom: 14px;">300,000 원</td>
								</tr>
								<tr>
									<td style="padding-bottom: 14px;">15일</td>
									<td style="padding-bottom: 14px;">600,000 원</td>
								</tr>
								<tr>
									<td style="padding-bottom: 14px;">30일</td>
									<td style="padding-bottom: 14px;">1,200,000 원</td>
								</tr>
							</tbody>
						</table>
					</div>
					<button type="button" class="btn btn-default" data-dismiss="modal">등록한 채용공고 목록보기</button>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" style="padding: 5px 10px !important;">닫기</button>
			</div>
		</div>
	</div>
</div>
