<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 상세보기</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<!-- style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//신청결과 표시
		$('#app_result option').each(function(){
			if($(this).val()=="${app.app_result}"){
				$(this).attr("selected","selected");
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
	<!-- 본문 시작 -->
	<div id="main-width">
		<div id="menuinfo">수강 신청 상세보기</div>
		<!-- 수강신청 정보 -->
		<div class="card">
			<p class="card-header font-title">수강 신청 정보</p>
	    	<div class="card-body object-half">
	    		<table class="table table-borderless font-content">
					<tbody>
					<tr class="line-bottom">
						<th>과정명</th>
						<td>${app.course_name}</td>
					</tr>
					<tr class="line-bottom">
						<th>강사명</th>
						<td>${app.teacher_name }</td>
					</tr>
					<tr class="line-bottom">
						<th>신청일</th>
						<td>${app.app_date}</td>
					</tr>
					<tr>
						<th>신청결과</th>
						<td>
							<form class="form-inline" action="modifyAppResult.do" method="post">
								<input type="hidden" name="app_num" value="${app.app_num}">
								<select class="form-control form-control-sm" name="app_result" id="app_result" style="width: 150px;">
									<option value="0">신청완료</option>
									<option value="1">승인</option>
									<option value="2">미승인</option>
								</select>
								<input type="submit" value="변경" class="btn btn-danger btn-sm ml-2">
							</form>
						</td>
					</tr>
					</tbody>
				</table>
	    	</div>
	    </div>
		<!-- 회원 정보 -->
		<div class="card mt-3">
			<p class="card-header font-title">회원 정보</p>
	    	<div class="card-body object-half">
	    		<table class="table table-borderless font-content">
					<tbody>
					<tr class="line-bottom">
						<th>아이디</th>
						<td>${member.id}</td>
					</tr>
					<tr class="line-bottom">
						<th>이름</th>
						<td>${member.name}</td>
					</tr>
					<tr class="line-bottom">
						<th>생년월일</th>
						<td>${member.birth }</td>
					</tr>
					<tr class="line-bottom">
						<th>연락처</th>
						<td>${member.phone}</td>
					</tr>
					<tr class="line-bottom">
						<th>이메일</th>
						<td>${member.email}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">${member.address1} ${member.address2}</td>
					</tr>
					</tbody>
				</table>
	    	</div>
	    </div>
    	<!-- 버튼 -->
    	<div class="text-center mt-3">
			<input type="button" value="수강신청내역" class="btn btn-primary" onclick="location.href='listAllApp.do'">
			<input type="button" value="홈으로" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- 본문 끝 -->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>