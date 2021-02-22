
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/header.jspf"%>


<!DOCTYPE html>

<html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
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

.contact h3, h3.title, .portfolio h3, .blog h3 {
	text-align: center;
	font-size: 2em;
	color: #83BFA6;
	margin: inherit;
	padding-bottom: 0.5em;
	width: 20%;
	border-bottom: #DEDEDE;
	margin-bottom: 0em;
}

.contact h3, h3.title, .portfolio h3, .blog h3 {
	text-align: center;
	font-size: 2em;
	color: #83BFA6;
	margin: inherit;
	padding-bottom: 0.5em;
	width: 20%;
	border-bottom: #DEDEDE;
	margin-bottom: 0em;
	padding-top: 1em;
}

.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2,
	.col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3,
	.col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5,
	.col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6,
	.col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8,
	.col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9,
	.col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11,
	.col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12
	{
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
	padding-top: 3em;
}

.contact h3, h3.title, .portfolio h3, .blog h3 {
	text-align: center;
	font-size: 2em;
	color: #83BFA6;
	margin: inherit;
	padding-bottom: 0.5em;
	width: 70%;
	border-bottom: #DEDEDE;
	margin-bottom: 0em;
	padding-top: 1em;
}
ul,li {
    list-style: none;
    padding-left: 0px;
}
.td-left{
	width:30%;
}
.td-right{
	width:70%;
}
</style>



<!-- //banner -->
<!-- portfolio -->
<div class="portfolio">
	<div class="container">

		<div class="portfolio-grids">

			<div>
				<div class="box-header with-border"></div>

				<!-- <form name="BoardViewForm" method="post"> -->
				<input type='hidden' value='${login.USRCODE}' id='usrcodeInput'>

				<form role="form" action="modifyPage" method="post">

					<input type='hidden' name='NOTICECODE'
						value="${noticeVO.NOTICECODE}"> <input type='hidden'
						name='page' value="${cri.page}"> <input type='hidden'
						name='perPageNum' value="${cri.perPageNum}"> <input
						type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">

				</form>

				<table class="table table-striped"
					style="text-align: center; border: 2px solid #dddddd">
					<tbody>
						<tr>
							<td>번호</td>
							<td style="border-right: 2px solid #dddddd">${noticeVO.NOTICECODE}</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td style="border-right: 2px solid #dddddd">${noticeVO.USRNAME}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td style="border-right: 2px solid #dddddd">${noticeVO.NOTICETITLE}</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td colspan="2"><fmt:formatDate var="resultRegDt"
									value="${noticeVO.REGDATE}" pattern="yyyy-MM-dd hh:mm" />${resultRegDt}
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" >
								${noticeVO.NOTICECONTENT}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div align="center">
				<input type="button" value="목록" class="btn btn-primary"
					onclick="history.back()">
				<c:if test="${login.USRCODE == 1}">	
				<button type="submit" class="btn btn-warning">수정</button>
				<button type="submit" class="btn btn-danger noticedelete">삭제</button>
				</c:if>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="box box-success">
						<input type='hidden' class="USRNAME" name='USRNAME'
							value="${login.USRNAME}">
						
						<div class="box-header" align="center">
							<h3 class="box-title">■■■■■■■ 댓글 ■■■■■■■</h3>
						</div>
						<c:if test="${login.USRNAME != null}">
						<div class="box-body">
							<label for="exampleInputEmail1">댓글내용</label> <input
								class="form-control" type="text" placeholder="댓글내용 적어주세요."
								id="newRepleText">
						</div>
						
						<div class="box-footer">
							<button type="button" class="btn btn-primary replebtn"
								id="repleAddBtn">등록</button>
						</div>
						</c:if>
		
					</div>
				</div>
			</div>
			
			<ul class="timeline">
				<br>
		 		 <!-- timeline time label -->
				<li class="time-label" id="repliesDiv">
			
		  		<button class="btn-primary" >댓글 리스트</button>
		  		</li>
			</ul>
			
			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">

				</ul>
			</div>
			
			<!-- Modal -->
			<div id="modifyModal" class="modal modal-primary fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body" data-rno>
							<p>
								<input type="text" id="repletext" class="form-control">
							</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="repleModBtn">Modify</button>
							<button type="button" class="btn btn-danger repledelete" id="repleDelBtn">DELETE</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<script id="template" type="text/x-handlebars-template">
			{{#each .}}
			<li class="repleli" data-rno={{replecode}}>
			<table class="table table-hover" style="text-align: center; border: 2px solid #dddddd">
				<tbody>
					<tr>
						<td class="td-left">작성자</td>
						<td class="td-right" style="border-right: 2px solid #dddddd">{{usrname}}
						{{#xif usrname}}
						<a class="btn btn-primary btn-xs pull-right" data-toggle="modal" data-target="#modifyModal">수정</a>
						{{/xif}}
						</td>
					</tr>
					<tr>
						<td class="td-left">댓글내용</td>
						<td  class="td-right" style="border-right: 2px solid #dddddd">{{replecontent}}</td>
					</tr>
					<tr>
						<td class="td-left">작성날짜</td>
						<td class="td-right" style="border-right: 2px solid #dddddd">{{regdate}}</td>
					</tr>
				</tbody>
			</table>

     				
						
			</li>
			{{/each}}
			</script>

			<script>
				//공지사항 게시판 버튼 자바스크립.
				$(document).ready(function() {
					var formObj = $("form[role='form']");

					console.log(formObj);

					$(".btn-warning").on("click", function() {
						formObj.attr("action", "/notice/modifyPage");
						formObj.attr("method", "get");
						formObj.submit();
					});

					$(".noticedelete").on("click", function() {
						if (confirm("삭제하시겠습니까?")) {
							formObj.attr("action", "/notice/removePage")
							formObj.attr("method", "post");
							formObj.submit();
						} else
							return;
					});
				});
					//공지사항 댓글 자바스크립.
					var printData = function(repleArr, target, templateObject) {

						var template = Handlebars.compile(templateObject.html());

						var html = template(repleArr);
						$(".repleli").remove();
						target.after(html);

					}
					
					
					Handlebars.registerHelper("xif", function(usrname, option) {					
			 
			            var result = "";
			            var usrname2 = '${login.USRNAME}';
			 
			            if(usrname == usrname2) {
			                result += option.fn(this);
			            }
			            return result;
			        });
	
					
					var NOTICECODE = ${noticeVO.NOTICECODE};
					
					var replyPage = 1;

					function getPage(pageInfo){
						
						$.getJSON(pageInfo,function(data){
							printData(data.list, $("#repliesDiv") ,$('#template'));
							printPaging(data.pageMaker, $(".pagination"));
							
							$("#modifyModal").modal('hide');
							
						});
					}
					
					var printPaging = function(pageMaker, target) {

						var str = "";

						if (pageMaker.prev) {
							str += "<li><a href='" + (pageMaker.startPage - 1)
									+ "'> << </a></li>";
						}

						for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
							var strClass = pageMaker.cri.page == i ? 'class=active' : '';
							str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
						}

						if (pageMaker.next) {
							str += "<li><a href='" + (pageMaker.endPage + 1)
									+ "'> >> </a></li>";
						}
						console.log("endPage = " + pageMaker.endPage)
						target.html(str);
					};
					
					$("#repliesDiv").on("click", function() {

						if ($(".timeline li").size() > 1) {
							return;
						}
						getPage("/reple/" + NOTICECODE + "/1");

					});
					

					$(".pagination").on("click", "li a", function(event){
						
						event.preventDefault();
						
						replyPage = $(this).attr("href");
						
						getPage("/reple/"+NOTICECODE+"/"+replyPage);
						
					});
					

					$(".replebtn").on("click", function() {

						var repletextObj = $("#newRepleText");
						var REPLECONTENT = repletextObj.val();
						<%-- if(<%=session.getAttribute("login")%> != null){
							USRCODE = <%=session.getAttribute("login")%>;
						} --%>
						/* var USRCODE = ${login.USRCODE}; */
						var USRCODE = $("#usrcodeInput").val();
						var NOTICECODE = ${noticeVO.NOTICECODE};					
						
						console.log(REPLECONTENT);
						if(REPLECONTENT == ""){
							  alert("댓글을 입력해주세요!");
							  return false;
						  }
						
						console.log("작성자 : " + USRCODE + "내용 : " + REPLECONTENT
									+ "게시글번호 : " + NOTICECODE);

						if (confirm("댓글을 등록하시겠습니까?")) {
							$.ajax({
								type:'post',
								url:'/reple/',
								headers: {
									"Content-Type": "application/json",
									"X-HTTP-Method-Override": "POST" },
								dataType:'text',
								data:JSON.stringify({usrcode:USRCODE, noticecode:NOTICECODE, replecontent:REPLECONTENT}),
								success: function(result) {
									console.log("성공");
									if(result == 'SUCCESS'){
										console.log("성공2");
										replyPage = 1;
										getPage("/reple/"+NOTICECODE+"/"+replyPage );
										repletextObj.val("");
									}

								}
							});
						}

					})
					$(".timeline").on("click", ".repleli", function(event){
						
						var reple = $(this);
						
						$("#repletext").val(reple.find('.timeline-body').text());
						$(".modal-title").html(reple.attr("data-rno"));
						
					});
					
					
					$("#repleModBtn").on("click",function(){
						  
						
						
						  var replecode = $(".modal-title").html();
						  var replecontent = $("#repletext").val();

						  if(replecontent == ""){
							  alert("수정할 내용을 입력해주세요!");
							  return false;
						  }
						  console.log(replecode);
						  console.log(replecontent);
						  
						  $.ajax({
								type:'put',
								url:'/reple/'+replecode,
								headers: { 
								      "Content-Type": "application/json",
								      "X-HTTP-Method-Override": "PUT" },
								data:JSON.stringify({replecontent:replecontent}), 
								dataType:'text', 
								success:function(result){
									console.log("result: " + result);
									if(result == 'SUCCESS'){
										alert("수정 되었습니다.");
										getPage("/reple/"+NOTICECODE+"/"+replyPage );
									}
							}});
					});
					
					$("#repleDelBtn").on("click",function(){
						  
						var replecode = $(".modal-title").html();
						var replecontent = $("#repletext").val();
						  
						console.log(replecode);
						console.log(replecontent);
						
						  $.ajax({
								type:'delete',
								url:'/reple/'+replecode,
								headers: { 
								      "Content-Type": "application/json",
								      "X-HTTP-Method-Override": "DELETE" },
								dataType:'text', 
								success:function(result){
									console.log("result: " + result);
									if(result == 'SUCCESS'){
										alert("삭제 되었습니다.");
										getPage("/reple/"+NOTICECODE+"/"+replyPage);
									}
							}});
					});
				
			</script>

		</div>
	</div>
</div>

<!-- 		<div id="comment">
		<table border="1" bordercolor="lightgray"> -->
<!-- 댓글 목록 -->

<!-- //portfolio -->
<!-- contact -->

<%@ include file="/WEB-INF/views/include/footer.jspf"%>
</html>