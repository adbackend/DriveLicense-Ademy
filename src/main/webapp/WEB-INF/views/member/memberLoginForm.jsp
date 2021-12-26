<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- menu 끝 -->
	
<div id="main-width">

<br>
<br>
<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio1" onclick="location.href='${pageContext.request.contextPath}/member/memberLoginForm.do'">회원 로그인</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2" onClick="location.href='${pageContext.request.contextPath}/admin/adminLoginForm.do'">관리자 로그인</label>

</div>


<form class="loginForm" method="post" action="memberLogin.do">

<div>
  <div class="mb-3">
  <br>
  <h3>회원 로그인</h3>
  <br>
    <label for="id" class="form-label">아이디</label>
    <input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" max="20">
  </div>
  <div class="mb-3">
    <label for="passwd" class="form-label">비밀번호</label>
    <input type="password" class="form-control" id="passwd" name="passwd" max="30">
  </div>
        <div class="bottomText">
  <button type="submit" class="btn btn-primary">로그인</button><br><br>
       아직 회원이 아니신가요? <a href="memberJoinForm.do">회원가입 하기</a>
      </div>
</div>
  
</form>

</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
</body>
</html>