$(function() {
	$(".planner-top-content .icon-like").on("click", function() {
		if ($(this).hasClass("like")) {
			console.log("exist");
			$(this).removeClass("like");
		} else {
			console.log("doesn't exist");
			$(this).addClass("like");
		}
	});

	$(".comment-area-right #btn-delete").on("click", function() {
		console.log("ADSFASDFASDF");
		var deleteAlert = confirm("정말 댓글을 삭제하시겠습니까?");

		if (deleteAlert) {
			$(this).parent().parent().parent().remove();
		} else {

		}
	});

	$("#comment-none").hide();

	if (!$.trim($(".comment-area-container").html) == '') {
		$(".comment-list").css("margin-bottom", "1em");
		$("#comment-none").css("display", "block");
		$("#comment-none").show();
	} else {
		$("#comment-none").css("display", "none");
		$("#comment-none").hide();
	}

	$(".tab-on").hide();
	$(".tab-on:first").show();

	$(".nav-wrapper-left > .planner-nav-item").on("click", function() {
		$(".nav-wrapper-left > .planner-nav-item").removeClass("active");
		$(this).addClass("active");

		$(".tab-on").hide();

		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn();
	});
	
	function showPlan() {
		$.ajax({
			type: 'GET',
			url: '/planner/readAjax',
			data: JSON.stringify({
				USRNICKNAME : USRNICKNAME,
				PLANTITLE : PLANTITLE,
				PLANSTARTDATE : PLANSTARTDATE,
				PLANENDDATE : PLANENDDATE,
				DAY : {
					DAY : DAY,
					PLANSCHEDULE : {
						CITYIMAGE : CITYIMAGE,
						BUCKETLIST : {
							ACTIVITYNAME : ACTIVITYNAME
						}
					} 
				}
			}),
			dataType: 'text',
			success: function() {
				
			}
		});
	}
	
});
