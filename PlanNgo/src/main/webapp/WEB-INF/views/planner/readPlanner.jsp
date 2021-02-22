<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jspf"%>
<link
	href="${pageContext.request.contextPath}/resources/css/planner.css"
	rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/planner.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<!-- portfolio -->

<div class="planner">
	<div class="container">
		<div class="planner-top">
			<div class="planner-top-img">
				<img src="${pageContext.request.contextPath}/resources/images/city/${plannerDTO.CITYIMAGE}">
			</div>
			<div class="planner-top-content">
				<div>
					<div>
						<c:out value="${plannerDTO.USRNICKNAME}" />
						<c:if test="${!isShared && login.USRCODE == plannerDTO.USRCODE}">
							<form action="/planner/shareRegister" method="post">
								<input type="hidden" name="USRCODE" value="${plannerDTO.USRCODE} ">
								<input type="hidden" name="PLANCODE" value="${plannerDTO.PLANCODE} ">
								<button type="submit" class="btn-share">
									공유하기
								</button>
							</form>
						</c:if>
					</div>
					<h3>${plannerDTO.PLANTITLE}</h3>
				</div>
				<div class="planner-date-area">
					<h4>${plannerDTO.PLANSTARTDATE}</h4>
					~
					<h4>${plannerDTO.PLANENDDATE}</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="planner-nav">
		<div class="nav-container container">
			<div class="nav-wrapper-left">
				<div class="planner-nav-item active" rel="planner-tab-1">개요</div>

				<div class="nav-item-line"></div>
				<div class="planner-nav-item" rel="planner-tab-3">댓글</div>
			</div>
			<div class="nav-wrapper-right"></div>
		</div>
	</div>
	<div class="container planner-content tab-on" id="planner-tab-1">
		<div class="planner-container">
			<div class="planner-content-left">
				<c:forEach var="days" items="${plannerVO.DAYS}">
					<div class="schedule-box">
						<div class="schedule-box-info">
							<div class="day-txt">DAY ${days.DAY}</div>
							<div class="day-info">
								<div class="day-info-date"></div>
							</div>
						</div>
						<div class="planSchedule-wrapper">
							<c:forEach var="planSchedule" items="${days.PLANSCHEDULELIST}">
								<div>
									<div class="locate-info-title">${planSchedule.LOCATIONCITY}</div>
									<ul class="schedule-perDay">
										<c:forEach var="buc" items="${planSchedule.BUCKETLISTS}">
											<li class="schedule-perDay-list">${buc.ACTIVITYNAME}</li>
										</c:forEach>
									</ul>
								</div>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="planner-content-right"></div>
		</div>
	</div>
	<div class="comment-container container tab-on" id="planner-tab-3">
		<div class="comment-wrapper">
			<div class="planner-comment-left">
				<h4 class="comment-header">댓글</h4>
				<div class="divider"></div>
				<div class="comment-list">
					<div class="comment-input">
						<div class="comment-area">
							<div class="comment-profile">
								<img
									src="${pageContext.request.contextPath}/images/none-profile.png">
							</div>


							<form name="join" method="get"
								action="${pageContext.request.contextPath}/replewrite.do?planNo=${plan.PLANCODE}">
								<textarea name="replecontent" id="replecontent"></textarea>
								<input type="submit" value="등록" class="comment-submit">
							</form>

						</div>
					</div>
					<c:forEach var="reple" items="${replePage.content}">
						<div class="comment-area-container">
							<div class="comment-by-user">
								<div class="comment-area">
									<div class="comment-area-left">
										<div class="comment-profile">
											<img
												src="${pageContext.request.contextPath}/images/none-profile.png">
										</div>
										<div class="comment-content">
											<div class="user-comment-header">
												<h5 class="comment-writer">${reple.usrnickname}</h5>
												<!-- <h5 class="comment-date">2020.10.10</h5> -->
											</div>
											<h5 class="comment-body">${reple.replecontent}</h5>
										</div>
									</div>
									<div class="comment-area-right">
										<a
											href="repledelete.do?no=${reple.replecode}&plancode=${reple.plancode}"
											class="btn btn-default" onclick="return confirm('삭제하시겠습니까?')">삭제</a>

										<div id="btn-reply">답글</div>
									</div>
								</div>
							</div>
							<!-- <div class="comment-by-user">
                        <div class="comment-area">
                           <div class="comment-area-left">
                              <div class="comment-profile">
                                 <img src="../images/none-profile.png">
                              </div>
                              <div class="comment-content">
                                 <div class="user-comment-header">
                                    <h5 class="comment-writer">하상우</h5>
                                    <h5 class="comment-date">2020.10.10</h5>
                                 </div>
                                 <h5 class="comment-body">하기시렁</h5>
                              </div>
                           </div>
                           <div class="comment-area-right">
                              <div id="btn-delete">삭제</div>
                              <div id="btn-reply">답글</div>
                           </div>
                        </div>
                     </div> -->
						</div>
					</c:forEach>
					<div id="comment-none">등록된 댓글이 없습니다.</div>
				</div>
			</div>
			<div class="planner-comment-right"></div>
		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>

<!-- //portfolio -->
<!-- contact -->
<div class="contact" id="contact">
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d16271316.765282348!2d-176.42968180551608!3d60.143570657527626!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x5400df9cc0aec01b%3A0xbcdb5e27a98adb35!2sAlaska%2C+USA!5e0!3m2!1sen!2sin!4v1448597600354"
		frameborder="0" style="border: 0" allowfullscreen></iframe>
	<div class="container">
		<h3>Contact Us</h3>
		<div class="col-md-4 contact-grid">
			<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
			<h4>Address</h4>
			<p>
				JI.Paulnadwam 2nd D.No:23-50-903.<span>United States</span>
			</p>
		</div>
		<div class="col-md-4 contact-grid">
			<i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>
			<h4>Mail</h4>
			<a href="mailto:info@example.com">info@example.com</a>
		</div>
		<div class="col-md-4 contact-grid">
			<i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>
			<h4>Phone</h4>
			<p>+020 456 9696</p>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<%@ include file="../include/footer.jspf"%>