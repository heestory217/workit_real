<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Work IT | 개발자를 위한 취업 사이트</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

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
    <script type="text/javascript">
	    $(function(){
			$('#submit').click(function(){
				if($('#searchName').val().length<1){
					alert('법인명을 입력하세요');
					$('#searchName').focus();
					event.preventDefault();
				}
			});
		});
		
	    function setCorp(address, zipcode){
			$(opener.document).find('#zipcode').val(zipcode);
			$(opener.document).find('').val(address);
			self.close();
		}
    </script>
</head>
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<div class="row">
                        <div class="col-lg-4">
                            <div class="discount-coupon">
                                <h6>기업명 검색</h6>
                                <form action="#" class="coupon-form">
                                    <input type="text" placeholder="검색하실 기업 법인명을 입력하세요" value=${param.corpName } id='searchName'>
                                    <button type="submit" class="site-btn coupon-btn" id="submit">검색</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="cart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="p-name">법인명</th>
                                    <th>사업자 등록 번호</th>
                                    <th>설립 일자</th>
                                    <th>대표 주소</th>
                                    <th>상세 주소</th>
                                    <th>대표자 성함</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- 기업 정보 반복 -->
                                <tr>
                                    <td class="cart-title first-row">
	                                    <a href="#" onclick="setCorp('','')">
	                                        <h6>메리츠자산운용</h6>
	                                    </a>
                                    </td>
                                    <td class="p-price first-row" id="">1078708658</td>
                                    <td class="qua-col first-row" id="">2008년 05월 06일</td>
                                    <td class="qua-col first-row" id="">서울특별시 종로구 북촌로 104</td>
                                    <td class="qua-col first-row" id="">계동 빌딩 10층</td>
                                    <td class="qua-col first-row" id="">John Lee(이정복)</td>
                                </tr>
                            <!-- 기업 정보 반복 -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->


</html>
