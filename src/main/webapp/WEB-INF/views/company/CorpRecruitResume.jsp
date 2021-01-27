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
	.col-lg-3 {
		float:left;
	}
	
	</style>


<!-- 채용공고별 이력서 시작 -->
 <c:if test="${empty rList}">
 	<div style="border: 1px solid #bbb; margin: 0px 60px 60px; border-style: dashed; border-radius: 20px; text-align: center;">
 	<img src='<c:url value='/resources/img/empty2.jpg'/>' style="width: 10%;margin-top: 60px;">
 	<h2 style="font-weight: 600; color: #666; margin-top: 40px; margin-bottom: 20px;">아직 등록된 채용 공고가 없습니다.</h2>
 	<p style="margin-bottom: 0px;">채용 공고를 추가하시면 추천 이력서와 지원이력서를 보실 수 있습니다.</p>
 	<p style="margin-bottom: 60px;">(단, 채용 공고를 추가 하기 위해서는 기업 승인을 받아야 합니다.)</p>
 	</div>
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
                     
                    <div id="resume" class="col-lg-10 offset-lg-1" >
                    
                	</div>
                	
            </div>
        </div>
    </section>
    <!--채용 공고별 추천 이력서 끝-->
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
		var firstRnum = $('.rList:first').find("input").val();
		$('.rList').filter(':first').attr("class","active");
		if (firstRnum!=null) {
			send2(firstRnum	);
		};
		
		//클릭하면 다른 이력서 보여주기
		$('.rList').each(function(index,item){
			$(this).click(function(){
				$(this).siblings('li').removeClass('active');
				$(this).attr("class","active");
				var rNum = $(this).find("input").val();
				send2(rNum);
			});
		});
	});
	
	function send2(no){
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
	               str+="<p style='text-align: center; font-size: 17px; margin-bottom: 10px;'>총 <bold style='font-weight: 800; color: #4750D6;'>"+res.length+"</bold>명의 지원자가 이력서를 제출했습니다</p>";
	            	str+="<div style='border-bottom: 2px solid #4750d6;width: 8%;margin: auto;margin-bottom: 40px;'>"
	               str+="<p style='text-align: center;margin-bottom: 2px;'><a href=# id='goResumesAll' style='text-align:center;'>전체 보기</a></p>";
	               str+="</div>"
	               $(res).each(function(){
	                  //str+="이력서 번호 : "+this.appReUsView.resumeNo+"<br>";
	                  str+="<div class='col-lg-3'>";
	                  str+="<div class='product-item'>";
	                  str+="<div class='pi-pic'>";
                      str+="</div>";
                      str+="<div class='pi-text'>";
                      str+="<div class='catagory-name'>"+this.appReUsView.userExperience+"년</div>";
                      str+="<a href='#'><h5>"+this.appReUsView.resumeTitle+"</h5></a><div class='product-price'>";
                      $(this.languageList).each(function(){
                         str+=this.languageName+"&nbsp;&nbsp;&nbsp;";
                      });
                      str+="</div></div></div></div></div>";
	               })
	               str+="</div>";
	               $('#resume').html(str);
	            }else{
	            	str+="<div style='text-align:center; margin-bottom:30px;'>";
	            	str+="<img src='/workit/resources/img/empty.jpg' style='width: 17%; margin-top: 50px;'>";
	            	str+="</div>";
	            	str+="<p style='text-align: center; font-size: 17px; margin-bottom: 10px;color: #bbb;'>앗, 이런... 아직 지원자가 없습니다.</p>";
	            	$('#resume').html(str);
	            }
	         },
	          error:function(xhs, status, error){
	            alert('error : '+error);
	         }
	      });
	      return str;
		
	};
	</script>