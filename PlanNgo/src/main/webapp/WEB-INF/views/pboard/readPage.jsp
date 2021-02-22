<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script type="text/javascript" src="/resources/js/upload.js"></script>

<style>

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

li {
	
}

.planner {
	padding: 5em 0;
	background-color: #eeecec;
}

.planner .container {
	padding: 0;
}

.planner-top {
	display: flex;
}

.planner-top-img {
	width: 100%;
	max-width: fit-content;
}

.planner-top-img img {
	width: 100%;
	
}

.planner-top-content {
	width: 100%;
	position: relative;
	margin: 3em 5%;
}

.planner .loc {
	margin-bottom: 10px;
	display: flex;
	color: #d0c9c9;
}

.planner-top {
	background: #fff;
}

	

.planner-top-content .loc span:hover {
	cursor: pointer;
}

.planner-top-content .loc span:first-child {
	margin: 0 10px 0 0;
}

.planner-top-content .loc span:last-child {
	margin-left: 10px;
}

.planner-top-content h3 {
	font-weight: bold;
}

.planner-top-content h4 {
	margin-top: 10px;
}

@media ( max-width : 480px) {
	.planner-top-content {
		margin: 4%;
	}
	.planner-top-content .loc {
		font-size: 13px;
	}
	.planner-top-content h3 {
		font-size: 18px;
	}
	.planner-top-content h4 {
		font-size: 12px;
	}
}

.planner-top-content i {
	position: absolute;
	font-size: 20px;
	top: 0;
	right: 0;
	color: #8f8f8f;
	/* border: 3px solid #FF2D00;
	border-radius: 4px;
	text-align: center;
	padding: 0.5em; */
}

.planner-top-content .like {
	font-weight: bold;
	color: #FF2D00;
}

.planner-top-content i:hover {
	cursor: pointer;
}

.planner-nav {
	line-height: 54px;
	background: #fff;
	margin-top: 50px;
	width: 100%;
	height: 56px;
}

.nav-container {
	
}

.nav-wrapper-left {
	text-align: center;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	width: 100%;
	display: flex;
}

.nav-wrapper-right {
	float: right;
}

.planner-nav-item:hover {
	cursor: pointer;
}

.nav-wrapper-left>.active {
	font-weight: bold;
	border-bottom: 2px solid #3ad195;
}

.nav-item-line {
	width: 1px;
	background: #b3b3b3;
}

.planner-nav-item {
	width: 100%;
}

.planner-content {
	margin-top: 50px;
}

.planner-container {
	display: block;
	justify-content: space-between;
	width: 100%;
	padding-top: 50px;
}

.planner-content-left {
	width: 62%;
	background: #fff;
}

.planner-content-right {
	width: 33%;
	background: #fff;
}

.schedule-box {
	width: 100%;
	display: flex;
}

.schedule-box-info {
	height: 60px;
	width: 100%;
	display: flex;
}

.day-txt {
	text-transform: uppercase;
	background: #000;
	color: #fff;
	vertical-align: middle;
	line-height: 60px;
	font-weight: bold;
	width: 1%;
	text-align: center;
	background: #000;
}

.schedule-box:nth-child(n+2) {
	border-top: 1px solid #000;
}

.day-info-date {
	font-weight: bold;
	font-size: 13px;
	color: #b3b3b3;
}

.day-info-title {
	font-size: 18px;
	font-weight: bold;
}

.test {
	border-top: 1px solid #000;
}

.schedule-perDay {
	border-top: 1px solid #000;
	padding: 5% 0 5% 5%;
}

.comment-container {
	margin-top: 50px;
}

.comment-wrapper {
	display: block;
	flex-direction: row;
	justify-content: space-between;
	position: relative;
	left: 18%;
}

.planner-comment-left {
	border: 1px solid #000;
	background: #fff;
	width: 62%;
}

.planner-comment-right {
	width: 33%;
}

.comment-header {
	padding: 1.4em 1em;
	font-weight: bold;
}

.divider {
	opacity: 0.7;
	background: #000;
	width: 100%;
	height: 1px;
	margin-bottom: 1em;
}

.comment-list {
	padding: 0 1em;
}

.comment-input {
	background: #f7f7f7;
	padding: 2em 1em;
}

.comment-area {
	display: flex;
	justify-content: space-between;
}

.comment-profile {
	width: 6%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.comment-profile img {
	width: 100%;
	background: #ececec;
	border-radius: 50%;
}

#input-comment {
	resize: none;
	margin-right: 20px;
	margin-left: 20px;
	max-width: 80%;
	width: 100%;
}

.comment-submit {
	color: #fff;
	font-size: 13px;
	line-height: 28px;
	padding: 0.8em 1em;
	background: #838383;
}

.comment-submit:hover {
	cursor: pointer;
}

.comment-by-user {
	border-top: 1px solid #e9e9e9;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-top: 1em;
}

.comment-by-user:last-child {
	margin-bottom: 1em;
}

.comment-area-left {
	display: flex;
	width: 70%;
}

.comment-area-left .comment-profile {
	width: 10% !important;
}

.comment-content {
	margin-left: 20px;
}

.user-comment-header {
	display: flex;
}

.comment-date {
	margin-left: 20px;
}

.comment-body {
	margin-top: 20px;
}

.comment-area-right {
	height: 50%;
	width: 30%;
	display: flex;
	justify-content: flex-end;
}

.comment-area-right div {
	font-size: 14px;
	color: #49b2e9;
}

.comment-area-right div:hover {
	cursor: pointer;
}

.comment-area-right div:last-child {
	margin-left: 10px;
}

.comment-by-user:last-child {
	margin-bottom: 1em;
}

.none-comment-container {
	text-align: center;
}

#comment-none {
	border-top: 1px solid #e9e9e9;
	margin-top: 1em;
	margin-bottom: 3em;
	padding-top: 3em;
	text-align: center;
	display: none;
}

#comment-none {
	border-top: 1px solid #e9e9e9;
	margin-top: 1em;
	margin-bottom: 3em;
	padding-top: 3em;
	text-align: center;
	/* display: none; */
}

.stu_division {
	width: 100%;
	margin-top: 50px;
	position: relative;
	padding: 30px 20px;
	background: #fff;
}

.afont {
	font-weight: bold;
	color: #141516;
}

.package-content-font {
	font-weight: bold;
	color: #141516;
	font-size: x-large;
}

.delete-package {
	position: relative;
	float: right;
	top: 67%;
	left: 8%;
	margin: 0;
	padding: 0.5rem 1rem;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 1rem;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: auto;
	border: none;
	border-radius: 4px;
	background-color: #dc3545;
}

.imgShow {
	width: 100%;
	height: 400px;
}

.sd img {
	width: 100%;
}

h3.stu_h3_title {
	font-size: 1.4em;
}

@media screen and (max-width:480px) {
	.package-content-font {
		font-size: 0.9em;
	}
	.sd img {
		width: 100%;
		
	}
}
</style>

<!-- portfolio -->

<div class="planner">
	<div class="portfolio">
		<div class="container">
			<div class="stu_division">
				<h3>${PackageVO.AGENCYNAME}</h3>
				<div class="planner-top">
					<div class="planner-top-img">
						<%-- <img
					src="${pageContext.request.contextPath}/imageuploads/${packageCreateModel.fileRealName}"> --%>

					</div>


					<form role="form" action="" method="POST">

						<input type='hidden' name='pno' value="${PackageVO.PACKAGEID}">

					</form>
					<div class="planner-top-content">
						<h4>${PackageVO.TITLE}</h4>
						<h4>${PackageVO.PRICE}원</h4>

						<div class="loc">
							<span> 기간 : ${PackageVO.STARTDATE} ~ ${PackageVO.ENDDATE}</span>
						</div>

						<c:if test="${(login.USRNICKNAME eq PackageVO.AGENCYNAME)}">
							<button type="submit" class="delete-package" id="removeBtn">패키지
								삭제</button>
						</c:if>
					</div>
				</div>
			</div>

			<div class="planner-nav">
				<div class="nav-container container">
					<div class="nav-wrapper-left">
						<div class="planner-nav-item active" rel="planner-tab-1">
							<a class="afont" href="#content">상세정보</a>
						</div>
						<div class="planner-nav-item active" rel="planner-tab-2">
							<a class="afont" href="#note"> 주의사항</a>
						</div>
					</div>
					<div class="nav-wrapper-right"></div>
				</div>
			</div>


			<div class="planner-container">
				<div class="stu_division sd">
					<div class="content-header">
						<h3>상세정보</h3>
					</div>

					<div class="day-txt">
						<a name="content"></a>
					</div>

					<div class="package-content">
						<a class="package-content-font"> ${PackageVO.PACKAGECONTENT} </a>

					</div>


				</div>
			</div>



			<div class="stu_division">
				<a name="note"></a>
				<h3 class="stu_h3_title">꼭! 확인하세요</h3>
				<div class="stu_box_wrapper stu_clearfix">
					<div class="txt_box">
						<h4 class="stu_h4_title">가격 포함사항</h4>
						<p class="stu_more">
							*비엔나 지식가이드 전일 해설비용<br> * 무선수신기(개인 이어폰 준비 필수, 아이폰 전용 사용 불가)<br>
						</p>
						<h4 class="stu_h4_title">가격 불포함사항</h4>
						<p class="stu_more">
							* 식사비<br> * 대중교통 1DAY TICKET 구입(8€) 대중교통 티켓은 투어 시작 전에 미리
							구매완료해 주세요.<br> * 벨베데레 궁전 미술관 입장료: (성인 16€) (비엔나 카드 또는 만 26세
							이하 국제학생증 또는 만 65세 이상 여권 13.5€) (만 19세 이하 여권 또는 비엔나 패스 무료)<br>
						</p>
					</div>
					<div class="txt_box">
						<h4 class="stu_h4_title">환불정책</h4>
						<p class="stu_more">
							*투어 시작시간 기준 7일 이상 남아 있을 경우 :전액 환불 <br>*투어 시작시간 기준 6일 ~ 4일 남아
							있을 경우 :입금하신 금액의 70% 환불 <br>*투어 시작시간 기준 3일 ~ 2일 남아 있을 경우
							:입금하신 금액의 50%를 환불<br>*투어 시작시간 기준 만48시간이 남아 있지 않은 경우 :환불불가<br>
							<br> * <b>결합할인</b> 가격으로 예약한 뒤, 이전 예약 건을 가이드측 사유가 아닌 개인사유로
							취소할 경우, 다음 예약으로 할인받은 금액을 공제한 뒤 해당 상품의 환불규정에 따라 환불처리됩니다. <br>
							<br>

						</p>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/easyResponsiveTabs.js" type="text/javascript"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		
		
		
		
		
		});

							var jsonData = eval(${PackageVO.files});
							var length = jsonData.length;
							
							var swipercontainer = document.createElement('div');
							swipercontainer.className = "swiper-container";
							$('.sd').append(swipercontainer);
							
					
						
							var swiperwrapper =  document.createElement('div');
							swiperwrapper.className = "swiper-wrapper";
							swipercontainer.append(swiperwrapper);
							
						
							for(var j = 0; j < length; j++ ){
									var imgdiv = document.createElement('div');
									imgdiv.className = "swiper-slide";
									swiperwrapper.append(imgdiv);	
									
									//상세내용 이미지 
									var imgFullname = jsonData[j].value;
									var imgNoScontent = "/"+imgFullname.substr(3);
									
									var imgContent = document.createElement('img');	
									var imgObjectContent = getFileInfo(imgNoScontent);
									
									imgContent.src = imgObjectContent.imgsrc; 
										  
									imgdiv.append(imgContent);  
									
									}
							
								var swiperbuttonnext =document.createElement('div');
								swiperbuttonnext.className = "swiper-button-next";
								swipercontainer.append(swiperbuttonnext);
														
								
								var swiperbuttonprev =document.createElement('div');
								swiperbuttonprev.className = "swiper-button-prev";
								swipercontainer.append(swiperbuttonprev);
								
								
							
								
								//상단 이미지 
								var fullname = jsonData[0].value;
								var imgNoS = "/"+fullname.substr(3);
								
								var img = document.createElement('img');	
 								img.className = "imgShow";
								var imgObject = getFileInfo(imgNoS);
								
								

								img.src = imgObject.imgsrc; 
									  
								$(".planner-top-img").append(img);  
					
						//var jsonData = JSON.parse( JSON.stringify(${packageVO.files}));
						
			
			var swiper = new Swiper('.swiper-container', {navigation: {
								        nextEl: '.swiper-button-next',
								        prevEl: '.swiper-button-prev',
								      },
								    });
			
			var formObj = $("form[role='form']");
		
			console.log(formObj);

			$("#removeBtn").on("click" , function(){
				console.log("cliked");
				formObj.attr("method", "post");
				formObj.attr("action" ,"deletePackage");
				
				formObj.submit();
			});
			
		
	});
</script>

<!-- //portfolio -->
<%@ include file="../include/footer.jspf"%>

</html>