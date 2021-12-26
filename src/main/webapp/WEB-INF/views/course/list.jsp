<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div id="main-width">
<div id="menuinfo">과정 목록</div>
<div class="card mt-3">
		    <div class="card-body object-center text-center">
		    	<c:if test="${count==0}">
				<div class="my-5 text-danger empty-card">등록된 과정이 없습니다.</div>
				</c:if>
				<c:if test="${count>0}">
				<table class="table table-hover text-center line-bottom">
					<thead>
					<tr>
						<th>과정번호</th>
						<th width="30%">과정명</th>
						<th>강사명</th>
						<th>수강료</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="course" items="${list}">
					<tr>
						<td>${course.course_num}</td>
						<td class="text-primary">${course.course_name}</td>
						<td>${course.teacher_name}</td>
						<td><fmt:formatNumber value="${course.tuition}" type="number"/>원</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				${pagingHtml}
				</c:if>
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>