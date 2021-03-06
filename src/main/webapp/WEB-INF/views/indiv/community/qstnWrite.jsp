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
	
	.writeBoxWrap{
		border:1px solid silver;
		width:100%;
		height:500px;
		padding:10px;
	}
	
	.userNick{
		color:#4c50bb;
	}
	
	form[name=qstnWriteFrm]{
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
		width:120px;
		height:40px;
	}
	
	.btnCancel, .btnTempSave{
		background-color: white;
		color:gray;
		outline:0;
		border:0.5px solid silver;
		width:120px;
		height:40px;
	}
	
	.btnCommWrap{
		margin-top:20px;
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
		padding:20px 10px 20px 30px;
		background-color: #F6F6F6;	
	   	color: #6d6d6d;
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
		
		$('.btnQuestion').click(function(){
			if($('[name=workkindName]').val()=='직무 선택'){
				alert('질문과 관련된 직무를 선택해 주세요.');
				event.preventDefault();
			}else if($('.questionTitle').val().length<10){
				alert('질문 제목을 최소 10자 이상 작성해 주세요.');
				event.preventDefault();
			}else if($('.questionAbout').val().length<20){
				alert('질문 내용을 최소 20자 이상 작성해 주세요.');
				event.preventDefault();
			}			
		});
		
		$('.btnCancel').submit(function(){
			if(confirm("[취소]를 누르면 글이 저장되지 않습니다.\n글을 저장하지 않고 나가시겠습니까?")){
				location.href="<c:url value='/indiv/community/myQstn.do'/>";
			}
			
		});
		
		
		//임시저장
		$('.btnTempSave').click(function(){
			if(!confirm('질문을 임시저장 하시겠습니까?')){
				return false;
			}
		});

		
		//textarea 글자수 체크
		$('.questionAbout').keyup(function (e){
		    var content = $(this).val();
		    $('#count').html(content.length);    //글자수 실시간 카운팅

		    if (content.length > 1000){
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $('#count').html("1000");
		    }
		});
		
		//직무선택 클릭 => 직무선택창 띄우기
	    $('.pop-up').hide();
		$('.jobWrap').click(function(){
		    $('.pop-up').show();
		});
	
		//직무선택창 닫기 버튼 클릭시 창 숨기기
		$('.closeBtn').click(function(){
		    $('.pop-up').hide();
		});
		
		//직무선택 selectBox클릭 => 직무선택란에 선택한 직무 입력시키기
		$('.selectBox').change(function(){
			var selectJob = $(this).find('option:selected').html();
			var selectJobVal = $(this).find('option:selected').val();
			$('.jobBtn').val(selectJob);
			$('.jobNum').val(selectJobVal);
			$('.jobWrap').css('border','1px solid #4c50bb');
			$('.jobBtn').css('color','#4c50bb');
			$('.fa-angle-down').css('color','#4c50bb');
			$('.pop-up').hide();
		});
		
		$('.userJob a').click(function(){
			var userJob=$(this).text();
			var userJobNum=$(this).find('input').val();
			$('.jobBtn').val(userJob);
			$('.jobNum').val(userJobNum);
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
			<div id="content" class="QuestRegister">
				<div class="top-title-wrap">
					<p class="title"><span class="userNick">${userId}</span>님 어떤 질문을 하시겠어요?</p>
			</div>

				<!-- 직무, 기업선택 -->
				<form name="qstnWriteFrm" id="writeFrm" method="post">
				<input type="hidden" name="userNo" value="${sessionScope.userNo}">
					<article>
						<div class="checkListArea">
							<div class="checkboxCommWrap row">
								<!-- 버튼 -->
								<div class="selectJob">
									<div class="jobWrap">
										<input type="button" name="workkindName" 
										class="jobBtn" value="직무 선택"> 
										<input type="hidden" name="workkindNo" 
										class="jobNum"> 
										<i class="fa fa-angle-down"></i>
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
												<option value="1">서버 개발자</option>
												<option value="2">웹 개발자</option>
												<option value="3">프론트엔드 개발자</option>
												<option value="4">자바 개발자</option>
												<option value="5">안드로이드 개발자</option>
												<option value="6">IOS 개발자</option>
												<option value="7">빅데이터 엔지니어</option>
												<option value="8">파이썬 개발자</option>
												<option value="9">소프트웨어 엔지니어</option>
												<option value="10">유니티 개발자</option>
												<option value="11">Node.js 개발자</option>
												<option value="12">머신러닝 엔지니어</option>
												<option value="13">C,C++ 개발자</option>
												<option value="14">VR 엔지니어</option>
											</select> 
											<c:if test="${!empty workkindVo }">
												<span>나의 직무</span><br>
												<div class="userJob">
													<a href="#"><i class="fa fa-search"></i>&nbsp;${workkindVo.workkindName }
													<input type="hidden" name="workkindNo" value="${workkindVo.workkindNo }"></a>	
												</div>
											</c:if>
										</div>
									</div>
									<!-- 레이어 팝업창 끝 -->
								</div>
							</div>
						</div>
					</article>

					<!-- 질문글 쓰기 -->

					<article id="secArticle">
						<div class="writeBoxWrap">
							<fieldset>
								<div class="qstnTitleDiv">
									<p class="qstnTitle">
										<input type="text" class="questionTitle" name="questionTitle"
											placeholder="질문 제목을 입력해주세요.">
									</p>
									<hr style="margin-top: 0">
								</div>

								<!-- &#13;&#10; - placeholder 내에서 줄바꿈 시 이용 -->

								<div class="qstnContDiv">
									<textarea class="questionAbout" title="내용 입력" name="questionAbout"
										placeholder="구체적인 내용을 입력해주세요.&#13;&#10;*휴대폰 번호, 메일 주소, 카카오톡 ID 등 개인정보가 포함된 내용은 비노출 처리될 수 있습니다"></textarea>
									<span class="byte"> <b id="count">0</b> / 1,000</span>
								</div>

								<div class="btnCommWrap">
									<button type="submit" class="btnQuestion devQnaWriteButton"
									formaction="<c:url value='/indiv/community/qstnWrite.do'/>"
									>질문하기</button>
									<button type="submit" 
										class="btnTempSave bg_white devQnaWriteCancelButton"
										formaction="<c:url value='/indiv/community/tempQstn.do'/>"
									>임시저장</button>
									<button type="button" 
										class="btnCancel bg_white devQnaWriteCancelButton">취소</button>
								</div>
							</fieldset>
						</div>
					</article>
				</form>

				<!-- 글 등록 설명 -->
				<article>
					<div class="explain">
                    <ul class="txInfoWrap">
						<li>정확한 답변을 위해 질문자의 아이디를 포함한 기본 정보가 제공됩니다.</li>
						<li>개인정보를 공유 및 요청하거나, 명예 훼손, 무단 광고, 불법 정보 유포 시 이에 대한 민형사상 책임은 작성자에게 있습니다.</li>
						<li>인기 질문으로 추천될 수 있습니다.</li>
                    </ul>
					</div>				
				</article>
			</div>
		</div>
	</section>
	<div style="clear:both;"></div>

</div>	
</body>
</html>
<%@ include file="../../inc/bottom.jsp" %>
