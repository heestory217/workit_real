<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<div class="replyBoxWrap active">
<input type="hidden" name="commentrespondNo" value="${map['COMMENTRESPOND_NO']}"/>
	<div class="replyOne">
		
		<input type="hidden" name="commentrespondNo" id="cmntNo" value="${map['COMMENTRESPOND_NO']}">
	</div><!-- replyOne -->
	<div class="replyWrap">
		<form name="replyFrm" id="replyFrm">
		<input type="hidden" name="commentrespondNo" id="cmntNo" 
		value="${map['COMMENTRESPOND_NO']}">
		<input type="hidden" name="userNo" value="${userNo}"/>
			<div class="replyWriteArea">
				<textarea class="replyWrite" name="commentAbout" placeholder="댓글을 입력해주세요."></textarea>
				<input type="submit" value="등록" id="replyBtn">
			</div>
		</form>
	</div>
	<div class="replyFold">
		<a href="#">댓글 접기&nbsp;<i class="fa fa-angle-up"></i></a>
	</div>
</div>
<script type="text/javascript">

</script>
