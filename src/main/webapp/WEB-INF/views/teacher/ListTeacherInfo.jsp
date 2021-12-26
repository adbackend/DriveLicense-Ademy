<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>강사 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacherCss/teacherStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div id="main-width">
<div id="menuinfo">
	강사 소개
</div>

<c:if test='${count == 0}'>
	<div class="card my-3">
		<div class="card-body my-5 text-center">
			<div class="text-danger" style="font-size: 18px; font-weight: bold;">등록된 강사가 없습니다.</div>
		</div>
	</div>
</c:if>

<c:if test='${count > 0}'>
	<div class="row card-text">
		<c:forEach var="teacher" items="${list}">
	 		<div class="col-3 mb-4" >
				<div class="card card-width">
					<c:if test="${empty teacher.teacher_profile}">
						<img src="${pageContext.request.contextPath}/images/teacher/No-Image.png" class="card-img-top">
	          		</c:if>
	          		<c:if test="${!empty teacher.teacher_profile}">
	          			<img src="${pageContext.request.contextPath}/upload/${teacher.teacher_profile}" class="card-img-top">
	          		</c:if>
	          		
	           		<div class="card-body Info-card-body-height">
	              		<h4 class="card-title">${teacher.teacher_name}</h4>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>