
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/header.jspf"%>

<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.8, maximum-scale=0.8, user-scalable=no">
</head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="style.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
	$(function() {
		$('#searchBtn').on(
				"click",
				function(e) {

					self.location = "faqBoard" + '${PageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $('select option:selected').val() + "&keyword="
							+ $('#keywordInput').val();
				});
	});
</script>

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

.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 20px 0;
    border-radius: 4px;
}

.pagination > li {
    display: inline;
}

@media(max-width:1365px){
.portfolio-grids h3{
 font-size:4vw;
}
}





</style>

<!-- //banner -->
<!-- portfolio -->
<div class="portfolio" >
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
			<h3>FAQ</h3>

			<table class="table table-hover">
				<thead>
					<tr>
						<th>번 호</th>
						<th>제 목</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="faq" items="${list}">

						<tr>
							<td>${faq.FAQCODE}</td>
							<td><a href="/faq/readFaq?FAQCODE=${faq.FAQCODE}"><c:out
										value="${faq.FAQTITLE}" /></a></td>
							<td>${faq.USRCODE}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<!-- <input type="button" value="글쓰기" class="btn btn-default pull-right"
				onclick="/write.do"> -->

			<div class="box-footer">
				<div class="text-center">
					<ul class="pagination">

						<c:if test="${PageMaker.prev}">
							<li><a
								href="faqBoard${PageMaker.faqSearch(PageMaker.startPage - 1)}">&laquo;
							</a></li>
						</c:if>

						<c:forEach begin="${PageMaker.startPage}"
							end="${PageMaker.endPage}" var="idx">

							<li><c:out
									value="${pageMaker.cri.page == idx?'class =active':''}" /> <a
								href="faqBoard${PageMaker.faqSearch(idx)}">${idx}</a></li>

						</c:forEach>

						<c:if test="${PageMaker.next && PageMaker.endPage > 0}">
							<li><a
								href="faqBoard${PageMaker.faqSearch(PageMaker.endPage +1)}">&raquo;
							</a></li>
						</c:if>
					</ul>
				</div>
			</div>

			<div class='box-body' align="center">
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>---</option>
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>Title</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>Content</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>Title
						OR Content</option>
				</select> <input type="text" name='keyword' id="keywordInput"
					value='${cri.keyword }'>
				<button id='searchBtn'>Search</button>
			</div>

			<c:if test="${login.USRCODE == 1}">
				<a class="btn btn-default pull-right" href=/faq/writeFaq>게시글쓰기</a>
			</c:if>
			<a class="btn btn-default pull-left" href=/faq/faqBoard>처음으로</a>

		</div>
	</div>
</div>
<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>