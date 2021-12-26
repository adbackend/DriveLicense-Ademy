<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="./css/login_style.css"> -->
<style type="text/css">
.loginForm{
margin-left:600px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#deleteForm').submit(function(){
			if($('#passwd1').val().trim()==''){
				alert('비밀번호를 입력하세요');
				$('#passwd1').val('').focus();
				return false;
			}
			
			if($('#passwd2').val().trim()==''){
				alert('비밀번호 확일을 입력하세요');
				$('#passwd2').val('').focus();
				return false;
			}
			
			if($('#passwd1').val()!=$('#passwd2').val()){
				alert('비밀번호와 비밀번호확인 불일치!');
				$('#passwd2').val('').focus();
				return false;
			}
		});// end submit
	
		//비밀번호 확인 까지 한후 다시 비밀번호를 수정하면 비밀번호 확인 및 메시지 초기화
		$('#passwd1').keyup(function(){
			$('#passwd2').val('');
			$('#message_pw').text('');
		});
		
// 		//비밀번호와 비밀번호 확인 일치 여부 체크
// 		$('#passwd2').keyup(function(){
// 			if($('#passwd').val() == $('#passwd2').val()){
// 				$('#message_pw').text('비밀번호 일치');
// 			}else{
// 				$('#message_pw').text('');
// 			}
// 		});

	    $('#passwd2').focusout(function () {
	        var passwd1 = $('#passwd1').val();
	        var passwd2 = $('#passwd2').val();
	  
	        if ( passwd1 != '' && passwd2 == '' ) {
	            null;
	        } else if (passwd1 != '' || passwd2 != '') {
	            if (passwd1 == passwd2) {
	                $('#alert-success').css('display', 'inline-block');
	                $('#alert-danger').css('display', 'none');
	            } else {
	                alert('비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.');
	                $('#alert-success').css('display', 'none');
	                $('#alert-danger').css('display', 'inline-block');
	            }
	        }
	    });
		
	});
</script>
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- header 끝 -->
	<!-- menu 시작 -->
	<jsp:include page="/WEB-INF/views/common/menu.jsp"/>
	<!-- menu 끝 -->
	


<div id="main-width">
<div id="menuinfo">
	회원 탈퇴
</div>
<div style="margin-left: auto;">
<form id="deleteForm" method="post" action="memberDelete.do" style="width: 800px; margin-left: 380px; margin-right: auto;">
  			<div class="form-group" id="divEmail">
				<b><label for="id" class="col-lg-2 control-label">아이디</label></b>
				<div class="col-lg-7">
					<input type="text" class="form-control" id="id" name="id" maxlength="8" readonly="readonly" value="${member.id}">
				</div>
			</div>	
			<br>
  			<div class="form-group" id="divEmail">
				<b><label for="passwd1" class="col-lg-2 control-label">비밀번호</label></b>
				<div class="col-lg-7">
					<input type="password" class="form-control" id="passwd1" name="passwd1" placeholder="비밀번호" maxlength="8"><br>
				</div>
			</div>	
  			<div class="form-group" id="divEmail">
				<b><label for="passwd2" class="col-lg-2 control-label">비밀번호 확인</label></b>
				<div class="col-lg-7">
					<input type="password" class="form-control" id="passwd2" name="passwd2" placeholder="비밀번호 확인" maxlength="8">
<!-- 					<span id="message_pw"></span> -->
					<span id="alert-success" style="display: none; color:blue">비밀번호가 일치합니다.</span>
    				<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
					
				</div>
			</div>	
	<div style="margin-left: 145px;">
	  <button type="submit" class="btn btn-danger">회원탈퇴</button>
	  <input type="button" class="btn btn-primary" value="취소" onclick="location.href='memberMyPageForm.do'">
  </div>
  </form>
      </div>
</div>
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>