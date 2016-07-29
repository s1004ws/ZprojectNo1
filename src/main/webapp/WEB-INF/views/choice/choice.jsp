<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
	
	//쿠기 가져오기
	Cookie [] ck = request.getCookies();

%>

<html>
<head>
   <title>Home</title>
   <link href="/webApp/js_css/style.css" rel="stylesheet"/>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
   <style>
   		.LBimg{width:100%;height:90px;text-aling:center}
   		#left_banner div{color:white}
   		#LBlunch{text-align:center}
   		#main_area {
		   display: inline-block;
		   position: relative;
		   /*top: 312px;*/
		   min-width: 960px;
		   width: 100%;
		   height: auto;
		   background-color: #ffffff;
		}

		#item_headr {
		   float: left;
		   width: 100%;
		   background: rgba(0, 205, 205, .95);
		}
		
		#item-body {
		   float: left;
		   width: 100%;
		   padding: 40px 0px;
		   background: #fff;
		}
		
		.item-contain {
		   width: 960px;
		   margin: 0 auto;
		}
		
		#cafe-title-name {
		   width: 70%;
		   margin: 0 auto;
		   color: white;
		}
		
		#item-body-left {
		   float: left;
		   width: 49%;
		   padding: 0px 10px 0px 5px;
		}
		
		#item-body-right {
		   float: left;
		   width: 49%;
		   padding: 0px 0px 0px 0px;
		}
		
		.item-informatin {
		   display: flex;
		   display: -webkit-flex;
		   justify-content: left;
		   -webkit-justify-content: left;
		   width: 100%;
		   height: 38px;
		}
		
		.item-informatin-icon {
		   flex: none;
		   -webkit-flex: none;
		   margin-right: 20px;
		   margin-top: 7px;
		}
		
		.item-information-icon img {
		   width: 16px;
		   height: 16px;
		   margin: 5px 0px;
		}
		
		.item-informatin-text {
		   flex: 1;
		   -webkit-flex: 1;
		   color: #4f4f4f;
		   font-size: 14px;
		   text-align: left;
		   padding-top: 8px;
		}
		
		#photo-area {
		   width: 960px;
		   margin: 0 auto;
		}
		
		#photo-area img {
		   width: 300px;
		   height: 300px;
		   margin: 0px auto
		}
		
		#taeyeon1 {
		   float:left;
		   width: 200px;
		   height: 200px;
		   margin: 0px auto
		}
		#taeyeon1 img {
		   position:absolute;
		   
		   top:10px;
		   left:10px;
		   width: 200px;
		   height: 200px;
		   margin: 0px auto;
		   z-index:10;
		}
		#dialog-cover{width: 100%;height: 100%;position: absolute;top:0px;left: 0px;background-color: lightgray;border:0px;padding: 0px }
		
		#taeyeon2 {
		   position:absolute;
		   top:80px;
		   left:80px;
		   line-height: 200px;
		   float: right;
		   margin: 10px;
		   z-index:1;
		}
		
		#selected{position:absolute;top:10px;left:230px;z-index:5;background-color: rgba(0, 205, 205, 0.95);
			width:260px;height:30px;text-align:center;line-height:30px;border-radius:3px;color:white}
		#selectedcafename{position:absolute;top:320px;left:10px;z-index:5;background-color: rgba(0, 205, 205, 0.95)}
		#selectedcafemenu{position:absolute;top:360px;left:10px;z-index:5;background-color: rgba(0, 205, 205, 0.95)}
		
	   .hide-title-bar.ui-dialog-titlebar { display: none; }
	   .ui-dialog-titlebar { display: none; };

   </style>
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
        level: 5 // 지도의 확대 레벨
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
<script>

//마커가 표시될 위치입니다 

var cafeLat =${meal.latitude};
var   cafeLon =${meal.longitude};

//alert("${i.longitude}");

var markerPosition  = new daum.maps.LatLng(cafeLat, cafeLon); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">${meal.cafename}<br> <a href="http://map.daum.net/link/to/${meal.cafename},${meal.latitude},${meal.longitude}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(cafeLat, cafeLon); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>
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
<%-- 	<%
	 Cookie c = new Cookie("sname1",URLEncoder.encode("${i.cafename}","utf-8"));
	%> --%>
<div id="left_banner_list"><img src="/webApp/resources/left_banner_list.png" id="left_banner_list_icon"/></div>
<div id="left_banner">
  		추천리스트
  <c:if test="${loginStatus == 'Y' }">
	  <c:if test="${selectLunch!=null}">
	  <div><br/>점심 추천<br/>${selectLunch}</div>
	  <div class="LBimg"><img src="/webApp/upload/${selectLunchpic}" class="LBimg"/></div>
	  </c:if>
	  <c:if test="${selectDinner!=null}">
	  <div >저녁 추천<br/>${selectDinner}</div>
	  <div class="LBimg"><img src="/webApp/upload/${selectDinnerpic}" class="LBimg"/></div>
	  </c:if>
	  <c:if test="${selectLate!=null}">	  
	  <div>야식 추천<br/>${selectLate}</div>
	  <div class="LBimg"><img src="/webApp/upload/${selectLatepic}" class="LBimg"/></div>
	  </c:if>
	  <c:if test="${selectAlcohol!=null}">	  
	  <div>술안주 추천<br/>${selectAlcohol}</div>
	  <div class="LBimg"><img src="/webApp/upload/${selectAlcoholpic}" class="LBimg"/></div>
	  </c:if>
	  

  </c:if>
</div>
<div id="right_banner_list"><img src="/webApp/resources/right_banner_list.png" id="right_banner_list_icon"/></div>
<div id="right_banner">
      <h3>실시간 방영맛집</h3></br><hr>
         <a href="http://blog.naver.com/jsoofstudio?Redirect=Log&logNo=220771439247" target="_blank">백종원 3대천왕(장칼국수)</a></p>
         <a href="http://faori2.blog.me/220759682968" target="_blank">백종원 3대천왕(해성횟집)</a></p>
         <a href="http://for40.blog.me/220769698641" target="_blank">백종원 3대천왕(바로방)</a></p>
         <a href="http://choimulan62.blog.me/220741523498" target="_blank">수요미식회(긴자 바이린)</a></p>
         <a href="http://blog.naver.com/tmshingiru?Redirect=Log&logNo=220760721022" target="_blank">수요미식회(광화문집)</a>
   </div>
</div>
	<div id="main_area" >
		<div id="item_headr">
			<div class="item_contain">
				<div id="cafe-title-name"><h1>${meal.cafename}</h1></div>
			</div>                  
		</div>
		<div id="item-body">
			<div class="item-contain">
				<div id="item-body-left">
					<div class="item-informatin">
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-tag@2x.png"/></div>
						<div class="item-informatin-text">메인메뉴 : ${meal.cafemainmenu}</div>
					</div>
					<div class="item-informatin">   
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-phone@2x.png"/></div>
						<div class="item-informatin-text">전화번호 : ${meal.cafephone}</div>
					</div>
					<div class="item-informatin">   
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-address@2x.png"/></div>
						<div class="item-informatin-text">주소 : ${meal.cafeaddr}</div>
					</div>            
					<div class="item-informatin">   
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-point@2x.png"/></div>
						<div class="item-informatin-text">취향 : ${meal.cafefavor}</div>
					</div>   
				</div>
				<div id="item-body-right">
					<div class="item-informatin">
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-time@2x.png"/></div>
						<div class="item-informatin-text">휴무 : ${meal.cafeholi}</div>
					</div>
					<div class="item-informatin">   
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-time@2x.png"/></div>
						<div class="item-informatin-text">영업시간 : ${meal.cafetime}</div>
					</div>
					<div class="item-informatin">   
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-time@2x.png"/></div>
						<div class="item-informatin-text">영업유무 : ${meal.cafeshutdown}</div>
					</div>            
					<div class="item-informatin">   
						<div class="item-informatin-icon"><img src="/webApp/resources/icon-info-service@2x.png"/></div>
						<div class="item-informatin-text">주차유무 : ${meal.cafeparking}</div>
					</div>   
				</div>
			</div>
		</div>
		   
		<div id="photo-area">         
			<img src="/webApp/upload/${meal.cafepic1}"/>
			<img src="/webApp/upload/${meal.cafepic2}"/>
			<img src="/webApp/upload/${meal.cafepic3}"/>            
		</div> 
	</div>
	<script>
	   $(function() {
	      $( "#dialog-choice" ).dialog({
	         dialogClass: "hide-title-bar", 
	         draggable:true, //창 드래그 못하게
	         resizable: false,
	         position:{ my:"center", at:"center", of:"#map" },
	         //my : dialog 의 위치 
	         //at : 위치할 개체의 위치 
	         //of : 위치할 개체
	         height:420,
	         width:500,
	         
	         modal: true,
	         open: function() {
	            $(this).parents('.ui-dialog').attr('tabindex', -1)[0].focus();
	            jQuery('.ui-widget-overlay').bind('click', function() {
	                jQuery('#dialog-choice').dialog('close');
	            });
	         },
/* 	         closeText: 'Close',
	         open: function() {
	             closedialog = 1;
	             $(document).bind('click', overlayclickclose); },
	         focus: function() { 
	             closedialog = 0; },
	         close: function() { 
	             $(document).unbind('click'); } */
			show: {                // 애니메이션 효과 - 보여줄때
			    effect: "shake",
			    duration: 3000
			},
/* 			hide: {
				effect: "explode",
				duration: 1000
			} */
	      });
	      $("#dialog-choice").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
	   });
	</script>
	<div id="dialog-choice" title="자아~ 언제 먹을라고?? 나만 믿어!!">
		<div id="dialog-cover">
			<div id="taeyeon1"><img src="/webApp/upload/${meal.cafepic1}"/></div>
			<div id="taeyeon2"><img src="/webApp/resources/taeyeon.png"/></div>
			<div id="selectedcafename">상호 : ${meal.cafename}</div>
			<div id="selectedcafemenu">메인메뉴 : ${meal.cafemainmenu}</div>
			<div id="selected"> 고민하지 말고, 이거나 먹어!!</div>
		</div>
	</div>
</body>
</html>