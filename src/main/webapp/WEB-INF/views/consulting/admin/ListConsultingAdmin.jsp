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
	$("input[id^='update1']").on('click', function(e) {
		var choice = confirm('접수상태를 상담 대기로 변경하시겠습니까?');
		if(choice){
			var consulting_num = $(this).attr('id').substring(7);
			var con_state = 1;
			location.replace('adminUpdate.do?consulting_num='+consulting_num+'&con_state='+con_state);
		}else {
			return;
		}
	  });
	$("input[id^='update2']").on('click', function(e) {
		var choice = confirm('접수상태를 상담 완료로 변경하시겠습니까?');
		if(choice){
			var consulting_num = $(this).attr('id').substring(7);
			var con_state = 2;
			location.replace('adminUpdate.do?consulting_num='+consulting_num+'&con_state='+con_state);
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
	상담 신청 내역
</div>
<div class="card">
	<div class="card-body object-center text-center">
<c:if test='${count == 0}'>
	<div class="card my-3">
		<div class="card-body my-5 text-center">
			<div class="text-danger empty-card">상담 신청 내역이 없습니다.</div>
		</div>
	</div>
</c:if>
<c:if test='${count > 0}'>
	<table class="table table-hover text-center line-bottom">
		<thead>
			<tr>
				<th class="col-md-1">상담번호</th>
				<th class="clo-md-1">예약회원</th>
				<th class="col-md-2">상담희망날짜</th>
				<th class="col-md-2">상담희망시간</th>
				<th class="col-md-2">예약신청날짜</th>
				<th class="col-md-2">접수상태</th>
				<th class="col-md-2">접수상태변경</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="consulting" items="${list}">
			<tr>
				<td>${consulting.consulting_num}</td>
				<td><a href="adminDetail.do?consulting_num=${consulting.consulting_num}">${consulting.id}</a></td>
				<td>${consulting.consulting_date}</td>
				<td>${consulting.consulting_time}</td>
				<td><fmt:formatDate value="${consulting.con_date}" type="both" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
				<c:if test="${consulting.con_state==0}">
					<td><span class="btn btn-sm btn-secondary">접수완료</span></td>
				</c:if>
				<c:if test="${consulting.con_state==1}">
					<td><span class="btn btn-sm btn-warning">상담대기</span></td>
				</c:if>
				<c:if test="${consulting.con_state==2}">
					<td><span class="btn btn-sm btn-success">상담완료</span></td>
				</c:if>
				
				<td>
					<div align="center">
						<input type="button" class="btn btn-sm btn-info" value="상담대기"  id="update1${consulting.consulting_num}"
						<c:if test="${consulting.con_state==1}">
							disabled="disabled"
						</c:if>
						<c:if test="${consulting.con_state==2}">
							disabled="disabled"
						</c:if>
						>
						<input type="button" class="btn btn-sm btn-danger" value="상담완료"  id="update2${consulting.consulting_num}"
						<c:if test="${consulting.con_state==2}">
							disabled="disabled"
						</c:if>
						>
					</div>
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