
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/header.jspf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">

		<div class="portfolio-grids">
			<table summary="글쓰기 전체 테이블">
				<form role="form" method="post" action="modifyPage">

					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<table class="table-form" summary="테이블 구성">

						<input type="hidden" name="NOTICECODE" value="${read.NOTICECODE}">

						<tr>
							<td>제 목</td>
							<td>
							<input type="text" name="NOTICETITLE" id="NOTICETITLE" cols="130"
								value="${read.NOTICETITLE}">
							</td>
						</tr>
						<tr>
							<td>내 용</td>
							<td>
							<textarea name="NOTICECONTENT" id="NOTICECONTENT" rows="10" cols="130">${read.NOTICECONTENT}</textarea>
							</td>
						</tr>

					</table>
					<br>
				</form>
			</table>
			<div align="center">
				<button type="submit" class="btn btn-warning">취소</button>
				<button type="submit" class="btn btn-primary">수정</button>
			</div>
			<script>
				$(document).ready(function(){
					var formObj = $("form[role='form']");
						console.log(formObj);
					$(".btn-warning").on("click", function(){
						self.location = "/notice/readPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
								+ "&searchType=${cri.searchType}&keyword=${cri.keyword}&NOTICECODE=${read.NOTICECODE}";
						});
					$(".btn-primary").on("click", function(){
						formObj.submit();
					});
				});
			</script>
			
		</div>
	</div>
</div>
<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>