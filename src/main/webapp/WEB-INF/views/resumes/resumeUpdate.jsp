<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		var counCrr=${fn:length(cList)};
		var countAw=${fn:length(aList)};
		var countLi=${fn:length(lcList)};
		var count=${fn:length(fList)};
			
			//커리어
			$('#carrerBt').click(function() {
				var carrerInput1 =""; 
carrerInput1 +='<div id="addcarrer"><input type="text" id="carrerStartdate" name="CarrerVOList['+counCrr+'].carrerStartdate" placeholder="YYYY.MM"> -';
carrerInput1 +='<input type="text" id="carrerEnddate" name="CarrerVOList['+counCrr+'].carrerEnddate" placeholder="YYYY.MM">';
carrerInput1 +='<input type="text" id="carrerCorp" name="CarrerVOList['+counCrr+'].carrerCorp" placeholder="회사명">';
carrerInput1 +='<input type="text" id="carrerWork" name="CarrerVOList['+counCrr+'].carrerWork" placeholder="부서명/직책">';
// carrerInput1 +='<input type="hidden" name="CarrerVOList['+counCrr+'].carrerNo">';
carrerInput1 +='<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';
	   	
				$('#new-carrerDiv').append(carrerInput1);
				
				counCrr++;
			});//carrerBt
			
			$('#new-carrerDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
				//counCrr--;
		    });
			
			//수상
	   		$('#awardBt').click(function(){
	   			var awardInput = "";
awardInput += '<div id="addaward"><input type="text" id="awardAbout" name="AwardVOList['+countAw+'].awardAbout" placeholder="활동명">';	   			
awardInput += '<input type="text" id="awardDate" name="AwardVOList['+countAw+'].awardDate" placeholder="세부사항">';	   			
awardInput += '<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';	   			
	   		
				$('#new-awardDiv').append(awardInput);

				countAw++;
				
	   		});//awardBt
	   		
	   		$('#new-awardDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
				//countAw--;
		    });
	   		
	   		//자격증
	   		$('#licencseBt').click(function(){
	   			var licenInput = "";
licenInput+='<div id="addlicen"><input type="text" id="licencseName" name="LicenVOList['+countLi+'].licencseName" placeholder="자격증 이름">';
licenInput+='<input type="text" id="licencseIssuerLace" name="LicenVOList['+countLi+'].licencseIssueplace" placeholder="발행처">';
licenInput+='<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';	   			
	   			
				$('#new-licencseDiv').append(licenInput);
				
				countLi++;
	   		});
	   		
	   		$('#new-licencseDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
				//countLi--;
		    });
	   		
	   		//외국어
	   		$('#foreignBt').click(function(){
	   			var i =0;
	   			var foreignInput = "";
	   			
foreignInput+='<div id="addforeign"><input type="text" id="foreignlanguageskillLang" name="ForeignskillVO['+count+'].foreignlanguageskillLang" placeholder="언어">';
foreignInput+='<input type="text" id="foreignlanguageskillExpert" name="ForeignskillVO['+count+'].foreignlanguageskillExpert" placeholder="수준">';
foreignInput+='<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';	   			
	   			
				$('#new-foreignDiv').append(foreignInput);
				
				count++;
	   		});
	   		
	   		$('#new-foreignDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
				//count--;
		    });
	   		
	   		
	   		//개별삭제
	   		$('.btnDel').click(function(){
	   			
	   		});
		});
</script>
<style type="text/css">
h2 {
    margin-top: 60px;
}

textarea#resumeSelfintro {
    width: 100%;
    border: none;
    height: 120px;
    
}

.resumeBt {
    border: none;
    background: #fff;
    color: #4C50BB;
}

.resume-list{
	margin-bottom: 15px;
}

input#carrerStartdate,
#carrerEnddate {
    width: 120px;
}
input#carrerCorp {
    margin: 0 20px;
    width: 364px;
}
input#carrerWork {
    width: 234px;
    margin-right: 20px;
}

.colWarp {
    margin-bottom: 30px;
}
.colWarp2 {
    margin: 30px 0;
}
.labelWarp {
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
}

#awardDate, #licencseName,
#foreignlanguageskillLang {
    width: 300px;
    margin-right: 20px;
}
#awardAbout, #licencseIssuerLace,
#foreignlanguageskillExpert{
    width: 570px;
    margin: 0 20px 0 0;
}

.myWarp {
    width: 100%;
    margin: 14px;
    padding: 25px 0 40px 0;
    border-top: 1px solid #ddd;
}
button.btnRemove , .btnDel{
    background: #fff;
    border: none;
    color: #4C50BB;
}
div#new-awardDiv {
    margin-top: 20px;
}
</style>
<div class="container">
    <form class="checkout-form" method="POST" name="resumefrm"
    		action="<c:url value='/resumes/resumeUpdate.do'/>">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
   				<div class="section-title">
					<h2>이력서 수정</h2>
				</div>
                <div class="row">
                	<input type="hidden" name="resumeNo" value="${param.resumeNo }">
                    <input type="hidden" name="userNo" value="${sessionScope.userNo}">
                    <input type="hidden" name="userId" value="${sessionScope.userId}">
             	    <div class="col-lg-12 colWarp">
             	    	<div class="labelWarp">
                        <label id="resume-colName" for="resumeTitle">이력서 제목<span>*</span></label>
                        </div>
                        <input type="text" id="resumeTitle" name="resumeTitle"
                        	placeholder="나를 잘 나타낼 수 있는 제목을 써주세요" value="${map['RESUME_TITLE']}">
                        <p>&nbsp;&nbsp;<i class="fa fa-lightbulb-o" aria-hidden="true">
                        	</i>&nbsp;기업에게 보여지는 이름입니다</p>
                    </div>
                    <div class="myWarp">
						<p>${map['USER_NAME']}</p>
						<p>${map['USER_EMAIL1']}@${map['USER_EMAIL2'] }</p>
						<p>${map['USER_HP1']}-${map['USER_HP2']}-${map['USER_HP3'] }</p>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                    	<label id="resume-colName" for="resumeSelfintro">자기 소개</label>
                    	</div>
                    	<textarea class="content" id="resumeSelfintro" name="resumeSelfintro"
                    	 placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)">${map['resumeSelfintro']}</textarea><br><br>
                    </div>
                    <div class="col-lg-12">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="carrer">경력</label>
                        </div>
                        <button type="button" class="resumeBt" id="carrerBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-carrerDiv">
                        	<c:if test="${!empty cList}">
                        		<c:set var="car" value="0"/>
								<c:forEach var="cVo" items="${cList}">
									<div id="addcarrer">
									<input type="text" id="carrerStartdate" value="${cVo.carrerStartdate}"
										name="CarrerVOList[${car }].carrerStartdate" placeholder="YYYY.MM">-
									<input type="text" id="carrerEnddate" value="${cVo.carrerEnddate}"
										name="CarrerVOList[${car }].carrerEnddate" placeholder="YYYY.MM">
									<input type="text" id="carrerCorp" value="${cVo.carrerCorp}"
										name="CarrerVOList[${car }].carrerCorp" placeholder="회사명">	
									<input type="text" id="carrerWork" value="${cVo.carrerWork}"
										name="CarrerVOList[${car }].carrerWork" placeholder="부서명/직책">
									<button class="btnRemove" value="Remove"><i class="fa fa-times" 
										aria-hidden="true"></i></button><br>
									<input type="hidden" id="carrerNo" value="${cVo.carrerNo}"
										name="CarrerVOList[${car }].carrerNo">
									</div>
								<c:set var="car" value="${car+1 }"/>
								</c:forEach>
							</c:if>
                        </div>
                    </div>
                    <div class="col-lg-12 colWarp2">
                    	<div class="labelWarp">
                 		<label id="resume-colName" for="resumeFinaleducation">학력</label>
                 		</div>
                        <input type="text" id="resumeFinaleducation" name="resumeFinaleducation"
                        	placeholder="학교/학과" value="${map['RESUME_FINALEDUCATION']}">
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="award">수상 및 기타</label>
                        </div>
                        <button type="button" class="resumeBt" id="awardBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button>
                        <div id="new-awardDiv">
	                        <c:if test="${!empty aList}">
		                        <c:set var="aw" value="0"/>
								<c:forEach var="aVo" items="${aList}">
								    <div id="addaward">
								    	<input type="text" id="awardAbout" value="${aVo.awardAbout }"
								    		name="AwardVOList[${aw }].awardAbout" placeholder="활동명">
								    	<input type="text" id="awardDate" value="${aVo.awardDate }"
								    		name="AwardVOList[${aw }].awardDate" placeholder="세부사항">
								    	<input type="hidden" id="awardNo" value="${aVo.awardNo }"
								    		name="AwardVOList[${aw }].awardNo">
								    	<button class="btnDel" value="btnDel"><i class="fa fa-times" 
								    		aria-hidden="true"></i></button><br>
								    </div>
								<c:set var="aw" value="${aw+1}"/>
								</c:forEach>
							</c:if>
                        </div>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="licencse">자격증</label>
                        </div>
                        <button type="button" class="resumeBt" id="licencseBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-licencseDiv">
                        	<c:if test="${!empty lcList}">
                        		<c:set var="lcen" value="0"/>
								<c:forEach var="lVo" items="${lcList}">
				                        <div id="addlicen">
				                        	<input type="text" id="licencseName" value="${lVo.licencseName }"
				                        		name="LicenVOList[${lcen}].licencseName" placeholder="자격증 이름">
				                        	<input type="text" id="licencseIssuerLace" value="${lVo.licencseIssueplace }"
				                        		name="LicenVOList[${lcen}].licencseIssueplace" placeholder="발행처">
				                        	<input type="hidden" id="licencseNo" value="${lVo.licencseNo }" 
				                        		name="LicenVOList[${lcen}].licencseNo">
				                        	<button class="btnDel" value="btnDel"><i class="fa fa-times" 
				                        		aria-hidden="true"></i></button>
				                        </div>
				                <c:set var="lcen" value="${lcen+1}"/>
				                </c:forEach>
							</c:if>
                        </div>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="foreign">외국어</label>
                        </div>
                        <button type="button" class="resumeBt" id="foreignBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-foreignDiv">
                        	<c:if test="${!empty fList}">
                        		<c:set var="fls" value="0"/>
								<c:forEach var="fVo" items="${fList}">
			                        <div id="addforeign">
			                        	<input type="text" id="foreignlanguageskillLang" value="${fVo.foreignlanguageskillLang }"
			                        		name="ForeignskillVO[${fls }].foreignlanguageskillLang" placeholder="언어">
			                        	<input type="text" id="foreignlanguageskillExpert" value="${fVo.foreignlanguageskillExpert }"
			                        		name="ForeignskillVO[${fls }].foreignlanguageskillExpert" placeholder="수준">
			                        	<input type="hidden" id="foreignlanguageskillNo" value="${fVo.foreignlanguageskillNo }"
			                        		name="ForeignskillVO[${fls }].foreignlanguageskillNo">
			                        	<button class="btnDel" value="btnDel"><i class="fa fa-times" 
			                        		aria-hidden="true"></i></button>
			                        </div>
			                    <c:set var="fls" value="${fls+1}"/>
				                </c:forEach>
							</c:if>
                        </div>
                    </div>
					<button class="site-btn register-btn" type="submit">수정 완료</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../inc/bottom.jsp"%>