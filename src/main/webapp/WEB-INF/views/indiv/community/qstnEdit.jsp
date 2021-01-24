<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.divCmty{
		width: 1140px;
		margin:0 auto;
		margin-bottom:30px;
	}
	
	section{
		float:left; 
		margin-left:30px;
		margin-top:40px;
	}
	
	.title{
		font-size: 22px;
		padding:0 7px; 
	}
	
	#content{
		width:800px;
	}
	
	.EditBoxWrap{
		border:1px solid silver;
		width:100%;
		height:500px;
		padding:10px;
	}
	
	.userNick{
		color:#4c50bb;
	}
	
	form[name=qstnEditFrm]{
	    padding: 5px;
	}
	
	.questionTitle{
		width:100%;
		padding:10px;
		height:50px;
		border:none;
		font-size:24px;
		/* 
		테두리 안보이게 설정하기
		border-right:0px; 
		border-top:0px; 
		boder-left:0px; 
		boder-bottom:0px;
		 */

	}
	
	.questionTitle:focus, .questionAbout:focus{
		outline: none;
	}
	
	.qstnContDiv{
		color:gray;
		font-size: 14px;
		padding-left:12px;
	}
	
	.questionAbout{
		font-size:17px;
		width:100%;
		padding:0;
		border:none;
		height:260px;
		/* overflow-y: scroll; */
		resize: none;	/* textarea 크기 고정 */
		/* 
		스크롤바 숨기기
		overflow:hidden; 
		*/
	}
	
	.btnQuestion{
		background-color: #4c50bb;
		color:white;
		/* 테두리 없애기 */
		outline:0;
		border:0;
		width:140px;
		height:50px;
	}
	
	.btnCancel{
		background-color: white;
		color:gray;
		outline:0;
		border:0.5px solid silver;
		width:140px;
		height:50px;
	}
	
	.btnCommWrap{
		text-align:center;
	}
	
	.byte{
		display:block;
		text-align: right;
		margin-right: 15px;
	}
	
	.explain{
		border:1px solid silver;
		font-size: 14px;	
		padding:10px;
		padding-top:20px;
		background-color: #F6F6F6;	
	}
	
	article{
		margin-bottom: 30px;
	}
	
	b{
		color:#4c50bb;
	}
	
	.checkListArea{
		border:1px solid silver;
	}
	
	.checkboxCommWrap{
		margin: 10px;
		list-style-type: none;
		height:90px;
		padding:10px;
	}
	
	#jobBtn, #corpBtn{
		width:210px;
   	    height:35px;
   	    background-color: white;
 	   	background-color: white;
    	border: 1px solid #bcbcbc;
	}
	
	#jobBtn:focus, #corpBtn:focus{
    	border: 1px solid #4c50bb;
    	outline:0;
	}
	
	input[type=checkbox]{
		width: 20px;
		height: 20px;
		border: 2px solid #bcbcbc;
		cursor: pointer;
	}
	
	
	input[type=checkbox]:checked{
		background-color: #4c50bb;
	}
	
	/* 스크롤바 굵기 */
	.questionAbout::-webkit-scrollbar {
	  width:8px;
	}
	
	.questionAbout::-webkit-scrollbar-thumb {
	  border-radius: 5px;
	  background-color: silver;
	}

	/* 버튼 클릭 시 레이어 팝업 창 띄우기 */
	.jobBtn {
	    float:left;
		background: white;
		outline: 0;
		border: 0;
	}
	
	.jobWrap{
		padding:8px;
	    width: 200px;
	    height: 40px;
		background: white;
	    border: 1px solid silver;
	    position: relative;
	    overflow: hidden;
	    color:gray;
	}
	
	.fa-angle-down{
		padding-top:3px;
		float:right;
	}
	
	.pop-up{
	    width: 300px;
	    height: 230px;
	    position: absolute;
	    background: white;
	    border: 1px solid gray;
	    margin: -30px 0;
	    padding: 0 20px;
	}
	
	.popUpHead { 
	  width: 100%;
	  height: 60px;
	  padding: 12px 0;
	  overflow:hidden;
	  background:white;
	}
	
	.popUpTit{
		padding: 11px 3px;
	    float: left;
	    font-size: 20px;
	    font-weight: 500;
	}
	
	.closeBtn{
	  font-size:28px;
	  display:block;
	  float:right;
	}
	
	.closeBtn > i{
	  color: silver;
	}
	
	.selectJob > p{
		font-size:14px;
		color:gray;
		margin:10px;
		clear:both;
	}
	
	.selectBox{
	    width: 250px;
	    height: 40px;
	    margin: 24px 0;
	    border: 1px solid gray;
	    color: gray;
	    padding:0 15px;
	}

	.userJob{
		margin-top:10px;
	}
	
	.userJob>a{
		color:gray;
	}
	
	select{
		cursor: pointer;
	}
</style>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		var job = $('.selectBox').find('option:selected').html();
		$('.jobBtn').val(job);
		$('.jobWrap').css('border','1px solid #4c50bb');
		$('.jobWrap').find('input, i').css('color','#4c50bb');
		$('.selectBox').find('option').eq(0).attr('selected',true);
		
		$('form[name=qstnEditFrm]').submit(function(){
			if($('.questionTitle').val().length<10){
				alert('질문 제목을 최소 10자 이상 작성해 주세요.');
				event.preventDefault();
			}else if($('.questionAbout').val().length<20){
				alert('질문 내용을 최소 20자 이상 작성해 주세요.');
				event.preventDefault();
			}			
		});
		
		$('.btnCancel').click(function(){
			if(confirm("[취소]를 누르면 글이 수정되지 않습니다.\n글을 수정하지 않고 나가시겠습니까?")){
				location.href="<c:url value='/indiv/community/myQstn.do'/>"
			}
			
		});
		
		//textarea 글자수 체크
	    $('#count').html($('.questionAbout').val().length);
		
		$('.questionAbout').keyup(function (e){
	    var content = $(this).val();
	    $('#count').html(content.length);    //글자수 실시간 카운팅
		    if (content.length > 1000){
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $('#count').html("1000");
		    }
		});
		
	    $('.pop-up').hide();
		$('.jobWrap').click(function(){
		    $('.pop-up').show();
		});
	
		$('.closeBtn').click(function(){
		    $('.pop-up').hide();
		});
		
		//
		
		
		$('.selectBox').change(function(){
			var selectJob = $(this).find('option:selected').html();
			$('.jobBtn').val(selectJob);
			$('.jobWrap').css('border','1px solid #4c50bb');
			$('.jobBtn').css('color','#4c50bb');
			$('.fa-angle-down').css('color','#4c50bb');
			$('.pop-up').hide();
		});
		
		$('.userJob a').click(function(){
			var userJob=$(this).text();
			$('.jobBtn').val(userJob);
			$('.jobWrap').css('border','1px solid #4c50bb');
			$('.jobBtn').css('color','#4c50bb');
			$('.fa-angle-down').css('color','#4c50bb');
			$('.pop-up').hide();
		});
	});
	
</script>
</head>
<body>
<div class="divCmty">		
	<!-- asdie : 사이드 메뉴바 -->
	<c:import url="/indiv/community/cmtyNavbar.do">
		<c:param name="userNo" value="${userNo}"></c:param>
		<c:param name="userId" value="${userId}"></c:param>
	</c:import>	
	
	<!-- 질문 등록 -->
	<section style="float:left; margin-left:30px;">
		<div id="container">
			<div id="content" class="QuestEdit">
				<div class="top-title-wrap">
					<p class="title"><span class="userNick">${userId}</span>님 어떤 질문을 하시겠어요?</p>
			</div>

				<!-- 직무, 기업선택 -->
				<form name="qstnEditFrm" method="post" 
					action="<c:url value='/indiv/community/qstnEdit.do'/>">
					<input type="text" name="questionNo" value="${qstnVo.questionNo }">
					<input type="text" name="userNo" value="${qstnVo.userNo }">
					<article>
						<div class="checkListArea">
							<div class="checkboxCommWrap row">
								<!-- 버튼 -->
								<div class="selectJob">
									<div class="jobWrap">
										<input type="button" name="workkindNo" 
										class="jobBtn" value="${qstnVo.workkindNo}"> <i
											class="fa fa-angle-down"></i>
									</div>
									<p>· 원하는 직무를 검색해 질문할 수 있습니다.</p>
									<!-- 레이어 팝업창 -->
									<div class="popUp-wrapper">
										<div class="pop-up">
											<div class="popUpHead">
												<span class="popUpTit">직무 선택</span> <a class="closeBtn"><i
													class="fa fa-times"></i> </a>
											</div>
											<select class="selectBox" name="workkindNo">
												<option>전체</option>
												<option value="1" 
													<c:if test="${qstnVo.workkindNo=='1' }">
														selected="selected"
													</c:if>
												>서버 개발자</option>
												<option value="2"
													<c:if test="${qstnVo.workkindNo=='2' }">
														selected="selected"
													</c:if>
												>웹 개발자</option>
												<option value="3"
													<c:if test="${qstnVo.workkindNo=='3' }">
														selected="selected"
													</c:if>
												>프론트엔드 개발자</option>
												<option value="4"
													<c:if test="${qstnVo.workkindNo=='4' }">
														selected="selected"
													</c:if>
												>자바 개발자</option>
												<option value="5"
													<c:if test="${qstnVo.workkindNo=='5' }">
														selected="selected"
													</c:if>
												>안드로이드 개발자</option>
												<option value="6"
													<c:if test="${qstnVo.workkindNo=='6' }">
														selected="selected"
													</c:if>
												>IOS 개발자</option>
												<option value="7"
													<c:if test="${qstnVo.workkindNo=='7' }">
														selected="selected"
													</c:if>
												>빅데이터 엔지니어</option>
												<option value="8"
													<c:if test="${qstnVo.workkindNo=='8' }">
														selected="selected"
													</c:if>
												>파이썬 개발자</option>
												<option value="9"
													<c:if test="${qstnVo.workkindNo=='9' }">
														selected="selected"
													</c:if>
												>소프트웨어 엔지니어</option>
												<option value="10"
													<c:if test="${qstnVo.workkindNo=='10' }">
														selected="selected"
													</c:if>
												>유니티 개발자</option>
												<option value="11"
													<c:if test="${qstnVo.workkindNo=='11' }">
														selected="selected"
													</c:if>
												>Node.js 개발자</option>
												<option value="12"
													<c:if test="${qstnVo.workkindNo=='12' }">
														selected="selected"
													</c:if>
												>머신러닝 엔지니어</option>
												<option value="13"
													<c:if test="${qstnVo.workkindNo=='13' }">
														selected="selected"
													</c:if>
												>C,C++ 개발자</option>
												<option value="14"
													<c:if test="${qstnVo.workkindNo=='14' }">
														selected="selected"
													</c:if>
												>VR 엔지니어</option>
											</select> <span>나의 직무</span><br>
											<div class="userJob">
												<a href="#"><i class="fa fa-search"></i>&nbsp;서버개발자</a>
											</div>
										</div>
									</div>
									<!-- 레이어 팝업창 끝 -->
								</div>
							</div>
						</div>
					</article>

					<!-- 질문글 수정 -->	
					<article id="secArticle">
						<div class="EditBoxWrap">
							<fieldset>
								<div class="qstnTitleDiv">
									<p class="qstnTitle">
										<input type="text" class="questionTitle" name="questionTitle"
											placeholder="질문 제목을 입력해주세요."
											value="${qstnVo.questionTitle }">
									</p>
									<hr style="margin-top: 0">
								</div>

								<!-- &#13;&#10; - placeholder 내에서 줄바꿈 시 이용 -->

								<div class="qstnContDiv">
									<textarea placeholder="구체적인 내용을 입력해주세요.&#13;&#10;*휴대폰 번호, 메일 주소, 카카오톡 ID 등 개인정보가 포함된 내용은 비노출 처리될 수 있습니다" 
									class="questionAbout" title="내용 입력" name="questionAbout">${qstnVo.questionAbout }</textarea>
									<span class="byte"> <b id="count">0</b> / 1,000</span>
								</div>

								<div class="btnCommWrap">
									<button type="submit" class="btnQuestion devQnaEditButton">수정하기</button>
									<button type="button"
										class="btnCancel bg_white devQnaEditCancelButton">취소</button>
								</div>
							</fieldset>
						</div>
					</article>
				</form>

				<!-- 글 등록 설명 -->
				<article>
					<div class="explain">
                    <ul class="txInfoWrap">
                    </ul>
					</div>				
				</article>
			</div>
		</div>
	</section>
	<div style="clear:both;height:400px;"></div>

</div>	
</body>
</html>
<%@ include file="../../inc/bottom.jsp" %>
