<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
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
	<!-- 본문 시작 -->
	<div id="main-width">
		<div id="menuinfo">수강 신청</div>
		<!-- 안내사항 시작 -->
		<div class="card bg-light text-dark">
	    	<div class="card-body object-half">
	    		<p class="card-title text-danger font-title">&lt;수강 안내사항&gt;</p>
	    		<div class="mt-3 font-content">
      			<table class="table">
      				<tr>
      					<th class="text-center" width="30%">입학자격</th>
      					<td>
      						- 만 18세 이상<br>
							- 운전면허 결격사유가 없는 분
      					</td>
      				</tr>
      				<tr>
      					<th class="text-center">입학준비물</th>
      					<td>
      						- 신분증<br>
							- 증명사진 3매
      					</td>
      				</tr>
      				<tr>
      					<td colspan="2">
      						※ 수강신청내역은 '마이페이지 > 수강신청내역' 메뉴에서 확인하실 수 있습니다.<br>
	      					※ 모든 금액은 부가세 포함입니다.
      					</td>
      			</table>
      			</div>
	    	</div>
	 	</div>
	 	<!-- 안내사항 끝 -->
		<div class="card mt-3">
		    <div class="card-body object-center text-center">
		    	<c:if test="${count==0}">
				<div class="my-5 text-danger empty-card">모집 중인 과정이 없습니다.</div>
				</c:if>
				<c:if test="${count>0}">
				<table class="table table-hover text-center line-bottom">
					<thead>
					<tr>
						<th width="30%">과정명</th>
						<th>강사명</th>
						<th>수강료</th>
						<th>수강신청</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="course" items="${list}">
					<tr>
						<td class="text-primary">${course.course_name}</td>
						<td>${map.get(course.teacher_num)}</td>
						<td><fmt:formatNumber value="${course.tuition}" type="number"/>원</td>
						<td><button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='registerApp.do?course_num=${course.course_num}'"
							<c:if test="${!empty admin_num}">disabled="disabled"</c:if>
						>수강신청</button></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="paging">${pagingHtml}</div>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- 본문 끝 -->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>