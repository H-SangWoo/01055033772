<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jspf"%>
<link
	href="${pageContext.request.contextPath}/resources/css/share.css"
	rel="stylesheet" type="text/css" media="all">
<script src="${pageContext.request.contextPath}/resources/js/share.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="share">
	<div class="container">
		<h3>공유게시판</h3>
		<div class="portfolio-grids">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">

					<div class='agencySelect'>
						<select name="searchType" id="searchType">
							<option value="all"
								<c:out value="${cri.searchType eq 'all'? 'selected' :''}"/>>
								전체</option>
							<option value="title"
								<c:out value="${cri.searchType eq 'title'?'selected':''}"/>>
								제목</option>
							<option value="writer"
								<c:out value="${cri.searchType eq 'writer'?'selected':''}"/>>
								작성자</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button id='searchBtn'>Search</button>
					</div>

					<div class="share-planner-container">
						<c:forEach var="share" items="${shareVO}">
							<a class="share-image" 
								href="/planner/readPlanner?planno=${share.PLANCODE}">
								<div class="share-content">
									<div class="planner-image-box">
										<img src="${pageContext.request.contextPath}/resources/images/city/${share.CITYIMAGE}">
										<div class="planner-title">
											<c:out value="${share.PLANTITLE}" />
										</div>
									</div>
									<div class="planner-info">
										<div class="info-header">

											<div>${share.USRNICKNAME}</div>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<script src="/resources/js/easyResponsiveTabs.js"
				type="text/javascript"></script>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#horizontalTab').easyResponsiveTabs({
						type : 'default', //Types: default, vertical, accordion           
						width : 'auto', //auto or any width like 600px
						fit : true
					// 100% fit in a container
					});
					
					$('#searchBtn').on("click", function(event) {
						self.location = "shareboard"
								+ '${PageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $('select option:selected').val()
								+ "&keyword=" + $('#keywordInput').val();
					});
				});
			</script>
			<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
	
								<c:if test="${PageMaker.prev}">
									<li><a
										href="shareboard${PageMaker.plannerMakeSearch(PageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${PageMaker.startPage }"
									end="${PageMaker.endPage }" var="idx">
									<li
										<c:out value="${PageMaker.cri.page == idx ? 'class =active' : ''}"/>>
										<a href="shareboard${PageMaker.plannerMakeSearch(idx)}">${idx}</a>
									</li>
								</c:forEach>
	
								<c:if test="${PageMaker.next && PageMaker.endPage > 0}">
									<li><a
										href="shareboard${PageMaker.plannerMakeSearch(PageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>
	
							</ul>
						</div>
					</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jspf"%>