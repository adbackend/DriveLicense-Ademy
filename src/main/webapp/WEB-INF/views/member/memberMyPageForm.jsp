<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="style.css">

<style type="text/css">

</style>
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- menu 끝 -->
<div id="main-width">
<div id="menuinfo">
	회원정보
</div>
	<div class="row">
	<div class="col-sm-6">
	 	<table class="table" style="margin-left: 350px; margin-right: auto;">
	 	<tr>
			<td>아이디</td>
			<td>${member.id }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${member.passwd }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${member.name }</td>
		</tr>
		<tr>
			<td>휴대폰</td>
			<td>${member.phone }</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${member.zipcode }</td>
		</tr>            
		<tr>
			<td>주소</td>
			<td>${member.address1}&nbsp;${member.address2}</td>
		</tr>
		<tr>
			<td>이메일</td>
  			<td>${member.email }</td>
		</tr>
		 <tr>
		 	<td colspan="2" class="text-center">
		 		<input type="hidden" name="member_num" value="${member.member_num }">
				<input type="button" value="회원 수정하기" class="btn btn-dark" onclick="location.href='myPageModifyForm.do'">
				<input type="button" value="회원 탈퇴하기" class="btn btn-danger" onclick="location.href='memberDeleteForm.do'">
	 		</td>
	 	</tr>
	 	</table>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>