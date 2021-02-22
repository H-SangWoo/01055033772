
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jspf"%>

<!DOCTYPE html>

<html>

<style>
.contact h3, h3.title, .portfolio h3, .blog h3 {
	text-align: center;
	font-size: 2em;
	color: #25242b;
	margin: auto;
	padding-bottom: 0.5em;
	width: 20%;
	border-bottom: 0px double #DEDEDE;
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
</style>



<script>
	$(document).ready(function() {
		$("#saveBtn").on("click", function() {
			var FAQTITLE = $("#FAQTITLE").val();
			var FAQCONTENT = $("#FAQCONTENT").val();
			
			if (FAQTITLE == "") {
				alert("제목을 입력하세요.");
				console.log("ASDFASDF");
				return false;
			} 
			if (FAQCONTENT == "") {
				
				alert("내용을 입력하세요.");
				return;
			}
			document.join.submit();
		});
	});
</script>


<!-- //banner -->
<!-- portfolio -->
<body>
	<div class="portfolio">
		<div class="container">

			<div class="portfolio-grids">
				<h3>FAQ 작성</h3>
				<table summary="글쓰기 전체 테이블">
					<!-- <form name="join" method="post" action="write.do" onsubmit="return formCheck();"> -->
					<form name="join" method="post" action="writeFaq">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<table class="table-form" summary="테이블 구성">
							<tr>
								<td>제 목</td>
								<td><input type="text" name="FAQTITLE" id="FAQTITLE" cols="130"></td>
							</tr>
							<tr>
								<td>내 용</td>
								<td><textarea name="FAQCONTENT" id="FAQCONTENT"  rows="10" cols="130"></textarea></td>
							</tr>

						</table>
						<br>
						<td colspan="2">
						<div align="center">
								<input type="button" value="취소" class="btn btn-default" onclick="history.go(-1)"> 
								<input type="button" value="등록" id="saveBtn" class="btn btn-default">&nbsp;&nbsp;
						</div>
						</td>
					</form>

				</table>
				<%-- ${pageContext.request.contextPath} --%>

				<!-- /.content -->
			</div>
		</div>
	</div>
	</div>
</body>
<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>