<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/top.jsp" %>
<%@ include file="../../inc/sideMenu.jsp" %>

<style>
.dashboard-wrapper{
	margin-top : 30px;
}
.card{
	margin-bottom : 10px;
}
.pagination{
	margin-top : 10px;
	margin-bottom : 60px;
	float:left;
}
.corpDetail{
	margin : 30px;
}
</style>


<div class="col-lg-12">
    <div class="section-block">
        <h3 class="section-title">기업 회원 조회</h3>
    </div>
    <div class="card">
        <div class="campaign-table table-responsive">
            <table class="table">
                <thead>
                    <tr class="border-0">
                        <th class="border-0">로고</th>
                        <th class="border-0">회사명</th>
                        <th class="border-0">대표명</th>
                        <th class="border-0">사업 분야</th>
                        <th class="border-0">승인 여부</th>
                        <th class="border-0">기업 등록일</th>
                        <th class="border-0">옵션</th>
                    </tr>
                </thead>
                <tbody>
                <!-- 기업 정보 테이블 반복 -->
                <c:if test="${empty corpList}">
                	<tr colspans="7">
                		<p> 기업 정보가 없습니다.</p>
                	</tr>
                </c:if>
                <c:if test="${!empty corpList}">
                <c:forEach var="corpVo" items="${corpList }">
                    <tr>
                        <td>
                            <div class="m-r-10"><img src="<c:url value='/pd_images/${corpVo.corpImgurl }'/>" alt="corpLogo" width="35"></div>
                        </td>
                        <td>
                        <a href="<c:url value='/admin/users/corp/corpDetail.do?corpNo=${corpVo.corpNo}&userNo=${corpVo.userNo }'/>"> ${corpVo.corpName }</a>
                        </td>
                        <td>${corpVo.corpHeadname}</td>
                        <td>${corpVo.corpIndustry }</td>
                        <td>
                        <c:if test="${corpVo.corpOkcheck eq 0}">
                        	등록 대기 중
                        </c:if>
                        <c:if test="${corpVo.corpOkcheck eq 1}">
                        	승인 완료
                        </c:if>
                        <c:if test="${corpVo.corpOkcheck eq 2}">
                        	등록 반려
                        </c:if>
                        </td>
                        <td>
                        <fmt:formatDate value="${corpVo.corpRegdate }" pattern="yyyy-MM-dd"/>
                        </td>
                        <td>
                            <div class="dropdown float-right">
                                <a href="#" class="dropdown-toggle card-drop" data-toggle="dropdown" aria-expanded="false">
                                        <i class="mdi mdi-dots-vertical"></i>
                                             </a>
                                <div class="dropdown-menu dropdown-menu-right" x-placement="bottom-end" style="position: absolute; transform: translate3d(14px, 19px, 0px); top: 0px; left: 0px; will-change: transform;">
                                    <!-- item-->
			                        <c:if test="${corpVo.corpOkcheck eq 0}">
			                        	<a href="<c:url value='/admin/users/corp/corpJudge.do?corpNo=${corpVo.corpNo }&type=Y'/>" class="dropdown-item">기업 등록 승인</a>
			                        </c:if>
			                        <c:if test="${corpVo.corpOkcheck eq 1}">
			                        	<a href="<c:url value='/admin/users/corp/corpJudge.do?corpNo=${corpVo.corpNo }&type=W'/>" class="dropdown-item">승인 취소</a>
			                        </c:if>
			                        <c:if test="${corpVo.corpOkcheck eq 2}">
			                        	<a href="<c:url value='/admin/users/corp/corpJudge.do?corpNo=${corpVo.corpNo }&type=W'/>" class="dropdown-item">등록 반려 취소</a>
			                        	<a href="<c:url value='/admin/users/corp/corpJudge.do?corpNo=${corpVo.corpNo }&type=Y'/>" class="dropdown-item">기업 등록 승인</a>
			                        	<a href="#" class="dropdown-item" onclick="sendMessage('${corpVo.corpName}','${corpVo.userNo}')">반려 사유 쪽지 전송</a>
			                        </c:if>
                                    
                                    <!-- item-->
                                    
                                </div>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                    <!-- 테이블 반복 끝 -->
                 </c:if>
                </tbody>
            </table>
        </div>
    </div>
	<!-- paging -->
	<div>
		<ul class="pagination">
		    <!-- 이전 블록 -->
		    <c:if test="${pagingInfo.firstPage>1 }">
			    <li class="page-item">
			        <a class="page-link" href="#" aria-label="Previous" onclick="searching(${pagingInfo.firstPage-1})">
			            <span aria-hidden="true">«</span><span class="sr-only">Previous</span>
		            </a>
			    </li>
		    </c:if>
		    
		    <!-- 페이징 -->
		    <c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
		    	<c:if test="${i==pagingInfo.currentPage }">
				    <li class="page-item active"><a class="page-link" href="#">${i }</a></li>
		    	</c:if>
		    	<c:if test="${i!=pagingInfo.currentPage }">
				    <li class="page-item"><a class="page-link" href="#" onclick="searching(${i})">${i }</a></li>
		    	</c:if>
		    </c:forEach>
		    <!-- 다음블록 -->
		    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
			    <li class="page-item">
			        <a class="page-link" href="#" onclick="searching(${pagingInfo.lastPage+1})" aria-label="Next"><span aria-hidden="true">»</span>
			           <span class="sr-only">Next</span></a>
			    </li>
		    </c:if>
		</ul>
	</div>
	<!-- searching -->
	<div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-4" style="float: right;">
       <form name="corpFrm" action="<c:url value='/admin/users/corp/corpList.do'/>" method="post">
    	  <input type="hidden" name="currentPage">
          <input class="form-control form-control-lg" name="searchKeyword" type="search" placeholder="기업명 검색" aria-label="Search" value=${param.searchKeyword }>
          <button class="btn btn-primary search-btn" onclick="searching(${pagingInfo.currentPage})" style="top: 1px; bottom: 0px; right: 0px;">검색</button>
       </form>
    </div>
	<!-- searching -->
</div>
<!-- 심사 대기 기업 보여주기 -->
<div class="col-lg-12" 	style="clear: both;	">
	<div class="section-block">
		<h3 class="section-title">신규 등록 신청 기업</h3>
	</div>
</div>
<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="margin-bottom: 60px;">
    <!-- ============================================================== -->
    <!-- card influencer one -->
    <!-- ============================================================== -->
    <c:if test="${empty corpWaitingList }">
    	심사 대기중인 기업이 없습니다.
    </c:if>
    <c:if test="${!empty corpWaitingList }">
    <c:forEach var="wCo" items="${corpWaitingList }">
	    <div class="card">
	        <div class="card-body">
	            <div class="row align-items-center">
	                <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12">
	                    <div class="user-avatar float-xl-left pr-4 float-none">
	                        <img src="<c:url value='/pd_images/${wCo.corpVo.corpImgurl }'/>" alt="User Avatar" class="rounded-circle user-avatar-xl">
	                            </div>
	                        <div class="pl-xl-3">
	                            <div class="m-b-0">
	                                <div class="user-avatar-name d-inline-block">
	                                    <h2 class="font-24 m-b-10">${wCo.corpVo.corpName }</h2>
	                                </div>
	                            </div>
	                            <div class="user-avatar-address">
	                                <p class="mb-2"><i class="fa fa-map-marker-alt mr-2  text-primary"></i>${wCo.corpVo.corpAddress1 }<span class="m-l-10">사업분야 : ${wCo.corpVo.corpIndustry }
	                                <span class="m-l-20">설립일 : ${wCo.corpVo.corpStartdate} </span></span>
	                                </p>
	                                <div class="mt-3">
	                                    <a href="https://${wCo.corpVo.corpWebaddress }" class="mr-1 badge badge-light">${wCo.corpVo.corpWebaddress }</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-3 col-lg-12 col-md-12 col-sm-12 col-12">
	                        <div class="float-xl-right float-none mt-xl-0 mt-4">
	                            <a href="<c:url value='/admin/users/corp/corpJudge.do?corpNo=${wCo.corpVo.corpNo }&type=N'/>" class="btn btn-outline-secondary">기업 등록 반려</a>
	                            <a href="<c:url value='/admin/users/corp/corpJudge.do?corpNo=${wCo.corpVo.corpNo }&type=Y'/>" class="btn btn-outline-primary">기업 등록 승인</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="border-top user-social-box">
	            	<div class="border-top card-footer p-0">
	                    <div class="campaign-metrics d-xl-inline-block" style="width: 100%;">
	                        <h4 class="mb-0" style="cursor:pointer;" onclick="moreinfo(${wCo.corpVo.corpNo })">더 보기</h4>
	                        <div id="${wCo.corpVo.corpNo }" class="corpDetail" style="display: none;">
	                        	<h5>기업 요약 정보</h5>
	                        	<p style="font-size: 1.5em;text-align: center;line-height: 0.7;">
			                        '${wCo.corpVo.corpName}'<span>
			                        <c:if test="${wCo.corpVo.corpAvrpay!=0}">
			                        	의 1인당 평균연봉은 </span><fmt:formatNumber value="${wCo.corpVo.corpAvrpay}" pattern="#,###,###"/> 만원, <br><br>
			                        </c:if>
			                        <c:if test="${wCo.corpVo.corpPnumber!=1}">
			                        	<span>기업 근로자 수는</span> 총  ${wCo.corpVo.corpPnumber}명
			                        </c:if>
			                        <c:if test="${!empty wCo.corpVo.corpKind}">
			                        	<span>인 중소기업 입니다.</span>
			                        </c:if>
			                        <c:if test="${empty wCo.corpVo.corpKind}">
			                        <span>입니다.</span>
			                        </c:if>
		                        </p>
		                        <h5>기업 소개</h5>
		                        <p>
		                        	${wCo.corpVo.corpIntro}
		                        </p>
		                        <h5>등록 이미지</h5>
		                        <c:forEach var="img" items="${wCo.corpImgList}">
		                        	<img alt="corpImg" src="<c:url value='/pd_images/${img.corpimgUrl}'/>"style="width: 300px;">
		                        </c:forEach>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </c:forEach>
        </c:if>
        <!-- ============================================================== -->
        <!-- end card influencer one -->
        <!-- ============================================================== -->


        <!-- ============================================================== -->
        <!-- end content -->
        <!-- ============================================================== -->
    </div>
</div>
<script src="<c:url value='/resources/admin/assets/vendor/jquery/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
	function searching(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=corpFrm]').submit();
	}
	
	function moreinfo(corpNo){
		var moreInfo = document.getElementById(corpNo);
		if(moreInfo.style.display=='none'){
			moreInfo.style.display='block';
		}else{
			moreInfo.style.display='none';
		}
	}
	
	function sendMessage(corpName,userNo){
		open(
				"/workit/admin/message/sendMessage.do?corpName="
						+corpName+"&userNo="+userNo, "chk",
				"width=650,height=518,left=0,top=0,location=yes");
		}
</script>
<%@ include file="../../inc/bottom.jsp" %>