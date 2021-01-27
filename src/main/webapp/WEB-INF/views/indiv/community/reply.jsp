<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="replyBoxWrap active">
<input type="hidden" name="commentrespondNo" value="${map['COMMENTRESPOND_NO']}"/>
	<c:if test="${!empty replyList }">
		<c:forEach var="map" items="${replyList }">
		
			<form id="commentForm" name="commentForm" method="post">
			
			<div class="replyOne">
				<div class="nickDiv">
					<span>┗  &nbsp; @silver</span>
				</div>
				<div class="replyCont" id="replyContent">
					<span class="nick">닉네임</span>
					<p class="replyTxt">${map['COMMENT_ABOUT']}</p>
				</div>
				<div class="regdateDiv">
					<span>${map['COMMENT_DATE'] } 작성</span>
				</div>
			</div><!-- replyOne -->
		</form>
		</c:forEach>
	</c:if>
	<div class="replyWrap">
		<form name="replyFrm" id="replyFrm" method="post">
		<input type="hidden" name="commentrespondNo" value="${map['COMMENTRESPOND_NO']}"/>
		<input type="hidden" name="userNo" value="${userNo}"/>
			<div class="replyWriteArea">
				<textarea class="replyWrite" name="commentAbout" placeholder="댓글을 입력해주세요."
				></textarea>
				<input type="submit" value="등록" id="replyBtn">
			</div>
		</form>
	</div>
	<div class="replyFold">
		<a href="#">댓글 접기&nbsp;<i class="fa fa-angle-up"></i></a>
	</div>
</div>
