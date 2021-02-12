<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- <link rel="stylesheet" type="text/css" -->
<%-- 	href="<c:url value='/resources/css/indivSearch.css'/>" /> --%>
	
<script type="text/javascript">
	$(function(){
		$('#areaAdd1').change(function(){
			var areaAdd1=$('#areaAdd1 option:selected').val();
			
			$.ajax({
				url:"<c:url value='/indivSearch/indivLanguageSearchAjax.do'/>",
				type:"get",
				data:{
					areaAdd1:areaAdd1
				},
				success:function(res){
					if(res.length>0){
						$('#areaAdd2').find('option').remove();
						
						$.each(res, function(idx, item){
							$('#areaAdd2').append("<option value="+item.areaAdd2+">"+item.areaAdd2+"</option>")
						});
					}//if
				},
				
				error:function(xhr, status, error){
					alert('error! : '  +error);
				}	
			});//ajax
		});//change
		
		
		$('#ExploreBtn').click(function(){
			if($('#areaAdd1 option:selected').val()=="X"){
				alert('지역을 선택하세요.');
				$('#areaAdd1').focus();
				event.preventDefault();
			}else if($('#areaAdd2 option:selected').val()=="X"){
				alert('상세 지역을 선택하세요.');
				$('#areaAdd2').focus();
				event.preventDefault();
			}else if($('#languageNo option:selected').val()=="X"){
				alert('사용 언어를 선택하세요.');
				$('#areaAdd2').focus();
				event.preventDefault();
			}
		});
		
		$("#userLanguage").on("click", function(){
			console.log("여기입니다");
		});
		
		$('#exploreBtn').click(function(){
			var len = $('#languageNo').val();
			
		    for (var i=0; i<len.length; i++) {
		        if(len[i].selected){
		            arr.push(len[i].value);
		         }
		     }
		});
		
	});
	
	
</script>
<style>
.sectionWarp {
    margin: 0 auto;
}
form.center {
    width: 1080px;
    margin: 0 auto;
}
.searchSelectbox {
    border: 1px solid #ebebeb;
    height: 500px;
    width: 250px;
}
p#arealb {
    font-size: 20px;
    font-weight: bold;
    margin-left: 102px;
}
p#langlb {
    font-size: 20px;
    font-weight: bold;
}
div#areaWarp {
    width: 600px;
    float: left;
    margin-left: 75px;
}
select#areaAdd1 {
    margin-left: 91px;
}
div#btWarp {
    width: 200px;
    margin: 50px auto;
    text-align: center;
}
p#info {
    padding: 45px 0 0 160px;
}
</style>
<!-- Latest Blog Section Begin -->
<section class="latest-blog spad margin_left_right_150 sectionWarp">
	<div class="section-title">
		<h2>지역/언어 선택</h2>
	</div>
	
	<form method="post" action="<c:url value='/resumes/resumeExplore.do'/>" class="center">
		<div id="areaWarp">
		<p id="arealb"><i class="fa fa-map-marker" aria-hidden="true">&nbsp;</i>지역</p>
		<select name="areaAdd1" id="areaAdd1" class="col-lg-4 searchSelectbox" multiple>
			<option disabled selected value="X">지역을 선택하세요</option>
			<c:if test="${!empty Alist }">
				<c:forEach var="Avo" items="${Alist }">
					<option value="${Avo.areaAdd1 }"
						<c:if test="${Avo.areaAdd1 == A1selected}">
							selected="selected"
						</c:if>
					>${Avo.areaAdd1 }</option>
				</c:forEach>
			</c:if>
		</select>
		<select name="areaAdd2" id="areaAdd2" class="col-lg-4 searchSelectbox" multiple>
			<option disabled selected value="X">지역을 선택하세요</option>
			<c:if test="${!empty Alist2 }">
				<c:forEach var="A2vo" items="${Alist2 }">
					<option value="${A2vo.areaAdd2 }"
						<c:if test="${A2vo.areaAdd2 == A2selected}">
							selected="selected"
						</c:if>
					>${A2vo.areaAdd2 }</option>
				</c:forEach>
			</c:if>
		</select>
		</div>
		
		<div id="langWarp">
		<p id="langlb"><i class="fa fa-cogs" aria-hidden="true"></i>&nbsp;언어</p>
		<select name="userLanguage" id="userLanguage" class="col-lg-3 searchSelectbox" multiple>
			<option disabled selected value="X">사용언어를 선택하세요</option>
			<c:if test="${!empty Llist }">
				<c:forEach var="Lvo" items="${Llist }">
					<option value="${Lvo.languageNo }"
						<c:if test="${Lvo.languageNo == Lselected}">
							selected="selected"
						</c:if>
					>${Lvo.languageName }</option>
				</c:forEach>
			</c:if>
		</select>
		</div>
		
		<input type="text" name="resumeNo" value="${param.resumeNo }">
		<p id="info"><i class="fa fa-hand-paper-o" aria-hidden="true"></i>
		이력서를 공개하시기 위해 근무 가능 지역과 사용할 수 있는 개발언어를 선택하셔야합니다(다중 선택 가능)</p>
		<div id="btWarp">
			<input class="site-btn" type="submit" value="등록" id="exploreBtn">
		</div>
	</form>
	
	<div class="container" id="container">

	</div>

</section>
<!-- Latest Blog Section End -->

<%@ include file="../inc/bottom.jsp"%>