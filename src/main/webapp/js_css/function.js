$(function(){
	$("#left_banner_list").click(function(){
		$("#left_banner").css("display","block");
	});
	$("#left_banner").mouseenter(function(){
		$(this).css("display","block");
	});
	$("#left_banner").mouseleave(function(){
		$(this).css("display","none");
	});
	
	$("#right_banner_list").click(function(){
		$("#right_banner").css("display","block");
	});
	$("#right_banner").mouseenter(function(){
		$(this).css("display","block");
	});
	$("#right_banner").mouseleave(function(){
		$(this).css("display","none");
	});
	
	
	$("#upup").click(function(){
		$("body").animate({scrollTop:"0px"},200);
	});
});
