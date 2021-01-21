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
    <style type="text/css">
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
		
		.shopping-cart spad {
			padding-top:30px;
		}
    </style>
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
    <script src="<c:url value="/resources/js/paging.js"/>" type="text/javascript"></script>
    <script type="text/javascript">
    var totalCount=0;
    
	    $(function(){
			$('#searchBtn').click(function(){
				if($('#searchName').val().length<1){
					alert('검색하실 기업의 법인명을 입력하세요');
					$('#searchName').focus();
					return false;
				}
				
				$.send(1);
				
				event.preventDefault();
			});
		});
		
	    //[1] 아작스 요청
	    $.send=function(curPage){
	    	$('#currentPage').val(curPage);
	    	$.ajax({
	    		url:"<c:url value='/company/corp/corpSearch.do'/>",
	    		type:"GET",
	    		data:{
	    			searchCorpName:$('#searchName').val(),
	    			currentPage:$('#currentPage').val()
	    		},
	    		dataType:"xml",
	    		success:function(xmlStr){
	    			totalCount=$(xmlStr).find('totalCount').html();
	    			$('#total').html(totalCount);
	    			
	    			var resultCode=$(xmlStr).find('resultCode').text();
	    			var resultMsg=$(xmlStr).find('errMsg').text();
	    			
	    			if(resultCode!=00){
	    				alert(resultMsg);
	    			}else{
	    				if(xmlStr!=null){
	    					$.makeList(xmlStr);
	    					$.pageMake();
	    				}
	    			}
	    		},
	    		error:function(xhs, status, error){
					alert('error : '+error);
				}
	    	});
	    }
	    
	    //기업 리스트 만들기
	    $.makeList=function(xmlStr){
	    	if(totalCount==0){
	    		$('#total').html("");
	    		$('#divList').html("<p style='text-align:center'>검색된 내용이 없습니다.</p>");
	    		return;
	    	}
	    	
	    	$('#total').html("<p>기업 정보 조회 결과 ("+totalCount+"건)</p>");
	    	
	    	var str="<div class='cart-table'> <table>";
	    	str+="<tr><th>기업명</th>";
	    	str+="<th>사업자 등록 번호</th>";
	    	str+="<th>대표자 성함</th></tr>";
	    	
	    	$(xmlStr).find('item').each(function(idx,item){
	    		var corpNm = $(this).find("corpNm").text();
	    		var enpRprFnm = $(this).find("enpRprFnm").text();
	    		var crno = $(this).find("crno").text();
	    		var enpEmpeCnt =$(this).find("enpEmpeCnt").text();
	    		var enpPn1AvgSlryAmt =$(this).find("enpPn1AvgSlryAmt").text();
	    		var enpBsadr=$(this).find("enpBsadr").text();
	    		var enpDtadr=$(this).find("enpDtadr").text();
	    		var enpHmpgUrl=$(this).find("enpHmpgUrl").text();
	    		var smenpYn=$(this).find("smenpYn").text();
	    		var enpTlno=$(this).find("enpTlno").text();
	    		var enpEstbDt=$(this).find("enpEstbDt").text();
	    		
	    		str+="<tr>";
	    		str+="<td style='padding-bottom: 10px; padding-top: 10px;'>  <a href='#' onclick='setCorp(\""+corpNm+"\",\""+enpRprFnm+"\",\""+crno+"\",\""+enpEmpeCnt+"\",\""+enpPn1AvgSlryAmt+"\",\""+enpBsadr+"\",\""+enpDtadr+"\",\""+enpHmpgUrl+"\",\""+smenpYn+"\",\""+enpTlno+"\",\""+enpEstbDt+"\" )'> "+corpNm+"</a></td>";
	    		str+="<td style='padding-bottom: 10px; padding-top: 10px;'>"+crno+"</td>";
	    		str+="<td style='padding-bottom: 10px; padding-top: 10px;'>"+enpRprFnm+"</td>";
	    		str+="</tr>";
	    	});//each
	    	str+="</div> </table>";
	    	$('#divList').html(str);
	    }
	    
	    //페이징 처리
	    $.pageMake=function(){
			var blockSize=10;
			pagination($('#currentPage').val(), 10, blockSize, totalCount);
			
			var str="";
			str+=" <div class='col-lg-12'> <div class='product__pagination blog__pagination'>"
			//이전블럭
		 	if(firstPage>1){	
				str+="<a href='#' onclick='$.send("+(firstPage-1)+")'>";
				str+="<i class='fa fa-long-arrow-left'></i></a>";
		 	}
		 	
		 	/*1 2 3 4 5 6 7.. 10*/
			for(var i=firstPage; i<=lastPage;i++){
				if (i==currentPage){
					str+="<span id='currentPage'>"+i+"</span>";
				}else{
					str+="<a href='#' onclick='$.send("+i+")'>"+i+"</a>";
					
				}
			}
			
			//다음블럭으로 이동
			if(lastPage < totalPage){
				str+="<a href='#' onclick='$.send("+(lastPage+1)+")'>";
				str+="<i class='fa fa-long-arrow-right'></i></a>";
			}
			str+="</div></div>"
			$('#divPage').html(str);
	    }
	    
	    
	    //클릭하면 부모페이지에 값 넣어주기
	    function setCorp(corpNm, enpRprFnm, crno, enpEmpeCnt, enpPn1AvgSlryAmt, enpBsadr, enpDtadr,enpHmpgUrl,smenpYn,enpTlno,enpEstbDt){
			$(opener.document).find('#corpName').val(corpNm);
			$(opener.document).find('#corpHeadname').val(enpRprFnm);
			$(opener.document).find('#corpCorpaddnumber').val(crno);
			$(opener.document).find('#corpPnumber').val(enpEmpeCnt);
			$(opener.document).find('#corpAvrpay').val(enpPn1AvgSlryAmt);
			$(opener.document).find('#corpAddress1').val(enpBsadr);
			$(opener.document).find('#corpAddress2').val(enpDtadr);
			$(opener.document).find('#corpWebaddress').val(enpHmpgUrl);
			$(opener.document).find('#corpKind').val(smenpYn);
			$(opener.document).find('#corpTel').val(enpTlno);
			$(opener.document).find('#corpStardate').val(enpEstbDt);
			self.close();
		}
	    
    </script>
    
</head>
    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad" style="padding-top: 30px;padding-bottom: 30px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<div class="row">
                        <div class="col-lg-4">
                            <div class="discount-coupon">
                                <h4 style="padding-bottom: 20px; font-weight: 600;">기업명 검색</h4>
                                    <input type="text" placeholder="검색하실 기업 법인명을 입력하세요" value="${param.corpName }" id="searchName" name="searchCorpName" style="width: 560px; height: 46px;padding-left: 10px;">
                                    <input type="hidden" name="currentPage" value="1" id="currentPage">
                                    <button class="site-btn" id="searchBtn">검색</button>
                            </div>
                        </div>
                    </div>
                    <div id="total"></div>
                    <div id="divList"></div>
                    <div id="divPage"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->


</html>
