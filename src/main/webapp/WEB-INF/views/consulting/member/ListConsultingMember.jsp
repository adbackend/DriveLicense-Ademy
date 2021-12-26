<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 신청 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultingStyle.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$("button[id^='delete']").on('click', function(e) {
	var choice = confirm('상담 예약을 취소하시겠습니까?');
	if(choice){
		var consulting_num = $(this).attr('id').substring(7);
		location.replace('delete.do?consulting_num='+consulting_num);
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
	상담 예약 내역
</div>
<c:if test='${count == 0}'>
	<div class="card my-3">
		<div class="card-body my-4 text-center">
			<div class="text-danger" style="font-size: 18px; font-weight: bold;">예약한 상담 내역이 없습니다.</div>
			<div align="center" style="padding-top: 15px">
				<button class="btn btn-outline-primary" onclick="location.href='registerForm.do'">상담예약</button> 
			</div>
		</div>
	</div>
</c:if>
<c:if test='${count > 0}'>
	<table class="table table-hover text-center">
		<thead>
			<tr>
				<th class="col-md-1">상담번호</th>
				<th class="col-md-2">상담희망날짜</th>
				<th class="col-md-2">상담희망시간</th>
				<th class="col-md-3">예약신청날짜</th>
				<th class="col-md-2">접수상태</th>
				<th class="col-md-2">예약변경 / 예약취소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="consulting" items="${list}">
			<tr>
				<td>${consulting.consulting_num}</td>
				<td>${consulting.consulting_date}</td>
				<td>${consulting.consulting_time}</td>
				<td><fmt:formatDate value="${consulting.con_date}" type="both" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
				<c:if test="${consulting.con_state==0}">
					<td><span class="btn btn-secondary">접수완료</span></td>
				</c:if>
				<c:if test="${consulting.con_state==1}">
					<td><span class="btn btn-warning">상담대기</span></td>
				</c:if>
				<c:if test="${consulting.con_state==2}">
					<td><span class="btn btn-success">상담완료</span></td>
				</c:if>
				
				<td>
					<div class="btn-group" align="center">
						
							<button class="btn btn-xs btn-info" onclick="location.href='updateForm.do?consulting_num=${consulting.consulting_num}'"
							<c:if test="${consulting.con_state==1 || consulting.con_state==2 }">
								disabled="disabled"
							</c:if>
							>예약변경</button>
							<button class="btn btn-xs btn-danger" id="delete_${consulting.consulting_num}"
							<c:if test="${consulting.con_state==1 || consulting.con_state==2 }">
								disabled="disabled"
							</c:if>
							>예약취소</button>
						
					</div>
				</td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
		<div class="my-3">${pagingHtml}</div>
	</c:if>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>