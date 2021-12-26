<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<!-- carousel 시작 -->

	<div id="carouselIndicators" class="carousel slide" data-ride="carousel" data-interval="2800">
		<ol class="carousel-indicators">
			<li data-target="#carouselIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselIndicators" data-slide-to="1"></li>
			<li data-target="#carouselIndicators" data-slide-to="2"></li>
			<li data-target="#carouselIndicators" data-slide-to="3"></li>
			<li data-target="#carouselIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner carousel_top">
			<div class="carousel-item active carousel_top">
				<img src="${pageContext.request.contextPath}/images/main/main1.png" class="d-block w-100">
				<div class="text">
					1:1 맞춤 친절 교육 서비스<br>
					자동차운전전문학원<br>
					1종, 2종/자동, 대형, 자체시험, 시내연수<br>
				</div>
			</div>
			<div class="carousel-item" >
				<img src="${pageContext.request.contextPath}/images/main/main2.png" class="d-block w-100">
				<div class="text">
					1:1 맞춤 친절 교육 서비스<br>
					자동차운전전문학원<br>
					1종, 2종/자동, 대형, 자체시험, 시내연수<br>
				</div>
			</div>
			<div class="carousel-item" >
				<img src="${pageContext.request.contextPath}/images/main/main3.png" class="d-block w-100">
				<div class="text">
					1:1 맞춤 친절 교육 서비스<br>
					자동차운전전문학원<br>
					1종, 2종/자동, 대형, 자체시험, 시내연수<br>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/images/main/main4.png" class="d-block w-100">
				<div class="text">
					1:1 맞춤 친절 교육 서비스<br>
					자동차운전전문학원<br>
					1종, 2종/자동, 대형, 자체시험, 시내연수<br>
				</div>
			</div>
			<div class="carousel-item">
				<img src="${pageContext.request.contextPath}/images/main/main5.jpg" class="d-block w-100">
				<div class="text">
					1:1 맞춤 친절 교육 서비스<br>
					자동차운전전문학원<br>
					1종, 2종/자동, 대형, 자체시험, 시내연수<br>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselIndicators" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span><!-- sr-only : 코드상에서는 보이지만 화면상에서는 보이지않음 -->
		</a>
		<a class="carousel-control-next" href="#carouselIndicators" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
<!-- carousel 끝 -->
<div class="middle-menu-style">
	<div class="middle-menu-call">
		<img src="${pageContext.request.contextPath}/images/main/call.png">
		<h3>02-336-8546~8</h3>
	</div>
	<div class="middle-quick-menu-div">
		<div class="middle-quick-menu-inner">
		<a href="${pageContext.request.contextPath}/notice/directions.do">
			<div class="middle-quick-menu-content">
				<img src="${pageContext.request.contextPath}/images/main/map.png" width="85">
				<h5 class="middle-text">찾아오시는길</h5>
			</div>
		</a>
		<a href="${pageContext.request.contextPath}/notice/list.do">
			<div class="middle-quick-menu-content">
				<img src="${pageContext.request.contextPath}/images/main/notice.png" width="77">
				<h5 class="middle-text">공지사항</h5>
			</div>
		</a>
		<a href="${pageContext.request.contextPath}/teacher/teacherInfo.do">
			<div class="middle-quick-menu-content">
				<img src="${pageContext.request.contextPath}/images/main/id.png" width="100">
				<h5 class="middle-text">강사소개</h5>
			</div>
		</a>
		<a href="${pageContext.request.contextPath}/course/list.do">
			<div class="middle-quick-menu-content">
				<img src="${pageContext.request.contextPath}/images/main/card.png" width="100">
				<h5 class="middle-text">과정안내</h5>
			</div>
		</a>
		<a href="${pageContext.request.contextPath}/consulting/registerForm.do">
			<div style="display:inline-block;">
				<img src="${pageContext.request.contextPath}/images/main/talk.png" width="95">
				<h5 class="middle-text">상담신청</h5>
			</div>
		</a>
		</div>
	</div>
</div>
<div class="notice-div">
	<div class="notice-info">
		공지사항
	</div>
	<hr>
	<div class="notice-table-div">
	<table class="table notice-table">
		<c:forEach var="notice" items="${list}">
		<tr>
			<td class="notice-table-date">${notice.reg_date}</td>
			<td> <a href="${pageContext.request.contextPath}/notice/detail.do?notice_num=${notice.notice_num}" style="color:#212121; text-decoration: none;">${notice.title}</a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>