<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
    <link href="/webApp/js_css/style.css" rel="stylesheet"/>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body>
<div id="map"></div>
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=00898857ec294e7d5798822afd4e9a62&libraries=services"></script>
    <script src="/webApp/js_css/map.js"></script>
<div id="left_banner_list"><img src="/webApp/resources/left_banner_list.png" id="left_banner_list_icon"/></div>
<div id="left_banner">
	오늘 추천된<br/>
	음식점<br/>
	리스트
</div>
<div id="right_banner_list"><img src="/webApp/resources/right_banner_list.png" id="right_banner_list_icon"/></div>
<div id="right_banner">
	실시간<br/>
	방영맛집
</div>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="/webApp/js_css/function.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	$(function() {
		$( "#dialog-confirm" ).dialog({
			draggable:true, //창 드래그 못하게
			resizable: false,
			position:{ my:"center", at:"center", of:"#box1" },
			//my : dialog 의 위치 
			//at : 위치할 개체의 위치 
			//of : 위치할 개체
			height:520,
			width:480,
			modal: true,
			open: function() {
				$(this).parents('.ui-dialog').attr('tabindex', -1)[0].focus();
			}
		});
	});
</script>
<div id="dialog-confirm" title="자아~ 언제 먹을라고?? 나만 믿어!!">
	<div class="choice" id="choice1">점심</div>
	<div class="choice" id="choice2">저녁</div>
	<div class="choice" id="choice3">야식</div>
	<div class="choice" id="choice4">술안주</div>
</div>
<div id="testblock">
</div>

</body>
</html>