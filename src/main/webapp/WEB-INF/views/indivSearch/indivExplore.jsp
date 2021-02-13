<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/indivSearch.css'/>" />
	
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
			}else if($('#indivCareer option:selected').val()=="X"){
				alert('경력 선택하세요.');
				$('#indivCareer').focus();
				event.preventDefault();
			}
		});
	});
</script>
<!-- Latest Blog Section Begin -->
<section class="latest-blog spad margin_left_right_150">

	<form method="post" action="<c:url value='/indivSearch/indivExplore.do'/>" class="center">
	<label for="areaAdd1">지역 *</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="areaAdd1" id="areaAdd1" class="col-lg-4 searchSelectbox">
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
	<!-- <label for="areaAdd2">지역2</label> -->
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="areaAdd2" id="areaAdd2" class="col-lg-4 searchSelectbox">
		<option disabled selected value="X">지역을 선택하세요</option>
		<c:if test="${!empty area2list }">
			<c:forEach var="A2vo" items="${area2list }">
				<option value="${A2vo.areaAdd2 }"
					<c:if test="${A2vo.areaAdd2 == A2selected}">
						selected="selected"
					</c:if>
				>${A2vo.areaAdd2 }</option>
			</c:forEach>
		</c:if>
	</select><br><br>
	
	<label for="languageNo">언어 *</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="languageNo" id="languageNo" class="col-lg-3 searchSelectbox">
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
	</select>&nbsp;&nbsp;&nbsp;&nbsp;
	<label for="indivCareer">경력 *</label>
		&nbsp;&nbsp;&nbsp;&nbsp;
	<select name="indivCareer" id="indivCareer" class="col-lg-3 searchSelectbox">
		<option disabled selected value="X">경력을 선택하세요</option>
		<option value="0"
			<c:if test="${Cselected =='0'}">
				selected="selected"
			</c:if>
		>신입</option>
		<option value="1"
			<c:if test="${Cselected =='1'}">
				selected="selected"
			</c:if>
		>1년</option>
		<option value="2"
			<c:if test="${Cselected =='2'}">
				selected="selected"
			</c:if>
		>2년</option>
		<option value="3"
			<c:if test="${Cselected =='3'}">
				selected="selected"
			</c:if>
		>3년</option>
		<option value="4"
			<c:if test="${Cselected =='4'}">
				selected="selected"
			</c:if>
		>4년</option>
		<option value="5"
			<c:if test="${Cselected =='5'}">
				selected="selected"
			</c:if>
		>5년</option>
		<option value="6"
			<c:if test="${Cselected =='6'}">
				selected="selected"
			</c:if>
		>6년</option>
		<option value="7"
			<c:if test="${Cselected =='7'}">
				selected="selected"
			</c:if>
		>7년</option>
		<option value="8"
			<c:if test="${Cselected =='8'}">
				selected="selected"
			</c:if>
		>8년</option>
		<option value="9"
			<c:if test="${Cselected =='9'}">
				selected="selected"
			</c:if>
		>9년</option>
		<option value="10"
			<c:if test="${Cselected =='10'}">
				selected="selected"
			</c:if>
		>10년이상</option>
	</select>
	<input type="submit" value="검색" id="ExploreBtn">
	</form>
	<br><br><br>
	<div class="container">
		<c:if test="${empty list }">
			<br><div class="center size_150 lightgray"><i class="fas fa-search"></i></div><br>
			<div class="center"><p>검색 결과가 없습니다.</p></div>
		</c:if>
		<div class="row">
			<!-- 반복시작 -->
			<c:if test="${!empty list }">
				<c:forEach var="vo" items="${list }">
					<div class="col-lg-4 col-md-6 padding_20">
						<div class="single-latest-blog">
								<div class="imgDiv">
									<a href="<c:url value='/recruit/recruitdetail.do?recruitannounceNo=${vo.recruitannounceNo }'/>"> 
									<img src="<c:url value='/pd_images/${vo.corpImgurl }'/>" onerror="this.src='<c:url value='/altImg/altlogo.jpg'/>'">
								</div>
								<div class="latest-text">
									<div class="tag-list">
										<div class="tag-item">
											<i class="fa fa-calendar-o"></i> 
											<fmt:formatDate value="${vo.recruitannounceEnddate }"
												pattern="yyyy-MM-dd"/>
										</div>
										<div class="tag-item">
											<i class="fas fa-search"></i> ${vo.workkindName }
										</div>
									</div>
									<h4>
										<b>${vo.corpName }</b>
									</h4>
									<p>
										<c:if test="${fn:length(vo.recruitannounceTitle)>=20}">
											${fn:substring(vo.recruitannounceTitle, 0, 20) } ...
										</c:if>
										<c:if test="${fn:length(vo.recruitannounceTitle)<20}">						
											${vo.recruitannounceTitle }
										</c:if>
									</p>
									<p class="margin_bottom_0 gray">
										<i class="fas fa-building"></i> ${vo.areaAdd1 } · ${vo.areaAdd2 }
									</p>
									<p class="margin_bottom_0 gray">
										<i class="fas fa-pencil-alt"></i> ${vo.languageName } · 
										<c:if test="${vo.recruitannounceWantedcarrer ==0}">
											신입
										</c:if>
										<c:if test="${vo.recruitannounceWantedcarrer !=0}">
											${vo.recruitannounceWantedcarrer }년 이상
										</c:if>
									</p>
									<p class="margin_bottom_0 gray">
										<i class="fas fa-dollar-sign"></i> ${vo.recruitannounceSpay }
									</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</c:if> 
			<!-- 반복 끝 -->
		</div>
	</div>

</section>
<!-- Latest Blog Section End -->

<%@ include file="../inc/bottom.jsp"%>