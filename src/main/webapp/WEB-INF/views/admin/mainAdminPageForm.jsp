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
.table table-striped{
margin-left
}

#table2{
margin-left:160px;
margin-top:30px;
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
<div class="container-scroller">
<div class="container">
    <div class="row">
        <div class="col-sm-18">
            <div class="col-sm-18"></div>
                <div class="col-sm-15" id="table2">
                    <h2 class="text-center">내 정보</h2>
                     
<!--                     <form action="MemberUpdateProc.jsp" method="post"> -->
                     
                    <table class="table">
                    
                      <tr>
                        <td style="font-weight: bold;">관리자 구분</td>
					<c:if test="${adminVO.admin_auth==1}">
                        <td>일반관리자</td>
					</c:if>
					<c:if test="${adminVO.admin_auth==2}">
						<td>최고관리자</td>
					</c:if>
                      </tr>

                      <tr>
                        <td style="font-weight: bold;">아이디</td>
                        <td>${adminVO.admin_id }</td>
                      </tr>
                      
                      <tr>
                        <td style="font-weight: bold;">이름</td>
                        <td>${adminVO.admin_name }</td>
                      </tr>
                      
                      
                       
                    <tr>
                        <td colspan="2" class="text-center">
<%--                          <input type="hidden" name="id" value="${adminVO.admin_id }"> --%>
                         <input type="hidden" name="member_num" value="${adminVO.admin_num }">
                         <input type="button" value="정보 수정하기" class="btn btn-dark" onclick="location.href='myPageModifyForm.do'">
<!--  						<button type="button"  class="btn btn-outline-dark" onclick="location.href='MemberList.jsp'">회원 전체 보기</button> -->
                         </td>    
                    </tr>
                           
                    </table>
<!--                 </form>    -->
                     
                </div>
        </div> <!-- col-sm-12 -->
    </div><!-- row -->
</div> <!-- container end-->
		   
		    </div>
		    
		    
		    
		    
		    
		    
		    
	    </div>
    </div>


    <div style="margin-bottom: 185px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>