<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jspf"%>


<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">

<style>	
.swiper-container {
	width: 45%;
	height: 100%;
}

/* img {
	border: 0;
	width: 100%;
} */
.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.imgList {
	width: 100%;
	height: 200px;
}

.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
	padding-left: 50%;
}

.col-xs-4 {
	width: 67%;
}

.box-body {
	position: relative;
	display: block;
	width: 100%;
	left: 15%;
	padding-top: 50px;
	padding-bottom: 30px;
}

.agencySelect, .searchbox, .priceSelect {
	display: inline-block;
}

.select-date {
	display: inline-block;
}

.start-date, .end-date {
	display: inline-block;
	width: auto;
}

.filterbox {
	display: block;
	width: 100%;
}

.swiper-slide {
	width: 100%;
}
</style>

<script>
	//선언한 TextBox에 DateTimePicker 위젯을 적용한다.
	$(function() {
		
		// 오늘 날짜를 출력
		//$("#today").text(new Date().toLocaleDateString());

		// datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		// 시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "resources/images/calendar.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "", // 버튼의 대체 텍스트
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			// minDate: 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) {
				// 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#toDate").datepicker("option", "minDate", selectedDate);
			}
		});

		// 종료일
		$('#toDate').datepicker({
			showOn : "both",
			buttonImage : "resources/images/calendar.png",
			buttonImageOnly : true,
			buttonText : "",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			// minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});

		$('#searchBtn').on(
				"click",
				function(e) {

					self.location = "listAll" + '${PageMaker.makeQuery(1)}'
							+ "&agencyType="
							+ $('#agencyType option:selected').val()
							+ "&startPrice="
							+ $('#startPrice option:selected').val()
							+ "&startDate=" + $('#fromDate').val()
							+ "&endDate=" + $('#toDate').val();

				});

	});

</script>
<head>

<style>
/* .box {
	display: inline-flex;
} */
</style>

<title>Search Travel!</title>


</head>
<body>
	<div class="portfolio">
		<div class="container">
			<h3>여행 패키지</h3>
			<div class='box filterbox'>
				<div class='box-body'>
					<div class='agencySelect'>
						<select name="agencyType" id="agencyType">
							<option value="all"
								<c:out value="${cri.agencyType eq 'all'? 'selected' :''}"/>>
								모든 여행사</option>
							<option value="하나투어"
								<c:out value="${cri.agencyType eq '하나투어'?'selected':''}"/>>
								하나투어</option>
							<option value="모두투어"
								<c:out value="${cri.agencyType eq '모두투어'?'selected':''}"/>>
								모두투어</option>
							<option value="노란풍선"
								<c:out value="${cri.agencyType eq '노란풍선'?'selected':''}"/>>
								노란풍선</option>
						</select>
					</div>

					<div class='priceSelect'>
						<select name="startPrice" id="startPrice">
							<option value="all"
								<c:out value="${cri.startPrice eq 'all'? 'selected':''}"/>>
								모든 가격대</option>

							<option value="100000"
								<c:out value="${cri.startPrice eq '100000'?'selected':''}"/>>
								100,000 원 ~</option>

							<option value="150000"
								<c:out value="${cri.startPrice eq '150000'?'selected':''}"/>>
								150,000 원 ~</option>

							<option value="200000"
								<c:out value="${cri.startPrice eq '200000'?'selected':''}"/>>
								200,000 원 ~</option>
						</select>
					</div>



					<div class="select-date">
						<div class="start-date">
							<label for="fromDate">시작일</label> <input placeholder="시작일 선택"
								type="text" name="fromDate" id="fromDate"
								value="${cri.startDate}" readonly />
						</div>
						<div class="end-date">
							~ <label for="toDate">종료일</label> <input placeholder="돌아오는 일 선택"
								type="text" name="toDate" id="toDate" value="${cri.endDate}"
								readonly />
						</div>
					</div>

					<div class='searchbox'>
						<button id='searchBtn'>검색</button>
					</div>
				</div>

			</div>

			<c:forEach items="${list}" var="packageVO" varStatus="status">
				<div class="blog-grids">
					<div class="col-md-6 blog-grid">

						<div class="swiper-container">
							<div class="swiper-wrapper wrapper${status.index}"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>

						<script>
		
						//var jsonData = JSON.parse( JSON.stringify(${packageVO.files}));
						var jsonData = eval(${packageVO.files});
						
						console.log(jsonData.length);
							
						for(var i = 0 ; i < jsonData.length; i++) {
							var imgdiv = document.createElement('div');
							imgdiv.className = "swiper-slide";
							$(".wrapper"+${status.index}).append(imgdiv);	
								
							
													
							var img = document.createElement('img');
							img.className = "imgList"
							
							var imgObject = getFileInfo(jsonData[i].value);
							img.src = imgObject.imgsrc; 
								  
							imgdiv.append(img);
							
											
							}
							
							
						
							
							
							
							
							
								
				</script>

						<div class="col-xs-8 blog-grid-right package-content"
							style="left: 20%;">

							<a href="readPage?pno=${packageVO.PACKAGEID}">패키지 명:
								${packageVO.TITLE}</a> <br> <a
								href="readPage?pno=${packageVO.PACKAGEID}">기간 :
								${packageVO.STARTDATE} ~ ${packageVO.ENDDATE}</a>
							<p></p>
							<a href="readPage?pno=${packageVO.PACKAGEID}"> 가격 :
								${packageVO.PRICE} 원 ~</a>
						</div>

						<div class="clearfix"></div>
						<div class="more m1"></div>
					</div>
				</div>


			</c:forEach>

			<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
			<script>

		var swiper = new Swiper('.swiper-container', {
     navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
		
</script>

			<div class="box-footer">
				<ul class="pagination">
					<c:if test="${PageMaker.prev }">
						<li><a
							href="listAll${PageMaker.pMakeSearch(PageMaker.startPage - 1) }">
								&laquo;</a>
					</c:if>

					<c:forEach begin="${PageMaker.startPage}"
						end="${PageMaker.endPage }" var="idx">
						<li
							<c:out value = "${PageMaker.cri.page == idx? 'class = active' : ''}"/>>
							<a href="listAll${PageMaker.pMakeSearch(idx)}">${idx}</a>
						</li>


					</c:forEach>
					<c:if test="${PageMaker.next && PageMaker.endPage > 0}">
						<li><a
							href="listAll${PageMaker.pMakeSearch(PageMaker.endPage +1) }">&raquo;</a></li>
					</c:if>
				</ul>
			</div>


		</div>
	</div>

</body>

<%@ include file="../include/footer.jspf"%>

