<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 소개</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/introduceStyle.css">
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
	학원 소개
</div>

<div align="center">
	<h3>“고객만족을 뛰어넘어 고객감동이 실현되는 그날까지…”</h3>
	<div class="first-div">
		자동차운전면허학원의 임직원 일동은 교육생의 신속한 면허취득과 우수한 안전능력 습득을 위해 부단한 연구와 노력을 계속하고 있습니다.<br>
		이를 통해, 고객만족을 뛰어넘어 고객감동이 실현되는 그 날까지 최선을 다할 것을 약속 드립니다.<br>
	</div>
	<hr style="width: 50px; background: #d6d6d6; margin-top: 50px; margin-bottom: 50px;">
	<h5 style="font-size:22px;font-weight: 700; margin-bottom: 35px;">
	자동차운전전문학원이 고객께 드리는 약속</h5>
	<div class="second-div">
		<img src="${pageContext.request.contextPath}/images/notice/ico_promise1.jpg">
		<h6>최고의 합격률</h6>
		<span style="">100% 합격을 위한 부단한 노력</span>
	</div>
	<div class="second-div">
		<img src="${pageContext.request.contextPath}/images/notice/ico_promise2.jpg">
		<h6>친절한 서비스</h6>
		<span style="font-size: 15px;">고객응대 시 고객의 마음으로</span>
	</div>
	<div class="second-div">
		<img src="${pageContext.request.contextPath}/images/notice/ico_promise3.jpg">
		<h6>맞춤 스케줄</h6>
		<span style="font-size: 15px;">고객의 신속한 면허취득을 위해</span>
	</div>
	<div class="second-div">
		<img src="${pageContext.request.contextPath}/images/notice/ico_promise4.jpg">
		<h6>온라인 활용</h6>
		<span style="font-size: 15px;">신속한 등록 및 각종 정보 조회</span>
	</div>
	<hr style="width: 50px; background: #d6d6d6; margin-top: 50px; margin-bottom: 50px;">
	<h5 style="font-size:22px;font-weight: 700; margin-bottom: 35px;">함께 성장하는 자동차운전면허학원</h5>
	<div class="card text-dark third-div">
		<div class="card-body object-half">
			<div class="mt-3 font-content">
				<table class="table" style="width: 590px;">
					<tr>
						<td style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">1967.03.02</td>
						<td >자동차학원 설립 (서울 중랑구 중화동)</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">1986.08.21</td>
						<td>학원이전 (서울 도봉구 상계동)</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">1990.06.07</td>
						<td>학원명 변경 및 이전 (서울 강서구 외발산동)</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">1997.03.16</td>
						<td>자동차운전전문학원 지정</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">2004.10.28</td>
						<td>강서구 자원봉사센터 설립지원</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">2005.06.12</td>
						<td>학원이전 (현재위치)</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">2009.06.12</td>
						<td>지역경제활성화 공로상 수상</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">2010.11.06</td>
						<td>서울지방 경찰청 발표. 배출 수강생 교통사고발생율 최저 기록</td>
					</tr>
					<tr>
						<td  style="width:50px; text-align: right; padding-right: 30px; font-weight: 600; color: #fe2828;">2011.02.01</td>
						<td>남부지역범죄예방위원회 지원</td>
					</tr>
					
				</table>
			</div>
		</div>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>