<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과정 등록</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
<script type="text/javascript">
	$(document).ready(function(){
		//이벤트 연결
		$('#write_form').submit(function(){
			if($('#course_name').val().trim()==''){
				alert('과정명을 입력하세요');
				$('#course_name').val('').focus();
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
#write_form{
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
	<div id="menuinfo">과정 등록</div>
	<!-- 수강신청 정보 -->
	<div class="card">
		<p class="card-header font-title">과정 정보</p>
	    <div class="card-body obejct-width">
	    <form id="write_form" action="write.do" method="post" style="margin: 0px;">
	    	<table class="table table-borderless font-content" >
				<tbody>
					<tr class="line-bottom">
						<th style="width: 40%; padding-left: 30%">과정명</th>
						<td>
							<input type="text" id="course_name" name="course_name">			
						</td>
					</tr>
					<tr class="line-bottom">
						<th style="width: 40%; padding-left: 30%">강사명</th>
						<td>
							<select name="teacher_num" id="teacher_num" style="width:63%;">
								<c:forEach var="teacher" items="${list}">
									<option value="${teacher.teacher_num}">
									${teacher.teacher_name}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr class="line-bottom">
						<th style="width: 40%; padding-left: 30%">수강료</th>
						<td>
							<input type="number" id="tuition" name="tuition" maxlength="10"> 
						</td>
					</tr>
				</tbody>
				
			</table>
			<div class="card-button mt-3" align="center">
				<button type="submit" class="btn btn-primary">과정등록</button>
	         </div>
			</form>
		</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>