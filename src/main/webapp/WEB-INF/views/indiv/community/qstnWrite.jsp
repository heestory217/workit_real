<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.divCmty{
		width: 1140px;
		margin:0 auto;
		margin-bottom:30px;
	}
	
	section{
		float:left; 
		margin-left:30px;
		margin-top:15px;
	}
	
	.title{
		font-size: 22px;
	}
	
	.nullBoxWrap{
		border:solid 1px silver;
		padding :20px;
		height:300px;
		width:100%;
		
	}	
	
	.msgBx{
		margin: 80px 0 30px 0;
		text-align: center;
	}
	
	.btnBx{
		margin: 0 auto;
	    text-align: center;
	    background-color: #4c50bb;
	    border: solid 1px #4c50bb;
	    width: 140px;
	    height:53px;
	    padding-top: 15px;
	}
	
	.btnWrite{
		color:white;
		text-decoration: none;
	}
	
	#leftNav{
		border:1px solid silver;
		width:213px;
		height: 560px;
	}
	
	
	li a{
		vertical-align:center;
		text-decoration: none;
		color:black;
		margin: 0 10px;
	} 
	
	li a:hover{
		color:#4c50bb;
	}
	
	#searchBoxNav > input[type=text] {
	    width: 90%;
	    margin: 10px;
	}
	
	#content{
		width:800px;
	}
	
	#top{
		height:200px;
	}
	
	li #searchQuest{
		width: 95%;
	    height: 45px;
	    margin: 5px 5px 5px 5px;
	}
	
	#searchBoxNav hr{
		margin-top:0px;
	}
	
	em{
		color:#4c50bb;
	}
	
	#popularQuest{
		margin-top:30px;
	}
	
	.card{
		height: 200px;
		width:200px;
	}
	
	#moreQuestBtn{
		width:160px;
		height:25px;
		padding:3px;
		margin:5px 0 5px 0;
		padding-left:5px;
		border:1px solid white;
		background-color:white;
		border-radius: 80px / 80px;
	}
	
	#moreQuestBtn a{
		font-size: 12px;
		color:blue;
	}
	
	.first-card{
		background-color: #4c50bb;
		color:white;
	}
	
	a:hover{
		color:#4c50bb;
	}
	
	
	#questionBtn{
		width:90%;
		height:50px;
		margin:10px;
		background-color: #4c50bb;
		text-align: center;
		padding-top: 15px;
	}
	
	#questionBtn a{
		color:white;
		text-decoration: none;
		display: block;
		
	}
	
	.myInfoSec{
		border: 1px solid silver;
	    height: 150px;
	    margin: 10px;
	}
	
	#userInfo{
		text-align: center;
	    padding-top: 55px;
	}
	
	.writeBoxWrap{
		border:1px solid silver;
		width:100%;
		height:500px;
		padding:10px;
	}
	
	form[name=qstnWriteFrm]{
	    padding: 5px;
	}
	
	.devQnaWriteTitle{
		width:100%;
		padding:10px;
		height:50px;
		border:none;
		font-size:24px;
		/* 
		테두리 안보이게 설정하기
		border-right:0px; 
		border-top:0px; 
		boder-left:0px; 
		boder-bottom:0px;
		 */

	}
	
	.devQnaWriteTitle:focus, .devQnaWriteCntnt:focus{
		outline: none;
	}
	
	.uiPlaceholder{
		color:gray;
		font-size: 14px;
	}
	
	.devQnaWriteCntnt{
		width:100%;
		padding:0;
		border:none;
		height:260px;
		/* overflow-y: scroll; */
		resize: none;	/* textarea 크기 고정 */
		/* 
		스크롤바 숨기기
		overflow:hidden; 
		*/
	}
	
	.btnQuestion{
		background-color: #4c50bb;
		color:white;
		/* 테두리 없애기 */
		outline:0;
		border:0;
		width:140px;
		height:50px;
	}
	
	.btnCancel{
		background-color: white;
		color:gray;
		outline:0;
		border:0.5px solid silver;
		width:140px;
		height:50px;
	}
	
	.btnCommWrap{
		text-align:center;
	}
	
	.byte{
		display:block;
		text-align: right;
	}
	
	.explain{
		border:1px solid silver;
		font-size: 14px;	
		padding:10px;
		padding-top:20px;
		background-color: #F6F6F6;	
	}
	
	article{
		margin-bottom: 30px;
	}
	
	b{
		color:#4c50bb;
	}
	
	.checkListArea{
		border:1px solid silver;
	}
	
	.checkboxCommWrap{
		margin: 10px;
		list-style-type: none;
	}
	
	.checkboxCommWrap #chk{
		float:left;
		padding:10px;
	}
	
	#open{
		width:210px;
   	    height:35px;
   	    background-color: white;
 	   	background-color: white;
    	border: 1px solid #bcbcbc;
	}
	
	#open:focus{
    	border: 1px solid #4c50bb;
    	outline:0;
	}
	
	#c{
		clear:both;
	}
	
	input[type=checkbox]{
		width: 20px;
		height: 20px;
		border: 2px solid #bcbcbc;
		cursor: pointer;
	}
	
	
	input[type=checkbox]:checked{
		background-color: #4c50bb;
	}
	
</style>
<script type="text/javascript" 
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.btnCancel').click(function(){
			if(confirm("[취소]를 누르면 글이 저장되지 않습니다.\n글을 저장하지 않고 나가시겠습니까?")){
				location.href="<c:url value='/indiv/community/myQstn.do'/>"
			}
		});
		
		//textarea 글자수 체크
		$('.devQnaWriteCntnt').keyup(function (e){
		    var content = $(this).val();
		    $('#count').html(content.length);    //글자수 실시간 카운팅

		    if (content.length > 1000){
		        alert("최대 1000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1000));
		        $('#count').html("1000");
		    }
		});

	});
	
</script>
</head>
<body>
<div class="divCmty">		
	<!-- asdie : 사이드 메뉴바 -->		
	<%@ include file="cmtyNavbar.jsp" %>		
	
	<section style="float:left; margin-left:30px;">
		<div id="container">
			<!-- 메인 : qnaMainWrap,  나의질문 : myQuestion 추가 -->
			<div id="content" class="qnaMainWrap myQuestion">
				<div class="top-title-wrap">
					<p class="title">어떤 질문을 하시겠어요?</p>
				</div>
				
<!-- 직무, 기업선택 -->
<article>
	<div class="checkListArea">
	    <div class="checkboxCommWrap row" >
	        <div class="col-sm-4" id="chk">
	            <input type="checkbox">
	            <label for="job" >직무명</label><br>
	            <input type="button" id="open">
	        </div>
	        <div class="col-sm-4" id="chk">
	            <input type="checkbox">
	            <label for="company">기업명</label>
	            <input type="button" id="open" >
	        </div>
	    </div>
	    <div id="c">
	    
	    </div>
	</div>
</article>
				
				
				<!-- 질문글 쓰기 -->
				
				<article id="secArticle">
				 <div class="writeBoxWrap">
                        <form name="qstnWriteFrm">
                            <fieldset>
                                <div class="jkTxInput">
                                    <p class="inpWrap">
                                        <input type="text" class="jkSchInp devQnaWriteTitle" placeholder="질문 제목을 입력해주세요.">
                                    </p>
                                    <hr style="margin-top:0">
                                </div>
                                
                                <!-- &#13;&#10; - placeholder 내에서 줄바꿈 시 이용 -->
                                
                                <div class="uiPlaceholder">
                                    <textarea class="devQnaWriteCntnt" title="내용 입력"
                                    placeholder="구체적인 내용을 입력해주세요.&#13;&#10;*휴대폰 번호, 메일 주소, 카카오톡 ID 등 개인정보가 포함된 내용은 비노출 처리될 수 있습니다"
                                    ></textarea>
                                    <span class="byte">
                                        <b id="count">0</b> / 1,000
                                    </span>

                                </div>
                               
                                <div class="btnCommWrap">
                                    <button type="submit" class="btnQuestion devQnaWriteButton">질문하기</button>
                                    <button type="button" class="btnCancel bg_white devQnaWriteCancelButton">취소</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
				</article>
				
				<!-- 글 등록 설명 -->
				<article>
					<div class="explain">
                    <ul class="txInfoWrap">
                    </ul>
					</div>				
				</article>
			</div>
		</div>
	</section>
	<div style="clear:both;height:400px;"></div>

</div>	
</body>
</html>
<%@ include file="../../inc/bottom.jsp" %>