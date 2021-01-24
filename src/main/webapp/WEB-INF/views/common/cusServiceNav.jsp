<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h4 class="fw-title">고객센터</h4>
	<ul class="filter-catagories">
		<li><a href="#">Q&A</a></li>
		<li><a href="#">공지사항</a></li>
		<li><a href="<c:url value='/faq/faqList.do'/>">FAQ</a></li>
	</ul>

</body>
</html>