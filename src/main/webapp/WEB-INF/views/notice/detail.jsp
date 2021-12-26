<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 페이지</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<style type="text/css">
.detail-img{
	max-width:500px;
}	
#notice{
	font-size:30px;
	text-align: center;" 
}
.btn btn-primary{
	line-height:2.2;
}

.main-div{
	width:1200px; 
	margin:0 auto; 
	height: 200px;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- menu -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
<div class="main-div">
<div id="menuinfo">
	공지사항 상세 페이지
</div>
</div>
	<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container" style="margin: 0 auto">
		<div class="row" style="margin: 0 auto">
			<table class="table table-bordered" style=" font-size: 17px;">
					<tr>
						<td style=" color:#666666;text-align: center; font-weight: bold;">게시글 번호</td>
						<td>${notice.notice_num}</td>
						<td style=" color:#666666; text-align: center; font-weight: bold;">조회수</td>
						<td>${notice.hit}</td>
						<td style=" color:#666666; text-align: center; font-weight: bold;">작성자</td>
						<td>${notice.admin_id}</td>
					</tr>
					<tr>
						<td style="color:#666666; width: 20%; text-align: center;font-weight: bold;">글 제목</td>
						<td colspan="3">${notice.title}</td>
						<td style="color:#666666; text-align: center;font-weight: bold;">작성일</td>
						<td>${notice.reg_date}</td>
					</tr>
					
					<tr>
						<td style="color:#666666; text-align: center;font-weight: bold;">내용</td>
						<td colspan="6" style="height: 200px; text-align: left;">${notice.content}<br>
							<c:if test="${!empty notice.filename}">
							<img src="${pageContext.request.contextPath}/upload/${notice.filename}">
							</c:if>
						</td>
					</tr>
			</table>
			</div>
			<div class="btn-div" align="right">
			<c:if test="${admin_num != notice.admin_num}">
				<a href="list.do" class="btn btn-primary">목록</a> &nbsp;
			</c:if>
			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<c:if test="${admin_num == notice.admin_num}">

			<a href="list.do" class="btn btn-primary">목록</a> &nbsp;
				<a href="updateForm.do?notice_num=${notice.notice_num}" class="btn btn-primary">수정</a> &nbsp;
				<a id="delete_btn" class="btn btn-primary">삭제</a>
				<script type="text/javascript">
					var delete_btn = document.getElementById('delete_btn');
					//이벤트 연결
					delete_btn.onclick=function(){
						var choice = confirm('삭제하시겠습니까?');
						if(choice){
		    				location.replace('delete.do?notice_num=${notice.notice_num}');
						}
					};
 			</script>	
		</c:if>
		</div>
		</div><br><br><br><br>
		
	<!-- 게시판 글 보기 양식 영역 끝 -->
	<div style="margin-bottom: 60px;"></div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>