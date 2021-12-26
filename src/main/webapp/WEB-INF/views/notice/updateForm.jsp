<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
#notice{
	background-color: #eeeeee;
	text-align:center;
}
.container{
	margin-left: 80px;
	margin-bottom: 100px;
	text-align: center;
}
.main-div{
	width:1200px; 
	margin:0 auto; 
	height: 200px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#update_form').submit(function(){
			if($('#title').val().trim()==''){
				alert('제목을 입력하세요!');
				$('title').val('').focus();
				return false;
			}
			if($('#content').val().trim()==''){
				alert('내용을 입력하세요!');
				$('#content').val('').focus();
				return false;
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
<div class="main-div">
<div id="menuinfo">
	공지사항 글 수정
</div>
</div>

	<div class="container">
		<div class="row">
			<form action="update.do" method="post" enctype="multipart/form-data" id="update_form">
			<input type="hidden" name="notice_num" value="${notice.notice_num}">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" id="title" maxlength="50"
								value="${notice.title}"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content"  id="content"
								style="width:1000px; height: 350px;">${notice.content}</textarea></td>
						</tr>
						<tr>
							<td><input type="file" class="form-control" placeholder="파일" name="filename" accept="image/gif,image/png,image/jpeg">
								<c:if test="${!empty notice.filename}">
								<br>
								<span>(${notice.filename})파일이 등록되어 있습니다. 다시 업로드하면 기존 파일은 삭제됩니다.</span>
								</c:if>
						</tr>

				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right" value="수정하기 ">
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<!-- 게시판 글 수정 양식 영역 끝 -->
<!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>




