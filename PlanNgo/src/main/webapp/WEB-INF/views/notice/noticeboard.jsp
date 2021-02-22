
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="u" tagdir="/WEB-INF/tags"%> --%>

<%@ include file="/WEB-INF/views/include/header.jspf"%>

<!DOCTYPE html>

<html>

<style>
.contact h3, h3.title, .portfolio h3, .blog h3 {
	text-align: center;
	font-size: 2em;
	color: #83BFA6;
	margin: auto;
	padding-bottom: 0.5em;
	width: 20%;
	border-bottom: 7px double #DEDEDE;
	margin-bottom: 1em;
}

.resp-tabs-list {
	list-style: none;
	padding: 0em 0 0em;
	margin: 0 auto;
	text-align: center;
}

.resp-tab-item {
	color: #3AA079;
	font-size: 0.9em;
	cursor: pointer;
	padding: 10px 25px;
	display: inline-block;
	margin: 0;
	text-align: center;
	list-style: none;
	outline: none;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
	text-transform: uppercase;
	margin: 0 0.5em 0;
	border-radius: 12px;
}

.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td,
	.table>tbody>tr>td, .table>tfoot>tr>td {
	font-size: 0.9em;
	color: #999;
	border-top: none !important;
	text-align: center;
}

@media(max-width:1365px){
.portfolio-grids h3{
 font-size:4vw;
}
}

</style>

<script>
	$(function() {
		$('#searchBtn').on(
				"click",
				function(event) {
					self.location = "noticeboard" + '${PageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $('select option:selected').val() + "&keyword="
							+ $('#keywordInput').val();
				});

		$('#newBtn').on("click", function(event) {
			self.location = "register";
		});

	});
</script>

<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">

		<div class="portfolio-grids">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<ol class="breadcrumb">
							<ul class="resp-tabs-list">
								<a href="${pageContext.request.contextPath}/notice/noticeboard">
									<li class="resp-tab-item">
										<center>공지사항</center>
								</li>
								</a>
								<a href="${pageContext.request.contextPath}/faq/faqBoard">
									<li class="resp-tab-item">
										<center>FAQ</center>
								</li>
								</a>
								<a href="${pageContext.request.contextPath}/qna/qna">
									<li class="resp-tab-item">
										<center>Q&A</center>
								</li>
								</a>
								<a href="${pageContext.request.contextPath}/service/termsOfService">
									<li class="resp-tab-item">
										<center>이용약관</center>
								</li>
								</a>
								<a href="${pageContext.request.contextPath}/service/privacyStatement">
									<li class="resp-tab-item">
										<center>개인정보취급방침</center>
								</li>
								</a>
							</ul>
						</ol>

					</ul>

				</div>
			</div>
			<h3>공지사항</h3>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번 호</th>
						<th>제 목</th>
						<th>작성자</th>
						<th>작성날짜</th>
					</tr>

				</thead>
				<tbody>
					<c:forEach items="${list}" var="notice">
						<tr>
							<td>${notice.NOTICECODE}</td>
							<td><a
								href='/notice/readPage${PageMaker.nMakeSearch(PageMaker.cri.page)}&NOTICECODE=${notice.NOTICECODE}'>
									${notice.NOTICETITLE}</a></td>
							<td>${notice.USRNAME}</td>
							<td>
							<fmt:formatDate var="resultRegDt" value="${notice.REGDATE}" pattern="yyyy-MM-dd hh:mm"/>${resultRegDt}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="box-footer">

				<div class="text-center">
					<ul class="pagination">

						<c:if test="${PageMaker.prev}">
							<li><a
								href="noticeboard${PageMaker.nMakeSearch(PageMaker.startPage - 1)}">&laquo;
							</a></li>
						</c:if>

						<c:forEach begin="${PageMaker.startPage}"
							end="${PageMaker.endPage}" var="idx">
							<li><c:out
									value="${pageMaker.cri.page == idx?'class =active':''}" /> <a
								href="noticeboard${PageMaker.nMakeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${PageMaker.next && PageMaker.endPage > 0}">
							<li><a
								href="noticeboard${PageMaker.nMakeSearch(PageMaker.endPage +1)}">&raquo;
							</a></li>
						</c:if>
					</ul>
				</div>
			</div>


			<div align="center" class='box-body'>
				<div class="searchSelect">
					<select name="searchType" id="searchType">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							제목</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							제목+내용</option>

					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>

					<button id='searchBtn'>검색</button>
				
				</div>
			</div>



			<!-- <input type="button" value="글쓰기" class="btn btn-default pull-right"
				onclick="/write.do"> -->
			<c:if test="${login.USRCODE == 1}">
			<button id='newBtn' class="btn btn-default pull-right">글쓰기</button>
			</c:if>
			<a class="btn btn-default pull-left" href=noticeboard>처음으로</a>
		</div>
	</div>
</div>

<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>