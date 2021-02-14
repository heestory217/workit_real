<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/sideMenu.jsp"%>

<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<style type="text/css">
h2 {
    margin: 60px;
    text-align: center;
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
    margin-bottom: 35px;
}
.colWarp2 {
    margin: 30px 0 50px;
}
.labelWarp {
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
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
.labelWarp {
    font-size: 20px;
    font-weight: 500;
}
.site-btn {
    color: #ffffff;
    background: #4C50BB;
    border: 1px solid #4C50BB;
    font-size: 14px;
    font-weight: 700;
    text-transform: uppercase;
    padding: 13px 45px 11px;
    cursor: pointer;
}
.btWarp {
    float: right;
    margin: 50px 0;
}
.row.infoWarp {
    border-bottom: 1px solid #ddd;
}
.row.conWarp {
    background: #fff;
    margin: 50px 0;
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		$('.opBt').click(function(){
			var op = confirm('승인하시겠습니까?');
			
			if (op) {
location.href='<c:url value="/admin/users/resume/resumreAck.do?resumeNo="/>'+this.attr('value');
			}
		});	
	});
</script>
<div class="container">
        <div class="row conWarp">
            <div class="col-lg-10 offset-lg-1">
   				<div class="section-title">
					<h2>${map['USER_NAME']}님 이력서</h2>
				</div>
                <div class="row infoWarp">
             	    <div class="col-lg-12 colWarp">
             	    	<div class="labelWarp">
                        <label id="resume-colName" for="resumeTitle">이력서 제목</label>
                        </div>
                        <p>${map['RESUME_TITLE']}</p>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="resumeTitle">기본 정보</label>
                        </div>
						<p>${map['USER_NAME']}</p>
						<p>${map['USER_EMAIL1']}@${map['USER_EMAIL2'] }</p>
						<p>${map['USER_HP1']}-${map['USER_HP2']}-${map['USER_HP3'] }</p>
                    </div>
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
									<div>${cVo.carrerStartdate }-${cVo.carrerEnddate }</div>
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
                </div>
                
                <div class="btWarp">
                	<button type="button" class="site-btn opBt" value="${map['RESUME_NO'] }">승인</button>
                	<button type="button" class="site-btn">반려</button>
                	<button type="button" class="site-btn" 
                		onclick="location.href='<c:url value="/admin/users/resume/resumeManager.do"/>'">목록</button>
                </div>
            </div>
        </div>
</div>


<%@ include file="../../inc/bottom.jsp"%>

