
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
</style>

<!-- <script>
$("#replyAddBtn").on("click",function(){
	 
	 var replyerObj = $("#newReplyWriter");
	 var replytextObj = $("#newReplyText");
	 var replyer = replyerObj.val();
	 var replytext = replytextObj.val();
	
	  
	  $.ajax({
			type:'post',
			url:'/reply/'',
			headers: { 
			      "Content-Type": "application/json",
			      "X-HTTP-Method-Override": "POST" },
			dataType : 'text',
			data : JSON.stringify({REPLECODE:REPLECODE, USRCODE:USRCODE, PLANCODE:PLANCODE, REPLECONTENT:REPLECONTENT}),     
			success : function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/faq/"+REPLECODE+"/"+replyPage );
					replyerObj.val("");
					replytextObj.val("");
				}
		}});
});

var bno = ${boardVO.bno};

var replyPage = 1;

function getPage(pageInfo) {

	$.getJSON(pageInfo, function(data) {   // data = list
		printData(data.list, $("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));

		$("#modifyModal").modal('hide');

	});
}

$("#repliesDiv").on("click", function() {

	if ($(".timeline li").size() > 1) {
		return;
	}
	getPage("/replies/" + bno + "/1");

});
</script> -->
<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">

		<div class="portfolio-grids">

			<div class="box">
				<div class="box-header with-border"></div>

				<!-- <form name="BoardViewForm" method="post"> -->
				<form name="join">
					<table class="table table-striped"
						style="text-align: center; border: 2px solid #dddddd">
						<tbody>
							<tr>
								<td>글 번호</td>
								<td style="border-right: 2px solid #dddddd">${faqVO.FAQCODE}</td>
							</tr>
							<tr>
								<td>글 제목</td>
								<td style="border-right: 2px solid #dddddd">${faqVO.FAQTITLE}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td style="border-right: 2px solid #dddddd">${faqVO.USRCODE}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td style="border-right: 2px solid #dddddd">${faqVO.FAQCONTENT}</td>
							</tr>
						</tbody>
					</table>
					<tr>
						<td align=center colspan=2>
							<hr size=1>
							<div align="center">
								<input type="button" value="목록" class="btn btn-default"
									onclick="location.href='/faq/faqBoard'">

								<c:if test="${login.USRCODE == 1}">
									<a href="/faq/modifyFaq?FAQCODE=${faqVO.FAQCODE}"
										class="btn btn-default">수정</a>

									<a href="/faq/deleteFaq?FAQCODE=${faqVO.FAQCODE}"
										class="btn btn-default" type="submit"
										onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
								</c:if>
							</div>
						</td>
					</tr>
				</form>
				<!-- </form> -->
			</div>
			<!-- /.content -->
		</div>

	</div>
</div>
</div>
<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>