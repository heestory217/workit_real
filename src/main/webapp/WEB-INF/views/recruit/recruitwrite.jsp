<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#endDate').datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeYear : true,
					changeMonth : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',	'8월', '9월', '10월', '11월', '12월' ]
				});
		
			//$('.infobox').each(function(idx, item){

			//});
		$('#recruitask').click(function(){
			if($("#recruitannounceTitle").val().length<1){
				$("#finalcheck").text("제목을 입력해주세요");
				return false;
			}else if($("#endDate").val().length<1){
				$("#finalcheck").text("마감날짜를 입력해 주세요");
				return false;
			}else if($("#recruitannounceSworkkind").val().length<1 || $("#recruitannounceScarrer").val().length<1 || 
					$("#recruitannounceSpay").val().length<1 || $("#recruitannounceSkill").val().length<1){
				$("#finalcheck").text("필수사항을 입력해주세요");
				return false;
			}else{
				$("#finalcheck").text("");
			}
		});
	});
</script>
<style>
	select {
	    width: 100%;
	    height: 44px;
	    border: 2px solid #ebebeb;
	    padding: 10px;
	    display :block;
	}
</style>

	<div class="register-login-section spad">
        <div class="container">
          <form class="checkout-form" action="<c:url value='/recruit/recruitwrite.do'/>" method="POST">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                	<div class="section-title">
                        <h2>채용 공고 등록</h2>
                    </div>
                    <div class="row">
                            <div class="col-lg-12">
                                <label>제목 <span class="red">*</span></label>
                                <input type="text" id="recruitannounceTitle" name="recruitannounceTitle" placeholder="예시)WORKIT에서 중견 웹프로그래머를 모집합니다">
                            </div>
                            
                            <div class="col-lg-12" style="margin-bottom: 30px;">
                            <label>요구 직무 <span class="red">*</span></label>
                               <select id="workkindNo" name="workkindNo">
                                   <option value=1>서버개발자</option>
                                   <option value=2>웹 개발자</option>
                                   <option value=3>프론트엔드 개발자</option>
                                   <option value=4>자바개발자</option>
                                   <option value=5>안드로이드개발자</option>
                                   <option value=6>IOS 개발자</option>
                                   <option value=7>빅데이터 엔지니어</option>
                                   <option value=8>파이썬 개발자</option>
                                   <option value=9>소프트웨어 엔지니어</option>
                                   <option value=10>유니티 개발자</option>
                                   <option value=11>Node.js 개발자</option>
                                   <option value=12>머신러닝 엔지니어</option>
                                   <option value=13>C,C++ 개발자</option>
                                   <option value=14>VR 엔지니어</option>
                               </select>
                            </div>
                            
                            <div class="col-lg-6">
                              	<label>필수 요구 언어<span class="red">*</span></label>
                               	<select id="languageNo" name="languageNo">
                               	<c:forEach items="${language}" var="langs">
                               		<option value="${langs.languageNo}">${langs. languageName}</option>
                               	</c:forEach>
                              	</select>
                            </div>

                            <div class="col-lg-6">
                                <label>그 외 요구 언어</label>
                                <input type="text" id="recruitannounceSkill" name="recruitannounceSkill" placeholder="예시) JAVA, PYTHON">
                            </div>
                            
                            <div class="col-lg-6">
	                            <label for="pass">모집 종료일 <span class="red">*</span></label>
	                            <input type="text" id="endDate" name="endDate">
                            </div>
                            
                            <div class="col-lg-6">
                                <label for="pass">고용 형태<span class="red">*</span></label>
                                <input type="text" id="recruitannounceSworkkind" name="recruitannounceSworkkind" placeholder="예시) 비정규직, 3개월 수습이후 정규직전환">
                            </div>
	                            
                            <div class="col-lg-12">
                                <label for="pass">연봉<span class="red">*</span></label>
                                <input type="text" id="recruitannounceSpay" name="recruitannounceSpay" placeholder="예시)3500">
                            </div>
                            
                            <div class="col-lg-12">
                                <label for="pass">우대사항</label>
                                <input type="text" id="recruitannounceUpcheckcarrer" name="recruitannounceUpcheckcarrer" placeholder="예시)4년제 대학 졸업자, 외국어가능">
                            </div>
                            
							<div class="col-lg-6" style="margin-bottom: 30px;" >
                                    <label for="pass">요구 근무지</label>
                                    <select class="col-lg-7 mystyle" id="arealistNo" name="arealistNo">
                                        <c:forEach items="${arealist}" var="ho">
	                                    	<option value="${ho.areaNo}">${ho.areaAdd1}, ${ho.areaAdd2}</option>
	                                    </c:forEach>
                                    </select>
                            </div>
                            
                            <div class="col-lg-6">
                                <label for="pass">요구 경력 <span class="red">*</span></label>
                                <select class="col-lg-5 mystyle" id="recruitannounceWantedcarrer" name="recruitannounceWantedcarrer">
		                           				<option value=0>신입</option>
		                              			<option value=1>1년차</option>
		                         		        <option value=2>2년차</option>
		                                        <option value=3>3년차</option>
		                                        <option value=4>4년차</option>
		                                        <option value=5>5년차</option>
		                                        <option value=6>6년차</option>
		                                        <option value=7>7년차</option>
		                                        <option value=8>8년차</option>
		                                        <option value=9>9년차</option>
		                                        <option value=10>10년이상</option>
	                            </select>
                            </div>
                            
                            <div class="col-lg-12">
                                <label for="pass">채용절차</label>
                                <input type="text" id="recruitannounceHirestep" name="recruitannounceHirestep">
                            </div>
                            
                            <div class="col-lg-12">
		                    	<label for="corpIntro">상세 요강<span class="red">*</span></label>
		                    	<textarea id="recruitannounceWorkkind" name="recruitannounceWorkkind"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('recruitannounceWorkkind',	{height : 200});
								</script>
                   			</div>
                   			
                            <div class="col-lg-12">
		                    	<label for="corpIntro">주요업무</label>
		                    	<textarea id="recruitannounceWork" name="recruitannounceWork"></textarea><br><br>
								<script type="text/javascript">
									CKEDITOR.replace('recruitannounceWork',	{height : 200});
								</script>
                   			</div>

                            <input type="hidden" id="userNo" name="userNo" value="${sessionScope.userNo}">
                            <span class="call" id="finalcheck" name="finalcheck" style="cursor:hand;color:red"></span>
                            <button type="submit" class="site-btn register-btn" id='recruitask' name='recruitask'>공고등록 요청</button>
                    	</div>
                    </div>
                </div>
		     </form>
            </div>
        </div>


<%@ include file="../inc/bottom.jsp" %>