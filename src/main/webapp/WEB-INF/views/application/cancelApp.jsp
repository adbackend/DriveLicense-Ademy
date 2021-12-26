<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 취소 완료</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<!-- style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- 본문 시작-->
	<div id="main-width">
		<div id="menuinfo">수강 신청 취소</div>
		<div class="card bg-light">
	    	<div class="card-body object-center text-center">
	    		<div class="my-5 empty-card">수강 신청 취소가 완료되었습니다.</div>
	    		<div>
					<input type="button" value="수강신청내역" class="btn btn-primary" onclick="location.href='listApp.do'">
					<input type="button" value="돌아가기" class="btn btn-secondary" onclick="location.href='registerAppForm.do'">
				</div>
			</div>
	 	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- 본문 끝-->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>