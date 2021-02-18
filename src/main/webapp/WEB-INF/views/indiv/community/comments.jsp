<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
   padding: 10px 16px 18px;
    font-size:18px;
    font-weight: bold;
}

.regdateDiv{
   color:gray;
   font-size:13px;
   padding: 8px 16px 24px;
   float:left;
}

#adoptBtn{
    width: auto;
    padding: 5px 10px;
    float: right;
    text-align: center;
    margin: 0px 16px 20px;
    cursor: pointer;
    background: #4c50bb;
    border-radius:7px;
    color: white;
    border: none;
    outline: none;
    font-size: 14px;
}

.cmtCnt{
   font-size: 20px;
}

.cmtCnt b{
   color:#4c50bb;
    padding-left:5px;
    font-size:21px;
}


#updateBtn{
	border: 0;
	color: white;
	background-color: #4c50bb;
	width: 100px;
	height: 42px;
}

#closeUpdateBtn{
	border: 0;
	color: #4C4747;
	background-color: white;
	border:1px solid silver;
	margin-left:3px;
	width: 100px;
	height: 42px;
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
   cursor: pointer;
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


/* 스크롤바 굵기 */
.cmtEditArea::-webkit-scrollbar {
  width:8px;
}

.cmtEditArea::-webkit-scrollbar-thumb {
  border-radius: 5px;
  background-color: silver;
}

.divWrap{
	overflow: hidden;
}

.selectedComment{
	float: right;
    border: 1px solid #ff4c08;
    border-radius: 7px;
    background: white;
    width: auto;
    padding: 3px 8px;
    color: #ff4c08;
    margin: 0px 16px 20px;
    font-size: 14px;
}

.fotterWrap{
	margin-top:45px;
}

#editB{
	cursor: pointer;
}

#editB:hover{
	color:#4C50BB;
}
</style>  


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
<c:set var="commentNo" value="${map['COMMENTRESPOND_NO']}"/>
<div class="cmtOne" ><!-- //////////////// -->
   <input type="hidden" name="userNo" id="userNo" value="${map['USER_NO']}">
   <input type="hidden" name="commentrespondNo" id="cmtNo" value="${map['COMMENTRESPOND_NO']}">
   <div class="nickDiv">
   	  <c:set var="commentWriter" value="${map['USER_ID']}"/>
      <span>@ ${map['USER_ID'] }</span>
      
      <c:if test="${sessionScope.userId == commentWriter }">
      <!-- if 조건으로 로그인한 회원의 번호와 질문글의 회원번호가 같은 경우에만 보이도록 설정 -->
         <div class="cmtEditBox">
         <a>
            <i class="fa fa-ellipsis-h"></i>
         </a>
         <!-- 수정, 삭제  -->
            <div class="cmtEditBtn">
            <a id="editB" onClick="editFunc(${commentNo})">수정</a>
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
   <div id="${map['COMMENTRESPOND_NO']}" class="divWrap">
   <%
		pageContext.setAttribute("newLine", "\n");
	%>
   <c:set var="cmtContent" value="${fn:replace(map['commentrespondAbout'], newLine, '<br>')}"/>
   <div class="cmtCont" id="content${map['COMMENTRESPOND_NO']}">
      <p>${cmtContent}</p>
   </div>
   <div class="fotterWrap">
	   <div class="regdateDiv">
	      <span><fmt:formatDate value="${map['COMMENTRESPOND_DATE']}" pattern="yyyy-MM-dd"/> 작성</span>
	   </div>
	   <c:if test="${map['COMMENTRESPOND_LIKENUM']==0 && qstnMap['USER_NO']==userNo}"><!-- //////////// -->
		   <input type="button" value="답변 채택하기" id="adoptBtn"
		   	onClick="sendMsgFunc(${map['COMMENTRESPOND_NO']})"/>
		   <c:set value="${map['COMMENTRESPOND_NO']}" var="commentNo"/>
	   </c:if>
	   <c:if test="${map['COMMENTRESPOND_LIKENUM']==1}">
	   		<div class="selectedComment">
		   		<span id="adoptIcon"><i class="far fa-check-circle"></i>채택된 답변</span>
	   		</div>
	   </c:if>
	</div>
   </div>
  </div> 
   
</c:forEach>
<!-- 답변 반복 끝  -->
<c:set var="n" value="${n+1 }"/>
  

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



<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"
></script>
<script type="text/javascript">


$(function(){
	
   /* 수정&삭제 아이콘 클릭시 수정, 삭제 버튼 보이도록 클릭 이벤트 */
   $('.cmtEditBtn').hide();
   $('.fa-ellipsis-h').each(function(index, item){
      $(this).click(function(){
         $(this).parent('a').next('.cmtEditBtn').toggle();
      });
   });
   
   
   $('.cmtEditArea').keyup(function (e){
	    var content = $(this).val();
	    $('#cnt').html(content.length);

	    if (content.length > 1000){
	        alert("최대 1000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 1000));
	        $('#cnt').html("1000");
	    }
	});
   
});//


function editFunc(commentNo){
	$.ajax({
		url:"<c:url value='/indiv/community/editComment.do'/>",
		type:'get',
		data:'commentNo='+commentNo,
		dataType:'text',
		contentType: "application/text; charset=utf-8",
		success:function(res){
			var editBox="";
			editBox+='<div class="editWrap" style="margin-top:15px">';
			editBox+='<div class="cmtBox">';
			editBox+='<div class="writeBoxWrap cmtWrite">';
			editBox+='<form name="editFrm" method="post">';
			editBox+='<div class="cmtWriteBox">';
			editBox+='<textarea onKeyup="countFunc('+res+')" name="commentrespondAbout"'; 
			editBox+=' class="cmtEditArea">'+res+'</textarea></div>';
			editBox+='<div class="regiBtnWrap">';
			editBox+='<span class="letterNum"><b id="numCnt" style="color:#4c50bb">'+res.length+'</b> / 1,000</span>';
			editBox+='<button type="button" id="updateBtn" onclick="updateComment('+commentNo+')">수정</button>';
			editBox+='<button type="button" id="closeUpdateBtn"'; 
			editBox+=' onclick="cancelUpdate()">';
			editBox+='닫기</button></div>';
			editBox+='<div style="clear: both;"></div></form></div></div></div>';
			$('#'+commentNo).html(editBox);
			$('.cmtEditBtn').hide();
			
		},error:function(xhr, status, error){
			alert('답변 수정 창 조회 오류');
		}
		
	});
	
}

function cancelUpdate(){
	if(!confirm("답변을 수정하지 않고 나가시겠습니까?")){
		return false;
	}
	window.location.reload();
}

function updateComment(commentNo){
	var content=$('.cmtEditArea').val();
	$.ajax({
		url:"<c:url value='/indiv/community/updateComment.do'/>",
		type:'get',
		data: {'commentAbout' : content, 'commentNo' : commentNo},
		dataType:'json',
		async:false,
		contentType: "application/json; charset=utf-8",
		success:function(res){
			alert('답변이 정상적으로 수정되었습니다.');
			if(res==1){
				window.location.reload();
			}
			$('#content'+commentNo).html(content);
		},error:function(xhr, status, error){
			alert('답변 수정에 실패하였습니다.다시 시도해주세요');
		}
		
	});
	
}//


function pageFunc(curPage){
   $('input[name=currentPage]').val(curPage);
   $('form[name=frmPage]').submit();
}
</script>
