<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp"%>
<!-- 기업 상세 Section Begin -->
<style type="text/css">
.blog-details-inner .blog-quote p:before {
	display: none
}
.blog-details-inner .blog-quote p span{
	font-size: 20px;
	}

.card-text {
 margin-bottom: 35px;
	}

#mask {
      position:absolute;
      z-index:9000;
      background-color:#000;
      display:none;
      left:0;
      top:0;
    }
    
.window{
  display: none;
  position:absolute;
  left:100px;
  top:100px;
  z-index:10000;
	}
	
</style>
<section class="blog-details spad">
    <div class="container">
        <div class="row">
         <c:if test="${cVo.corpOkcheck==2}">
        	<div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cVo.corpName}</h2>
                        <p>${cVo.corpIndustry}<span> - ${cVo.corpStartdate}</span></p>
                    </div>
               </div>
       	   		<div class="blog-quote">
                  <p style="font-size: 2.2em;text-align: center;">
                  '${cVo.corpName}'<span>은(는)<br><br> 기업 등록 반려되었습니다.<br><br>쪽지함에서 반려사유를 확인할 수 있습니다.</span>
                  </p>
              </div>
           </div>
        </c:if>
        <c:if test="${cVo.corpOkcheck==0}">
        	<div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cVo.corpName}</h2>
                        <p>${cVo.corpIndustry}<span> - ${cVo.corpStartdate}</span></p>
                    </div>
               </div>
       	   		<div class="blog-quote">
                  <p style="font-size: 2.2em;text-align: center;">
                  '${cVo.corpName}'<span>은(는)<br><br> 현재 기업 등록 심사중입니다.</span>
                  </p>
              </div>
           </div>
        </c:if>
        <c:if test="${cVo.corpOkcheck==1}">
            <div class="col-lg-12">
                <div class="blog-details-inner">
                    <div class="blog-detail-title">
                       	<img src="<c:url value='/pd_images/${cVo.corpImgurl }'/>" style="width: 50px;margin-bottom: 20px;"><br>
                        <h2>${cVo.corpName}</h2>
                        <p>사업 분야 : ${cVo.corpIndustry}<span> - 설립일 : ${cVo.corpStartdate} </span></p>
                    </div>
	                    <c:if test="${!empty imgList}">
                        	<c:forEach var="imgList" items="${imgList }" begin="0" end="0">
			                    <div class="blog-large-pic">
			                        <img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
			                    </div>
                        	</c:forEach>
                        </c:if>
                    <div class="blog-detail-desc">
                        <p>
                        </p>
                    </div>
	                    <div class="blog-quote">
	                        <p style="font-size: 2.2em;text-align: center;">
	                        '${cVo.corpName}'<span>
	                        <c:if test="${cVo.corpAvrpay!=0}">
	                        	의 1인당 평균연봉은 </span><fmt:formatNumber value="${cVo.corpAvrpay}" pattern="#,###,###"/> 만원, <br><br>
	                        </c:if>
	                        <c:if test="${cVo.corpPnumber!=0}">
	                        	<span>기업 근로자 수는</span> 총  ${cVo.corpPnumber}명
	                        </c:if>
	                        <c:if test="${!empty cVo.corpKind}">
	                        	<span>인 중소기업 입니다.</span>
	                        </c:if>
	                        <c:if test="${empty cVo.corpKind}">
	                        <span>입니다.</span>
	                        </c:if>
	                        </p>
	                    </div>
                    <div class="blog-more">
                        <div class="row">
                        <c:if test="${!empty imgList}">
                        	<c:forEach var="imgList" items="${imgList }" begin="1" end="3">
	                        	<div class="col-sm-4">
	                        	 <a href="#" class="openMask">
	                                <img src="<c:url value='/pd_images/${imgList.corpimgUrl}'/>">
                              	</a>
	                            </div>
                        	</c:forEach>
                        </c:if>
                        </div>
                    </div>
                    <div class="blog-detail-desc">
                     	${cVo.corpIntro}
                    </div>
                    <div class="tag-share">
	                    <div class="col-lg-9">
	                        <div class="details-tag">
	                            <ul>
	                                <li><i class="fa fa-tags"></i></li>
	                                <li><a href="http:&#x2F&#x2F${cVo.corpWebaddress}">${cVo.corpWebaddress}</a></li>
	                                <li>${cVo.corpAddress1}</li>
	                                <li>${cVo.corpTel}</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <!-- 해당 기업이 로그인한 유저와 일치할때만 보여주기! c:if 추가-->
	                    <c:if test="${cVo.userNo eq sessionScope.userNo }">
                    	<a href="<c:url value="/company/corp/corpEdit.do?corpNo=${cVo.corpNo }"/>"><button style="float: right;" class="site-btn">기업 정보 수정</button></a>
                    	</c:if>
                    </div>
                    <input type="hidden" id="corpNo" value="${cVo.corpNo}">
                    <input type="hidden" id="corpUserNo" value="${cVo.userNo}">
					
					<!-- 채용중인 포지션 리스트 -->
                    <c:import url="/company/corp/corpRecruitList.do">
                    	<c:param name="corpNo" value="${cVo.corpNo}"></c:param>
                    </c:import>
					<!-- 채용중인 포지션 리스트 끝-->
                    <hr>
					<!-- 기업 리뷰 리스트 -->
					<c:import url="/company/corp/corpReviewList.do">
                    	<c:param name="corpNo" value="${cVo.corpNo}"></c:param>
                    </c:import>
					<!-- 기업 리뷰 끝 -->
                </div>
            </div>
            </c:if>
        </div>
    </div>
    <div id="mask"></div>
    <div class="window">
    	<div class="center" id="center">
        	<input type="button" href="#" class="close" value="X"/>
        </div>
    </div>
   
</section>
<!-- 기업 상세 Section End -->
<script type="text/javascript">
function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();  

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({'width':maskWidth,'height':maskHeight});  

    //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
    $('#mask').fadeIn(300);
    $('#mask').fadeTo("fast",0.7);    

    //윈도우를 띄운다.
    $('.window').show();
}

$(document).ready(function(){
    //검은 막 띄우기
    $('.openMask').click(function(e){
        e.preventDefault();
        var imgUrl = jQuery($(this).find('img')).attr("src");
        var windowWidth = $(window).width();  
        $('.center').append("<img src='"+imgUrl+"' id='bigImg'>");
        $('.center').css({"width":"1000px","position":'absolute',
        				"top":(($(window).height()-$('.center').outerHeight())/2+$(window).scrollTop())-500+"px",
        				"left":(windowWidth)/7+"px"
        				});
        wrapWindowByMask();
    });

    //닫기 버튼을 눌렀을 때
    $('.window .close').click(function (e) {
        //링크 기본동작은 작동하지 않도록 한다.
        $('#bigImg').remove();
        $('#mask, .window').hide();
        e.preventDefault();
    });       

    //검은 막을 눌렀을 때
    $('#mask').click(function () {
        $(this).hide();
        $('#bigImg').remove();
        $('.window').hide();
    });
});

</script>

<%@ include file="../../inc/bottom.jsp"%>