<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안내</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	
<div class="page-main">
	<h2>안내</h2>
	<div class="result-display">
		<div class="align-center">
			잘못된 접속입니다.
			<p>
			<input type="button" value="홈으로" onclick="${pageContext.request.contextPath}/main/main.do">
		</div>
	</div>
</div>
</body>
</html>