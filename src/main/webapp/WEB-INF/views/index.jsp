<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="inc/top.jsp" %>
<!-- 개인 메인 c:import -->
<c:if test="${empty sessionScope.userId || sessionScope.user_corpcheck==1}">
비회원, 개인로그인 메인
</c:if>

<!-- 기업 메인 c:import -->
<c:if test="${sessionScope.user_corpcheck==2}">
	<c:import url="/company/main.do"/>
</c:if>

<%@ include file="inc/bottom.jsp" %>