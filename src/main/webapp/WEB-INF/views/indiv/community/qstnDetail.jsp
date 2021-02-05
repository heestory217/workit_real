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
}
.cellBx div{
	display:inline-block;
}

.cellBx span {
	font-size:14px;
	float: left;
}

.cellBx .bookmark {
	float: right;
	font-size: 27px;
	padding-bottom: 20px;
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
			location.href=href='<c:url value="/indiv/community/insertBookMark.do?qstnNo=${qstnVo.questionNo}"/>';
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
							<c:if test="${userNo eq qstnVo.userNo }">
							<!-- if 조건으로 로그인한 회원의 번호와 질문글의 회원번호가 같은 경우에만 보이도록 설정 -->
								<div class="editBox">
								<a>
									<i class="fa fa-ellipsis-h"></i>
								</a>
								<!-- 수정, 삭제  -->
									<div class="editBtn">
									<a href
					="<c:url value='/indiv/community/qstnEdit.do?qstnNo=${qstnVo.questionNo }'/>">수정</a>
									<hr>
									<a id="delBtn" href
					="<c:url value='/indiv/community/qstnDelete.do?qstnNo=${qstnVo.questionNo }'/>">삭제</a>
									</div>	
								</div>
							<!-- editBox 끝 -->
							</c:if>									
							<!-- 직무 -->
							<!-- 질문 제목 -->
							<p>
								<i class="fa fa-quora"></i>${qstnVo.questionTitle}
							</p>
						</div>
						
						<!-- 질문 내용 -->
						<%
							pageContext.setAttribute("newLine", "\r\n");
						%>
						<c:set var="questionAbout" 
							value="${fn:replace(qstnVo.questionAbout, newLine, '<br>') }" />
						<div class="cont">
							<p>${questionAbout }</p>
						</div>
						<div class="cellBx">
							<div 
							<c:if test="${sessionScope.userNo==qstnVo.userNo }">
								style="margin-bottom:15px;"
							</c:if>>
								<span class="cell">조회 ${qstnVo.questionView }&nbsp;&nbsp;|</span>
								<span class="cell">&nbsp;&nbsp;
									<fmt:formatDate value="${qstnVo.questionDate }"
										pattern="yyyy-MM-dd"/>	
								</span>
							</div>
							<c:if test="${sessionScope.userNo!=qstnVo.userNo }">
								<c:if test="${bmStatus==0 }">
									<a class="bookmark">
									<i class="fa fa-bookmark-o" aria-hidden="true"></i></a>
								</c:if>
								<c:if test="${bmStatus>0 }">
									<a class="bmChecked"
									href='<c:url value="/indiv/community/delBookMark.do?qstnNo=${qstnVo.questionNo}"/>'>
									<i class="fa fa-bookmark" aria-hidden="true"></i></a>
								</c:if>
							</c:if>
						</div>
						
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
						<!-- <div class="explain">
							<ul class="txInfoWrap">
							</ul>
						</div> -->
					</div>
				</article>
				
				<!-- 답변 include -->
				<c:import url="/indiv/community/comments.do"/>
			</div>
		</div>
	</section>
	<div style="clear: both;"></div>
</div>




<%@ include file="../../inc/bottom.jsp"%>