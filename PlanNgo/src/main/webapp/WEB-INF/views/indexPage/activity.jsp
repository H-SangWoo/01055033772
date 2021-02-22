<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jspf"%>
<!-- //banner -->
<!-- about -->
<style>
.grid figure {
	position: relative;
	float: none;
	overflow: hidden;
	margin: 0;
	min-width: 533px;
	max-width: 500px;
	max-height: 400px;
	width: 48%;
	height: auto;
	background: #3085a3;
	text-align: center;
	cursor: auto;
}
.about-grid-right h3 {
    font-size: 2.5em;
    color: #83BFA6;
    letter-spacing: 1px;
    margin: 0;
    line-height: 1.5em;
    text-transform: capitalize;
}
h3, .h3 {
    font-size: 24px;
    color: #83BFA6;
    padding-top: 0.7em;
}
.label {
    padding: 10px 10px;
    border: none;
    text-shadow: none;
}
</style>
<div class="about">
	<div class="container">
		<div class="about-grids">
			<div class="col-md-6 about-grid-left">
				<div class="grid">
					<figure class="effect-julia">
						<img src="${pageContext.request.contextPath}/resources/images/activity/${readActivity.ACTIVITYIMAGE}" onerror="this.src='${pageContext.request.contextPath}/resources/images/LogoBlack.png'" style="max-width: auto; height: auto ">
						<figcaption>

							<h2>
								<span>${readActivity.ACTIVITYNAME}</span>
							</h2>


						</figcaption>
					</figure>
				</div>
			</div>
			<div class="col-md-6 about-grid-right">
			
			<button id="btn_like" class="label label-danger" type="button" onclick="" style="float: right;">♥&nbsp;345</button>
			
				<h3>${readActivity.ACTIVITYNAME}</h3>
				<p class="great">${readActivity.ACTIVITYNAME}에는 ...</p>
				<p>${readActivity.ACTIVITYINFOMATION}</p>
			</div>
			<div class="clearfix"></div>

		</div>
		<br>
		<h3>&nbsp;★ 주변 다른 즐길거리</h3>
		<div class="featured-services-grids">
			<c:forEach var="activity" items="${activityList}">
			<div class="col-md-3 featured-services-grid" style="margin-bottom: 10px;">
			<a href="activity?locationCity=${locationCity}&activityCode=${activity.ACTIVITYCODE}">
				<div class="featured-services-grd">
					<img src="${pageContext.request.contextPath}/resources/images/activity/${activity.ACTIVITYIMAGE}" onerror="this.src='${pageContext.request.contextPath}/resources/images/LogoBlack.png'"  style="max-width: auto; height: auto; width: 150px;">
					<h4>${activity.ACTIVITYNAME}</h4>
				</div>
			</a>
			</div>
			</c:forEach>
		</div>
	</div>
	<div>

		</div>


<%@include file="../include/footer.jspf"%>
	</body>
	</html>