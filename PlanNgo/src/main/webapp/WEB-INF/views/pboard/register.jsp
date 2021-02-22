<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jspf"%>


<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script>
	$(function() {

		//phone-img handler 
		const phonefile = $('.Phone-fileupload');

		phonefile.change(this.files, function() {
			const fileList = this.files;
			console.log(fileList);

			var file = fileList[0];

			//지정된 요소의 key/value 들로 채울수있는 FormData() 생성.
			var formData = new FormData();

			//첫번쨰로 지정한 파일의 value 들을 "file" 이란 key 에 넣어줌
			formData.append("file", file);

			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".ImagePreviewList").append(html);

				}

			});
		});

		$("#registerForm").submit(
				function() {
					$(".ImagePreviewList li").each(function(index, item) {
						var cf = new Object();
						cf.number = index;
						cf.value = $(item).find('input').val();
						fileList.push(cf);
					});
					var jsonFile = JSON.stringify(fileList);
					//alert(jsonFile);
					$('#getfiles').val(jsonFile);
					//	$('#getfiles').attr("files", jsonFile);

					/* 
					var dispJson = document.createElement("a");
					dispJson.className="files";
					$("#files").val() = jsonFile; */

					if ($("#title").val() == "" || $("#fromDate").val() == ""
							|| $("#toDate").val() == ""
							|| $("#packagePrice").val() == ""
							|| $("#content").val() == "") {
						alert("빈칸이 없는지 확인해 주세요.");
						$("#title").focus();
						return false;
					}
					if ($("#files").val() == null) {
						alert("썸네일 이미지를 등록해주세요!");
						$("#title").focus();
						return false;

					}

					var numberExpr = /^[0-9]*$/;

					if (!(numberExpr.test($("#packagePrice").val()))) {
						alert("가격은 숫자 만, 콤마(,) 빼고 입력해주세요!");
						$("#packagePrice").focus();
						return false;
					}

				});
		// 오늘 날짜를 출력
		//$("#today").text(new Date().toLocaleDateString());

		// datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
		// 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

		// 시작일.
		$('#fromDate').datepicker({
			showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			buttonImage : "/resources/images/calendar.png", // 버튼 이미지
			buttonImageOnly : true, // 버튼 이미지만 표시할지 여부
			buttonText : "날짜선택", // 버튼의 대체 텍스트
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
			buttonImage : "/resources/images/calendar.png",
			buttonImageOnly : true,
			buttonText : "날짜선택",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			// minDate: 0, // 오늘 이전 날짜 선택 불가
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정
				$("#fromDate").datepicker("option", "maxDate", selectedDate);
			}
		});

	});
</script>
<style>
#Image-attach-Warrper {
	display: none;
}
.Image-Drop-Zone-Warrper {
	left: 50%;
}

.ImageDropZone {
	box-sizing: border-box;
	width: 25%;
	height: 25%;
	padding-top: 15%;
	padding-bottom: 15%;
	padding-left: 5%;
	padding-right: 5%;
	z-index: 99999;
	text-align: center;
	border: 2.5px dashed #60a7dc;
	margin-left: 37.5%;
}

.table-form input[type="text"], .table-form input[type="email"],
	.table-form textarea {
	border: 1px solid #E3E3E3;
	outline: darkblue;
	padding: 14px;
	color: black;
	overflow: hidden;
	display: block;
	font-size: 14px;
	background: none;
	margin: 5;
}

.banner-bottom, .banner-bottom-position, .slider, .sevices-list,
	.featured-services, .contact, .typo, .portfolio, .blog, .single, .about,
	.features {
	padding: 1em 0;
}

.table-form textarea {
	min-height: 220px;
	resize: none;
	margin: 0;
}

#dragitem {
	color: red;
	background-color: pink;
	width: 100px;
}

#a.input[type="text"] {
	font-family: Georgia, serif;
	color: black;
}

/*datepicker에서 사용한 이미지 버튼 style적용*/
img.ui-datepicker-trigger {
	margin-left: 5px;
	vertical-align: middle;
	cursor: pointer;
	width: 30px;
	height: 30px;
	object-fit: cover;
}

.inputVal {
	position: relative;
}

.inputVal label {
	position: relative;
	top: 1px; /* input 요소의 border-top 설정값 만큼 */
	left: 1px; /* input 요소의 border-left 설정값 만큼 */
	padding: .8em .5em; /* input 요소의 padding 값 만큼 */
	color: #999;
	cursor: text;
}

.table-form input[type="submit"] {
	width: 20%;
	float: right;
	top: 4%;
}

.table-form input[type="text"] {
	display: inline-block;
}

.date input[type="text"] {
	display: inline-block;
	height: auto; /* 높이값 초기화 */
	line-height: normal; /* line-height 초기화 */
	padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	font-family: inherit; /* 폰트 상속 */
	border: 1px solid #999;
	border-radius: 0; /* iSO 둥근모서리 제거 */
	outline-style: none; /* 포커스시 발생하는 효과 제거를 원한다면 */
	-webkit-appearance: none; /* 브라우저별 기본 스타일링 제거 */
	-moz-appearance: none;
	appearance: none;
	width: 20%;
}

.thumbnailImgsText input[type="file"] {
	display: inline-block;
}

.ImagePreviewList li {
	display: inline-block;
	text-align: -webkit-match-parent;
}




@media ( max-width : 500px) {
	#Image-Drop-Zone-Warrper {
		display: none;
	}
	#Image-attach-Warrper {
		display: block;
}
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="portfolio">
		<div class="blog">
			<div class="container">
				<h3>여행 패키지 등록하기</h3>

				<div class="table-form">
					<form id='registerForm' role="form" method="POST"
						enctype="multipart/form-data">

						<input type='hidden' name='AGENCYNAME'
							value="${login.USRNICKNAME}"> <input id="getfiles"
							type='hidden' name='files' value="">

						<div id="Image-Drop-Zone-Warrper">
							<div class="ImageDropZone">
								<label for="Image-Drop">썸네일 이미지를 드래그 해주세요!</label>
							</div>
						</div>

						<div id="Image-attach-Warrper">
							<input class="Phone-fileupload" type="file"
								value="썸네일 이미지를 한장 선택해주세요" multiple />
						</div>

						<div class="ImagePreView">
							<ul class="ImagePreviewList">
							</ul>
						</div>

						<div class="inputVal">
							<label for="packageTitle">패키지명</label> <input type="text"
								id="title" name="TITLE">

							<div class="date">

								<label for="fromDate">시작일</label> <span> <input
									placeholder="시작일 선택" type="text" name="STARTDATE" id="fromDate"
									readonly> ~ <label for="toDate">종료일</label> <input
									placeholder="종료일 선택" type="text" name="ENDDATE" id="toDate"
									readonly></span>

							</div>

							<label for="packagePrice">패키시 시작 가격</label> <input type="text"
								name="PRICE" id="packagePrice" style="width: 25%;" /> <br>
						</div>


						<label for="packagePrice">패키시 상세내용 </label>
						<textarea class="form-control" id="content" name="PACKAGECONTENT"
							maxlength="14000" rows="10" placeholder="상세 내용을 기입해 주세요"></textarea>

						<input type="submit" value="등록하기" id="submit">

					</form>

				</div>
			</div>
		</div>
	</div>


	<script id="template" type="text/x-handlebars-template">
<li>
  <div class="ImagePreViewIteam">
	<input id = "files" type='hidden' name='filess' value = '{{fullName}}'>

	<img src="{{imgsrc}}" alt="Attachment">
  	<div class="ImagePreviewDelete">
		<small data-src = {{delLink}}><i class="fa fa-fw fa-remove"></i></small>
	</div>
  </div>
</li>        


        
</script>

	<script>
		//핸들바 템플릿 가져오기
		var source = $('#template').html();
		//핸들바 템플릿 컴파일
		var template = Handlebars.compile(source);

		//핸들바 템플릿 바인딩할 데이터  imgsrc 

		//Drop Zone Drag & Drop 기능 ==> 
		// dragenter : 드래깅해서 특정영역 으로 들어가는것 
		// dragover ==> 특정영역으로 들어가있는 상태
		$('.ImageDropZone').on("dragenter dragover", function(e) {
			// 만약 사용자가 URL 링크를 드래그 해서 놓을경우, 그 링크로 가능 브라우저 디폴트 성향을 막는다 ==> e.preventDefault() 
			e.preventDefault();

		});
		//드랍 했을떄, 마우스를 특정 구역에서 놓았을떄 
		$('.ImageDropZone ').on("drop", function(e) {
			e.preventDefault();

			//originalEvent.dataTransfer.files ==> drag & drop 한 모든 파일(files) 의 정보를 가진, FileList 객체 
			//FileList 는 배열과 닮았지만, 배열이 아닌 유사배열.
			// 0 부터 시작하고 lastModified, name, size, type 등이 있다.
			var files = e.originalEvent.dataTransfer.files;
			//files 에 있는 첫번째 파일
			var file = files[0];

			//지정된 요소의 key/value 들로 채울수있는 FormData() 생성.
			var formData = new FormData();

			//첫번쨰로 지정한 파일의 value 들을 "file" 이란 key 에 넣어줌
			formData.append("file", file);

			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					//data = ResponseEntity
					/* 				UploadFileUtils.uploadFile(
																uploadPath, 
																origName, 
																file.getBytes()),		
																HttpStatus.CREATED); */

					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".ImagePreviewList").append(html);

				}
			});

		});
		//드랍 했을떄, 마우스를 특정 구역에서 놓았을떄 
		$('.ImageDropZone ').on("drop", function(e) {
			e.preventDefault();

			//originalEvent.dataTransfer.files ==> drag & drop 한 모든 파일(files) 의 정보를 가진, FileList 객체 
			//FileList 는 배열과 닮았지만, 배열이 아닌 유사배열.
			// 0 부터 시작하고 lastModified, name, size, type 등이 있다.
			var files = e.originalEvent.dataTransfer.files;
			//files 에 있는 첫번째 파일
			var file = files[0];

			//지정된 요소의 key/value 들로 채울수있는 FormData() 생성.
			var formData = new FormData();

			//첫번쨰로 지정한 파일의 value 들을 "file" 이란 key 에 넣어줌
			formData.append("file", file);
			console.log(file);
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".ImagePreviewList").append(html);

				}
			});

		});

		var fileList = new Array();

		$(".ImagePreviewList").on("click", "small", function(event) {

			var that = $(this);
			$.ajax({
				url : "/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						that.parent().parent().parent().remove();
					}
				}
			});
		});
	</script>






	<%-- 	<%@include file="../include/footer.jspf"%> --%>