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
<script type="text/javascript">
$(document).ready(function() {
$("input[id^='delete']").on('click', function(e) {
	var choice = confirm('해당 강사를 삭제하시겠습니까?');
	if(choice){
		var teacher_num = $(this).attr('id').substring(7);
		location.replace('delete.do?teacher_num='+teacher_num);
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
<div id="menuinfo">
	강사 목록
</div>
<div class="btn-div" align="right">
	<input type="button" class="btn btn-outline-primary btn-lg" value="강사 등록" onclick="location.href='registerForm.do'">
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
	          		
	           		<div class="card-body card-body-height">
	              		<h4 class="card-title">${teacher.teacher_name}</h4>
	               		<p>${teacher.teacher_phone}</p>
	              		<p>${teacher.teacher_email}</p>
	              		<div class="card-button">
	              		<input type="button" class="btn btn-info" value="정보수정" onclick="location.href='updateForm.do?teacher_num=${teacher.teacher_num}'">
	              		<input type="button" class="btn btn-danger deleteBtn" value="삭제" id="delete_${teacher.teacher_num}">
	               		</div>
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