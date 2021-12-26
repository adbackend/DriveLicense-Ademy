<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
//유효성 체크
	$(document).ready(function(){
		$('#update_form').submit(function(){
			if($('#course_name').val().trim()==''){
				alert('과정명을 입력하세요');
				$('course_name').val('').focus();
				return false;
			}
			if($('#tuition').val().trim()==''){
				alert('수강료를 입력하세요');
				$('#tuition').val('').focus();
				return false;
			}
		});
	});
</script>
<style type="text/css">
#update_form{
	margin-left:200px;
}
</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div id="main-width">
	<div id="menuinfo">과정 정보 수정</div>
	<!-- 수강신청 정보 -->
	<div class="card">
		<p class="card-header font-title">과정 정보</p>
	    <div class="card-body obejct-width">
	    <form id="update_form" action="update.do" method="post" style="margin: 0px;">
	    	<input type="hidden" id="course_num" name="course_num" value="${course.course_num}">
	    	<table class="table table-borderless font-content" >
				<tbody>
					<tr class="line-bottom">
						<th style="width: 40%; padding-left: 30%">과정명</th>
						<td>
							<input type="text" id="course_name" name="course_name" value="${course.course_name}">			
						</td>
					</tr>
					<tr class="line-bottom">
						<th style="width: 40%; padding-left: 30%">강사명</th>
						<td>
							<select name="teacher_num" style="width:63%;">
								<c:forEach var="teacher" items="${list}">
									<option value="${teacher.teacher_num}"
									<c:if test="${course.teacher_num == teacher.teacher_num}">
										selected="selected"
									</c:if>>
									${teacher.teacher_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="line-bottom">
						<th style="width: 40%; padding-left: 30%">수강료</th>
						<td>
							<input type="number" id="tuition" name="tuition" value="${course.tuition}" maxlength="10"> 
						</td>
					</tr>
				</tbody>
				
			</table>
			<div class="card-button mt-3" align="center">
				<button type="submit" class="btn btn-primary">정보수정</button>
	         </div>
			</form>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>




