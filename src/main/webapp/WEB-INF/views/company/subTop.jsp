<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 기업 subTop -->
 <div class="col-lg-8 col-md-8">
     <div class="advanced-search">
         <div class="input-group">
             <input type="text" placeholder="이력서를 직군, 언어, 이름으로 검색" id="searckKeyword" value="${param.searchKeyword }">
          	 <button type="button" id="searchBtn" onclick="search()"><i class="ti-search"></i></button>
         </div>
     </div>
 </div>
<div class="col-lg-2 text-right col-md-2">
     <ul class="nav-right">
     	<!-- 쪽지함 : 아이콘 바꿔야함 -->
         <li class="heart-icon">
             <a href="<c:url value='/message/messageBox.do'/>">
                 <i class="fa fa-envelope-o" aria-hidden="true"></i>
                 <!-- 안읽은 메시지 갯수 표현: <span>1</span>  : 최대값 표현 : +99 -->
             </a>
         </li>
     	<!-- 장바구니 -->
         <li class="cart-icon" onmouseover="showCart(${sessionScope.userNo})">
             <a href="#" id="miniCartQty">
                 <i class="icon_bag_alt"></i>
             </a>
             <div class="cart-hover">
                 <div class="select-items">
                     <table>
                         <tbody id="miniCart">
                         <!-- 장바구니에 담은 이력서 최대 3개 반복 ajax -->
                         
                         <!-- 장바구니에 담은 이력서 반복끝 -->
                         </tbody>
                     </table>
                 </div>
                 <div class="select-total">
                     <span>total:</span>
                     <h5 id="totalCount"></h5>
                 </div>
                 <div class="select-button">
                     <a href="<c:url value='/shop/shoppingCart.do'/>" class="primary-btn view-card">장바구니 보러가기</a>
                     <a href="<c:url value='/shop/checkOut.do'/>" class="primary-btn checkout-btn">바로 결제하기</a>
                 </div>
             </div>
         </li>
     </ul>
 </div>
 </div>
 </div>
 </div>
  <!-- 네비게이션 시작-->
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>직군별 탐색</span>
                        <ul class="depart-hover">
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=서버 개발자'/>">서버 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=웹 개발자'/>">웹 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=자바 개발자'/>">JAVA 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=프론트엔드 개발자'/>">프론트엔드 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=안드로이드 개발자'/>">안드로이드 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=IOS 개발자'/>">iOS 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=빅데이터 엔지니어'/>">빅데이터 엔지니어</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=소프트웨어 엔지니어'/>">소프트웨어 엔지니어</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=머신러닝 엔지니어'/>">머신러닝 엔지니어</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=유니티 개발자'/>">유니티 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=Node.js 개발자'/>">Node.js 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=C,C++ 개발자'/>">C,C++ 개발자</a></li>
                            <li><a href="<c:url value='/corpSearch.do?searchKeyword=VR 엔지니어'/>">VR 엔지니어</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="<c:url value='/corpSearch.do'/>">이력서 탐색</a></li>
                        <li><a href="<c:url value='/recruit/recruitwrite.do'/>">채용 공고 등록</a></li>
                        <li><a href="#">기업 관리</a>
                            <ul class="dropdown">
                                <li><a href="<c:url value='/company/corp/corpDetail.do?corpNo=${corpNo}'/>">기업 정보</a></li>
                                <li><a href="#">채용 공고 관리</a></li>
                            </ul>
                        </li>
                        <li><a href="#">지원자 관리</a>
                            <ul class="dropdown">
                                <li><a href="#">전체지원자</a></li>
                                <li><a href="#">공고별지원자</a></li>
                                <li><a href="#">입사지원제한</a></li>
                            </ul>
                        <li><a href="#">인재 관리</a>
                            <ul class="dropdown">
                                <li><a href="<c:url value='/company/HRManagment/positionSuggest.do'/>">포지션제안</a></li>
                                <li><a href="<c:url value='/company/HRManagment/purchasedResumes.do'/>">구매 이력서</a></li>
                            </ul>
                        </li>
                        <li><a href="#">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="<c:url value='/companyMypage/companyMypageEdit.do'/>">회원 정보 수정</a></li>
                                <li><a href="<c:url value='/companyMypagecompanyPayment.do'/>">유료 결제 내역</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
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
    $(function(){
    	userNo=$('#userNoforCart').val();
    });
    
    //검색
   	function search(){
    	var searchKeyword = document.getElementById("searckKeyword").value;
   		location.href="/workit/corpSearch.do?searchKeyword="+searchKeyword;
   	}

   	//장바구니에 최근 담은 이력서 보여주기
   	function showCart(userNo){
   		$('.cart-hover').show();
   		CartList(userNo);
   	}

	
   	function delResume(cartNo){
   		alert(cartNo);
   	}
   	
   	//장바구니 리스트 ajax
	function CartList(userNo){
		$.ajax({
		   url:"<c:url value='/shop/miniCart.do'/>",
		   type:"GET",
		   data: "userNo="+userNo,
		   dataType:"json",
		   success:function(res){
			/*
			[{"shoppingCartNo":6,"userNo":5,"resumeNo":4,"userName":"최보미","resumeTitle":"최보미_1","userExperience":"7","workkindName":"서버 개발자","paidServicePrice":2000},
			{"shoppingCartNo":7,"userNo":5,"resumeNo":1,"userName":"김길동","resumeTitle":"김길동_1","userExperience":"3","workkindName":"서버 개발자","paidServicePrice":2000},
			{"shoppingCartNo":8,"userNo":5,"resumeNo":7,"userName":"박나은","resumeTitle":"박나은_1","userExperience":"0","workkindName":"서버 개발자","paidServicePrice":2000},
			{"shoppingCartNo":9,"userNo":5,"resumeNo":2,"userName":"홍길동","resumeTitle":"홍길동_1","userExperience":"1","workkindName":"서버 개발자","paidServicePrice":2000}]
			 */
			   	var str="";
			   	var qty=0;
			   	if(res.length>0){
					$.each(res, function(idx, item){
						str+="<tr> <td class='si-text'> <div class='product-selected'> <p>";
						str+=this.resumeTitle;
						str+="</p>";
						str+="<h6>"
						var userexp;
						if(this.userExperience==='0'){
							userexp="신입";
						}else{
							userexp=this.userExperience+"년";
						}
						str+=userexp+", "+this.workkindName;
						str+="</h6></div></td>";
						str+="</tr>";
					});
					$('#miniCart').html(str);
					var total = (res.length*2000);
					$('#totalCount').html(numberWithCommas(total)+"원");
				}else{
					str+="<p>장바구니가 비어있습니다.</p>";
					$('#miniCart').html(str);
				}//if
		 	},
		   error:function(xhs, status, error){
		      alert('error : '+error);
		   }
		});
   	}//CartList 

   	
	//숫자 (#,###) 표현 함수
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
    </script>
