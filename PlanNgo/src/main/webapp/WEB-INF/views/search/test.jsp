<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<style>
.btn1 {
	display: inline-block;
	padding: .2em .6em .3em;
	font-size: 100%;
	line-height: 1;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border: 2px solid #3ad195;
}

.btn1:hover {
	cursor: pointer;
}

.btn1 a {
	display: inline-block;
	color: white;
	font-size: 20px;
	/* width: 50px;
   height: 33px; */
}

.banner_top_right {
	position: relative;
}

.btn1 {
	padding: 10px 35px;
	/* position: absolute; */
	float: right;
	top: 10px;
	right: 10px;
}

.navbar-nav {
	margin-left: 4em;
}

.banner_top_left p:before {
	background: url(../images/123123.png) no-repeat 0px 0px;
	display: block;
	width: 50px;
	height: 50px;
	content: '';
	position: absolute;
	top: 0%;
	left: 1%;
}
</style>
<head>
<title>Your Trip a Travel Agency Category Flat Bootstrap
	Responsive Website Template | Home :: w3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Your Trip Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
   
   
   
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
      function hideURLbar(){ window.scrollTo(0,1); } 






</script>
<!-- //for-mobile-apps -->
<link href="/resources/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all" />


<!-- js -->
<script src="/resources/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link
	href='//fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald:400,300,700'
	rel='stylesheet' type='text/css'>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="/resources/js/move-top.js"></script>
<script type="text/javascript" src="/resources/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>

<!-- start-smoth-scrolling -->
</head>

<body>
	<!-- banner -->

	<div class="banner">
		<div class="container">
			<div class="banner_top">
				<div class="banner_top_left">
					<p>
						<a href="share.do"></a>
					</p>
				</div>

				<div class="banner_top_right">
					<c:choose>
						<c:when test="${empty User}">
							<form>
								<div class="btn1">
									<a href="login.do"> 로그인 </a>
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<form>
								<div class="btn1">
									<a href="logout.do"> 로그아웃 </a>
								</div>
							</form>
						</c:otherwise>
					</c:choose>


				</div>


				<div class="clearfix"></div>
			</div>


			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav cl-effect-14">
						<li><a href="${pageContext.request.contextPath}/myplanner.do">내
								플래너</a></li>
						<li><a href="${pageContext.request.contextPath}/share.do">공유
								플래너 </a></li>
						<li><a
							href="${pageContext.request.contextPath}/packagelist.do">여행패키지</a></li>
						<li><a href="${pageContext.request.contextPath}/search.do">탐색</a></li>
						<!-- 	class = .  -->
						<c:if test="${(authAgency.usrName eq '하나투어') or (authAgency.usrName eq 'R')}">
							<li class="packageCreate"><a
								href="${pageContext.request.contextPath}/packageCreate.do">패키지
									등록</a></li>
						</c:if>
						<li><a href="${pageContext.request.contextPath}/list.do">고객센터</a></li>
					</ul>
				</div>
			</nav>
			<div class="logo">
				<a href="share.do">Plan & Go<span>한국 여행 플래너</span></a>
			</div>

		</div>
	</div>