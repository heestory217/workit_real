<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
    <style>
    .product-item {
    	position:relative;
    }
	.pi-text{
	  	position: absolute;
		left: 30px;
    	top: 30px;
	}
	.col-lg-3 {
		float:left;
	}
	
	.product-item .pi-text{
		width:75%;
	}
	.product-item .pi-pic .sale.pp-sale{
		top: 0px;
	    width: 100%;
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
                        <h4 class="fw-title">직군</h4>
                        <ul class="filter-catagories">
                            <li><a href="#">Men</a></li>
                            <li><a href="#">Women</a></li>
                            <li><a href="#">Kids</a></li>
                        </ul>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">지역 설정</h4>
                        <div class="fw-size-choose">
                            <div class="sc-item">
                                <input type="radio" id="s-size">
                                <label for="s-size">s</label>
                            </div>
                            <div class="sc-item">
                                <input type="radio" id="m-size">
                                <label for="m-size">m</label>
                            </div>
                            <div class="sc-item">
                                <input type="radio" id="l-size">
                                <label for="l-size">l</label>
                            </div>
                            <div class="sc-item">
                                <input type="radio" id="xs-size">
                                <label for="xs-size">xs</label>
                            </div>
                        </div>
                    </div>
                    <div class="filter-widget">
                        <h4 class="fw-title">언어</h4>
                        <div class="fw-tags">
                            <a href="#">JAVA</a>
                            <a href="#">Python</a>
                            <a href="#">C/C++</a>
                            <a href="#">JavaScript</a>
                            <a href="#">SQL</a>
                            <a href="#">Men's hats</a>
                            <a href="#">Backpack</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-show-option">
                        <div class="row">
                            <div class="col-lg-7 ">
								<p>총 <span>${resumeList.size() }</span>개의 검색 결과가 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
                        <div class="row">
                        <!-- 이력서 리스트 반복 -->
                        <c:if test="${empty resumeList}">
                        	<h2>검색된 이력서가 없습니다.</h2>
                        </c:if>
                        <c:if test="${!empty resumeList}">
                        	<c:forEach var="resume" items="${resumeList}">
                            <div class="col-lg-4 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <div class="sale pp-sale">구매한 이력서</div>
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
						<form action="<c:url value='/corpSearch.do'/>" name="frmPage" method="post">
							<input type="hidden" name="currentPage">
							<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
						</form>
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