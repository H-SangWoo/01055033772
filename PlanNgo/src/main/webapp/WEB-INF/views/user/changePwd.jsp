<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/css/style2.css">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.8, maximum-scale=0.8, user-scalable=no">
<title>회원 정보 수정</title>
<style>
#change {
	width: 280px;
	margin: 0 auto;
}

</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script>

$(function() {
	
	//빈칸 체크 & 비밀번호 체크 
	$('#submit').on("click", function () {
	  	 if($("#curpwd2").val() == "" || $("#chpwd").val() == ""){
			 alert("빈칸이없는지 확인해주세요!");
			 return false;
	      }
	  	var pwd1 = $("#curpwd1").val(); // 로그인된 비밀번호 
		var pwd2 = $("#curpwd2").val(); // 입력한 비밃너호 
		
		if( pwd1 ==pwd2){
	 		
	 		$.ajax({
	 			url: "user/changePwd",
	 			type: "POST",
	 			dataType: "json",
	 			data: {USRPASSWORD :  $("#chpwd").val()},
	 		    success: function(data){
	 		    }
	 		});
	 		
		}else{
			alert("현재 비밀번호가 일치하지 않습니다.");
			return false;
		}
	  	 
	  	 
	 });
	

//현재 비밀번호 체크 
$("#curpwd2").blur(function() {
	if($("#curpwd2").val() == ""){
		$("#password_check1").text("현재 비밀번호를 입력해주세요");
		$('#password_check1').css('color', 'red');
		$("#submit").attr("disabled", true);
		
	}else{
		$("#password_check1").text("");
		$("#submit").attr("disabled", false);
	}
});
	
// 변경할 비밀번호 체크 
$("#chpwd").blur(function() {
	
	if ($('#chpwd').val() == '' ) {
		$("#password_check2").text("비밀번호를 작성해주세요");
		$("#password_check2").css("color", "red");
		$("#submit").attr("disabled", true);

	}else {
		var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //영문, 숫자 혼합 최소 6자 . 

		if(reg_pwd.test($('#chpwd').val())){
			$("#password_check2").text("");
			$("#submit").attr("disabled", false);
		}  else {
			$('#password_check2').text("비밀번호는 영문,숫자 혼합 최소 6 자리 이상 입니다.");
			$('#password_check2').css('color', 'red');
			$("#submit").attr("disabled", true);
		}
		return true;
	}
});
});
</script>

<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<a href="${pageContext.request.contextPath}/planner/shareboard"><button
						type="button" class="togglebtn">HOME</button></a>

			</div>
			
			<form id ="change" action="changePwd" method="post">

				<input type="hidden" name="USRID"  id="USRID"  value="${login.USRID}"> 
				<input type="hidden" id="curpwd1"  name="curpwd1"  value="${login.USRPASSWORD}"> 
			
			 
			 <input type="password" class="input-field"  id="curpwd2"  name="curpwd2" class = "USRPASSWORD" 
					placeholder="현재 비밀번호를 입력하세요 "  onfocus="this.placeholder=''">
					<div class="password_check1" id="password_check1"></div>
			 
					
				<input type="password" class="input-field" name="USRPASSWORD"  id="chpwd" class = "USRPASSWORD" 
					placeholder="새로운 비밀번호를 입력하세요 "  onfocus="this.placeholder=''">
					<div class="password_check2" id="password_check2"></div>

				<input class="submit" type="submit"  id="submit" value="암호 변경" onclick= "return confirm('정말 변경하시겠습니까?')" >
	 			
			</form>
		
</div>
</div>
</body>
</html>