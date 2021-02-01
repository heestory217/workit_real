<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(function() {
		var count=0;
			
			//커리어
			$('#carrerBt').click(function() {
				var carrerInput1 =""; 
carrerInput1 +='<div id="addcarrer"><input type="text" id="carrerStartdate" name="carrerStartdate" placeholder="YYYY.MM"> ~';
carrerInput1 +='<input type="text" id="carrerEnddate" name="carrerEnddate" placeholder="YYYY.MM">';
carrerInput1 +='<input type="text" id="carrerCorp" name="carrerCorp" placeholder="회사명">';
carrerInput1 +='<input type="text" id="carrerWork" name="carrerWork" placeholder="부서명/직책">';
carrerInput1 +='<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';
	   	
				$('#new-carrerDiv').append(carrerInput1);
				
			});//carrerBt
			
			$('#new-carrerDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
		    });
			
			//수상
	   		$('#awardBt').click(function(){
	   			var awardInput = "";
awardInput += '<div id="addaward"><input type="text" id="awardDate" name="AwardVOList['+count+'].awardDate" placeholder="활동명">';	   			
// awardInput += '<input type="text" name="count" value="'+count+'">';	   			
awardInput += '<input type="text" id="awardAbout" name="AwardVOList['+count+'].awardAbout" placeholder="세부사항">';	   			
awardInput += '<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';	   			
	   		
				$('#new-awardDiv').append(awardInput);

				count++;
				
	   		});//awardBt
	   		
	   		$('#new-awardDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
		    });
	   		
	   		//자격증
	   		$('#licencseBt').click(function(){
	   			var licenInput = "";
licenInput+='<div id="addlicen"><input type="text" id="licencseName" name="licencseName" placeholder="자격증 이름">';
licenInput+='<input type="text" id="licencseIssuerLace" name="licencseIssuerLace" placeholder="발행처">';
licenInput+='<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';	   			
	   			
				$('#new-licencseDiv').append(licenInput);
				
	   		});
	   		
	   		$('#new-licencseDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
		    });
	   		
	   		//외국어
	   		$('#foreignBt').click(function(){
	   			var i =0;
	   			var foreignInput = "";
	   			
foreignInput+='<div id="addforeign"><input type="text" id="foreignlanguageskillLang" name="foreignlanguageskillLang" placeholder="언어">';
foreignInput+='<input type="text" id="foreignlanguageskillExpert" name="foreignlanguageskillExpert" placeholder="수준">';
foreignInput+='<button class="btnRemove" value="Remove"><i class="fa fa-times" aria-hidden="true"></i></button><br></div>';	   			
	   			
				$('#new-foreignDiv').append(foreignInput);
	   		});
	   		
	   		$('#new-foreignDiv').on('click','.btnRemove', function(){
				$(this).parent().remove();
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
}
#awardAbout, #licencseIssuerLace,
#foreignlanguageskillExpert{
    width: 580px;
    margin: 0 20px;
}

.myWarp {
    width: 100%;
    margin: 14px;
    padding: 25px 0 40px 0;
    border-top: 1px solid #ddd;
}
button.btnRemove {
    background: #fff;
    border: none;
    color: #4C50BB;
}
</style>
<div class="container">
    <form class="checkout-form" method="POST" name="resumefrm"
    		action="<c:url value='/resumes/resumeWrite.do'/>">
        <div class="row">
            <div class="col-lg-10 offset-lg-1">
   				<div class="section-title">
					<h2>이력서 등록</h2>
				</div>
                <div class="row">
                    <input type="hidden" name="userNo" value="${sessionScope.userNo}">
             	    <div class="col-lg-12 colWarp">
             	    	<div class="labelWarp">
                        <label id="resume-colName" for="resumeTitle">이력서 제목<span>*</span></label>
                        </div>
                        <input type="text" id="resumeTitle" name="resumeTitle"
                        	placeholder="나를 잘 나타낼 수 있는 제목을 써주세요">
                        <p>&nbsp;&nbsp;<i class="fa fa-lightbulb-o" aria-hidden="true">
                        	</i>&nbsp;기업에게 보여지는 이름입니다</p>
                    </div>
                    <div class="myWarp">
						<p>이름</p>
						<p>이메일 주소</p>
						<p>전화번호</p>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                    	<label id="resume-colName" for="resumeSelfintro">자기 소개</label>
                    	</div>
                    	<textarea class="content" id="resumeSelfintro" name="resumeSelfintro"
                    	 placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)"></textarea><br><br>
                    </div>
                    <div class="col-lg-12">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="carrer">경력</label>
                        </div>
                        <button type="button" class="resumeBt" id="carrerBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-carrerDiv"></div>
                    </div>
                    <div class="col-lg-12 colWarp2">
                    	<div class="labelWarp">
                 		<label id="resume-colName" for="corpIndustry">학력</label>
                 		</div>
                        <input type="text" id="corpIndustry" name="corpIndustry"
                        	placeholder="학교/학과">
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="award">수상 및 기타</label>
                        </div>
                        <input type="hidden" name="resumeNo" value="1">
                        <button type="button" class="resumeBt" id="awardBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-awardDiv"></div>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="licencse">자격증</label>
                        </div>
                        <button type="button" class="resumeBt" id="licencseBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-licencseDiv"></div>
                    </div>
                    <div class="col-lg-12 colWarp">
                    	<div class="labelWarp">
                        <label id="resume-colName" for="foreign">외국어</label>
                        </div>
                        <button type="button" class="resumeBt" id="foreignBt">
                        	<i class="fa fa-plus" aria-hidden="true"></i>
                        	추가
                        </button><br><br>
                        <div id="new-foreignDiv"></div>
                    </div>
					<button class="site-btn register-btn " type="submit">작성 완료</button>
                </div>
            </div>
        </div>
    </form>
</div>

<%@ include file="../inc/bottom.jsp"%>