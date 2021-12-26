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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultingStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("input[id^='delete']").on('click', function(e) {
		var choice = confirm('해당 과정을 삭제하시겠습니까?');
		if(choice){
			var course_num = $(this).attr('id').substring(7);
			location.replace('delete.do?course_num='+course_num);
		}else {
			return;
		}
	  });
	 });
</script>
</head>

<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div id="main-width">
<div id="menuinfo">과정 관리</div>

<div class="btn-div" align="right">
	<input type="button" class="btn btn-outline-primary" value="과정 등록" onclick="location.href='writeForm.do'" class="btn btn-primary">
</div>
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
						<th>수정/삭제</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="course" items="${list}">
					<tr>
						<td>${course.course_num}</td>
						<td>${course.course_name}</td>
						<td>${course.teacher_name}</td>
						<td><fmt:formatNumber value="${course.tuition}" type="number"/>원</td>
						<td>
							<input type="button" class="btn btn-info" value="수정" onclick="location.href='updateForm.do?course_num=${course.course_num}'">
							<input type="button" class="btn btn-danger deleteBtn" value="삭제" id="delete_${course.course_num}">
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="my-3">${pagingHtml}</div>
				</c:if>
				
			</div>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>