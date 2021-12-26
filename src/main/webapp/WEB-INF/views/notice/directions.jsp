<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는 길</title>
<!-- Bootstrap CSS -->
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div id="main-width">
<div id="menuinfo">
	찾아오시는 길
</div>
<div align="center">
	<h4>서부권 최적의 위치</h4>
	<p style="font-size:16px;">
	<strong style="color:navy;">강서, 양천, 영등포, 동작, 당산, 마포, 부천</strong> 
	지역 무료 셔틀버스 운행, 강서면허시험장 도보 3분거리, 남부순환로 대로변<p>
	<img src="${pageContext.request.contextPath}/images/notice/위치.jpg">
</div>
<div align="center" style="margin-top: 80px;">
	<h3 style="padding-bottom: 30px;">버스 이용시</h3>
	<hr style="width: 1100px;background:black;margin-top: 0;margin-bottom: 0;height: 1px;">
	<table class="table" style="text-align: center; width: 1100px;">
		<tr style="height: 110px;">
			<td style="vertical-align: middle;width:400px; text-align: right; padding-right: 20px;"><img src="${pageContext.request.contextPath}/images/notice/버스1.jpg"></td>
			<td style="vertical-align: middle; text-align: left; padding-left: 100px;">외발산신광명마을 정류장(학원 앞 하차)<br>388, 650, 651, 653, 662, 6628, 6630</td>
		<tr>
		<tr style="height: 110px;">
			<td style="vertical-align: middle; width:400px; text-align: right; padding-right: 20px;"><img src="${pageContext.request.contextPath}/images/notice/버스2.jpg"></td>
			<td style="vertical-align: middle;text-align: left; padding-left: 100px;">서울자동차학원 정류장(학원 맞은편 하차)<br>마을버스 강서05, 강서05-1</td>
		<tr>
		<tr style="height: 110px;">
			<td style="vertical-align: middle; width:400px; text-align: right; padding-right: 20px;"><img src="${pageContext.request.contextPath}/images/notice/버스3.jpg"></td>
			<td style="vertical-align: middle; text-align: left; padding-left: 100px;">마곡수명산파크 7단지(도보 5분)<br>388, 6630, 6632, 6642</td>
		<tr>
	</table>
</div>
<div align="center" style="margin-top:80px;">
	<h3 style="padding-bottom: 30px;">지하철 연계노선</h3>
	<hr style="width: 1100px;background:black;margin-top: 0;margin-bottom: 0;height: 1px;">
	<table class="table" style="text-align: left; width: 1100px;">
		<tr style="height: 70px;">
			<td style="padding-left: 90px; vertical-align: middle;"><img src="${pageContext.request.contextPath}/images/notice/지하철.jpg"></td>
			<td style="vertical-align: middle;">5호선 까치산역	2번 출구에서 6628, 653번을 타고 외발산신광명마을 정류장 하차</td>
		</tr>
		<tr style="height: 70px;">
			<td style="padding-left: 90px; vertical-align: middle;"><img src="${pageContext.request.contextPath}/images/notice/지하철.jpg"></td>
			<td style="vertical-align: middle;">5호선 화곡역 2번 출구에서 650번 또는 7번 출구 화곡역/에이스정형외과 앞 정류장에서 653번을 타고 외발산신광명마을 정류장 하차</td>
		</tr>
		<tr style="height: 70px;">
			<td style="padding-left: 90px; vertical-align: middle;"><img src="${pageContext.request.contextPath}/images/notice/지하철.jpg"></td>
			<td style="vertical-align: middle;">5호선 마곡역 6번 출구에서 388번을 타고 외발산신광명마을 정류장 하차 또는 마을버스 강서05-1번을 타고 서울자동차학원 정류장 하차</td>
		</tr>
		<tr style="height: 70px;">
			<td style="padding-left: 90px;"><img src="${pageContext.request.contextPath}/images/notice/지하철.jpg"></td>
			<td style="vertical-align: middle;">5호선 발산역 9번 출구에서 6630번을 타고 외발산신광명마을 정류장 하차</td>
		</tr>
		<tr style="height: 70px;">
			<td style="padding-left: 90px;"><img src="${pageContext.request.contextPath}/images/notice/지하철.jpg"></td>
			<td style="vertical-align: middle;">5호선 우장산역	4번 출구에서 마을버스 강서05번을 타고 서울자동차학원 정류장 하차</td>
		</tr>
	</table>
	</div>
</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</body>
</html>