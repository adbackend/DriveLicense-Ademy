<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<footer>
	<div class="footer-div">
		<div class="footer-div-content">
			<span>ABOUT</span>
			<hr class="longhr"> 
			자동차운전면허학원<br>
			부천시 원미구 평천로 651<br>
			사업자등록번호 : 107-82-04832<br>
			담당자 : 김길동<br>
			코드번호 13-609 등록번호 1-8 지정번호 73<br>
		</div>
		<div class="footer-div-content">
			<span>CALL CENTER</span>
			<hr class="longhr">
			Tel_02-336-8546~8<br>
			Fax_02-334-5405<br>
			<br><br><br>
		</div>
		<div class="footer-div-content">
			<span>QUICK MENU</span>
			<hr class="shorthr">
				<a href="${pageContext.request.contextPath}/notice/introduce.do" style="color: white; text-decoration: none;">학원소개<br></a>
				<a href="${pageContext.request.contextPath}/notice/list.do" style="color: white; text-decoration: none;">공지사항<br></a>
				<a href="${pageContext.request.contextPath}/course/list.do" style="color: white; text-decoration: none;">과정안내<br></a>
				<a href="${pageContext.request.contextPath}/application/registerAppForm.do" style="color: white; text-decoration: none;">수강안내<br></a>
				<a href="${pageContext.request.contextPath}/consulting/registerForm.do" style="color: white; text-decoration: none;">상담안내<br></a>
		</div>
	</div>
</footer>
<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</html>