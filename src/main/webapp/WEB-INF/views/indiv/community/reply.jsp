<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div class="replyBoxWrap active">
   <div class="replyOne">
   </div><!-- replyOne -->
   <div class="replyWrap">
      <form name="replyFrm" id="replyFrm">
	      <input type="text" name="commentrespondNo" id="cmntNo" value="${map['COMMENTRESPOND_NO']}">
	      <input type="hidden" name="userNo" id="userNo" value="${sessionScope.userNo}"/>
	      <div class="replyWriteArea">
	         <textarea class="replyWrite" name="commentAbout" placeholder="댓글을 입력해주세요."></textarea>
	         <input type="button" value="등록" id="replyBtn">
	      </div>
      </form>
   </div>
   <div class="replyFold">
      <a href="#">댓글 접기&nbsp;<i class="fa fa-angle-up"></i></a>
   </div>
</div>

