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
   <script src="//code.jquery.com/jquery-1.10.2.js"></script>
   <script src="/webApp/js_css/function.js"></script>
   <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<div id="map"></div>
<!-- 지도 표시 부분 -->
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=00898857ec294e7d5798822afd4e9a62&libraries=services"></script>
    <script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);
</script>
<!-- 식당 위치 좌표 -->
<c:if test="${meal!=null}">
<%-- <c:forEach var="j" items="${meal}">
<!-- <script>
//   var dd ="${j.cafedate}";
//   alert(dd);

</script> -->
</c:forEach> --%>
<c:forEach var="i" items="${meal}">
<script>

//마커가 표시될 위치입니다 

var cafeLat =${i.latitude};
var   cafeLon =${i.longitude};

//alert("${i.longitude}");

var markerPosition  = new daum.maps.LatLng(cafeLat, cafeLon); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">${i.cafename}<br> <a href="http://map.daum.net/link/to/${i.cafename},${i.latitude},${i.longitude}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(cafeLat, cafeLon); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
</c:forEach>
</c:if>
<script>


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
<div id="testblock">
</div>

</body>
</html>