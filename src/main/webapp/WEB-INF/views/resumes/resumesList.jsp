<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
button.newresumeBt,
.uploderesumeBt {
    border: none;
    width: 100%;
    height: 100%;
    background-color: #fff;
}

button.newresumeBt {
    color: #4C50BB;
}

i.fa.fa-upload {
    color: #777;
}

h5#newresumeSpan,
#fileupSpan {
    font-weight: bold;
}

.fa.fa-files-o,
.fa.fa-upload {
    font-size: 50px;
    padding-bottom: 13px;
}

.preview {
    padding: 45px 15px;
}

h3.resumeName {
    font-weight: bolder;
    color: #666;
    padding-bottom: 9px;
}

.openOnOff{
	color: #4C50BB;
	font-weight: bolder;
}

</style>

<!-- Product Shop Section Begin -->
<section class="product-shop spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="row headWarp">
					<div class="col-lg-7 col-md-7">
						<p>최근 문서</p>
					</div>
				</div>


				<div class="product-list contentWarp">
					<div class="row">
						<!-- 새이력서 작성 버튼-->
						<div class="col-lg-3 col-sm-6">
							<div class="product-item">
								<div class="pi-pic">
									<button class="newresumeBt"
										onclick="location.href='<c:url value="/resumes/resumeWrite.do"/>'">
										<i class="fa fa-files-o" aria-hidden="true"></i>
										<h5 id="newresumeSpan">새 이력서 작성</h5>
									</button>
								</div>
							</div>
						</div>

						<!--이력서 첨부 버튼 -->
						<div class="col-lg-3 col-sm-6">
							<div class="product-item">
								<div class="pi-pic">
									<button class="uploderesumeBt">
										<i class="fa fa-upload" aria-hidden="true"></i>
										<h5 id="fileupSpan">파일 업로드</h5>
									</button>
								</div>
							</div>
						</div>

						<!-- 이력서 직접 작성된것/이력서 첨부 된 파일 -->
						<input type="hidden" name="userNo" value="${sessionScope.userNo}">
						<c:if test="${!empty resumeList }">
							<c:forEach var="resumeVo" items="${resumeList }">
								<div class="col-lg-3 col-sm-6">
									<div class="product-item">
										<div class="pi-pic">
											<div class="preview">
												<h3 class="resumeName">
													<a href="<c:url value='/resumes/resumeDetail.do?resumeNo=${resumeVo.resumeNo}'/>"> 
													${resumeVo.resumeTitle} </a>
												</h3>
												<p class="resumeDate">
													<i class="fa fa-calendar" aria-hidden="true"></i>
													<fmt:formatDate value="${resumeVo.resumeDate}" pattern="YYYY-MM-dd"/> 
												</p>
												<p class="openOnOff">
													<c:if test="${resumeVo.resumeResumeopencheck eq '1'}">
													임시저장
													</c:if>
													<c:if test="${resumeVo.resumeResumeopencheck eq '2'}">
													이력서 열람
													</c:if>
													<c:if test="${resumeVo.resumeResumeopencheck eq '3'}">
													반려
													</c:if>
												</p>
											</div>
											<div class="icon" title="삭제">
												<a href="#"> <i class="fa fa-times" aria-hidden="true"></i></a>
											</div>
											<ul>
												<li class="w-icon active"><a href="#" title="공개여부">
													<i class="fa fa-external-link" aria-hidden="true"></i>
												</a></li>
												<li class="w-icon active"><a href="#" title="다운로드">
													<i class="fa fa-arrow-down" aria-hidden="true"></i>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
				<div class="loading-more">
					<i class="icon_loading"></i> <a href="#"> Loading More </a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Shop Section End -->


<%@ include file="../inc/bottom.jsp"%>