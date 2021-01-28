<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- Css Styles -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/themify-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/elegant-icons.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/nice-select.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/slicknav.min.css"/>" type="text/css">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css">

	<!-- 맞춤 이력서 추천 : 기업이 등록한 채용공고의 경력, 지역, 언어로 매칭함 : 추천할 이력서가 있을때만 보여줌 -->
 <c:if test="${!empty matchingList}">
    <section class="man-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="filter-control">
                    </div>
                    <div class="product-slider owl-carousel">
                    <!-- 이력서 반복 시작 -->
                    	<c:forEach var='matchVo' items='${matchingList }'>
							<div class="product-item">
	                            <div class="pi-pic">
	                                <ul>
	                                    <li class="w-icon active" onclick="insertCart('${matchVo.resumesVo.resumeNo }')">
		                                    <input type="hidden" value="${matchVo.resumesVo.resumeNo }" class="resumeNo">
	                                    	<a href="#">
	                                    		<i class="icon_bag_alt"></i>
                                    		</a>
                                   		</li>
	                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
	                                </ul>
	                            </div>
	                            <div class="pi-text">
	                            <c:if test="${matchVo.userExperience==0}">
	                            	<div class="catagory-name">신입</div>
	                            </c:if>
	                            <c:if test="${matchVo.userExperience!=0}">
	                                <div class="catagory-name">${matchVo.userExperience}년</div>
	                            </c:if>
	                                <a href="#">
	                                    <h5>${matchVo.resumesVo.resumeTitle }</h5>
	                                </a>
	                                <!-- 언어 리스트 -->
	                                <div class="product-price">
						                <c:forEach var="lang" items="${matchVo.langList}" >
			                                    ${lang.languageName} 
										</c:forEach>
	                                </div>
									
	                            </div>
	                        </div>
                    	</c:forEach>
                    
                        <!-- 이력서 반복 끝-->
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="product-large set-bg m-large" data-setbg="<c:url value='/resources/img/products/man-large.jpg'/>"
                    	style="height: 400px;padding-top: 120px;" >
                        <h2>맞춤 이력서<br>추천</h2>
                        <a href="#">More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </c:if>
    <!-- 맞춤인재추천끝 -->
    
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

 function insertCart(no){
		insertResume(no);
		event.preventDefault();
	}
	
    //[1] 아작스 요청
   function insertResume(no){
    	var no = no;
    	$.ajax({
   			url:"<c:url value='/shop/insertCartAjax.do'/>",
    		type:"GET",
    		data:{
    			resumeNo:no
    		},
    		dataType:"json",
    		success:function(res){
    			if(res==1){
    				alert('이력서를 장바구니에 담았습니다.');
    			}else if(res==2){
    				alert('이미 장바구니에 담긴 이력서입니다.');
    			}else{
    				alert('이력서를 장바구니에 담을 수 없습니다.');
    			}
    		},
    		error:function(xhs, status, error){
				alert('error : '+error);
			}
    	});
    }
	
 </script>