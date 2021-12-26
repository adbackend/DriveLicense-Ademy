<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 정보</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/consultingStyle.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
table {
    width:500px; 
    margin: auto;
}

</style>
</head>
<body>
<!-- header -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!-- menu -->
<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div id="main-width">
<div id="menuinfo">
	상담 상세 정보
</div>
	<div class="card my-3 bg-light">
		<div class="card-body my-3 text-center">
			<div class="text-danger font-weight-bold detail-admin-fontSize">
				상담 번호 : ${consulting.consulting_num}<br>
				 예약 일시 : 
				<fmt:formatDate value="${consulting.consulting_date}" pattern = "yyyy년MM월dd일 "/> 
				${consulting.consulting_time.substring(0,2)}시 ${consulting.consulting_time.substring(3,5)}분<br>
				접수 상태 : 
				<c:if test="${consulting.con_state==0}">
					접수완료
				</c:if>
				<c:if test="${consulting.con_state==1}">
					상담대기
				</c:if>
				<c:if test="${consulting.con_state==2}">
					상담완료
				</c:if>
				</div>
			</div>
		</div>
		<div class="card mt-3">
			<p class="card-header font-title">상담예약 회원 정보</p>
	    	<div class="card-body object-half">
	    		<table class="table table-borderless font-content">
					<tbody>
					<tr class="line-bottom">
						<th>아이디</th>
						<td>${consulting.id}</td>
					</tr>
					<tr class="line-bottom">
						<th>이름</th>
						<td>${consulting.name}</td>
					</tr>
					<tr class="line-bottom">
						<th>생년월일</th>
						<td>${consulting.birth}</td>
					</tr>
					<tr class="line-bottom">
						<th>연락처</th>
						<td>${consulting.phone}</td>
					</tr>
					<tr class="line-bottom">
						<th>이메일주소</th>
						<td>${consulting.email}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">${consulting.address1} ${consulting.address2}</td>
					</tr>
					</tbody>
				</table>
	    	</div>
	    </div>
    	<!-- 버튼 -->
    	<div class="text-center mt-3">
			<button class="btn btn-success" onclick="location.href='adminList.do'">목록으로</button>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>