<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<link rel="stylesheet" href="/resources/css/style2.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.8, maximum-scale=0.8, user-scalable=no">
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
#register {
	width: 280px;
	margin: 0 auto;
}

#idcheck {
	width: 65px;
	position: relative;
	left: 220px;
	bottom: 40px;
}
</style>



<script>
	$(function() {

		var password = $('#USRPASSWORD').val();

		//radio check				
		// 빈칸 체크
		$('#submit').click(
				function() {
					var radioVal = $('input[name="USRGENDER"]:checked').val();
					if (radioVal == "" || $('#USRNAME').val() == ""
							|| $("#USRNICKNAME").val() == ""
							|| $("#USRPASSWORD").val() == ""
							|| $("#USRID").val() == ""
							| $('#USREMAIL').val() == ""
							|| $('#USRDOB').val() == "") {
						alert("빈칸이없는지 확인해주세요 !");
						return false;
					}

					// 중복확인버튼 클릭 체크
					var idChkVal = $("#idcheck").val(); //N

					if (idChkVal == "N") {
						alert("중복확인 버튼을 눌러주세요.");
						return false;
					} else if (idChkVal == "Y") {
						$("#register").submit();
					}
				});

		$('#idcheck').click(function() {

			console.log($("#USRID").val());
			$.ajax({
				url : "/user/idChk",
				type : "POST",
				dataType : "json", //서버로부터 내가 받는 데이터의 타입
				data : {
					"USRID" : $("#USRID").val()
				},
				success : function(data) {
					if ($("#USRID").val() == "") {
						alert("아이디를 입력해주세요.");
						return false;
					}
					if (data == 0) {
						console.log("아이디 없음");
						$("#idcheck").attr("value", "Y"); // 클릭시 Y로
						alert("사용하실 수 있는 아이디입니다.");
					} else {
						console.log("아이디 있음");
						alert("중복된 아이디가 존재합니다.");
					}
				}

			});
		});

		// 아이디 체크	
		$("#USRID").blur(function() {
			//var idJ = /^[a-z0-9]{4,12}$/; // a~z,0~9 로 시작하는 4~12 자리 아이디를 만들수있다. 

			if ($("#USRID").val() == "") {
				$("#id_checkbox").text("아이디를 입력해주세요");
				$('#id_checkbox').css('color', 'red');
				$("#submit").attr("disabled", true);

			} else {
				$("#id_checkbox").text("");
				$("#submit").attr("disabled", false);
			}
		});

		//이름 체크 : 2 자리이상
		$('#USRNAME').blur(function() {
			if ($("#USRNAME").val() == "") {
				$("#namecheck").text("이름을 입력해주세요");
				$('#namecheck').css('color', 'red');
				$("#submit").attr("disabled", true);

			} else if ($("#USRNAME").val().length < 2) {
				$("#namecheck").text("이름은 2자 이상이여야합니다.");
				$('#namecheck').css('color', 'red');
				$("#submit").attr("disabled", true);
				return false;
			} else {
				$("#namecheck").text("");
				$("#submit").attr("disabled", false);
			}
			return true;
		});

		//닉네임 체크 
		$("#USRNICKNAME").blur(function() {
			if ($("#USRNICKNAME").val() == "") {
				$("#nicknamecheck").text("닉네임을 입력해주세요");
				$('#nicknamecheck').css('color', 'red');
				$("#submit").attr("disabled", true);

			} else {
				$("#nicknamecheck").text("");
				$("#submit").attr("disabled", false);
			}
		});

		//비밀번호 체크 
		$("#USRPASSWORD")
				.blur(
						function() {

							if ($('#USRPASSWORD').val() == '') {
								$("#password_check").text("비밀번호 를 작성해주세요");
								$("#password_check").css("color", "red");
								$("#submit").attr("disabled", true);

							} else {
								var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/; //영문, 숫자 혼합 최소 6자 . 

								if (reg_pwd.test($('#USRPASSWORD').val())) {
									$("#password_check").text("");
									$("#submit").attr("disabled", false);
								} else {
									$('#password_check').text(
											"비밀번호는 영문,숫자 혼합 최소 6 자리 이상 입니다.");
									$('#password_check').css('color', 'red');
									$("#submit").attr("disabled", true);
								}
								return true;
							}
						});
		// 비밀번호 확인
		$("#pw2").blur(function() {
			if ($('#pw2').val() != $('#USRPASSWORD').val()) {
				$("#confirmpassword_check").text("입력하신 비밀번호가 다릅니다.");
				$("#confirmpassword_check").css("color", "red");
				$("#submit").attr("disabled", true);
			} else {

				$("#confirmpassword_check").text("");

			}
		});
	});
</script>

<title>회원가입</title>
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<a href="${pageContext.request.contextPath}/planner/shareboard"><button
						type="button" class="togglebtn">HOME</button></a>
			</div>
			<div class="test">
				<!-- <form id="register" onsubmit="return oepnIdchk();" action="join.do"
					class=" " method ="post"> -->
			</div>
			<form id="register" action="/user/join" method="post">


				<input type="text" class="input-field" placeholder="아이디를 입력하세요"
					name="USRID" id="USRID" maxlength="50"
					onfocus="this.placeholder=''"
					onblur="this.placeholder='아이디를 입력하세요'">
				<div class="id_checkbox" id="id_checkbox"></div>

				<button id="idcheck" type="button" value="N">중복체크</button>

				<input type="text" class="input-field" placeholder="닉네임을 입력하세요"
					name="USRNICKNAME" id="USRNICKNAME" onfocus="this.placeholder=''"
					onblur="this.placeholder='닉네임을 입력하세요'">
				<div class="nicknamecheck" id="nicknamecheck"></div>

				<input type="password" class="input-field" placeholder="비밀번호를 입력하세요"
					name="USRPASSWORD" id="USRPASSWORD" class="USRPASSWORD"
					onfocus="this.placeholder=''"
					onblur="this.placeholder='비밀번호를 입력하세요'">
				<div class="password_check" id="password_check"></div>

				<input type="password" class="input-field"
					placeholder="비밀번호를 재입력하세요" name="pw" id="pw2" class="pw2"
					onfocus="this.placeholder=''"
					onblur="this.placeholder='비밀번호를 재입력하세요'">
				<div class="confirmpassword_check" id="confirmpassword_check"></div>

				<input type="text" class="input-field" placeholder="이름을 입력하세요"
					name="USRNAME" id="USRNAME" onfocus="this.placeholder=''"
					onblur="this.placeholder='이름을 입력하세요'">
				<div class="namecheck" id="namecheck"></div>

				<input type="email" class="input-field" placeholder="이메일을 입력하세요"
					name="USREMAIL" id="USREMAIL" onfocus="this.placeholder=''"
					onblur="this.placeholder='이메일을 입력하세요'">

				<div class="col-tit" placeholder="xxxx-xx-xx">생년월일</div>
				<div class="row">
					<input type="date" class="input-field" name="USRDOB" id="USRDOB"
						placeholder="생년월일">
				</div>

				<div class="text" placeholder="xxxx-xx-xx">성별</div>
				<div class="row">
					<input type="radio" name="USRGENDER" id="USRGENDER" value="M">남
					<input type="radio" name="USRGENDER" value="W">여
				</div>

				<button class="submit" type="submit" name="submit" id="submit">회원가입</button>

			</form>

		</div>
	</div>

</body>
</html>

