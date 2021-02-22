<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 세션 사용 : 특별한 경우가 아니면 굳이 사용할 필요가 없음, 기본값이 true -->

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.8, maximum-scale=0.8, user-scalable=no">
<!-- <script>

 $(function() {

	
	 $('#submit').click(function(){
			
			$.ajax({
			    url: "/user/idChk",
			    type: "POST",
			    dataType: "json", 
			    data: {USRID : $("#USRID").val()},
			    success: function(data){
					 if(data == 0){
						 alert("아이디가 존재하지 않습니다.");
						 return false;
					 }
			    }
			  });
		}); 
	});
 
 </script> -->


<script type="text/javascript"> 

// 이메일 전송 완료시
var result = '${msg}';

if (result == 'SUCCESS') {
	alert("이메일 전송이 완료되었습니다.");

}
// 이메일 전송 실패시 
var result1 = '${message}';

if (result1 == 'false') {
	alert("아이디나 이메일이 올바르지 않습니다.");
	
}
// 아이디가 존재하지 않을 때
var result2 = '${idChk}';

if (result2 == 'idcheck') {
	alert("아이디가 존재하지 않습니다.");
	
}

</script>


<title>비밀번호찾기</title>
<link rel="stylesheet" href="/resources/css/style2.css">
</head>
<body>
	<div class="wrap">
		<div class="form-wrap">
			<div class="button-wrap">
				<div id="btn"></div>
				<a href="${pageContext.request.contextPath}/planner/shareboard""><button type="button" class="togglebtn">HOME</button></a>
				
			</div>
			<div class="social-icons">
				<!-- <img src="./images/fb.png" alt="facebook"> 
				<img src="./images/tw.png" alt="twitter"> 
				<img src="./images/gl.png" alt="google"> -->
			</div>
			
			
			
			<form id="searchPassword" action="searchPwd" class="input-group" method="post">
			
			<%-- 	<input type="hidden"  id="usrEmail"  value="${UsrVO.USREMAIL}">  --%>
				
				<input type="text" class="input-field" placeholder="아이디" id="USRID"
					name="USRID" onfocus="this.placeholder=''"
					onblur="this.placeholder='아이디'" required> 
				<input type="email" class="input-field" placeholder="E-mail" id="USREMAIL" 
					name="USREMAIL" onfocus="this.placeholder=''"
					onblur="this.placeholder='E-Mail'" required>

				<button class = "submit" type="submit">전송</button>
				<!-- <a href="loginform"><button class="submit"> 로그인 </button></a> -->
			   <!-- <button class = "submit" type = "button" onclick = "location.href = '/ '" ></button> -->
			</form>

		</div>
	</div>

</body>

</html>

