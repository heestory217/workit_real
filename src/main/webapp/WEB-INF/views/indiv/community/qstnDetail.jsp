<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style type="text/css">
.divCmty {
	width: 1140px;
	margin: 0 auto;
	margin-bottom: 30px;
}

section {
	float: left;
	margin-left: 30px;
	margin-top: 40px;
}

.title {
	font-size: 22px;
}

.BoxWrap {
	border: solid 1px silver;
	padding: 30px 50px;
	width: 100%;
	height: auto;
	margin-bottom:20px;
}

.msgBx {
	margin: 80px 0 30px 0;
	text-align: center;
}

.btnBx {
	margin: 0 auto;
	text-align: center;
	background-color: #4c50bb;
	border: solid 1px #4c50bb;
	width: 140px;
	height: 53px;
	padding-top: 15px;
}

.btnWrite {
	color: white;
	text-decoration: none;
}

.btnWrite:hover {
	color: white;
}

.qstnDetailBox {
	width: 800px;
}

a {
	color: #4c50bb;
}

.fa-ellipsis-h{
	font-size:22px;
	color:silver;
	position: relative;
}

.editBox{
	float:right;
	margin:-6px 5px 0 0;
}

.editBtn{
	border:1px solid gray;
	position: absolute;
	width: 70px;
    height: 80px;
    background: white;
    padding:8px;
}

.editBtn>hr{
	margin:8px 0;
}
.editBtn>a{
	padding:9px;
}

.tit{
	overflow: hidden;
}

.tit>p {
	font-size: 25px;
	color: black;
	margin-top: 20px;
}

.cont p {
	margin: 30px 0px;
	font-size: 18px;
	color: black;
}

.cellBx {
	margin-bottom: 0px;
    color: gray;
    padding-top: 7px;
}
.cellBx div{
	display:inline-block;
}

.cellBx span {
	font-size:13px;
	float: left;
}

.cellBx .bookmark {
	float: right;
	font-size: 27px;
	padding-bottom: 10px;
	margin-right: 5px;
	display:block;
	cursor:pointer;
}


.cellBx .bmChecked {
	float: right;
	font-size: 27px;
	padding-bottom: 20px;
	margin-right: 5px;
	display:block;
	cursor:pointer;
	color:#4c50bb;
}

.cellBx  a{
	color:gray;
	font-size:14px;	
}

.cmtBox {
	clear: both;
	border: 1px solid silver;
	height: 190px;
	margin-bottom: 20px;
}

.cmtWriteBox textarea {
	width: 100%;
	height: 135px;
	resize: none;
	outline: 0;
	border: 0;
	border-bottom: 0.5px solid rgba(192, 192, 192, 0.4);
	padding: 20px;
}

.regiBtnWrap {
	float: right;
	margin: -1px;
	margin-right: 5px;
}

#regiBtn {
	border: 0;
	color: white;
	background-color: #4c50bb;
	width: 100px;
	height: 42px;
}

.letterNum {
	font-size: 13px;
	margin-right: 8px;
}

textarea::placeholder {
	color: silver;
}

.explain {
	border: 1px solid silver;
	font-size: 14px;
	padding: 10px;
	padding-top: 20px;
	background-color: #F6F6F6;
}

#cnt{
	color:#4c50bb;
}

/* 스크롤바 굵기 */
.cmtWriteArea::-webkit-scrollbar {
  width:8px;
}

.cmtWriteArea::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: silver;
}

.fa-quora{
	font-size: 30px;
  	margin-right: 10px;
	color:#4c50bb;
		
}

.workkind{
	margin: 0 0 18px 0;
    font-size: 13px;
    background-color: #c0c0c059;
    width: max-content;
}

.writer{
    font-size: 19px !important;
    font-weight: 600 !important;
    display: inline-block;
    float: left;
    padding-right: 10px;
    padding-bottom: 10px;
}

.bottomDiv{
	overflow: hidden;
}

</style>
<script type="text/javascript">
	$(function(){
		//textarea 글자수 체크
		$('.cmtWriteArea').keyup(function (e){
		    var content = $(this).val();
		    $('#cnt').html(content.length);

		    if (content.length > 1000){
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $('#cnt').html("1000");
		    }
		});
		
		/* 수정&삭제 아이콘 클릭시 수정, 삭제 버튼 보이도록 클릭 이벤트 */
		$('.editBtn').hide();
		$('.fa-ellipsis-h').click(function(){
			$('.editBtn').toggle();
		});
		
		//답변 등록하지 않고 등록버튼 누르는 경우 
	   $('form[name=comntFrm]').submit(function(){
		   if($('.cmtWriteArea').val().length<1){
			   alert('먼저 답변을 입력해주세요.');
			   event.preventDefault();
		   }
	   });
		   
	  
		$('#delBtn').click(function(){
			if(!confirm('삭제된 질문은 복구가 불가능합니다.\n글을 삭제하시겠습니까?')){
				event.preventDefault();
			}
		});
		
		$('.cmtWrite').click(function(){
			if($('input[name=userNo]').val()==""){
				alert('답변을 등록하려면 로그인이 필요합니다.\n로그인 페이지로 이동합니다.');
				event.preventDefault();
				location.href="<c:url value='/users/login.do'/>"
			}
		});
		
		
		$('.bookmark').click(function(){
			alert('내 프로필 > 북마크에 추가되었습니다.'); 
			location.href='<c:url value="/indiv/community/insertBookMark.do?qstnNo=${qstnMap['QUESTION_NO']}"/>';
		});
	});
	
	
</script>


<div class="divCmty">
	<!-- asdie : 사이드 메뉴바 -->
	<c:import url="/indiv/community/cmtyNavbar.do">
		<c:param name="userNo" value="${userNo}"></c:param>
		<c:param name="userId" value="${userId}"></c:param>
	</c:import>
	

	<section>
		<div id="container">
			<div class="qstnDetailBox">
				
				<!-- 질문 -->
				<article>
					<div class="BoxWrap">
						<div class="tit">
							<c:if test="${userNo eq qstnMap['USER_NO'] }">
							<!-- if 조건으로 로그인한 회원의 번호와 질문글의 회원번호가 같은 경우에만 보이도록 설정 -->
								<div class="editBox">
								<a>
									<i class="fa fa-ellipsis-h"></i>
								</a>
								<!-- 수정, 삭제  -->
									<div class="editBtn">
									<a href
					="<c:url value='/indiv/community/qstnEdit.do?qstnNo=${qstnMap["QUESTION_NO"]}'/>">수정</a>
									<hr>
									<a id="delBtn" href
					="<c:url value='/indiv/community/qstnDelete.do?qstnNo=${qstnMap["QUESTION_NO"] }'/>">삭제</a>
									</div>	
								</div>
							<!-- editBox 끝 -->
							</c:if>									
							<!-- 직무 -->
							<span class="workkind">
							<a href="<c:url value='/indiv/community/listByField.do?workkindNo=${qstnMap["WORKKIND_NO"] }'/>">
							#${qstnMap['WORKKIND_NAME']}
							</a></span>
							<!-- 질문 제목 -->
							<p>
								<i class="fa fa-quora"></i>${qstnMap['QUESTION_TITLE']}
							</p>
						</div>
						
						<!-- 질문 내용 -->
						<%
							pageContext.setAttribute("newLine", "\n");
						%>
						<c:set var="questionAbout" 
							value="${fn:replace(qstnMap['questionAbout'], newLine, '<br>') }" />
						<div class="cont">
							<p>${questionAbout }</p>
						</div>
						<div class="bottomDiv">
							<span class="writer">@ ${userId }</span>
							<div class="cellBx">
								<div 
								<c:if test="${sessionScope.userNo==qstnMap['USER_NO'] }">
									style="margin-bottom:10px;"
								</c:if>>
									<span class="cell">조회 ${qstnMap['QUESTION_VIEW'] }&nbsp;&nbsp;|</span>
									<span class="cell">&nbsp;&nbsp;${time }</span>
								</div>
								<c:if test="${sessionScope.userNo!=qstnMap['USER_NO'] }">
									<c:if test="${bmStatus==0 }">
										<a class="bookmark">
										<i class="fa fa-bookmark-o" aria-hidden="true"></i></a>
									</c:if>
									<c:if test="${bmStatus>0 }">
										<a class="bmChecked"
										href='<c:url value="/indiv/community/delBookMark.do?qstnNo=${qstnMap['QUESTION_NO']}"/>'>
										<i class="fa fa-bookmark" aria-hidden="true"></i></a>
									</c:if>
								</c:if>
							</div>
						</div>
						<c:if test="${sessionScope.userNo !=qstnMap['USER_NO'] }">
							<!-- 답변 등록 -->
							<div class="cmtBox">
								<div class="writeBoxWrap cmtWrite">
									<input type="hidden" name="userNo" value="${sessionScope.userNo }">
									<form name="comntFrm" method="post" 
									action="<c:url value='/indiv/community/cmtWrite.do?qstnNo=${param.qstnNo }'/>">
										<div class="cmtWriteBox">
											<textarea	name="commentrespondAbout" 
											class="cmtWriteArea" placeholder="솔직하고 따뜻한 답변을 남겨주세요."></textarea>
										</div>
										<div class="regiBtnWrap">
											<span class="letterNum"><b id="cnt">0</b> / 1,000</span>
											<button type="submit" id="regiBtn">등록</button>
										</div>
										<div style="clear: both;"></div>
									</form>
								</div>
							</div>
						
						</c:if>
					</div>
				</article>
				
				<!-- 답변 include -->
				<c:import url="/indiv/community/comments.do"/>
				<!-- 메시지박스 -->
				<div class="msgBox">
   					<span id="closeIcon">&times;</span>
					<div class="msgBxWrap">
						<h4 id="msgBxTit">답변 채택하기</h4>
						<hr>
						<div class="msg">
							<span>답변이 마음에 드셨나요?<br>
							답변을 주신 분께 감사 인사를 남겨주세요.<span> (최대 300자)</span>
							</span>
						</div>
						<form name="modalFrm" method="post"
							action="<c:url value='/indiv/community/adoptComment.do'/>">
							<input type="hidden" value="" name="commentrespondNo" id="comntNo">
							<input type="hidden" value="${qstnMap['QUESTION_NO'] }" name="questionNo" id="qstnNo">
							<textarea id="msgTextarea" name="messageContent"></textarea>
							<div style="overflow: hidden">
								<span class="letterCnt"><b id="count">0</b> / 300</span></div>
							<div class="msgBtnBx">
							<input type="submit" id="adopt" value="채택하기">
							<input type="button" id="close" value="닫기">
							</div>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div style="clear: both;"></div>
</div>
<script>
$(function(){
	$('.msgBox').hide();
	$('#closeIcon').click(function(){
		$('.msgBox').hide();
	});
	
	$('form[name=modalFrm]').submit(function(){
		var len = $('#msgTextarea').val().length;
		if(len<1){
			alert('답변 채택 메세지를 입력해주세요');
			event.preventDefault();
		}else if(len>300){
			alert('답변 채택 메세지는 300자 이내로 입력 가능합니다.');
			event.preventDefault();
		}
	});
	
	$('#msgTextarea').keyup(function (e){
	    var content = $(this).val();
	    $('#count').html(content.length);

	    if (content.length > 1000){
	        alert("최대 300자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 300));
	        $('#count').html("300");
	    }
	});
	
	$('#close').click(function(){
		if((confirm('답변을 채택하지 않고 나가시겠습니까?'))){
			$('.msgBox').hide();
		}
	});
});

function sendMsgFunc(commentsNo){
	$('.msgBox').show();
	$('form[name=modalFrm]').find('#comntNo').val(commentsNo);
}
</script>
<style>
	.msgBox{
	    border: 1.8px solid #b8baff;
	    border-radius: 10px;
	    width: 500px;
	    height: 385px;
	    position: absolute;
	    top: 33%;
	    left: 33%;
	    background: #f7f7f7;
	    overflow: hidden;
	}
	
	#closeIcon{
		float: right;
	    font-size: 25px;
	    padding: 10px 25px;
	    cursor:pointer;
	    color:#8e8e8e;
	}
	
	#msgBxTit{
		color:#4c50bb;
	}
	
	.msgBxWrap>hr{
	    background-color: #dadaff;
    	margin-bottom: 0px;
	}
	
	.msgBxWrap{
	    padding: 30px;
	    width: 100%;
	    height: 100%;
	}
	
	.divCmty{
		position:relative;
	}
	
	#msgTextarea{
	    border-radius: 7px;
	    overflow: auto;
	    resize: none;
	    width: 100%;
	    height: 100px;
	    background-color: #ffffff;
	    border: 1px solid #dadaff;
	}
	/* 스크롤바 굵기 */
	#msgTextarea::-webkit-scrollbar {
	  width:8px;
	}
	
	#msgTextarea::-webkit-scrollbar-thumb {
	  border-radius: 5px;
	  background-color: #dadaff;
	}
	
	.msgBtnBx{
		width:100%;
		height:50px;
		resize: none;
		outline:none;
		
	}
	
	.msgBtnBx > input{
		border-radius: 7px;
		width: 49%;
    	height: 100%;
    	background: white;
    	border: 1px solid #dadaff;
	}
	
	.msgBtnBx > input:hover{
		background:#4c50bb;
		color:white;
	}
	
	#close{
		width:50% !important;
	}
	
	.msg{
		padding:22px 0;
	}
	
	.msg > span{
		font-size:15px;
	}
	
	.msg>span>span{
		font-size: 14px;
	}
	
	.letterCnt > b{
		color:#4c50bb;
	}

	.letterCnt {
	    font-size: 13px;
	    margin-right: 8px;
	    margin-bottom: 10px;
	    display: inline-block;
	    float: right;
	}
	
</style>


<%@ include file="../../inc/bottom.jsp"%>