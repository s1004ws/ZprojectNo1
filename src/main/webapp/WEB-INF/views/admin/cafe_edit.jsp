<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cafe_regist</title>
<link href="/webApp/js_css/mypage_style.css" rel="stylesheet"/>
<style>
#registration_cafe_edit{
	width:50%;
	height: auto;
	margin:0px auto;
	background:lightgray;
	border:3px solid gray;
}
</style>
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
<form method="post" action="/webApp/cafe_editOk" enctype="multipart/form-data">
	<div id="registration_cafe_edit">
			<a href="/webApp/admin">Admin홈</a>
			<a href="/webApp/cafe_list">업체목록</a>
			<h3>업체 정보 수정</h3>
			<b> * 필수입력사항</b>
			<ul id="regi_content">
				<li>상호명 : * <input type="text" id="cafename" name="cafename" value="${vo.cafename}"/></li>
				<li>메인메뉴 : * <input type="text" id="cafemainmenu" name="cafemainmenu" value="${vo.cafemainmenu}"/></li>
				<li>전화번호 : * <input type="text" id="cafephone" name="cafephone" value="${vo.cafephone}"/></li>
				<li>주소 : * <input type="text" id="cafeaddr" name="cafeaddr" value="${vo.cafeaddr}"/></li>
				<li>위도 : * <input type="text" id="latitude" name="latitude" value="${vo.latitude}"/></li>
				<li>경도 : * <input type="text" id="longitude" name="longitude" value="${vo.longitude}"/></li>
				<li>취향 : * <input type="text" id="cafefavor" name="cafefavor" value="${vo.cafefavor}"/></li>
				<li>사진1 : * <input type="file" id="cafepic1" name="cafepic" value="${vo.cafepic1}"/><br/><img src="/webApp/upload/${vo.cafepic1}"/></li>
				<li>사진2 : * <input type="file" id="cafepic2" name="cafepic" value="${vo.cafepic2}"/><br/><img src="/webApp/upload/${vo.cafepic2}"/></li>
				<li>사진3 : <input type="file" id="cafepic3" name="cafepic" value="${vo.cafepic3}"/><br/><img src="/webApp/upload/${vo.cafepic3}"/></li>
				<li>별점 : <input type="text" id="cafestar" name="cafestar" value="${vo.cafestar}"/></li>
				<li>
					주차유무 : 
					* <input type="radio" name="cafeparking" value="가능" <c:if test="${vo.cafeparking=='가능'}"> checked</c:if> />가능
					<input type="radio" name="cafeparking" value="불가능" <c:if test="${vo.cafeparking=='불가능'}"> checked</c:if> />불가능
				</li>
				<li>휴무 : * <input type="text" id="cafeholi" name="cafeholi" value="${vo.cafeholi}"/></li>
				<li>영업시간 : * <input type="text" id="cafetime" name="cafetime" value="${vo.cafetime}"/></li>
				<li>
					영업유무 : 
					* <input type="radio" name="cafeshutdown" value="영업중" <c:if test="${vo.cafeshutdown=='영업중'}">checked</c:if> />영업중
					<input type="radio" name="cafeshutdown" value="폐업" <c:if test="${vo.cafeshutdown=='폐업'}">checked</c:if> />폐업
				</li>
				<li>
					배달여부 : 
					* <input type="radio" name="cafedelivery" value="가능" <c:if test="${vo.cafedelivery=='가능'}">checked</c:if> />가능
					<input type="radio" name="cafedelivery" value="불가능" <c:if test="${vo.cafedelivery=='불가능'}">checked</c:if> />불가능
				</li>
				<li>
					점심여부 : 
					* <input type="radio" name="cafelunch" value="1" <c:if test="${vo.cafelunch=='1'}">checked</c:if> />가능
					<input type="radio" name="cafelunch" value="0" <c:if test="${vo.cafelunch=='0'}">checked</c:if> />불가능
				</li>
				<li>
					저녁여부 : 
					* <input type="radio" name="cafedinner" value="1" <c:if test="${vo.cafedinner=='1'}">checked</c:if> />가능
					<input type="radio" name="cafedinner" value="0" <c:if test="${vo.cafedinner=='0'}">checked</c:if> />불가능
				</li>
				<li>
					야식여부 : 
					* <input type="radio" name="cafelate" value="1" <c:if test="${vo.cafelate=='1'}">checked</c:if> />가능
					<input type="radio" name="cafelate" value="0" <c:if test="${vo.cafelate=='0'}">checked</c:if> />불가능
				</li>
				<li>
					술안주여부 : 
					* <input type="radio" name="cafealcohol" value="1" <c:if test="${vo.cafealcohol=='1'}">checked</c:if> />가능
					<input type="radio" name="cafealcohol" value="0" <c:if test="${vo.cafealcohol=='0'}">checked</c:if> />불가능
				</li>
			</ul>
		<div id="cafe_regist_btn">
			<input type="submit" value="수정"/>
			<input type="hidden" name="num" value="${vo.num}"/>
		</div>
	</div>
</form>
</body>
</html>