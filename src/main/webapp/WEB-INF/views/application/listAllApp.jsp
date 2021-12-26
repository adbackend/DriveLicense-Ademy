<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 신청 내역(관리자)</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<!-- style.css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-app.css" type="text/css">
<!-- jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		//검색어 유효성 체크
		$(document).on('submit', '#search_form',function(){
			if($('#keyfield').val() != 'r'){
				if($('#keyword').val().trim()==''){
					alert('검색어를 입력하세요!');
					$('#keyword').val('').focus();
					return false;
				}
			};
		});
		//신청결과 필드
		$(document).on('change','#keyfield',function(){
			var keyfield = $(this).val();
			if(keyfield == 'r'){
				$('#keyword').hide();
				$('#re_keyword').show();
			}else{
				$('#re_keyword').hide();
				$('#keyword').show();
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
		<div id="menuinfo">수강 신청 관리</div>
		<div class="card">
		    <div class="card-body object-center text-center">
		    	<!-- 검색창 시작 -->
				<form class="form-inline mb-4 justify-content-end" id="search_form" action="listAllApp.do" method="get">
					<select class="form-control form-control-sm mr-1" name="keyfield" id="keyfield">
						<option value="c">과정명</option>
						<option value="t">강사명</option>
						<option value="m">회원명</option>
						<option value="r">신청결과</option>
					</select>
					<div class="input-group input-group-sm" style="width: 200px;">
						<input type="text" class="form-control" name="keyword" id="keyword" placeholder="Search">
						<!-- 신청결과 필드 -->
						<select class="form-control form-control-sm mr-1" name="re_keyword" id="re_keyword" style="display:none;">
							<option value="0">신청완료</option>
							<option value="1">승인</option>
							<option value="2">미승인</option>
						</select>
						<div class="input-group-append">
							<button class="btn btn-dark" type="submit">검색</button>  
						</div>
					</div>
				</form>
				<!-- 검색창 끝 -->
				<c:if test="${count==0}">
				<div class="my-5 text-danger empty-card">수강 신청 내역이 없습니다.</div>
				</c:if>
				<c:if test="${count>0}">
				<table class="table table-hover line-bottom">
					<thead>
					<tr>
						<th width="30%">과정명</th>
						<th>강사명</th>
						<th>회원명</th>
						<th>신청일</th>
						<th>신청결과</th>
						<th>상세보기</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach var="app" items="${list}">
					<tr>
						<td>${app.course_name}</td>
						<td>${app.teacher_name}</td>
						<td class="text-primary">${app.name}</td>
						<td>${app.app_date}</td>
						<td>
							<c:if test="${app.app_result==0}"><span class="badge badge-pill badge-secondary">신청완료</span></c:if>
							<c:if test="${app.app_result==1}"><span class="badge badge-pill badge-primary">승인</span></c:if>
							<c:if test="${app.app_result==2}"><span class="badge badge-pill badge-danger">미승인</span></c:if>
						</td>
						<td><button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='detailApp.do?app_num=${app.app_num}'">상세보기</button></td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				<div class="paging">${pagingHtml}</div>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- 본문 끝 -->
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>