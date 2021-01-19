<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.tit>p {
	font-size: 25px;
	color: black;
	margin-top: 20px;
}

.qnaSpB {
	font-size: 40px;
	color: #4c50bb;
	margin-right: 15px;
}

.cont>p {
	margin: 30px 0px;
	font-size: 18px;
	color: black;
}

.cellBx {
	margin-bottom: 0px;
}

.cellBx>span {
	font-size:14px;
	float: left;
}

.cellBx>.bookmark {
	float: right;
	font-size: 30px;
	padding-bottom: 20px;
	margin-right: 5px;
}

.cellBx {
	color: gray;
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
	});

</script>

<title>커뮤니티게시판</title>
</head>
<body>
	<div class="divCmty">
		<!-- asdie : 사이드 메뉴바 -->
		<%@ include file="cmtyNavbar.jsp"%>
		
		
				
		<section>
			<div id="container">
				<div class="qstnDetailBox">
				
					<!-- 질문 -->
					<article>
						<div class="BoxWrap">
							<div class="tit">
								<p>
									<i class="icoQ_on qnaSpB">Q</i>고등학교 졸업 예정자 입니다. 질문드립니다.
								</p>
							</div>
							<div class="cont">
								<p>
									제가 고등학교 졸업예정자인데 여기 회사가 군면제되는거죠? 그리고 혹시 기숙사 있는지 알 수 있을까요?<br />
								</p>
							</div>
							<div class="cellBx">
								<span class="cell">조회 13&nbsp;&nbsp;|</span><span class="cell">&nbsp;&nbsp;23분
									전 작성</span>
								<div class="bookmark">
									<i class="fa fa-bookmark-o" aria-hidden="true"></i>
								</div>
							</div>
							<div class="cmtBox">
								<div class="writeBoxWrap cmtWrite">
									<form action="/User/Qstn/AnswerWriteIns" method="post"
										oncopy="return false" oncut="return false"
										onpaste="return false">
										<div class="cmtWriteBox">
											<textarea class="cmtWriteArea" placeholder="솔직하고 따뜻한 답변을 남겨주세요."></textarea>
										</div>
										<div class="regiBtnWrap">
											<span class="letterNum"><b id="cnt">0</b> / 1,000</span>
											<button type="button" id="regiBtn">등록</button>
										</div>
										<div style="clear: both;"></div>
									</form>
								</div>
							</div>
							<div class="explain">
								<ul class="txInfoWrap">
								</ul>
							</div>
						</div>
					</article>
					
					<!-- 답변 -->
					<article>
						<%@ include file="comments.jsp" %>
					</article>
				</div>
			</div>
		</section>
		<div style="clear: both;"></div>
	</div>

</body>
</html>


<%@ include file="../../inc/bottom.jsp"%>