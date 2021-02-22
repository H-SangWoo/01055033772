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
</style>
<script language="javascript">
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	function formCheck() {
		if (join.subject.value == "") {
			alert("제목을 입력해 주세요");
			join.subject.focus();
			return false;
		}
		if (join.name.value == "") {
			alert("이름을 입력해 주세요");
			join.name.focus();
			return false;
		}		
		if (join.email.value == "") {
			alert("이메일을 입력해 주세요");
			join.email.focus();
			return false;
		}
		if (join.number.value == "") {
			alert("연락처를 입력해 주세요");
			join.number.focus();
			return false;
		}
		if (join.content.value == "") {
			alert("문의내용을 입력해 주세요");
			join.content.focus();
			return false;
		}

		if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
			return false;
		}
		
	}

	
</script>

<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">

		<h3>Q&A</h3>
		<table summary="글쓰기 전체 테이블">
			<form name="join" method="post" action="qnaMailForm"
				onsubmit="return formCheck();">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<table class="table-form" summary="테이블 구성">
					<tr>
						<td><input type="hidden" name="id" cols="130" value=""></td>
					</tr>
					<tr>
						<td><input type="hidden" name="from" value="wndud7965@naver.com" /></td>
					</tr>
					<tr>
						<td><input type="hidden" name="to" value="wndud7965@naver.com" /></td>
					</tr>
					<tr>
						<td>제 목</td>
						<td><input type="text" name="subject" cols="130"></td>
					</tr>
					<tr>
						<td>이 름</td>
						<td><input type="text" name="name" cols="130"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" cols="130"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="number" cols="130"></td>
					</tr>
					<tr>
						<td>내 용</td>
						<td><textarea name=content rows="10" cols="130"
								style="height: 500px;"></textarea></td>
					</tr>
					
				</table>
				<br>
				<center>
					<input type="submit" id = "submit" value="전송" class="btn btn-default" >&nbsp;&nbsp;
				</center>
			</form>
			
		</table>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>
