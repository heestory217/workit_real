<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
    
    <style>
    .product-item {
    	position:relative;
    }
	.col-lg-3 {
		float:left;
	}
	
	.product-item .pi-text{
		width:75%;
		position: absolute;
		left: 30px;
    	top: 30px;
    	padding-top : 0px;
	}
	.product-item .pi-pic .sale.pp-sale{
		top: 0px;
	    width: 100%;
	}
	
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
	margin-right: 16px;
	-webkit-transition: all, 0.3s;
	-moz-transition: all, 0.3s;
	-ms-transition: all, 0.3s;
	-o-transition: all, 0.3s;
	transition: all, 0.3s;
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
	
	.langTags{
	    border: 1px solid #ebebeb;
	    padding: 5px 5px 5px 10px; 
	    width: max-content;
	    float: left;
	    margin : 5px 5px 5px 0px;
	}
	
	.langName{
	    padding: 5px 5px 0px 5px;
        font-weight: 700;
	}
	
	.wantedArea{
	    background-color: #f2f2f2;
	    border-radius: 35px;
	    text-align: left;
	    padding: 5px 10px;
	    width: fit-content;
	    font-size: 14px;
	    color: #666;
	    float: left;
  		margin: 5px 5px 0px 0px;
	}
	
	#careerYear{
	    width: 90%;
	    height: 40px;
	    border: 1px solid #e6e6e6;
	    padding: 10px;
	}
	
	</style>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>이력서 탐색</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
    <!-- Product Shop Section Begin -->
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">경력</h4>
                        <select id="careerYear" onchange="careerYear(${pagingInfo.currentPage})">
                        	<option>경력을 선택하세요</option>
                        	<option value="0">신입</option>
                        	<option value="1">1년차</option>
                        	<option value="2">2년차</option>
                        	<option value="3">3년차</option>
                        	<option value="4">4년차</option>
                        	<option value="5">5년차</option>
                        	<option value="6">6년차</option>
                        	<option value="7">7년차</option>
                        	<option value="8">8년차</option>
                        	<option value="9">9년차</option>
                        	<option value="10">10년 이상</option>
                        </select>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">언어</h4>
                        <div class="fw-tags">
							<form action="<c:url value='/corpSearch.do'/>" name="frmPage" method="post">
								<input type="text" name="currentPage">
								<input type="text" name="searchKeyword" value="${param.searchKeyword}">
								<input type="text" name="langNo" value="${param.langNo}">
								<input type="text" name="career" id="career" value="${param.career}">
							</form>
								<c:set var="k" value="0"/>
	                            <c:forEach var="lang" items="${langlist }">
		                            <div class="langTags">
		                            	<input type="checkbox" value="${lang.languageNo}"
		                            			name="langReSearch" id="${lang.languageName}"
		                            			onclick="reSearch(${lang.languageNo},${pagingInfo.currentPage})"
		                            			<c:forEach var="no" items="${langNo }">
		                            			<c:if test="${no == lang.languageNo}">
		                            				checked="checked"
		                            			</c:if>
		                            			</c:forEach>
                            			>
		                            			
		                            	<label for="${lang.languageName}" class="langName">${lang.languageName}</label>
		                           	</div>
		                           	<c:set var="k" value="${k+1 }"/>
	                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 ">
								<p>총 <span>${pagingInfo.totalRecord }</span>개의 검색 결과가 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                        <!-- 이력서 리스트 반복 -->
                        <c:if test="${empty resumeList}">
                        	<br><div class="center size_150 lightgray"><i class="fas fa-search"></i></div><br>
							<div class="center"><p>검색 결과가 없습니다.</p></div>
                        </c:if>
                        <c:if test="${!empty resumeList}">
                        	<c:forEach var="resume" items="${resumeList}">
                            <div class="col-lg-4 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <!-- <div class="sale pp-sale">구매한 이력서</div> -->
                                        <ul>
                                        	<li class="w-icon active" onclick="insertCart('${resume.resumesVo.resumeNo }')">
	                                            <a href="#"><i class="icon_bag_alt"></i></a>
                                            </li>
                                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
	                                    <c:if test="${resume.userExperience==0}">
			                            	<div class="catagory-name">신입</div>
			                            </c:if>
			                            <c:if test="${resume.userExperience!=0}">
			                                <div class="catagory-name">${resume.userExperience}년</div>
			                            </c:if>
			                                <a href="#">
			                                    <h5>${resume.resumesVo.resumeTitle }</h5>
			                                </a>
		                                <!-- 언어 리스트 -->
		                                <div class="product-price">
							                <c:forEach var="lang" items="${resume.langList}" >
				                                ${lang.languageName} 
											</c:forEach>
		                                </div>
		                                <!-- 희망 근무 지역 리스트 -->
		                                <div class="areaList">
		                                	<c:forEach var="area" items="${resume.areaList}">
		                                	<h5 class="wantedArea">${area.areaAdd1} ${area.areaAdd2}</h5>
		                 		    	</c:forEach>
		                                </div>
                                    </div>
                                </div>
                            </div>
						    </c:forEach>
                        </c:if>
                        </div>
                    </div>
                    <!-- 페이징처리 -->
                     <div class="col-lg-12">
						 <div class="product__pagination blog__pagination">
						 	<c:if test="">	
								<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
									<i class="fa fa-long-arrow-left"></i>
								</a>
							</c:if>
						
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
							
							<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
								<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
									<i class="fa fa-long-arrow-right"></i>
								</a>
							</c:if>
						    </div>
						</div>
                    <!-- 페이징처리 -->
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->
    <!-- Js Plugins -->
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.countdown.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.nice-select.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.zoom.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.dd.min.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery.slicknav.js"/>"></script>
    <script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
    <script src="<c:url value="/resources/js/main.js"/>"></script>
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/check.js"/>" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/a86f09c0f4.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
    //[3]결과 내 재검색
    function reSearch(langNo, curPage){
    	var reSearchLangNoList=[];
    	$('input[name=langReSearch]:checked').each(function(){
    		reSearchLangNoList.push($(this).val());
    	});
    	
    	$('input[name=currentPage]').val(curPage);
    	$('input[name=langNo]').val(reSearchLangNoList);
    	$('form[name=frmPage]').submit();
    }
    
    var year = document.getElementById("careerYear");
	function careerYear(curPage){
		 alert('선택된 옵션 value 값=' + year.options[year.selectedIndex].value);
		 var selectYear = year.options[year.selectedIndex].value
		 $('input[name=currentPage]').val(curPage);
		 $('input[name=career]').val(selectYear);
		 $('form[name=frmPage]').submit();
	}
    
    ///[2] 페이징처리
	function pageFunc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	//[1] 장바구니 담기
	function insertCart(no){
		insertResume(no);
		event.preventDefault();
	}
	
	//[1] 장바구니 담기 아작스 요청
	function insertResume(no) {
		var no = no;
		$.ajax({
			url : "<c:url value='/shop/insertCartAjax.do'/>",
			type : "GET",
			data : {
				resumeNo : no
			},
			dataType : "json",
			success : function(res) {
				if (res == 1) {
					alert('이력서를 장바구니에 담았습니다.');
				} else if (res == 2) {
					alert('이미 장바구니에 담긴 이력서입니다.');
				} else {
					alert('이력서를 장바구니에 담을 수 없습니다.');
				}
			},
			error : function(xhs, status, error) {
				alert('error : ' + error);
			}
		});
	}
	
</script>
<%@ include file="../../inc/bottom.jsp"%>