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
</style>    

<script type="text/javascript">
$(function(){
	
	$('.replyBtnDiv').click(function(){
		$('.replyBoxWrap').toggle();
	});
	
});
</script>

<c:if test="${!empty cmtList}">
<article>
<div class="cmtBoxWrap">
<p class="cmtCnt">답변<b>1</b></p>
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

<div class="pageDiv">

</div>


</div>
</article>
</c:if><!-- !empty cmtList  -->
