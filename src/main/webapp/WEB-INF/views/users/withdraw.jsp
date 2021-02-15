<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.user_corpcheck==1}">	
<%@ include file="../indivMypage/indivMypageMenu.jsp"%>
</c:if>
<c:if test="${sessionScope.user_corpcheck==2}">	
<%@ include file="../companyMypage/companyMypageMenu.jsp"%>
</c:if>

<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/usersRegister.css'/>" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	.explain{
		border:1px solid #efefef;
		width:100%;
		height:auto;
		padding:25px 20px;
		font-size:10px;
		color:gray;
		margin-bottom:20px;
		background-color: #f4f4ff;
	}
	
	p > span{
		color:#ff3b3b;
	}
	
	.explain li > p{
		font-size:14px;
		margin: 8px 0px 8px 0px; 
		line-height: 120%;
	}
	
	.explain ul{
		padding-left:20px;
	}
	.explain> p{
		font-weight:bold;
		color:#4C4747;
		font-size:16px !important;
	}
	form > p{
		margin-top:30px;
		text-align: center;
	    font-weight: bold;
	    color:#4C4747;
		font-size:16px; 
	}
	
	.inputBx{
		border: 1px solid #a5a5a5;
	    width: 80%;
	    height:170px;
	    text-align: center;
	    margin:0 auto;
	    padding:20px 0;
	    background-color:#f4f4ff;;
	    border:1px solid #efefef;
	}
	
	.inputText{
	    box-shadow: 0.2px 0.2px 0.2px 0.2px grey inset;
	}
	
	.btnWrap{
		text-align:center;
		margin-top:20px;
		color:#4c4c4c;
		font-size:14px;
	}
	
	#chk{
		margin-bottom:15px;
	}	
	
	.section-title{
	    margin-bottom: 60px;
	}
	
	.titDiv{
	    margin-left: 80px;
	    margin-right: 80px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('form[name=withdrawFrm]').submit(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if($('#chk:checked').length<1){
				alert('탈퇴 유의사항을 확인하고 동의해 주세요.');
				return false;
			}
		});
	});
	
	
</script>

<div class="register-form titDiv">
	<div class="filter-widget">
	<div class="register-form section-title">
		<h2 class="fw-title center">회원 탈퇴</h2>
		</div>
	</div>
	<div class="explain">
		<p>지금까지 이용해주셔서 감사 드립니다. 탈퇴하기 전 아래 유의사항을 확인해주세요.</p>
		<ul>
			<!-- 개인 회원 탈퇴 유의사항 -->
			<c:if test="${sessionScope.user_corpcheck==1}"> 	
				<li><p>탈퇴하신 아이디는 <span>복구가 불가능</span>하며, 추후 동일한 아이디로 재가입이 되지 않습니다.<p></li>	
				<li><p>회원탈퇴 시 등록한 게시물은 삭제되지 않으므로, 삭제를 원하시면 회원탈퇴 전에 삭제해 주시기 바랍니다.</p></li>
				<li><p>이력서 정보, 구직 활동내역, 유료서비스가 모두 삭제되며, <span>삭제된 데이터는 복구되지 않습니다.</span></p></li>
			</c:if>	
			<!-- 기업 회원 탈퇴 유의사항 -->
			<c:if test="${sessionScope.user_corpcheck==2}">
				<li><p>탈퇴하신 아이디는 <span>복구가 불가능</span>하며, 추후 동일한 아이디로 재가입이 되지 않습니다.<p></li>	
				<li><p>회원탈퇴 시 등록한 게시물은 삭제되지 않으므로, 삭제를 원하시면 회원탈퇴 전에 삭제해 주시기 바랍니다.</p></li>
				<li><p>기업 정보, 유료서비스가 모두 삭제되며, <span>삭제된 데이터는 복구되지 않습니다.</span></p></li>
			</c:if>	
		</ul>
	</div>
	<form name="withdrawFrm" 
		method="post" action="<c:url value='/users/withdraw.do'/>">
		<p>정확한 본인확인을 위해 비밀번호를 입력해 주세요.</p>
		<div class="inputBx">
		<div class="group-input">
           <!-- <label for="userid">아이디 *</label> -->
           <input type="text" id="userid" class="col-lg-10 inputText" name="userId" 
           	value="${sessionScope.userId}" readonly="readonly">
       </div>
       <div class="group-input">
           <!-- <label for="pwd">비밀번호 *</label> -->
           <input type="password" id="pwd" class="col-lg-10 inputText" name="userPassword" 
           placeholder="비밀번호 입력">
       </div>
       </div>
        <div>
        </div>
		<div class="btnWrap">
        	<input type="checkbox" id="chk">&nbsp;유의 사항을 모두 확인했으며, 이에 동의합니다.<br>
			<button type="submit" class="col-md-3 site-btn register-btn" 
					id="submit">탈퇴하기</button>
		</div>		
	</form>
</div>

<!-- Menu include 한것 닫는 태그 -->
</div></div></div></section>


<%@ include file="../inc/bottom.jsp"%>