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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
#btn1{
margin-left:480px;
}

.table{
margin-left:40px;
margin-right:300px;
}
#admin_1{
margin-left:200px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	var idChecked = 0;
	
	$('#id_check').click(function(){
		if($('#admin_id').val().trim()==''){
			alert('아이디를 입력하세요');
			$('#admin_id').focus();
			$('#admin_id').val('');
			return ;
		}
		$('#message_id').text('');
		
		$.ajax({
			url:'checkDupliatedId2.do',
			type:'post',
			data:{admin_id:$('#admin_id').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='isNotFound'){
					idChecked=1;
					$('#message_id').css('color','blue').text('등록가능한 ID');
				}else if(param.result=='isDuplicated'){
					idChecked=0;
					$('#message_id').css('color','red').text('중복된 ID');
					$('#admin_id').val('').focus();
				}else{
					idCheck=0;
					alert('아이디 중복 체크 오류 발생');
				}
			},
			error:function(){
				alert('1');
				idChecked=0;
				alert('아이디 중복 체크 오류 발생');				
			}
		});
		
	});
	
	//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
	$('#adminAddForm #admin_id').keydown(function(){
		idChecked=0;
		$('#message_id').text('');
	});
	
	var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/); //4~12자의 영문 대소문자와 숫자로만 입력

	$('#adminAddForm').submit(function(){
		if($('#admin_id').val().trim()==''){
			alert('아이디를 입력하세요.');
			$('#admin_id').focus();
			$('#admin_id').val('');
		}
		
		if(!getCheck.test($("#admin_id").val())){ 
			alert("4~12자의 영문 대소문자와 숫자로만 입력"); 
			$('#admin_id').val(''); 
			$('#admin_id').focus(); 
			return false; 
		}
		
		if(idChecked==0){
			alert('아이디 중복 체크 필수!');
			return false;
		}
		
		if($('#admin_name').val().trim()==''){
			alert('이름 입력하세요!');
			$('#admin_name').focus();
			$('#admin_name').val('');
			return false;
		}
		
		if($('#admin_passwd').val().trim()==''){
			alert('패스워드를 입력하세요!');
			$('#admin_passwd').focus();
			$('#admin_passwd').val('');
			return false;
		}
		
		if($('#passwd2').val().trim()==''){
			alert('비밀번호 확일을 입력하세요');
			$('#passwd2').val('').focus();
			return false;
		}	
		
		if($('#admin_passwd').val()!=$('#passwd2').val()){
			alert('비밀번호와 비밀번호확인 불일치!');
			$('#passwd2').val('').focus();
			return false;
		}
		
	});
	
    $('#passwd2').focusout(function () {
        var admin_passwd = $('#admin_passwd').val();
        var passwd2 = $('#passwd2').val();
  
        if ( admin_passwd != '' && passwd2 == '' ) {
            null;
        } else if (admin_passwd != '' || passwd2 != '') {
            if (admin_passwd == passwd2) {
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

   <div class="wrap">
   <br>
	    <header class="w">
		    <h3>관리자 추가</h3>
	    </header>
	    
<jsp:include page="/WEB-INF/views/admin/adminAside.jsp"/>
<div id="container" class="clear">

<div style="width: 1000px;">
<div class="container">
    <div class="row">
        <div class="col-sm-15">
            <div class="col-sm-5"></div>
                <div class="col-sm-15" id="admin_1">
                    <h2 class="text-center">관리자 추가</h2>
						<br>                    
                    <form id="adminAddForm" action="adminAdd.do" method="post">
					<input type="radio" name="admin_auth" value="1" checked>일반관리자
					<br>
					<br>
			<div class="form-group" >
				<b><label for="admin_id" class="col-lg-2 control-label">아이디</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="admin_id" name="admin_id"  placeholder="4~12자의 영문 대소문자와 숫자로만 입력 " maxlength="20">
					<br><input type="button"  value="ID중복체크" id="id_check">
					<span id="message_id"></span>
				</div>
			</div>
			
			<br>
			<div class="form-group" >
				<b><label for="admin_name" class="col-lg-2 control-label">이름</label></b>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="admin_name" name="admin_name"  placeholder="이름 " maxlength="20">
				</div>
			</div>
			
			<br>
			<div class="form-group" id="divPassword">
				<b><label for="passwd1" class="col-lg-3 control-label">비밀번호</label></b>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="admin_passwd" name="admin_passwd"  placeholder="패스워드" maxlength="30">
				</div>
			</div><br>
			
			<div class="form-group" id="divPassword">
				<b><label for="passwd2" class="col-lg-3 control-label">비밀번호 확인</label></b>
				<div class="col-lg-10">
					<input type="password" class="form-control" id="passwd2" name="passwd2"  placeholder="비밀번호 확인" maxlength="30">
					<span id="alert-success" style="display: none; color:blue">비밀번호가 일치합니다.</span>
    				<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
	
				</div>
			</div><br>
			
			
			
			
				<div class="col-lg-offset-2 col-lg-10">
<!-- 					<button type="submit" class="btn btn-primary">로그인</button> -->
						<input type="submit" class="btn btn-primary" value="추가">
				</div>			


                </form>   
                     
                </div>
        </div> <!-- col-sm-12 -->
    </div><!-- row -->
</div> <!-- container end-->
		   
		    </div>
		    
		    
		    
		    
		    
		    
		    
	    </div>
    </div>


    <div style="margin-bottom: 100px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</body>
</html>