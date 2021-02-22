
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}

.pagination>li {
	display: inline;
}

<
style>.contact h3, h3.title, .portfolio h3, .blog h3 {
	text-align: center;
	font-size: 2em;
	color: #83BFA6;
	margin: inherit;
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

@media(max-width:1365px){
.portfolio-grids h3{
 font-size:4vw;
 width: 25%;
}
}
</style>
</style>

<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">
		<div class="portfolio-grids">
			<h3>마이페이지</h3>
			<form name="join">
				<table class="table table-striped"
					style="text-align: center; border: 2px solid #dddddd">
					<tbody>
						<tr>
							<td>아이디</td>
							<td style="border-right: 2px solid #dddddd">${login.USRID}</td>
						</tr>
						<tr>
							<td>이름</td>
							<td style="border-right: 2px solid #dddddd">${login.USRNAME}</td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td style="border-right: 2px solid #dddddd">${login.USRNICKNAME}</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td style="border-right: 2px solid #dddddd">${login.USREMAIL}</td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td style="border-right: 2px solid #dddddd">${login.USRDOB}</td>
						</tr>
						<tr>
							<td>비밀번호 변경</td>
							<td style="border-right: 2px solid #dddddd">
							<a href="changePwd"><button>비밀번호 변경</a></button>
							<a href="delete"><button>회원 탈퇴</a></button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>
	</div>
</div>
<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>