<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<title>header</title>
</head>
<body>
<div id="header">
	<a href="${pageContext.request.contextPath}/main/main.do">
	<img src="${pageContext.request.contextPath}/images/main/logo.png" ></a>
	<div class="header-menu">
		<ul>
		
		<c:if test="${empty member_id && empty admin_num}">
			<li><a href="${pageContext.request.contextPath}/member/memberLoginForm.do">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/member/memberJoinForm.do">회원가입</a></li>
		</c:if>
		
		<c:if test="${!empty member_id && member_auth == 1}">
			<li>${member_id}님 [회원]</li>
			<li><a href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a></li>
		</c:if>
		
		<c:if test="${!empty admin_num}">
			<li>${admin_id}님 [관리자]</li>
			<li><a href="${pageContext.request.contextPath}/admin/adminLogout.do">로그아웃</a></li>
		</c:if>
			
		</ul>
	</div>
</div>
</body>
</html>