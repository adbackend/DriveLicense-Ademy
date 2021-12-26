<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 신청</title>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultingStyle.css" type="text/css">
<script src="https://use.fontawesome.com/747c3ff62f.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#consulting_register_form').submit(function(){
		if($('#consulting_date').val().trim()==''){
			alert('날짜를 선택해주세요!');
			$('#consulting_date').focus();
			$('#consulting_date').val('');
			return false;
		}
		
		if($('#consulting_time').val().trim()==''){
			alert('시간을 입력해주세요!');
			$('#consulting_time').focus();
			$('#consulting_time').val('');
			return false;
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
	상담 신청
</div>



<form id="consulting_register_form" action="register.do" method="post">
<div align="center">
	<div class="card my-3">
		<div class="card-body my-4 text-danger">
			<div class="text-danger empty-card">상담을 원하시는 날짜와 시간을 선택해주세요.</div>
		</div>
	</div>
<input type="date" id="consulting_date" name="consulting_date">
<select name="consulting_time_hour">
	<option value="09">09시</option>
	<option value="10">10시</option>
	<option value="11">11시</option>
	<option value="12">12시</option>
	<option value="14">14시</option>
	<option value="15">15시</option>
	<option value="16">16시</option>
	<option value="17">17시</option>
</select>
<select name="consulting_time_min">
	<option value="00">00분</option>
	<option value="30">30분</option>
</select>
</div>
<div align="center" style="padding-top: 20px;">
<button type="submit" id="join-submit" class="btn btn-primary">상담 예약<i class="fa fa-check spaceLeft" style="color:white; margin-left: 3px;"></i></button>
<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">메인으로<i class="fa fa-times spaceLeft" style="color:white;margin-left: 3px;"></i></button>
</div>
</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>