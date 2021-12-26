<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 리스트</title>
<style type="text/css">
h2{
	text-align:center;
}
.notice-display{
	font-size:20px;
	text-align:center;
}
.btn-div{
	margin-right:100px;
}

.notice-main{
	min-height: 100%;
	position:relative;
	padding-bottom: 215px;}
	
.main-div{
	width:1200px; 
	margin:0 auto; 
	height: 200px;

}
</style>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>

<div class="main-div">
<div id="menuinfo">
	공지사항
</div>
</div>
<div class="notice-main">
	<c:if test="${count == 0}">
	<div class="notice-display">
		등록된 게시물이 없습니다.<br>
		<input type="button" class="btn btn-primary pull-right" value="글쓰기" onclick="location.href='writeForm.do'"> 
	</div>
	</c:if> 
	<c:if test="${count > 0}">
		<c:if test="${admin_num == null}">
		</c:if>
		<div class="container">
		<div class="row">
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach var="notice" items="${list}">
				<tr style="background: white;">
					<td>${notice.notice_num}</td>
					<td><a href="detail.do?notice_num=${notice.notice_num}">${notice.title}</a></td>
					<td>${notice.reg_date}</td>
					<td>${notice.hit}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<c:if test="${admin_num != null}">
			<div align="right">
				<input type="button" class="btn btn-primary pull-right" value="글쓰기" onclick="location.href='writeForm.do'"> 
			</div>
		</c:if>
	</div>
	<div align="center">
 	<div class="my-3">${pagingHtml}</div>
  </div>
  </c:if>
 
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>