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
    <style>
    .product-item {
    	position:relative;
    }
	.pi-text{
	  	position: absolute;
		left: 30px;
    	top: 30px;
	}
	.col-lg-5 {
		float:left;
	}
	
	</style>


<!-- 채용공고별 이력서 시작 -->
 <c:if test="${empty rList}">
 	<p>등록된 채용 공고가 없습니다. 채용공고를 추가해주세요(링크와 이미지 추가 예정)</p>
 </c:if>

<c:if test="${!empty rList}">
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-large set-bg" data-setbg="<c:url value='/resources/img/products/women-large.jpg'/>">
                        <h2>채용 공고별 지원자 현황</h2>
                        <a href="#">More</a>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="filter-control">
                        <ul>
                        	<!-- 사용자가 등록한 채용공고 리스트 보기 : 없으면 영역전체 안보여줌 -->
                        	<!-- 클릭시 해당 공고의 채용 공고만 볼 수 있도록 ajax로 처리 -->
                            <c:forEach var="rMap" items="${rList }">
	                            <li class="rList">
	                            	${rMap['RECRUITANNOUNCE_TITLE']}
	                            	<input class="rNum" type="hidden" value="${rMap['RECRUITANNOUNCE_NO']}">
	                            </li>
                            </c:forEach>                           	
                        </ul>
                    </div>
                     
                    <div id="resume" class="col-lg-12"style="padding-left: 300px;">
                	</div>
                	
            </div>
        </div>
    </section>
    <!--채용 공고별 추천 이력서 끝-->
    
    
	<!-- 맞춤 인재 추천 -->
    <section class="man-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="filter-control">
                    </div>
                    <div class="product-slider owl-carousel">
                    <!-- 이력서 반복 시작 -->
						<div class="product-item">
                            <div class="pi-pic">
                                <ul>
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">year</div>
                                <a href="#">
                                    <h5>title</h5>
                                </a>
                                <div class="product-price">
                                    language
                                </div>
                            </div>
                        </div>
                        <!-- 이력서 반복 끝-->
						<div class="product-item">
                            <div class="pi-pic">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">3년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>3년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
						<div class="product-item">
                            <div class="pi-pic">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">3년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>3년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
						<div class="product-item">
                            <div class="pi-pic">
                                <ul>
                                	<!-- 장바구니 담기 float버튼 기능, ajax처리 -->
                                    <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                    <!-- 이력서 미리보기 기능 -->
                                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                            	<!-- 경력이 들어갈 것임 -->
                                <div class="catagory-name">3년</div>
                                <!-- 지원서 제목이 들어갈 것임 -->
                                <a href="#">
                                    <h5>3년차 웹 개발자입니다.</h5>
                                </a>
                                <!-- 사용 언어가 들어갈 것임 최대 4개 -->
                                <div class="product-price">
                                    JAVA, SQL, PL/SQL, PYTHON
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="product-large set-bg m-large" data-setbg="<c:url value='/resources/img/products/man-large.jpg'/>">
                        <h2>맞춤 이력서<br>추천</h2>
                        <a href="#">More</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 맞춤인재추천끝 -->
   </c:if>
    
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
    
    <script src="<c:url value="/resources/js/jquery-3.5.1.min.js"/>"></script>
	<script type="text/javascript">
	$(function(){
		//클릭이 없을때 첫번째 이력서 보여주기
		//.rList의 첫번재 클래스 의 input을 값으로 넣어주기  
		var firstRnum = $('.rList:first').find("input").val();
		//성공
		
		//클릭하면 다른 이력서 보여주기
		$('.rList').each(function(index,item){
			$(this).click(function(){
				$('.rList').removeClass();
				$(this).attr("class","active");
				var rNum = $(this).find("input").val();
				$.send(rNum);
			});
		});
		//ajax요청
		$.send=function(no){
			var data = 'recruitannounceNo='+no;
			var str="";
			$.ajax({
				url:"<c:url value='/company/selectResumeView.do'/>",
				type:"get",
				data:data,
				dataType:'json',
				success:function(res){
					/*
					{"appReUsView":{"applicantlistNo":1,"userNo":6,"resumeNo":2,"recruitannounceNo":4,"applicantlistDate":1611579683000,"applicantlistPapercheck":3,
					"recruitannounceTitle":null,"recruitannounceSworkkind":null,
					"recruitannounceSpay":null,"resumeTitle":"홍길동_1","userExperience":"1"},
					"areaList":[{"resumeNo":2,"areaNo":105,"areaAdd1":"경기","areaAdd2":"구리시"}],
					"languageList":[{"resumeNo":2,"languageNo":1,"languageName":"JAVA"}]}
					*/
					$('#resume').html("");
					if(res.length>0){
						str+="<p style='text-align: center; padding-right: 230px;'>총 "+res.length+"명의 지원자가 이력서를 제출했습니다 <a>전체 보기</a></p>";
						$(res).each(function(){
							//str+="이력서 번호 : "+this.appReUsView.resumeNo+"<br>";
							str+="<div class='col-lg-5'>";
							str+="<div class='product-item'>";
							str+="<div class='pi-pic'>";
							str+="<ul>";
							str+="<li class='w-icon active'><a href='#'><i class='icon_bag_alt'></i></a></li>";
                            str+="<li class='quick-view'><a href='#'>+ Quick View</a></li></ul></div>";
                            str+="<div class='pi-text'>";
                            str+="<div class='catagory-name'>"+this.appReUsView.userExperience+"년</div>";
                            str+="<a href='#'><h5>"+this.appReUsView.resumeTitle+"</h5></a><div class='product-price'>";
                            $(this.languageList).each(function(){
                            	str+=this.languageName+"  ";
                            });
                            str+="</div></div></div></div></div>";
						})
						str+="</div>";
						$('#resume').html(str);
					}
				},
	    		error:function(xhs, status, error){
					alert('error : '+error);
				}
			});
			return str;
		}
	});

	</script>