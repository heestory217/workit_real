<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	
.cmtBoxWrap {
	border:solid 1px silver;
	padding:50px 30px 0;
	height:auto;
}

.cmtOne{
	border-top:1px solid silver;
	overflow: hidden;
}

.pageDiv{
	border-top:1px solid silver;
	height:50px;
}


.cmtCont, .replyCont{
	padding:5px 15px;
}

.cmtCont>p{
    margin: 0;

}
.nickDiv{
	padding: 10px 16px;
    font-size:18px;
    font-weight: bold;
}

.regdateDiv{
	color:gray;
	font-size:14px;
	padding: 14px 16px;
}

.replyBtnDiv{
	border: 1px solid silver;
    width: 90px;
    padding:4px;
	float: left;
	text-align: center;
	margin: 10px 16px 20px;
	cursor: pointer;
}

.recommendCntDiv a,
.recommendCntDiv a:hover{
    color:gray;
}

.replyCnt, .recmdCnt{
	font-weight:bold;
	color:black;
}

.recommendCntDiv{
	margin:10px 0;
	border: 1px solid silver;
    width:90px;
    padding:4px;
	float: left;
	text-align: center;
}

.cmtCnt{
	font-size: 20px;
}

.cmtCnt b{
	color:#4c50bb;
    padding-left:5px;
    font-size:21px;
}

.replyBoxWrap{
	border-top:1px solid silver;
	padding:0 30px;
	height:auto;
	background-color: #F6F6F6;
}

.replyOne{
	border-bottom:1px solid silver;
	padding:10px 0;
}

.replyWrite:placeholder{
	color:silver;
}

.replyWrite{
	float: left;
    width: 80%;
    resize: none;
    height: 60px;
	border:1px solid silver;
    border-right: 0;
    padding:15px;
}

#replyBtn{
	float:left;
	width:100px;
	height:60px;
	background-color:#4c50bb;
	color:white;
	border:1px solid silver;
}

.replyFold{
	clear:both;
	border-top:1px solid silver;
	text-align:center;
}

.replyWrap {
    height: 100px;
}

.replyWriteArea{
	padding:20px;
	width:710px;
}

.fa-angle-up, 
.replyFold a, 
.replyFold a:hover, 
.replyFold a:focus{
	font-size:14px;
	color:gray;
}

.replyBoxWrap{
	display:none;
}

/* 페이징처리 */
.product__pagination a,
	.blog__pagination a,
	#currentPage {
	display: inline-block;
	width: 30px;
	height: 30px;
	border: 1px solid #b2b2b2;
	font-size: 14px;
	color: #b2b2b2;
	font-weight: 700;
	line-height: 28px;
	text-align: center;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
	margin-right: 0;
}
	
.product__pagination a:hover,
.blog__pagination a:hover,
#currentPage {
	background: #4C50BB;
	border-color: #4C50BB;
	color: #ffffff;
}
	
.product__pagination a:last-child,
.blog__pagination a:last-child {
	margin-right: 0;
}

.paging {
	border-top: 1px solid silver;
    height: 100px;
    text-align: center;
    padding: 35px;
}

/* 답변 수정, 삭제 */

.fa-ellipsis-h{
	font-size:22px;
	color:silver;
	position: relative;
}

.cmtEditBox{
	float:right;
	margin:-6px 5px 0 0;
}

.cmtEditBtn{
    border: 1px solid gray;
    position: absolute;
    width: 70px;
    height: 80px;
    background: white;
    padding: 3px;
    text-align: center;
}

.cmtEditBtn>hr{
	margin:8px 0;
}
.cmtEditBtn>a{
    padding: 11px;
    font-size: 14px;
    font-weight: 100;
    color: gray;
}

</style>    

<script type="text/javascript">
$(function(){
	
	$('.replyBtnDiv').click(function(){
		$('.replyBoxWrap').toggle();
	});
	
	/* 수정&삭제 아이콘 클릭시 수정, 삭제 버튼 보이도록 클릭 이벤트 */
	$('.cmtEditBtn').hide();
	$('.fa-ellipsis-h').each(function(index, item){
		$(this).click(function(){
			$(this).parent('a').next('.cmtEditBtn').toggle();
		});

	});
});


function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>


<c:if test="${!empty cmtList}">
<!-- 페이징 처리 form  -->
<form action="<c:url value='/indiv/community/comments.do'/>" 
		name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="questionNo" value="${param.questionNo}">
	<input type="hidden" name="userNo" value="${userNo}">
</form>
<article>
<div class="cmtBoxWrap">
<p class="cmtCnt">답변<b>${pagingInfo.totalRecord }</b></p>
<!-- 답변 반복 시작 -->
<c:forEach var="map" items="${cmtList}">
<div class="cmtOne">
	<div class="nickDiv">
		<span>@ ${map['USER_ID'] }</span>
		<c:if test="${userId eq map['USER_ID'] }">
		<!-- if 조건으로 로그인한 회원의 번호와 질문글의 회원번호가 같은 경우에만 보이도록 설정 -->
			<div class="cmtEditBox">
			<a>
				<i class="fa fa-ellipsis-h"></i>
			</a>
			<!-- 수정, 삭제  -->
				<div class="cmtEditBtn">
				<a href
="<c:url value='/indiv/community/cmtEdit.do?cmtNo=${map["COMMENTRESPOND_NO"]}'/>">수정</a>
				<hr>
				<a id="cmtDelBtn" href
="<c:url value='/indiv/community/cmtDelete.do?qstnNo=${map["QUESTION_NO"] }&cmtNo=${map["COMMENTRESPOND_NO"]}'/>"
				onclick="if(!confirm('삭제된 답변은 복구가 불가능합니다.\n답변을 삭제하시겠습니까?')){return false;}"
				>삭제</a>
				</div>	
			</div>
		<!-- cmtEditBox 끝 -->
		</c:if>	
	</div>
	
	<div class="cmtCont">
		<p>${map['commentrespondAbout']}</p>
	</div>
	<div class="regdateDiv">
		<span><fmt:formatDate value="${map['COMMENTRESPOND_DATE']}" pattern="yyyy-MM-dd"/> 작성</span>
	</div>
	<div class="replyBtnDiv">
		<span>댓글 <b class="replyCnt">0</b></span>
	</div>
	<div class="recommendCntDiv">
		<a href="#"><i class="fa fa-thumbs-o-up"></i>
		<b class="recmdCnt">${map['COMMENTRESPOND_LIKENUM'] }</b></a>
	</div>
</div><!-- cmtBoxWrap -->
</c:forEach>
<!-- 답변 반복 끝  -->

<!-- 댓글 -->

<div class="replyBoxWrap active">
	<div class="replyOne">
		<div class="nickDiv">
			<span>┗  &nbsp; @silver</span>
		</div>
		<div class="replyCont">
			<p>댓글 내용<br>........<br>......</p>
		</div>
		<div class="regdateDiv">
			<span>2020-12-20 작성</span>
		</div>
	</div><!-- replyOne -->
		<div class="replyWrap">
			<form name="replyFrm" id="replyFrm">
				<div class="replyWriteArea">
					<textarea class="replyWrite" placeholder="댓글을 입력해주세요."
					></textarea>
					<input type="submit" value="등록" id="replyBtn">
				</div>
			</form>
		</div>
		<div class="replyFold">
			<a href="#">댓글 접기&nbsp;<i class="fa fa-angle-up"></i></a>
		</div>
</div>

<!-- 페이징 처리 -->
<div class="paging col-lg-12">
	<!-- 이전블럭 -->	
	 <div class="product__pagination blog__pagination">
	 	<c:if test="${pagingInfo.firstPage>1 }">	
			<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
				<i class="fa fa-long-arrow-left"></i>
			</a>
		</c:if>
		
	<!-- [1][2][3][4][5][6][7][8][9][10] -->		
	<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
		<c:if test="${i==pagingInfo.currentPage }">
			<span id="currentPage" >
				${i}</span>			
		</c:if>
		<c:if test="${i!=pagingInfo.currentPage }">
			<a href="#" onclick="pageFunc(${i})">
				${i}</a>			
		</c:if>
	</c:forEach>
	
	<!-- 다음블럭 -->	
	<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
		<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
			<i class="fa fa-long-arrow-right"></i>
		</a>
	</c:if>
    </div>
</div>

</div>
</article>
</c:if><!-- !empty cmtList  -->
