<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jspf"%>
<link href="${pageContext.request.contextPath}/resources/css/share.css"
	rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/share.js"></script>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>


<%-- <link href="${pageContext.request.contextPath}/css/share.css"
	rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/js/share.js"></script> --%>
<div class="share">
	<div class="container">
		<h3>내 플래너</h3>
		<div class="portfolio-grids">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">

					<section class="planner-create">
						<div class="create-left">
							<img
								src="${pageContext.request.contextPath}/resources/images/create-img-test.PNG">
						</div>
						<div class="create-right">
							<div class="title-area">
								<div class="create-header">PLAN & GO</div>
								<div class="create-body">
									Wherever you want<br> Wherever we want<br> Wherever I
									want<br> We're going to ...
								</div>
							</div>
							<div class="btn-area">
								<div class="create-btn-wrapper">
									<a href="register" class="create-planner-btn"> 플래너 시작
									</a>
								</div>
							</div>
						</div>
					</section>

					<div class="share-planner-container">
						<div class='box-body' style="width: 100%">
							<div class='agencySelect'>
							
								<select name="searchType" id="searchType">
									<option value="all"
										<c:out value="${cri.searchType eq 'all'? 'selected' :''}"/>>
										전체
									</option>
									<option value="title"
										<c:out value="${cri.searchType eq 'title'?'selected':''}"/>>
										제목
									</option>
									<option value="writer"
										<c:out value="${cri.searchType eq 'writer'?'selected':''}"/>>
										작성자
									</option>
								</select>
								<input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
								<button id='searchBtn'>Search</button>
							</div>

							<div class="share-planner-container">
								<c:forEach var="plan" items="${plannerDTO}">
									<a class="share-image"
										href="/planner/readPlanner?planno=${plan.PLANCODE}">
										<div class="share-content">
											<div class="planner-image-box">
												<div id="thumbnail-template">
													<img src="${pageContext.request.contextPath}/resources/images/city/${plan.CITYIMAGE}">
												</div>
												<div class="planner-title">
													<c:out value="${plan.PLANTITLE}" />
												</div>
											</div>
											<div class="planner-info">
												<div class="info-header">

													<div>${plan.USRNICKNAME}</div>
												</div>
											</div>
										</div>
									</a>
								</c:forEach>
<!-- 							</div> -->
							</div>
							
						</div>
<%-- 					<script
						src="${pageContext.request.contextPath}/js/easyResponsiveTabs.js" type="text/javascript"></script>						
 --%>
						<script>
							$(function() {
								/* $('#horizontalTab').easyResponsiveTabs({
									type : 'default', //Types: default, vertical, accordion           
									width : 'auto', //auto or any width like 600px
									fit : true
								// 100% fit in a container
								}); */
								
								$('#searchBtn').on("click", function(event) {
									self.location = "myPlannerBoard"
											+ '${PageMaker.makeQuery(1)}'
											+ "&searchType="
											+ $('select option:selected').val()
											+ "&keyword=" + $('#keywordInput').val();
								});
							});
						</script>
					</div>
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
	
								<c:if test="${PageMaker.prev}">
									<li><a
										href="myPlannerBoard${PageMaker.plannerMakeSearch(PageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${PageMaker.startPage }"
									end="${PageMaker.endPage }" var="idx">
									<li
										<c:out value="${PageMaker.cri.page == idx ? 'class =active' : ''}"/>>
										<a href="myPlannerBoard${PageMaker.plannerMakeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
	
								<c:if test="${PageMaker.next && PageMaker.endPage > 0}">
									<li><a
										href="myPlannerBoard${PageMaker.plannerMakeSearch(PageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
	
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			$(document).ready(function() {
				var msg = '${msg}';
				if(msg == "notLogin") {
					alert(msg);
					//self.location = "/user/loginform";
				}
			});
		</script>
	
	<%@include file="../include/footer.jspf"%>
	