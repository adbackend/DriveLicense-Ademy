<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 예약 변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultingStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="https://use.fontawesome.com/747c3ff62f.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#consulting_update_form').submit(function(){
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
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div id="main-width">
<div id="menuinfo">
	상담 예약 변경
</div>
	<div class="card my-3 bg-light">
		<div class="card-body my-3 text-center">
			<div class="text-danger font-weight-bold" style="font-size: 18px;">
			예약하신 상담 날짜는
			<fmt:formatDate value="${consulting.consulting_date}" pattern = "yyyy년MM월dd일 "/> 
			${consulting.consulting_time.substring(0,2)}시 ${consulting.consulting_time.substring(3,5)}분입니다.</div>
		</div>
	</div>
	<div class="card my-3">
		<div class="card-body my-2 text-center">
			<div class="detail-info">변경하시려는 날짜와 시간을 선택해주세요.</div>
		</div>
	</div>

<form id="consulting_update_form" action="update.do" method="post">
<div align="center">
<input type="hidden" id="consulting_num" name="consulting_num" value="${consulting.consulting_num}">
<input type="date" id="consulting_date" name="consulting_date" placeholder="상담 예약 날짜">
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
<button type="submit" id="join-submit" class="btn btn-primary">예약 변경<i class="fa fa-check spaceLeft" style="color:white; margin-left: 3px;"></i></button>
<button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">메인으로<i class="fa fa-times spaceLeft" style="color:white;margin-left: 3px;"></i></button>
</div>
</form>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>