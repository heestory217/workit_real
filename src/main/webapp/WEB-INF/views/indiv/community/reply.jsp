<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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