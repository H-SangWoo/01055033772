
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

.table td, .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td,
	.table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
	padding: 10px !important;
}

.grid_5 h3, .grid_5 h2, .grid_5 h1, .grid_5 h4, .grid_5 h5, h3.hdg, h3.bars
	{
	margin-bottom: 1em;
	color: #2B82AD;
	letter-spacing: 1px;
}

h1, h2, h3, h4, h5, h6, a {
	font-family: 'Oswald', sans-serif;
	font-weight: 300;
	margin: 0;
}

.table-form input[type="text"], .table-form input[type="email"],
	.table-form textarea {
	border: 1px solid #E3E3E3;
	outline: none;
	padding: 14px;
	color: #000000;
	overflow: hidden;
	display: block;
	font-size: 14px;
	background: none;
	margin: auto;
}

.table-form input[type="submit"], .table-form textarea, .table-form input[type="text"],
	.table-form input[type="email"] {
	width: 90%;
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
@media(max-width:1365px){
.portfolio h3{
 font-size:4vw;
}
}

</style>

<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">

		<div class="portfolio-grids">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
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
		</div>

		<h3>Q&A</h3>
			<center><h4>안녕하세요? Plan&go 입니다.<br><br>
			Q&A메일을 보내주시면 2~3일 내에 답변메일을 전송해드립니다!
			이용해주셔서 감사합니다.</h4></center>
			<br>
			<br>
			<form action="/qna/qnaMailForm">
			<center><input type="submit" value="Q&A메일 보내기" class="btn btn-default">&nbsp;&nbsp;</center>
			</form>
							
		</div>

	</div>

<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>