<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>회원탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.8, maximum-scale=0.8, user-scalable=no">
<link rel="stylesheet" href="/resources/css/style2.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
$(document).ready(function() {
	
	// id 체크 
	$("#USRID").blur(function(){		
		if($("#USRID").val() == ""){
			$("#id_checkbox").text("아이디를 적어주세요");
			$('#id_checkbox').css('color', 'red');
			$("#submit").attr("disabled", true);
		}else {
				$("#id_checkbox").text("");
				$("#submit").attr("disabled", false);			
			}
		});
	
	
	//비밀번호 체크 
	$("#USRPASSWORD").blur(function() {
		if($("#USRPASSWORD").val() == ""){
			$("#password_check").text("비밀번호를 적어주세요");
			$('#password_check').css('color', 'red');
			$("#submit").attr("disabled", true);
			
		}else{
			$("#password_check").text("");
			$("#submit").attr("disabled", false);
		}
	});
	//pw2 = USRPASSWORD 체크
	$("#pw2").blur(function() {
		if($("#pw2").val() != $("#USRPASSWORD").val()){
			$("#confirmpassword_check").text("비밀번호가 일치하지 않습니다.");
			$('#confirmpassword_check').css('color', 'red');
			$("#submit").attr("disabled", true);
			
		}else{
			$("#confirmpassword_check").text("");
			$("#submit").attr("disabled", false);
		}
	});
		
	//빈칸 체크
	$('#submit').on("click", function () {
	  	 if($("#USRPASSWORD").val() == "" || $("#USRID").val() == "" || $("#pw2").val() == ""){
			 alert("빈칸이없는지 확인해주세요!");
			 return false;
	      }
	  });

});
</script>
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>

			</div>

<!-- 회원탈퇴 -->
			<div class="test">
				<!-- <form id="register" onsubmit="return oepnIdchk();" action="join.do"
					class=" " method ="post"> -->
				<form id="register"  name ="delete" action="delete" method ="post">
					
					<input type="hidden" class="input-field"  name="USRID" id="USRID" maxlength="50" onfocus="this.placeholder=''"
							onblur="this.placeholder='아이디를 입력하세요'" value="${login.USRID}">
					<div class="id_checkbox" id="id_checkbox"></div>
						
						 <input
						type="password" class="input-field" placeholder="비밀번호를 입력하세요"
						name="USRPASSWORD" id="USRPASSWORD" class = "USRPASSWORD" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호를 입력하세요'">
						<div class="password_check" id="password_check"></div>
						 <input
						type="password" class="input-field" placeholder="비밀번호를 재입력하세요"
						name="pw" id="pw2" class = "pw2" onfocus="this.placeholder=''"
						onblur="this.placeholder='비밀번호를 재입력하세요'"> 
						<div class="confirmpassword_check" id="confirmpassword_check"></div>
						
					<div>
						<c:if test="${msg == false}">
					비밀번호가 맞지 않습니다.
				</c:if>
					</div>
					<!-- <button class="submit" type="submit" name="submit" id="submit"
						onclick="oepnIdchk()">회원가입</button> -->
					<button class="submit" type="submit" name="submit" id="submit" onclick="return confirm('정말 삭제하시겠습니까?')">회원탈퇴</button>
					<button class="submit" type="button" onclick = "location.href = '/ '" >취소</button>
					<div class="password_checkbox1" id="ipassword_checkbox1"></div>

					
				</form>
			</div>
		</div>
	</div>

</body>
</html>

	