<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
    <link href="/webApp/js_css/style.css" rel="stylesheet"/>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
</head>
<body>
<div id="map"></div>
<!-- 지도 표시 부분 -->
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=00898857ec294e7d5798822afd4e9a62&libraries=services"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(37.525081, 126.888574); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
    </script>
 <!-- 지도 표시 부분 -->  
    
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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="/webApp/js_css/function.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
   <a href="/webApp/selectLunch"><div class="choice" id="choice1">점심</div></a>
   <a href="/webApp/selectDinner"><div class="choice" id="choice2">저녁</div></a>
   <a href="/webApp/selectLate"><div class="choice" id="choice3">야식</div></a>
   <a href="/webApp/selectAlcohol"><div class="choice" id="choice4">술안주</div></a>
</div>
</body>
</html>