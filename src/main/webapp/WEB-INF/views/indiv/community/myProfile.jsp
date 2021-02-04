<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<style type="text/css">
.divCmty {
	width: 1140px; /*1104px*/
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

#content {
	width: 800px;
}

.qtTitle {
	font-size: 20px;
	color: black;
	font-weight: lighter;
}

.paging {
	height: 100px;
	clear: both;
	text-align: center;
	padding: 35px 0;
}

.questBoxWrap:hover {
	background-color: #f5f7ff;
}

#noneQuestBox {
	clear: both;
	height: 400px;
	text-align: center;
	border: 1px solid silver;
}

.cellBx > a{
	color:gray;
	font-size:14px;	
}

.cellBx > span{
	float:left;
	font-size:14px;	
}

.cellBx  .bookmark{
	float:right;
	font-size:20px;
	display:block;
	color:gray;
	cursor:pointer;
}

.cellBx  .bookmarked{
	float:right;
	font-size:20px;
	display:block;
	color:#4c50bb;
	cursor:pointer;
}

article {
	margin-bottom: 30px;
}

.tabMenuWrap {
	height: 50px;
	background-color: #f3f3f3;
	width: 100%;
	border: 1px solid silver;
}

.tabMenuWrap>div {
	/* float: left; */
	width: 25%;
	height: 100%;
	text-align: center;
	padding-top: 12px;
	background-color: #f3f3f3;
}

.tabMenuWrap>div:hover {
	background-color: #4c50bb;
	color: white;
	cursor: pointer;
}

#comntTab {
	border-right: 1px solid silver;
	border-left: 1px solid silver;
}

#bMarkTab {
	border-left: 1px solid silver;
}

.fa-commenting-o {
	font-size: 57px;
	color: silver;
}

#myContCnt {
	color: #4c50bb;
}

/* 임시 프로필 이미지  */
#profile {
	height: 150px;
	border: 1px solid silver;
	background-color: #f5f7ff;
	padding: 35px;
	overflow: hidden;
}

.imgBox {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	float: left;
}

.imgBox>a {
	color: black;
}

.profileId {
	float: left;
	height: 100%;
	margin: 25px;
	font-size: 20px;
}

.profilePic {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.noneBox {
	padding-top: 160px;
}

/*  */
#questBox{
	border-top: 1px solid silver;
	border-left: 1px solid silver;
	border-right: 1px solid silver;
	border-bottom: 1px solid silver;
}

.oneQuestBox{
	padding: 30px 10px 40px 10px;
	height: auto;
	width: 92%;
	border-bottom: 1px solid silver;
	margin: 0px 30px 0 30px;
}

.qtContent {
	font-size: 16px;
	color: #5f5f5f;
}

.fa-quora {
	font-size: 22px;
	color: #4c50bb;
	margin-right: 5px;
}

dd {
	margin-top: 20px;
}

.cellBx {
	color: gray;
}

.replyNum {
	color: black;
	font-weight: bold;
}

.cellBx>.bookmark {
	float: right;
	font-size: 25px;
	padding-bottom: 20px;
}


/* 페이징처리 */
.product__pagination a, .blog__pagination a, #currentPage {
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

.product__pagination a:hover, .blog__pagination a:hover, #currentPage {
	background: #4C50BB;
	border-color: #4C50BB;
	color: #ffffff;
}

.product__pagination a:last-child, .blog__pagination a:last-child {
	margin-right: 0;
}

td{
	text-align: center;
    padding-top: 5px;
    border-right: 1px solid silver;
    cursor: pointer;
}

td:last-child{
	border-right:none;
}

table{
	height:100%;
}

.selected{
	background-color: #4C50BB;
	color:white;
}

td:link, td.selected{
	background-color: #4C50BB;
	color:white;	
}

.workkind{
		margin: 0 0 18px 0;
	    font-size: 13px;
	    background-color: #c0c0c059;
	    width: max-content;
}
</style>

	
<script type="text/javascript">

function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>
	
	
<div class="divCmty">
	<!-- asdie : 사이드 메뉴바 -->
	<c:import url="/indiv/community/cmtyNavbar.do">
		<c:param name="userNo" value="${userNo}"></c:param>
		<c:param name="userId" value="${userId}"></c:param>
	</c:import>
	
<section>
	<div id="container">
		<div id="content" class="AllQuestList">
			<article id="profile">
				<div class="imgBox" style="background: #BDBDBD; overflow: hidden;">
					<a href="#"><img class="profilePic"
						src="<c:url value='/resources/img/banner-1.jpg'/>"></a>
				</div>
				<div class="profileId">
					<span>${userId }</span>
				</div>
				<div></div>
			</article>

			<!-- 탭 메뉴 -->
			<article id="tabMenu">
				<div class="tabMenuWrap">
				<table>
					<colgroup>
						<col width="200px">
						<col width="200px">
						<col width="200px">
						<col width="200px">
					</colgroup>
					<tbody>
						<tr>
							<td 
							<c:if test="${type==1 }">
								class="selected"
							</c:if>
							onclick="location.href='<c:url value="/indiv/community/myProfile.do?userNo=${userNo}&type=1"/>'">
								질문
							</td>
							<td 
							<c:if test="${type==2 }">
								class="selected"
							</c:if>
							onclick="location.href='<c:url value="/indiv/community/myProfile.do?userNo=${userNo}&type=2"/>'">
								답변
							<td 
							<c:if test="${type==3 }">
								class="selected"
							</c:if>
							onclick="location.href='<c:url value="/indiv/community/myProfile.do?userNo=${userNo}&type=3"/>'">
								임시저장
							</td>
							<td
							<c:if test="${type==4 }">
								class="selected"
							</c:if>
							onclick="location.href='<c:url value="/indiv/community/myProfile.do?userNo=${userNo}&type=4"/>'">
								북마크
							</td>
						</tr>
					</tbody>
				</table>
				</div>	
			</article>
		
			<!--질문 목록-->
			<c:if test="${param.type==1 }">
				<div>
					<%@include file="userCmtyList/userQstnList.jsp" %>	
				</div>
			</c:if>
			
			<!-- 답변 목록 -->
			<c:if test="${param.type==2 }">
				<div>
					<%@include file="userCmtyList/userCommentList.jsp" %>
				</div>
			</c:if>

			<!-- 임시저장 목록 -->
			<c:if test="${param.type==3 }">
				<div>
					<%@include file="userCmtyList/userTempQstnList.jsp" %>
				</div>
			</c:if>

			<!-- 북마크 목록 -->
			<c:if test="${param.type==4 }">
				<div>
					<%@include file="userCmtyList/userBookmarkList.jsp" %>
				</div>
			</c:if>
		
		</div>
	</div>
</section>
<div style="clear: both;"></div>
</div>


<%@ include file="../../inc/bottom.jsp"%>