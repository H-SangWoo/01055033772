<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션 사용 : 특별한 경우가 아니면 굳이 사용할 필요가 없음, 기본값이 true -->


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.8, maximum-scale=0.8, user-scalable=no">


<title>로그인 / 회원가입</title>
<link rel="stylesheet" href="/resources/css/login.css">


<script type="text/javascript"> 


// 아이디가 존재하지 않을 때

var result = '${aaa}';
if(result == "loginFail" )
	alert("아이디나 비밀번호가 일치하지 않습니다.");

</script> 

</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<a href="${pageContext.request.contextPath}/planner/shareboard"><button
						type="button" class="togglebtn">HOME</button></a>

			</div>
			<div class="social-icons">
				<!-- <img src="./images/fb.png" alt="facebook"> 
				<img src="./images/tw.png" alt="twitter"> 
				<img src="./images/gl.png" alt="google"> -->
			</div>

			<form id="login" action="/user/loginPost"
				class="input-group" method="post">

				<input type="text" class="input-field" placeholder="아이디" id="USRID"
					name="USRID" onfocus="this.placeholder=''"
					onblur="this.placeholder='아이디'" required>
				

				<input type="password" class="input-field" placeholder="비밀번호"
					id="USRPASSWORD" name="USRPASSWORD" onfocus="this.placeholder=''"
					onblur="this.placeholder='비밀번호'" required>

				<label>
          			<input type="checkbox" name="useCookie" id="useCookie"> 7일동안 로그인 유지
        		</label>
				
				
				<!-- <input type="checkbox" class="checkbox"><span>비밀번호 기억하기</span> -->
				<!-- 			<a href="login.do" button class="submit" onclick="oepnIdchk()">로그인</button></a> --->

				<button class="submit" type="submit">로그인</button>

				<a href="searchPwd"><button2 class="submit2">비밀번호 찾기 </a></button2>

				<a href="/user/join"><button4
						class="submit4">회원가입 </button4></a>
						
				

			</form>



		</div>
	</div>
</body>

</html>

