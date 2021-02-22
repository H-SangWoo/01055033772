<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">

<link href="/resources/css/swipe.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="/resources/css/search.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- portfolio -->

<div class="portfolio">
	<div class="container">
		<h3>둘러보기</h3>
		<br>
		<!-- Search for bar 미구현 -->

		<div class="portfolio-grids" style="margin-top: 20px">
			<br> <br>
			<h3>여행지</h3>
			<div class="sap_tabs">

				<div class="horizonTab" id="horizontalTab">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed black"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-2">
							<span class="sr-only ">Toggle navigation</span> <span
								class="icon-bar bg-black"></span> <span
								class="icon-bar bg-black"></span> <span
								class="icon-bar bg-black"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse nav-wil"
						id="bs-example-navbar-collapse-2">
						<ul >
							<li class="resp-tab-item resp-tab-active" data-tap="all"><span>전체</span></li>
							<li class="resp-tab-item" data-tap="수도권"><span>수도권</span></li>
							<li class="resp-tab-item" data-tap="강원도"><span>강원도</span></li>
							<li class="resp-tab-item" data-tap="경상도"><span>경상도</span></li>
							<li class="resp-tab-item" data-tap="전라도"><span>전라도</span></li>
							<li class="resp-tab-item" data-tap="충청도"><span>충청도</span></li>
							<li class="resp-tab-item" data-tap="제주도"><span>제주도</span></li>
						</ul>
					</div>
					<div class="clearfix"></div>

					<div class="col-md-6 about-grid-left" id="city-grid-1">
						<div class="grid swiper-container">
							<div class="swiper-wrapper"></div>
							<!-- Ajax -->
							<div class="swiper-pagination"></div>
						</div>
					</div>


				</div>
			</div>
		</div>

		<div class="portfolio-grids">
			<h3 >즐길거리</h3>

			<div class="sap_tabs">
				<div class="horizonTab" id="horizontalTab2">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed black"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-3">
							<span class="sr-only ">Toggle navigation</span> <span
								class="icon-bar bg-black"></span> <span
								class="icon-bar bg-black"></span> <span
								class="icon-bar bg-black"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse nav-wil"
						id="bs-example-navbar-collapse-3">
						<!-- 					<ul class="resp-tabs-list" > -->
						<ul>
							<li class="resp-tab-item resp-tab-active" data-tap="all"><span>전체</span></li>
							<li class="resp-tab-item" data-tap="서울특별시"><span>서울특별시</span></li>
							<li class="resp-tab-item" data-tap="인천광역시"><span>인천광역시</span></li>
							<li class="resp-tab-item" data-tap="안양시"><span>안양시</span></li>
							<li class="resp-tab-item" data-tap="태백시"><span>태백시</span></li>
							<li class="resp-tab-item" data-tap="강릉시"><span>강릉시</span></li>
							<li class="resp-tab-item" data-tap="속초시"><span>속초시</span></li>
							<li class="resp-tab-item" data-tap="충주시"><span>충주시</span></li>
							<li class="resp-tab-item" data-tap="공주시"><span>공주시</span></li>
							<li class="resp-tab-item" data-tap="천안시"><span>천안시</span></li>
							<li class="resp-tab-item" data-tap="부산광역시"><span>부산광역시</span></li>
							<li class="resp-tab-item" data-tap="포항시"><span>포항시</span></li>
							<li class="resp-tab-item" data-tap="울산광역시"><span>울산광역시</span></li>
							<li class="resp-tab-item" data-tap="전주시"><span>전주시</span></li>
							<li class="resp-tab-item" data-tap="나주시"><span>나주시</span></li>
							<li class="resp-tab-item" data-tap="목포시"><span>목포시</span></li>
							<li class="resp-tab-item" data-tap="제주시"><span>제주시</span></li>
						</ul>
					</div>
				</div>
				<div class="horizonTab" id="horizontalTab3">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed black"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-4">
							<span class="sr-only ">Toggle navigation</span> <span
								class="icon-bar bg-black"></span> <span
								class="icon-bar bg-black"></span> <span
								class="icon-bar bg-black"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse nav-wil"
						id="bs-example-navbar-collapse-4">
						<!-- 					<ul class="resp-tabs-list" > -->
						<ul>
							<li class="resp-tab-item resp-tab-active" data-tap="all"><span>전체</span></li>
							<li class="resp-tab-item" data-tap="액티비티"><span>액티비티</span></li>
							<li class="resp-tab-item" data-tap="관광지"><span>관광지</span></li>
							<li class="resp-tab-item" data-tap="먹거리"><span>먹거리</span></li>
						</ul>
					</div>
					<div class="clearfix"></div>
					<div class="col-md-6 about-grid-left" id="city-grid-2">
						<div class="grid swiper-container">
							<div class="swiper-wrapper"></div>
							<!-- Ajax -->
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>

			</div>
		</div>



	</div>
</div>

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<script type="text/javascript">
	var request = new XMLHttpRequest();
	var locationProvince = "all";
	var locationCity = "all";
	var activityType = "all";

	$(document)
			.ready(
					function() {
						// location 초기화 ajax
						$
								.getJSON(
										"/searchAjax/locationProvince/all",
										function(data) {
											var citygrid = document
													.getElementById("city-grid-1");
											$(
													'#city-grid-1 > .grid > .swiper-wrapper')
													.empty();
											for (var i = 0; i < data.length; i++) {
												$(
														'#city-grid-1 > .grid .swiper-wrapper')
														.append(
																"<div class=\"swiper-slide"
																		+ "\" role=\"group\" "
																		+ "aria-label=\""
																		+ (i + 1)
																		+ " / "
																		+ (data.length)
																		+ "\" >"
																		+ "<figure class=\"effect-julia\">"
																		+ "<img src=\"/resources/images/city/"
																		+ data[i].cityimage
																		+ "\" alt=\"\" class=\"img-responsive\" style=\"max-width: 100%; height: auto\"/>"
																		+ "<figcaption style=\"padding: 5px\"><h2 style=\"padding: 10px\">"
																		+ "<span>"
																		+ data[i].locationcity
																		+ "</span></h2>"
																		+ "<div style=\"padding-left: 10px\">"
																		+ "<p style=\"display: block\">"
																		+ data[i].comment
																		+ "</p>"
																		+ "</div><a href=\"${pageContext.request.contextPath}/indexPage/city?locationCity="
																		+ data[i].locationcity
																		+ "\">View more</a></figcaption></figure>"
																		+ "</div>");
											}

											/*  새로 로드된 swipe들을 swiper 설정 적용 */
											var swiper = new Swiper(
													'.swiper-container',
													{
														slidesPerView : 3,
														slidesPerColumn : 3,
														spaceBetween : 30,
														pagination : {
															el : '.swiper-pagination',
															clickable : true,
														},
													});

										});

						/* activity 초기화  */
						$
								.getJSON(
										"/searchAjax/locationCity/all/activityType/all",
										function(data) {
											var citygrid = document
													.getElementById("city-grid-2");
											$(
													'#city-grid-2 > .grid > .swiper-wrapper')
													.empty();
											for (var i = 0; i < data.length; i++) {
												$(
														'#city-grid-2 > .grid .swiper-wrapper')
														.append(
																"<div class=\"swiper-slide"
																		+ "\" role=\"group\" "
																		+ "aria-label=\""
																		+ (i + 1)
																		+ " / "
																		+ (data.length)
																		+ "\" >"
																		+ "<figure class=\"effect-julia\">"
																		+ "<img src=\"/resources/images/activity/"
																		+ data[i].activityimage
																		+ "\" alt=\"\" class=\"img-responsive\" style=\"max-width: 100%; height: auto\"/>"
																		+ "<figcaption style=\"padding: 5px\"><h2 style=\"padding: 10px\">"
																		+ "<span>"
																		+ data[i].activityname
																		+ "</span></h2>"
																		+ "<div style=\"padding-left: 10px\">"
																		+ "<p style=\"display: block\">"
																		+ data[i].activityinfomation
																		+ "</p>"
																		+ "</div><a href=\"${pageContext.request.contextPath}/indexPage/activity?locationCity="
																		+ data[i].locationcity
																		+ "&activityCode="
																		+ data[i].activitycode
																		+ "\">View more</a></figcaption></figure>"
																		+ "</div>");
											}

											/*  새로 로드된 swipe들을 swiper 설정 적용 */
											var swiper = new Swiper(
													'.swiper-container',
													{
														slidesPerView : 3,
														slidesPerColumn : 3,
														spaceBetween : 30,
														pagination : {
															el : '.swiper-pagination',
															clickable : true,
														},
													});

										});

						/* location Ajax  */
						$('#horizontalTab ul li')
								.click(
										function() {

											locationProvince = $(this).attr(
													'data-tap');
											$('#horizontalTab ul li')
													.removeClass(
															'resp-tab-active');
											$(this).addClass('resp-tab-active');
											var uri = "/searchAjax/locationProvince/"
													+ locationProvince;
											console.log("uri test : " + uri);
											$
													.getJSON(
															uri,
															function(data) {
																var citygrid = document
																		.getElementById("city-grid-1");
																$(
																		'#city-grid-1 > .grid > .swiper-wrapper')
																		.empty();
																for (var i = 0; i < data.length; i++) {
																	$(
																			'#city-grid-1 > .grid .swiper-wrapper')
																			.append(
																					"<div class=\"swiper-slide"
																							+ "\" role=\"group\" "
																							+ "aria-label=\""
																							+ (i + 1)
																							+ " / "
																							+ (data.length)
																							+ "\" >"
																							+ "<figure class=\"effect-julia\">"
																							+ "<img src=\"/resources/images/city/"
																							+ data[i].cityimage
																							+ "\" alt=\"\" class=\"img-responsive\" style=\"max-width: 100%; height: auto\"/>"
																							+ "<figcaption style=\"padding: 5px\"><h2 style=\"padding: 10px\">"
																							+ "<span>"
																							+ data[i].locationcity
																							+ "</span></h2>"
																							+ "<div style=\"padding-left: 10px\">"
																							+ "<p style=\"display: block\">"
																							+ data[i].comment
																							+ "</p>"
																							+ "</div><a href=\"${pageContext.request.contextPath}/indexPage/city?locationCity="
																							+ data[i].locationcity
																							+ "\">View more</a></figcaption></figure>"
																							+ "</div>");
																}

																/*  새로 로드된 swipe들을 swiper 설정 적용 */
																var swiper = new Swiper(
																		'.swiper-container',
																		{
																			slidesPerView : 3,
																			slidesPerColumn : 3,
																			spaceBetween : 30,
																			pagination : {
																				el : '.swiper-pagination',
																				clickable : true,
																			},
																		});

															});

										});

						/* Activity Ajax */
						$('#horizontalTab2 ul li')
								.click(
										function() {
											locationCity = $(this).attr(
													'data-tap');
											$('#horizontalTab2 ul li')
													.removeClass(
															'resp-tab-active');
											$(this).addClass('resp-tab-active');

											var uri = "/searchAjax/locationCity/"
													+ locationCity
													+ "/activityType/"
													+ activityType;
											console.log("uri test : " + uri);
											$
													.getJSON(
															uri,
															function(data) {
																var citygrid = document
																		.getElementById("city-grid-2");
																$(
																		'#city-grid-2 > .grid > .swiper-wrapper')
																		.empty();
																for (var i = 0; i < data.length; i++) {
																	$(
																			'#city-grid-2 > .grid .swiper-wrapper')
																			.append(
																					"<div class=\"swiper-slide"
																							+ "\" role=\"group\" "
																							+ "aria-label=\""
																							+ (i + 1)
																							+ " / "
																							+ (data.length)
																							+ "\" >"
																							+ "<figure class=\"effect-julia\">"
																							+ "<img src=\"/resources/images/activity/"
																							+ data[i].activityimage
																							+ "\" alt=\"\" class=\"img-responsive\" style=\"max-width: 100%; height: auto\"/>"
																							+ "<figcaption style=\"padding: 5px\"><h2 style=\"padding: 10px\">"
																							+ "<span>"
																							+ data[i].activityname
																							+ "</span></h2>"
																							+ "<div style=\"padding-left: 10px\">"
																							+ "<p style=\"display: block\">"
																							+ data[i].activityinfomation
																							+ "</p>"
																							+ "</div><a href=\"${pageContext.request.contextPath}/indexPage/activity?locationCity="
																							+ data[i].locationcity
																							+ "&activityCode="
																							+ data[i].activitycode
																							+ "\">View more</a></figcaption></figure>"
																							+ "</div>");
																}

																/*  새로 로드된 swipe들을 swiper 설정 적용 */
																var swiper = new Swiper(
																		'.swiper-container',
																		{
																			slidesPerView : 3,
																			slidesPerColumn : 3,
																			spaceBetween : 30,
																			pagination : {
																				el : '.swiper-pagination',
																				clickable : true,
																			},
																		});

															});
										});

						$('#horizontalTab3 ul li')
								.click(
										function() {
											activityType = $(this).attr(
													'data-tap');
											$('#horizontalTab3 ul li')
													.removeClass(
															'resp-tab-active');
											$(this).addClass('resp-tab-active');

											var uri = "/searchAjax/locationCity/"
													+ locationCity
													+ "/activityType/"
													+ activityType;
											console.log("uri test : " + uri);
											$
													.getJSON(
															uri,
															function(data) {
																var citygrid = document
																		.getElementById("city-grid-2");
																$(
																		'#city-grid-2 > .grid > .swiper-wrapper')
																		.empty();
																for (var i = 0; i < data.length; i++) {
																	$(
																			'#city-grid-2 > .grid .swiper-wrapper')
																			.append(
																					"<div class=\"swiper-slide"
																							+ "\" role=\"group\" "
																							+ "aria-label=\""
																							+ (i + 1)
																							+ " / "
																							+ (data.length)
																							+ "\" >"
																							+ "<figure class=\"effect-julia\">"
																							+ "<img src=\"/resources/images/activity/"
																							+ data[i].activityimage
																							+ "\" alt=\"\" class=\"img-responsive\" style=\"max-width: 100%; height: auto\"/>"
																							+ "<figcaption style=\"padding: 5px\"><h2 style=\"padding: 10px\">"
																							+ "<span>"
																							+ data[i].activityname
																							+ "</span></h2>"
																							+ "<div style=\"padding-left: 10px\">"
																							+ "<p style=\"display: block\">"
																							+ data[i].activityinfomation
																							+ "</p>"
																							+ "</div><a href=\"${pageContext.request.contextPath}/indexcity.do?prov="
																							+ encodeURIComponent(locationProvince)
																							+ "&city="
																							+ data[i].locationcode
																							+ "\">View more</a></figcaption></figure>"
																							+ "</div>");
																}

																/*  새로 로드된 swipe들을 swiper 설정 적용 */
																var swiper = new Swiper(
																		'.swiper-container',
																		{
																			slidesPerView : 3,
																			slidesPerColumn : 3,
																			spaceBetween : 30,
																			pagination : {
																				el : '.swiper-pagination',
																				clickable : true,
																			},
																		});

															});

										});

					});
</script>
<!-- //portfolio -->
<%@ include file="../include/footer.jspf"%>
</html>