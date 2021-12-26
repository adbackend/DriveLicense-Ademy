<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="lnb">
  <a href="${pageContext.request.contextPath}/admin/mainAdminPageForm.do" class="list-group-item list-group-item-action " >마이페이지</a>
  <a href="${pageContext.request.contextPath}/admin/memberManageListForm.do" class="list-group-item list-group-item-action " >회원 관리</a>

<c:if test="${admin_auth==2}"> <!-- 최고관리자일때 -->
  <a href="${pageContext.request.contextPath}/admin/adminManageListForm.do" class="list-group-item list-group-item-action" aria-current="true">관리자 관리</a>
</c:if>



</div>
</body>
</html>