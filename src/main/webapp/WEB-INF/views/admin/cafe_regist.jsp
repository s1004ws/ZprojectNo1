<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cafe_regist</title>
<link href="/webApp/js_css/mypage_style.css" rel="stylesheet"/>
</head>
<body>
<div id="top_area">
	<div id="background"></div>
	<div id="cover"></div>
	<div id="text_area">
		<div id="text_wrapper">
			<div id="subtitle">
				"-----------"<br/>
				"더이상 고민하지마.."<br/>
				"우리가 해결해줄께!!"<br/><br/>
				"혹시 마이페이지 이용해봤어?"<br/>
				"선택된 맛집 저장해 놓고 먹어봐!"<br/>
				"-----------"
			</div>
		</div>
	</div>
</div>
<div id="backblock"></div>
<form method="post" action="/webApp/cafe_registOk" enctype="multipart/form-data">
	<div id="registration_cafe">
		<a href="/webApp/admin">Admin홈</a>
		<a href="/webApp/cafe_list">업체목록</a>
		<fieldset>
			<legend>음식점 등록</legend>
			<b> * 필수입력사항</b>
			<ul id="regi_content">
				<li>상호명 : * <input type="text" id="cafename" name="cafename"/></li>
				<li>메인메뉴 : * <input type="text" id="cafemainmenu" name="cafemainmenu"/></li>
				<li>전화번호 : * <input type="text" id="cafephone" name="cafephone"/></li>
				<li>주소 : * <input type="text" id="cafeaddr" name="cafeaddr"/></li>
				<li>위도 : * <input type="text" id="latitude" name="latitude"/></li>
				<li>경도 : * <input type="text" id="longitude" name="longitude"/></li>
				<li>취향 : * <input type="text" id="cafefavor" name="cafefavor"/></li>
				<li>사진1 : * <input type="file" id="cafepic1" name="cafepic"/></li>
				<li>사진2 : * <input type="file" id="cafepic2" name="cafepic"/></li>
				<li>사진3 : <input type="file" id="cafepic3" name="cafepic"/></li>
				<li>별점 : <input type="text" id="cafestar" name="cafestar"/></li>
				<li>
					주차유무 : 
					* <input type="radio" name="cafeparking" value="true" checked/>가능
					<input type="radio" name="cafeparking" value="false"/>불가능
				</li>
				<li>휴무 : * <input type="text" id="cafeholi" name="cafeholi"/></li>
				<li>영업시간 : * <input type="text" id="cafetime" name="cafetime"/></li>
				<li>
					영업유무 : 
					* <input type="radio" name="cafeshutdown" value="true" checked/>영업중
					<input type="radio" name="cafeshutdown" value="false"/>폐업
				</li>
				<li>
					배달여부 : 
					* <input type="radio" name="cafedelivery" value="true" checked/>가능
					<input type="radio" name="cafedelivery" value="false"/>불가능
				</li>
				<li>
					점심여부 : 
					* <input type="radio" name="cafelunch" value="1" checked/>가능
					<input type="radio" name="cafelunch" value="0"/>불가능
				</li>
				<li>
					저녁여부 : 
					* <input type="radio" name="cafedinner" value="1" checked/>가능
					<input type="radio" name="cafedinner" value="0"/>불가능
				</li>
				<li>
					야식여부 : 
					* <input type="radio" name="cafelate" value="1" checked/>가능
					<input type="radio" name="cafelate" value="0"/>불가능
				</li>
				<li>
					술안주여부 : 
					* <input type="radio" name="cafealcohol" value="1" checked/>가능
					<input type="radio" name="cafealcohol" value="0"/>불가능
				</li>
			</ul>
		</fieldset>
		<div id="cafe_regist_btn">
			<input type="submit" value="등록"/>
		</div>
	</div>
</form>
</body>
</html>