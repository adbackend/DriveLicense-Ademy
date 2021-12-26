<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<div id="menu">
	<ul class="menu-main">
		<li><a href="${pageContext.request.contextPath}/notice/introduce.do">학원 안내</a>
			<ul class="sub">
				<li><a href="${pageContext.request.contextPath}/notice/introduce.do">학원 소개</a></li>
				<li><a href="${pageContext.request.contextPath}/notice/directions.do">찾아오시는 길</a></li>
				<li><a href="${pageContext.request.contextPath}/teacher/teacherInfo.do">강사 소개</a></li>
				<li><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
			</ul>
		</li>
		<li><a href="${pageContext.request.contextPath}/course/list.do">과정 안내</a>
			<ul class="sub">
				<li><a href="${pageContext.request.contextPath}/course/list.do">과정 소개</a></li>
			</ul>
		</li>
		<li><a href="${pageContext.request.contextPath}/application/registerAppForm.do">수강 안내</a>
			<ul class="sub">
				<li><a href="${pageContext.request.contextPath}/application/registerAppForm.do">수강 신청</a></li>
			</ul>
		</li>
		<li><a href="${pageContext.request.contextPath}/consulting/registerForm.do">상담 안내</a>
			<ul class="sub">
				<li><a href="${pageContext.request.contextPath}/consulting/registerForm.do">상담 예약</a></li>
			</ul>
		</li>
		<c:if test="${!empty member_num && empty admin_num}">
			<li><a href="${pageContext.request.contextPath}/member/memberMyPageForm.do">마이 페이지</a>
				<ul class="sub">
					<li><a href="${pageContext.request.contextPath}/member/memberMyPageForm.do">내정보관리</a></li>
					<li><a href="${pageContext.request.contextPath}/application/listApp.do">수강신청내역</a></li>
					<li><a href="${pageContext.request.contextPath}/consulting/memberList.do">상담신청내역</a></li>
					
				</ul>
			</li>
		</c:if>
		<c:if test="${empty member_num && empty admin_num}">
			<li><a href="${pageContext.request.contextPath}/member/memberMyPageForm.do">마이 페이지</a>
				<ul class="sub">
					<li><a href="${pageContext.request.contextPath}/member/memberMyPageForm.do">내정보관리</a></li>
					<li><a href="${pageContext.request.contextPath}/application/listApp.do">수강신청내역</a></li>
					<li><a href="${pageContext.request.contextPath}/consulting/memberList.do">상담신청내역</a></li>
				</ul>
			</li>
		</c:if>
		<c:if test="${!empty admin_num && empty member_num}">
			<li><a href="${pageContext.request.contextPath}/admin/mainAdminPageForm.do">관리자 페이지</a>
				<ul class="sub">
					<li><a href="${pageContext.request.contextPath}/admin/mainAdminPageForm.do">관리자 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/teacher/list.do">강사 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/course/detail.do">과정 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/application/listAllApp.do">수강신청내역관리</a></li>
					<li><a href="${pageContext.request.contextPath}/consulting/adminList.do">상담신청내역관리</a></li>
				</ul>
			</li>
		</c:if>
	</ul>
</div>
</body>
</html>