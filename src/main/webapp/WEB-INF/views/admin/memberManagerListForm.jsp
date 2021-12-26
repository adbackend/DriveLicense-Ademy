<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminCSS/adminStyle.css">

<style type="text/css">

#btn1{
margin-left:480px;
}

.table{
margin-left:40px;
margin-right:300px;
margin-top:30px;
}
.paging{
margin-left:100px;
}

</style>

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- menu 끝 -->

   <div class="wrap">
   <br>
	    <header class="w">
		    <h3>관리자 메인</h3>
	    </header>
	    
<jsp:include page="/WEB-INF/views/admin/adminAside.jsp"/>
<div id="container" class="clear">
<!-- <div class="lnb"> -->
<!--   <a href="#" class="list-group-item list-group-item-action active" aria-current="true">마이페이지</a> -->
<!--   <a href="#" class="list-group-item list-group-item-action">관리자 관리</a> -->
<!--   <a href="#" class="list-group-item list-group-item-action">A third link item</a> -->
<!--   <a href="#" class="list-group-item list-group-item-action">A fourth link item</a> -->
<!--   <a class="list-group-item list-group-item-action disabled">A disabled link item</a> -->
<!-- </div> -->

<div class="container-scroller">
<div class="container">
    <div class="row">
        <div class="col-sm-20">
            <div class="col-sm-22"></div>
                <div class="col-sm-20">
                    <h2 class="text-center">회원 리스트</h2>
                    
<!--                     <form action="MemberUpdateProc.jsp" method="post"> -->
<table class="table">
<c:if test="${count==0 }">
	등록된 회원이 없습니다.
</c:if>

<c:if test="${count>0 }">
  <thead>
    <tr>
<!--       <th scope="col">#</th> -->
      <th scope="col">아이디</th>
      <th scope="col">이름</th>
      <th scope="col">휴대폰</th>
      <th scope="col">이메일</th>
      <th scope="col">삭제</th>
    </tr>
  </thead>
  
  <c:forEach var="list" items="${list}">
  <tbody>
    <tr>
<!--       <th scope="row">1</th> -->
      <td>${list.id}</td>
      <td>${list.name }</td>
      <td>${list.phone }</td>
      <td>${list.email }</td>
      
      
	  <td><input type="button"  class="btn btn-danger btn-sm" value="삭제" onclick="location.href='${pageContext.request.contextPath}/admin/memberDeleteForm.do?member_num2=${list.member_num}&id2=${list.id}&name2=${list.name}'" ></td>      
	  <input type="hidden" name="admin_num2" value="${list.member_num}">
    </tr>
  </tbody>
  </c:forEach>
</c:if>
</table>
<div class="align-center" id="paging" align="center">
	${pagingHtml} 
</div>
<!--                 </form>    -->
                     
                </div>
        </div> <!-- col-sm-12 -->
    </div><!-- row -->
</div> <!-- container end-->
		   
		    </div>
		    
		    
	    </div>
    </div>
    <div style="margin-bottom: 220px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>