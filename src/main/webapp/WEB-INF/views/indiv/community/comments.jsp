<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
	
.cmtBoxWrap {
	border:solid 1px silver;
	padding:50px 30px;
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
    padding-bottom:15px;
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
	height: 100px;
	text-align: center;
}
</style>    

<script type="text/javascript">
$(function(){
	
	$('.replyBtnDiv').click(function(){
		$('.replyBoxWrap').toggle();
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
