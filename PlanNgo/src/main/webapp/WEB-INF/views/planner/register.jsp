<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<title>Plan & go 계획세우기</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />


<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f69c8902e1b50b1cd719d95c9066fddd"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="/resources/css/makePlanner.css" rel="stylesheet"
	type="text/css" media="all" />

<body style="margin-top: 0px;">

	<script>
	var dayTotal = 0;	// 총 day 수
	var selectday = -1;	// 선택된 day
	var selectSchedule = -1;	// 선택된 일정
 	var positionList = new Array(); // 맵 마커에 표시될 정보 리스트
 	
 	
	var DAYS = new Array(); // 각 날짜마다 가지는 스케쥴정보 
 	var dayCnt;  //각 day마다 일정 수
 	
 	var activityList; // activitylist 정보
	
$(document).ready(function(){
	/* 날짜 표시되기 */
	$('#date-submit').click(
	 function() {
		var date = new Date($("#make-planner-date").val());
		if (isNaN(date)) {
			alert("여행 시작날자를 선택해주세요");
			return false;
		}
		else {
			$('#btn-day-add').show();
			return false;
		}
	});

	/* day추가 누르면 날짜+1 추가되기 */
	$('#btn-day-add').click(function () {
		var date = new Date($("#make-planner-date").val());
		DAYS[dayTotal] = new Object();
		DAYS[dayTotal].planschedulelist = new Array();
		DAYS[dayTotal].dayCnt = 0;
		DAYS[dayTotal].day=++dayTotal;
		
		/*day 추가 */		
		var daysDiv = document.createElement("li");
		daysDiv.className="day";
		var dayp = document.createElement("p");
		daysDiv.appendChild(dayp);
		$(".daylist-days ul").append(daysDiv);	
		var textNode = document.createTextNode('Day'+dayTotal);
		dayp.appendChild(textNode);
		
		/*day 삭제버튼 */	
		var deleteDay = document.createElement('i');
	    deleteDay.className="daydelete fas fa-times";
	    daysDiv.append(deleteDay);
		
		/*day 삭제기능 */			
	    deleteDay.onclick = function(){
	    	
			// 해당 day 삭제 
	    	var delindex = $(this).parent().index();
			$(".daylist-days ul").children().eq(delindex).remove();			

			
			// 삭제된 day 뒤에 있는 day들을 갱신 및 dayTotal -1
			// ex) 1 2 3 에서 2를 삭제하면 1 3 이 아니라 1 2로 되야함
			dayTotal = $('li').length;
			
			for(var i = delindex; i < dayTotal; i++){
				var newDayp = document.createElement("p");
				var newNode = document.createTextNode('Day'+ (i+1));
				newDayp.appendChild(newNode);
				$(".daylist-days ul").children().eq(i).children().eq(0).replaceWith(newDayp);	
				DAYS[delindex].day= i+1;
			}
			
			//선택된 day 초기화
			selectday = -1;
			$('.day').removeClass('activeli');		
			//data에서 삭제
	    	DAYS.splice(delindex,1);
			//해당 day schedule ui 삭제
	    	$("#schedulelist").empty();
			
	    }
		
		//day 선택
		$('.day').click(function () {
			selectday = $("li").index(this);
			
			//이전 schedulelist ui 삭제
			$('#schedulelist').empty();
						
			$('.day').removeClass('activeli');
			$(this).addClass('activeli');

			//schedule이 있으면
			if(DAYS[selectday].dayCnt != 0){
				
				for(var i=0 ;i<DAYS[selectday].planschedulelist.length;i++){
					
				var scheduleItem = document.createElement('div');
		    	scheduleItem.className="schedule-item";
		    	
		    	var scheduleItemImg = document.createElement('div');
		    	scheduleItemImg.className="schedule-item-img";
		    	scheduleItem.appendChild(scheduleItemImg);
		    	
		    	var contentImage = document.createElement('img');
			    contentImage.src = "/resources/images/city/"+DAYS[selectday].planschedulelist[i].img;
			    contentImage.width = 73;
			    contentImage.height = 71;
			    scheduleItemImg.appendChild(contentImage);
			    
			    var infoWrap = document.createElement('div');
			    infoWrap.className="schedule-item-info-wrap";
			    scheduleItem.appendChild(infoWrap);
			    
			    var info = document.createElement('div');
			    info.className="schedule-item-info";
			    infoWrap.appendChild(info);
		    	
			    var title = document.createElement('div');
			    title.className="title";
			    title.appendChild(document.createTextNode(DAYS[selectday].planschedulelist[i].title));

			    info.appendChild(title);
			    
			    var ctrlBox = document.createElement('div');
			    ctrlBox.className="ctrl-box";
			    infoWrap.appendChild(ctrlBox);
			    
			    //bucket
			    var bucket = document.createElement('span');
				    bucket.className="bucket";
				    ctrlBox.appendChild(bucket);
					
				    var bucketImage = document.createElement('img');
				  	bucketImage.className = "bucketimg";
				  	bucketImage.src = '/resources/images/calendar.png';				  
				  	bucket.append(bucketImage);  
		    
				  	//버킷 리스트 추가 
				  	bucket.onclick = function(e){
				  		//핸들바 템플릿 컴파일
				  		var source = $('#template').html();
						var template = Handlebars.compile(source);
						
						//몇번쨰 스케줄인지 확인. 0 부터 시작. 
						selectSchedule = $(this).parent().parent().parent().index();
						//선택된 스케줄의 시티 이름 
						var cityname = $(this).parent().prev().children().eq(0).text();
						//총 스케줄의 갯수
						var totalSchedule = $('.make-plan-left-schedulelist').children().length;

						$('#bucket-modal').empty();
				
						 $.ajax({
						url : "/buketlist/",
						type : "post",
						data : JSON.stringify({
							locationcity : cityname
						}),
	 			        contentType: "application/json; charset=utf-8",
						dataType : "json",
						success : function(result) {
							
							activityList = JSON.stringify(result);
							activityList = eval(activityList);
							
							var html = template(activityList);
							$('#bucket-modal').append(html);

							for(var i =0 ; i<activityList.length; i++){
								for(var j =0; j<DAYS[selectday].planschedulelist[selectSchedule].bucketlist.length;j++){
									if(activityList[i].activitycode==DAYS[selectday].planschedulelist[selectSchedule].bucketlist[j].activitycode){ 
										$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).removeClass("fas");
										$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).removeClass("fa-check-circle");
										$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).removeClass("checkimg");
			 					 		
										$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).addClass("checked");
										$('.item-wrapper-'+activityList[i].activitycode).parent().addClass("checked-item");
									}
								}
							}
							 
						 for(var i =0 ; i<activityList.length; i++){
								
								 $('.item-wrapper-'+activityList[i].activitycode).on("click", function(){
			 					 		var name = $(this).children().eq(2).text();
			 					 		
			 					 		if($(this).children().eq(0).hasClass("checked")){
				 					 		$(this).children().eq(0).removeClass("checked");
				 					 		$(this).parent().removeClass("checked-item");

				 					 		$(this).children().eq(0).addClass("fas");
				 					 		$(this).children().eq(0).addClass("fa-check-circle");
				 					 		$(this).children().eq(0).addClass("checkimg");

				 						    var bucketindex = $(this).parent().index();
				 	 						var activitycode = activityList[bucketindex].activitycode;
				 	 						var activityindex;
				 	 						for(var j =0; j<DAYS[selectday].planschedulelist[selectSchedule].bucketlist.length;j++){
				 	 							if(activitycode==DAYS[selectday].planschedulelist[selectSchedule].bucketlist[j].activitycode){
						 					 		DAYS[selectday].planschedulelist[selectSchedule].bucketlist.splice(j,1);
				 	 							}
				 	 						}
				 					 		
			 					 		}else{
			 					 			
			 					 			$(this).children().eq(0).removeClass("fas");
				 					 		$(this).children().eq(0).removeClass("fa-check-circle");
				 					 		$(this).children().eq(0).removeClass("checkimg");
				 					 		
				 					 		$(this).children().eq(0).addClass("checked");
				 					 		$(this).parent().addClass("checked-item");
				 					 		
				 						    var BUCKETLISTDTO = new Object();
				 						    var bucketindex = $(this).parent().index();
				 	 						BUCKETLISTDTO.activitycode = activityList[bucketindex].activitycode;
				 	 					    DAYS[selectday].planschedulelist[selectSchedule].bucketlist.push(BUCKETLISTDTO);
											
			 					 		}

			 					 	}); 
							 } //end of for loop
						}//end of ajax success
					});  // end of ajax 
						
						$('#bucket-modal').modal({
					        fadeDuration: 250
					      });
				  	}
			    
			    /*스케줄 삭제 버튼 */
			    var deleteSchedule = document.createElement('span');
			    deleteSchedule.className="closeschedule";
			    ctrlBox.appendChild(deleteSchedule);
			    deleteSchedule.setAttribute("data-day",DAYS[selectday].dayCnt);
			    deleteSchedule.onclick = function(){
			    	var delindex = $(this).parent().parent().parent().index();
			    	
			    	DAYS[selectday].planschedulelist.splice(delindex,1);
			    	$("#schedulelist").children().eq(delindex).remove();
			    	DAYS[selectday].dayCnt--;

			    }

			    			    
			    $('#schedulelist').append(scheduleItem);
				}
			}
			
		});
	});
	/*city 정보*/
 	<c:forEach var ="city" items = "${markerInfo.city}">
	 		var data = new Object();
	 		data.title = '${city.LOCATIONCITY}';		 	
			data.locationCode = "${city.LOCATIONCODE}"
			data.latlng = new kakao.maps.LatLng(${city.LATLNG});
	 		data.image = "${city.CITYIMAGE}";
	 		data.comment = "${city.COMMENT}";
	 		positionList.push(data);
	</c:forEach>



	 	
	 	
	 	
	 	
	 	/*지도생성*/
		var mapContainer = document.getElementById('map'), 
		mapOption = {
		center : new kakao.maps.LatLng(37.5640455, 126.8340033), 																// 중심좌표
		level : 13,
		disableDoubleClickZoom: true
			};
		

		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		
		

		
		/* 마커, 오버레이 찍기 */
		positionList.forEach(function (pos){
			
			  // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		    	map : map,
				position : pos.latlng
		  		    
		    });
			  
			  
		    // content HTMLElement 생성
		    var content = document.createElement('div');
		    content.className = "wrap";
		    
		    var contentInfo = document.createElement('div');
		    contentInfo.className = "info";
		    content.appendChild(contentInfo);
		    
		    var contentTitle = document.createElement('div');
		    contentTitle.className = "title";
		    contentInfo.appendChild(contentTitle);
		    contentTitle.appendChild(document.createTextNode(pos.title));
		    
		   
			/*닫기 버튼 */
			  
		    var closeBtn = document.createElement('button');
		    contentTitle.appendChild(closeBtn);
		    
			var closeBtnDiv = document.createElement('div');
			closeBtnDiv.className = "close";
			closeBtn.appendChild(closeBtnDiv);
		  
			/*add 버튼 */
		    var addBtn = document.createElement('button');
		    contentTitle.appendChild(addBtn);
		    
			var addBtnDiv = document.createElement('div');
			addBtnDiv.className = "add";
			
		    // add 버튼 이벤트 추가 (처음 지도에서 + 버튼 눌렀을떄 add 됨)
		    addBtn.onclick = function() {
		    	
		    	if(selectday != -1){
		    		
			    	var schedulelist = document.getElementById("schedulelist");
			    	
			    	var scheduleItem = document.createElement('div');
			    	scheduleItem.className="schedule-item";
			    	
			    	var scheduleItemImg = document.createElement('div');
			    	scheduleItemImg.className="schedule-item-img";
			    	scheduleItem.appendChild(scheduleItemImg);
			    	
			    	var contentImage = document.createElement('img');
				    contentImage.src = "/resources/images/city/"+pos.image;
				    contentImage.width = 73;
				    contentImage.height = 71;
				    scheduleItemImg.appendChild(contentImage);
				    
				    var infoWrap = document.createElement('div');
				    infoWrap.className="schedule-item-info-wrap";
				    scheduleItem.appendChild(infoWrap);
				    
				    var info = document.createElement('div');
				    info.className="schedule-item-info";
				    infoWrap.appendChild(info);
			    	
				    var title = document.createElement('div');
				    title.className="title";
				    title.appendChild(document.createTextNode(pos.title));
	
				    info.appendChild(title);
				    
				    
				  /*   컨트롤박스 = 버킷리스트 + x 버튼  */
				    var ctrlBox = document.createElement('div');
				    ctrlBox.className="ctrl-box";
				    infoWrap.appendChild(ctrlBox);
				    
 				    var bucket = document.createElement('span');
 				    bucket.className="bucket";
 				    ctrlBox.appendChild(bucket);
 					
 				    var bucketImage = document.createElement('img');
 				  	bucketImage.className = "bucketimg";
 				  	bucketImage.src = '/resources/images/calendar.png';				  
 				  	bucket.append(bucketImage);  
			    
 				  	//버킷 리스트 추가 
 				  	bucket.onclick = function(e){
 				  		//핸들바 템플릿 컴파일
 				  		var source = $('#template').html();
 						var template = Handlebars.compile(source);
 						
 						//몇번쨰 스케줄인지 확인. 0 부터 시작. 
 						selectSchedule = $(this).parent().parent().parent().index();
 						//선택된 스케줄의 시티 이름 
 						var cityname = $(this).parent().prev().children().eq(0).text();
 						//총 스케줄의 갯수
 						var totalSchedule = $('.make-plan-left-schedulelist').children().length;
 						
 						//선택된 엑티비티 들 넣는곳
 						var selectedItem = new Array();
						var activityname = new Object();
 						
 						$('#bucket-modal').empty();
 				
 						 $.ajax({
							url : "/buketlist/",
							type : "post",
							data : JSON.stringify({
								locationcity : cityname
							}),
		 			        contentType: "application/json; charset=utf-8",
							dataType : "json",
							success : function(result) {
								
								activityList = JSON.stringify(result);
								activityList = eval(activityList);
								
								var html = template(activityList);
								$('#bucket-modal').append(html);

								for(var i =0 ; i<activityList.length; i++){
									for(var j =0; j<DAYS[selectday].planschedulelist[selectSchedule].bucketlist.length;j++){
										if(activityList[i].activitycode==DAYS[selectday].planschedulelist[selectSchedule].bucketlist[j].activitycode){ 
											$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).removeClass("fas");
											$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).removeClass("fa-check-circle");
											$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).removeClass("checkimg");
				 					 		
											$('.item-wrapper-'+activityList[i].activitycode).children().eq(0).addClass("checked");
											$('.item-wrapper-'+activityList[i].activitycode).parent().addClass("checked-item");
										}
									}
								}
								 
							 for(var i =0 ; i<activityList.length; i++){
									
									 $('.item-wrapper-'+activityList[i].activitycode).on("click", function(){
				 					 		var name = $(this).children().eq(2).text();
				 					 		
				 					 		if($(this).children().eq(0).hasClass("checked")){
					 					 		$(this).children().eq(0).removeClass("checked");
					 					 		$(this).parent().removeClass("checked-item");

					 					 		$(this).children().eq(0).addClass("fas");
					 					 		$(this).children().eq(0).addClass("fa-check-circle");
					 					 		$(this).children().eq(0).addClass("checkimg");

					 						    var bucketindex = $(this).parent().index();
					 	 						var activitycode = activityList[bucketindex].activitycode;
					 	 						var activityindex;
					 	 						for(var j =0; j<DAYS[selectday].planschedulelist[selectSchedule].bucketlist.length;j++){
					 	 							if(activitycode==DAYS[selectday].planschedulelist[selectSchedule].bucketlist[j].activitycode){
							 					 		DAYS[selectday].planschedulelist[selectSchedule].bucketlist.splice(j,1);
					 	 							}
					 	 						}
					 					 		
				 					 		}else{
				 					 			
				 					 			$(this).children().eq(0).removeClass("fas");
					 					 		$(this).children().eq(0).removeClass("fa-check-circle");
					 					 		$(this).children().eq(0).removeClass("checkimg");
					 					 		
					 					 		$(this).children().eq(0).addClass("checked");
					 					 		$(this).parent().addClass("checked-item");
					 					 		
					 						    var BUCKETLISTDTO = new Object();
					 						    var bucketindex = $(this).parent().index();
					 	 						BUCKETLISTDTO.activitycode = activityList[bucketindex].activitycode;
					 	 					    DAYS[selectday].planschedulelist[selectSchedule].bucketlist.push(BUCKETLISTDTO);
												
				 					 		}

				 					 	}); 
								 } //end of for loop
							}//end of ajax success
						});  // end of ajax 
 						
 						$('#bucket-modal').modal({
 					        fadeDuration: 250
 					      });
 				  	}
 				  		    
				    /*스케줄 삭제 버튼 */
				    var deleteSchedule = document.createElement('span');
				    deleteSchedule.className="closeschedule";
				    ctrlBox.appendChild(deleteSchedule);
				    deleteSchedule.setAttribute("data-day",DAYS[selectday].dayCnt);
				    deleteSchedule.onclick = function(){
				    	var delindex = $(this).parent().parent().parent().index();
				    	
				    	DAYS[selectday].planschedulelist.splice(delindex,1);
				    	$("#schedulelist").children().eq(delindex).remove();
				    	DAYS[selectday].dayCnt--;

				    }
				    				    
				    schedulelist.appendChild(scheduleItem);
				    
				    var SCHEDULEDTO = new Object();
				    SCHEDULEDTO.planscheduleorder = ++DAYS[selectday].dayCnt;
				    SCHEDULEDTO.title = pos.title;
				    SCHEDULEDTO.img = pos.image;
				    SCHEDULEDTO.locationcode = pos.locationCode;
				    SCHEDULEDTO.bucketlist = new Array();
				    
				    DAYS[selectday].planschedulelist.push(SCHEDULEDTO);
		    	}
		    };
			
			addBtn.appendChild(addBtnDiv);
		  	
		    
			/* 이미지  */
			var body = document.createElement('div');
			body.className = "body";
			contentInfo.appendChild(body);

			
			var contentImageDiv = document.createElement('div');
			contentImageDiv.className="img";
		    body.appendChild(contentImageDiv);
		    
		    
		    
		    var contentImage = document.createElement('img');
		    contentImage.src = "/resources/images/city/"+pos.image;
		    contentImage.width = 73;
		    contentImage.height = 71;
		    contentImageDiv.appendChild(contentImage);
		    
		    
		    /* 상세내용 */
		    var descDiv = document.createElement('div');
		    descDiv.className = "desc";
		    body.appendChild(descDiv);
		    
		    var descContent = document.createElement('div');
		    descContent.className = "ellipsis";
		    descDiv.appendChild(descContent);
		    descContent.appendChild(document.createTextNode(pos.comment));

		    
		    
		    // 닫기 이벤트 추가
		    closeBtn.onclick = function() {
		        overlay.setMap(null);
		    };

		    contentTitle.appendChild(closeBtn);

		    // customoverlay 생성, 이때 map을 선언하지 않으면 지도위에 올라가지 않습니다.
		    var overlay = new kakao.maps.CustomOverlay({
		        position: pos.latlng,
		        content: content
			});
		    
		    kakao.maps.event.addListener(marker, 'click', function() {
		        overlay.setMap(map);
		    });
		});    
		    
	
		function markerClickListener(marker, overlay, map) {
			return function() {
				overlay.setMap(map);
				
			};
 
		}
		
		//
		function closeOverlay( overlay, map) {
			return function(){
			overlay.setMap(null);
			};
		}
		
		//
	 	function addOverlay() {
			overlay.setMap(null);
		}
	 		
		
	 	$('#buttonSubmit').click(
	 			 function() {
					if ($('#make-planner-date').val()!="" && $("#planTitle").val()!=""){ 				
		 				let date = new Date($('#make-planner-date').val());
		 				date.setDate(date.getDate()+dayTotal)
						date = getFormatDate(date);
		 				
		 				request ={
		 				planenddate : date,
		 				planstartdate : $("#make-planner-date").val(),
		 				plantitle : $("#planTitle").val(),
		 				days : DAYS
		 				}
		 				
		 				console.log(JSON.stringify(request));
		 				
		 				$.ajax({
		 			        type: "post",
		 			        cache: false,
		 			        url: "/planner/register",
		 			        data: JSON.stringify(request),
		 			        contentType: "application/json; charset=utf-8",
		 			        success: function (result) {
		 						 window.location.href = "myPlannerBoard";
		 			        },
		 			        error: function (result) {
		 			            alert("No Connection to server"+result);
		 			        },
		 				});
					}
	 				//form.submit(); 
	 				 
	 			 });
	 	
	 
	 	
	 	
	 	
	 	
	 	
});


function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}


</script>
	<script id="template" type="text/x-handlebars-template">
<span>
  <div class="buketlist-item">
	<a> 버킷 리스트 </a>
	
   	<ul class = "bucketlist-ul">
        {{#each .}}
			<li class = "bucketlist-li" > 

			<div class = "item-wrapper-{{activitycode}} item-wrapper">
				<i class="fas fa-check-circle checkimg"></i>

				<img src= "/resources/images/activity/{{activityimage}}" alt="Attachment">
			

				<div class = "bucketlist-item-name"> {{activityname}} </div>
			</div>
			</li>
       {{/each}}
	</ul>
  </div>

</span>

</script>
	<!-- makePlan -->
	<div class="make-plan">
		<div class="make-plan-top">
			<!-- 로고, 완료버튼  -->
		<span><input id="planTitle" name="PLANTITLE"
					placeholder="여행제목을 입력해주세요" required> </span> <input type="hidden"
					name="DAYS" value="" /> <input type="hidden" name="PLANSTARTDATE"
					value="" /> <input type="hidden" name="PLANENDDATE" value="" /> <input
					type="button" id="buttonSubmit" style="float: right" value="완료">

		</div>

		<div class="make-plan-middle">
			<div class="make-plan-left">
				<div class="activityList"></div>

				<div class="make-plan-left-daylist">
					<div class="daylist-top">
						<!-- 날짜선택, day추가버튼  -->
						<p style="margin-bottom: 10px; margin-top: 0px; color: #fff;">여행
							날짜</p>
						<input type="date" name="startdate" id="make-planner-date">
						<!-- 여행시작 버튼 누르면 없어짐 -->
						<button id="date-submit">여행시작</button>
						<!-- 여행시작 하면 생김 -->
						<button id="btn-day-add">day추가</button>
					</div>
					<div class="daylist-days">
						<ul>

						</ul>
					</div>
				</div>
				<div class="schedulelist-box">
					<div class="make-plan-left-schedulelist" id="schedulelist">
						Day 를 선택해주세요 !</div>

				</div>
			</div>

			<!-- map -->
			<div class="make-plan-right">
				<div id="bucket-modal" class="modal"></div>

				<div id="map"></div>

			</div>

		</div>

	</div>

</body>

</html>