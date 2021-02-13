<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>

.listDiv{
	height:auto;	
}

.title > p{
	font-size:28px;
	color:#4C4747;
    margin: 35px 0px;

}

.regdate{
    margin-right: 20px;
}

.cellBx{
    color: #969696;
    font-size: 14px;
}

.content{
	font-size:15px;
}

.title, .content, .cellBx{
	padding:0 10px;
}

#logo{
	float:right;
	margin: 30px 0 25px 0;
}

.filter-catagories > li:nth-child(2) > a{
	font-weight:bold;
	color:#4c50bb;
	font-size:18px;
}

.prev, .next{
    border: 1px solid #ecefff;
    width: 50%;
    height: 80px;
    padding: 20px 20px;
}


.prev{
	float:left;
	text-align:left;
}

.next{
	float:right;
	text-align:right;
}

.fa-chevron-right, .fa-chevron-left{
	font-size: 33px;
    color: #ecefff;
}

.prevTit, .nextTit{
    vertical-align: super;
    color:#6c718c;
    
}

.next:hover{
	color:#4C50BB;
	background: #f7f7f7;
}

.prev:hover{
	color:#4C50BB;
	background: #f7f7f7;
}

.content{
	color:black;
}
</style>


<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<a href="#"><i class="fa fa-home"></i> Home</a> <span>공지사항</span>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="faq-section spad">
	<div class="container">
		<div class="row">

			<!-- nav -->
			<div
				class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
				<div class="filter-widget">
					<c:import url="/common/cusServiceNav.do"></c:import>
				</div>
			</div>
			
			<div class="col-lg-9 order-1 order-lg-2 listDiv">
				<div class="container">
					<div>
						<h4>공지사항</h4><br>
					</div>
					<hr style="background-color:#4C4747;height:1px;margin-top:0px">
					<div class="title">
						<p><span>[${noticeOne['CLASSIFICATION_NAME']}]</span>${noticeOne['NOTICE_TITLE'] }</p>
					</div>
					<div class="cellBx">
						<span class="regdate">
							등록일 : <fmt:formatDate value="${noticeOne['NOTICE_DATE'] }" 
								pattern="yyyy.MM.dd"/>
						</span>
						<span class="readCount">조회수 : ${noticeOne['NOTICE_VIEW'] }</span>
					</div>
					<hr>
					<%		
						pageContext.setAttribute("newLine", "\n");
					%>
					<c:set var="content" 
						value="${fn:replace(noticeOne['NOTICE_ABOUT'], newLine, '<br>')}"/>
					<div class="content">
						<p>${content}</p>
					</div>
					<img id="logo" alt="work it 로고" src="<c:url value='/resources/img/logo_workit.PNG'/>">
					<hr style="clear:both;">
					<div class="prev">
						<c:if test="${noticeOne['NOTICE_NO']=='1'}">
							<a class="goPrev" align="absmiddle"><i class="fas fa-chevron-left"></i>
								<span class="prevTit">&nbsp;이전 글이 없습니다.</span>
							</a>
						</c:if>
						<c:set var="noticeNo" value="${noticeOne['NOTICE_NO']}"/>
						<c:if test="${noticeOne['NOTICE_NO']!='1'}">
							<a class="goPrev" align="absmiddle" href="<c:url value='/notice/noticeViewCnt.do?noticeNo=${noticeNo-1 }'/>"
								><i class="fas fa-chevron-left"></i>&nbsp;
								<span class="prevTit">
								<c:if test="${fn:length(prevNotice['NOTICE_TITLE'])>=25}">
											${fn:substring(prevNotice['NOTICE_TITLE'],0,25) } ...
								</c:if>
								<c:if test="${fn:length(prevNotice['NOTICE_TITLE'])<25}">						
									${prevNotice['NOTICE_TITLE'] }
								</c:if>
								</span>
							</a>
						</c:if>
					</div>
					<div class="next">
						<c:if test="${noticeOne['NOTICE_NO']==totalR}">
							<a class="goNext" align="absmiddle">
								<span class="nextTit">&nbsp;다음 글이 없습니다.</span>
								<i class="fas fa-chevron-right"></i>
							</a>
						</c:if>
						<c:set var="noticeNo" value="${noticeOne['NOTICE_NO']}"/>
						<c:if test="${noticeOne['NOTICE_NO']!=totalR}">
							<a class="goNext" align="absmiddle" href="<c:url value='/notice/noticeViewCnt.do?noticeNo=${noticeNo+1 }'/>"
								>&nbsp;
								<span class="nextTit">
								<c:if test="${fn:length(nextNotice['NOTICE_TITLE'])>=25}">
											${fn:substring(nextNotice['NOTICE_TITLE'],0,25) } ...
								</c:if>
								<c:if test="${fn:length(nextNotice['NOTICE_TITLE'])<25}">						
									${nextNotice['NOTICE_TITLE'] }
								</c:if>
								</span>
								<i class="fas fa-chevron-right"></i>
							</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<%@ include file="../inc/bottom.jsp"%>