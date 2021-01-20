<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	padding:15px;
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


<div class="cmtBoxWrap">
<p class="cmtCnt">답변<b>1</b></p>
<div class="cmtOne">
	<div class="nickDiv">
		<span>silver</span>
	</div>
	<div class="cmtCont">
		<p>규모가 어느 정도인지 모르겠는데.. 보통 대졸 신입은 초임이 정해져 있는 경우가 많습니다. 제 생각에
			처우 협의가 아니라 계약서 작성을 위해 방문하는 것 같은데.. 일반적으로 대졸 신입 사원들이 초임으로 얼마나
			받는지 물어보시고 결정하시면 좋을 듯 합니다. 신입 사원은 사실 역량에 대한 확신이 회사와 개인 모두 없기에..
			조정이 많이 힘들어요. 제 생각에는 귀하께서 보상, 경력개발, 조직문화 측면에서 회사를 고르는 기준을
			세워보시고, 이와 입사할 회사가 적절할지를 고민해 보시는게 우선이며, 이를 기반으로 종합적으로 결정하시는게
			좋습니다.</p>
	</div>
	<div class="regdateDiv">
		<span>2020-12-20 작성</span>
	</div>
	<div class="replyBtnDiv">
		<span>댓글 <b class="replyCnt">1</b></span>
	</div>
	<div class="recommendCntDiv">
		<a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
		<b class="recmdCnt">1</b></a>
	</div>
</div>


<!-- 댓글 -->

<div class="replyBoxWrap active">
	<div class="replyOne">
		<div class="nickDiv">
			<span>┗  &nbsp; silver</span>
		</div>
		<div class="replyCont">
			<p>헐ㅠ</p>
		</div>
		<div class="regdateDiv">
			<span>2020-12-20 작성</span>
		</div>
	</div><!-- replyOne -->
	<div class="replyOne">
		<div class="nickDiv">
			<span>silver</span>
		</div>
		<div class="replyCont">
			<p>헐ㅠ</p>
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