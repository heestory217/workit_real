<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<style type="text/css">
h2 {
    margin-top: 60px;
}

textarea#resumeSelfintro {
    width: 100%;
    border: none;
    height: 100%;
}

.resumeBt {
    border: none;
    background: #fff;
    color: #4C50BB;
}

.resume-list{
	margin-bottom: 15px;
}

.colWarp {
    margin-bottom: 30px;
}
.colWarp2 {
    margin: 30px 0 50px;
}
.labelWarp {
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
}

.myWarp {
    width: 100%;
    margin: 14px;
    padding: 25px 0 40px 0;
    border-top: 1px solid #ddd;
}
#new-carrerDiv, #new-awardDiv, #new-licencseDiv, #new-foreignDiv{
    position: relative;
    width: 100%;
    padding-bottom: 23px;
    margin-bottom: 20px;
}
#new-carrerDiv > div {
	width: 30%;
	float: left;
}
#new-awardDiv > div, #new-licencseDiv > div, 
#new-foreignDiv > div{
	width: 40%;
	float: left;
}
button.site-btn.register-btn {
    margin: 40px 10px 40px 0;
    float: left;
}
.btWarp {
    width: 100%;
    margin: 50px 5px;
    padding-top: 25px;
    border-top: 1px solid #ddd;
}
.bt-float {
    float: right;
}

div.btWarp > div > a:nth-child(1) {
	padding: 10px 30px 10px;
	background: white;
    border: 1px solid #4C50BB;
    color: #4C50BB;
}
.btWarp .filter-widget a {
	padding: 10px 30px 10px;
}

</style>

<script type="text/javascript">
	$(function() {
		
		$('.delBt').click(function(){
			var del = confirm('삭제하시겠습니까?');
			
			
			if (del) {
				location.href='<c:url value="/resumes/deleteResumes.do?resumeNo=${map['RESUME_NO']}"/>';
			} else{
				 alert('삭제가 취소되었습니다.');
				 return;
			}
		});
		
		$('.updateBt').click(function(){
			var up = confirm('수정하시겠습니까?');
			
			
			if (up) {
				location.href='<c:url value="/resumes/resumeUpdate.do?resumeNo=${map['RESUME_NO']}"/>';
			} 
		});
		
		
		
	});
</script>

<div class="container">
    <form class="checkout-form" method="POST" name="resumefrm"
    		action="<c:url value='/resumes/resumeWrite.do'/>">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
   				<div class="section-title">
					<h2>${map['USER_NAME']}님 이력서</h2>
				</div>
                <div class="row">
                    <input type="hidden" name="userNo" value="${sessionScope.userNo}">
             	    <div class="col-lg-12 colWarp">
             	    	<div class="labelWarp">
                        <label id="resume-colName" for="resumeTitle">이력서 제목<span>*</span></label>
                        </div>
                        <c:if test="${!empty map['RESUME_FILENAME']}">
                        	<p> ${fn:substringBefore(map['RESUME_TITLE'], '_') }</p>
                        </c:if>
                        <c:if test="${empty map['RESUME_FILENAME']}">
                        	<p>${map['RESUME_TITLE']}</p>
                        </c:if>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="resumeTitle">기본 정보</label>
                        </div>
						<p>${map['USER_NAME']}</p>
						<p>${map['USER_EMAIL1']}@${map['USER_EMAIL2'] }</p>
						<p>${map['USER_HP1']}-${map['USER_HP2']}-${map['USER_HP3'] }</p>
                    </div>
                    
                    <!-- 파일 다운 -->
                    <c:if test="${!empty map['RESUME_FILENAME']}">
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
							<label id="resume-colName">파일 다운</label>
						</div>
						<div>
<a href="<c:url value='/resumes/download.do?resumeNo=${param.resumeNo }&resumeFilename=${map["RESUME_FILENAME"] }'/>">
								${fileInfo}
							</a>
						</div>
                    </div>
                    </c:if>
                    
                    <!-- 파일 없을떄 -->
                    <c:if test="${empty map['RESUME_FILENAME']}">
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                    	<label id="resume-colName" for="resumeSelfintro">자기 소개</label>
                    	</div>
                    	<textarea class="content" id="resumeSelfintro" readonly="readonly"
                    	name="resumeSelfintro">${map['resumeSelfintro'] }</textarea><br><br>
                    </div>
					<div class="col-lg-12">
						<div class="labelWarp">
							<label id="resume-colName" for="carrer">경력</label>
						</div>
						<c:if test="${!empty cList}">
							<c:forEach var="cVo" items="${cList}">
								<div id="new-carrerDiv">
									<div> ${cVo.carrerStartdate }-${cVo.carrerEnddate }</div>
									<div>${cVo.carrerCorp }</div> 
									<div>${cVo.carrerWork }</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
					<div class="col-lg-12 colWarp2">
                    	<div class="labelWarp">
                 			<label id="resume-colName" for="resumeFinaleducation">학력</label>
                 		</div>
                        <div>
                        	${map['RESUME_FINALEDUCATION']}
                        </div>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        	<label id="resume-colName" for="award">수상 및 기타</label>
                        </div>
                        <c:if test="${!empty aList}">
							<c:forEach var="aVo" items="${aList}">
		                        <div id="new-awardDiv">
		                        	<div>${aVo.awardAbout }</div>
		                        	<div>${aVo.awardDate }</div>
		                        </div>
		                 </c:forEach>
						</c:if>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        	<label id="resume-colName" for="licencse">자격증</label>
                        </div>
                      	<c:if test="${!empty lcList}">
							<c:forEach var="lVo" items="${lcList}">
		                        <div id="new-licencseDiv">
		                        	<div>${lVo.licencseName }</div>
		                        	<div>${lVo.licencseIssueplace }</div>
		                        </div>
		                 </c:forEach>
						</c:if>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                       		<label id="resume-colName" for="foreign">외국어</label>
                        </div>
                        <c:if test="${!empty fList}">
							<c:forEach var="fVo" items="${fList}">
		                        <div id="new-foreignDiv">
		                        	<div>${fVo.foreignlanguageskillLang }</div>
		                        	<div>${fVo.foreignlanguageskillExpert }</div>
		                        </div>
		                 </c:forEach>
						</c:if>
                    </div>
                    </c:if>
                    <c:if test="${map['USER_CORPCHECK']=='1' and empty param.type}">
	                    <div class="btWarp">
	                    	<div class="bt-float">
								<button class="site-btn listBt" type="button"
		onclick="location.href='<c:url value="/resumes/resumesList.do"/>'">목록</button>
								<!-- 이력서 file 없을떄 -->
								<c:if test="${empty map['RESUME_FILENAME']}">
								<button class="site-btn updateBt" type="button">수정</button>
								</c:if>
								<button class="site-btn delBt" type="button">삭제</button>
							</div>
						</div>
					</c:if>
					
					
					<!-- 채용공고에 지원한 이력서 일 때 -->
                    <c:if test="${param.type=='Applied' and !empty param.applicantlistNo}">
	                    <div class="btWarp">
	                    	<div class="filter-widget" style="text-align: right;">
								<a class="filter-btn" href="<c:url value="/company/ApplicantMng/applicantByRecruit.do"/>" style="float: left;">목록</a>
								<a class="filter-btn" href="<c:url value="/company/ApplicantMng/pass.do?resumeNo=${map['RESUME_NO']}&applicantlistNo=${param.applicantlistNo}"/>">합격</a>
								<a class="filter-btn" href="<c:url value="/company/ApplicantMng/fail.do?resumeNo=${map['RESUME_NO']}&applicantlistNo=${param.applicantlistNo}"/>">불합격</a>
								<a class="filter-btn" href="<c:url value="/company/ApplicantMng/prohibit.do?userNo=${map['USER_NO']}"/>">지원제한</a>
							</div>
						</div>
					</c:if>
					<!-- 구매한 이력서 일 때 -->
                    <c:if test="${param.type=='Bought'}">
	                    <div class="btWarp">
	                    	<div class="filter-widget" style="text-align: right;">
								<a class="filter-btn" href="<c:url value="/company/HRManagment/purchasedResumes.do"/>" style="float: left;">목록</a>
								<a class="filter-btn" href="<c:url value="/company/HRManagment/positionWrite.do?userId=${map['USER_ID']}"/>">포지션제안</a>
							</div>
						</div>
					</c:if>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../inc/bottom.jsp"%>