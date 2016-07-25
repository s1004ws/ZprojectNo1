<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cafe_view</title>
<link href="/webApp/js_css/mypage_style.css" rel="stylesheet"/>
<script>
	function delChk(){
		if(confirm("등록된 업체를 삭제하시겠습니까?????")){
			location.href="/webApp/cafe_del?num=${vo.num}";
		}
	}
</script>
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
	<div id="registration_cafe_view">
		<div id="cafe_regist_btn">
			<a href="/webApp/admin">Admin홈</a>
			<a href="/webApp/cafe_list">업체목록</a>
			<a href="/webApp/cafe_edit?num=${vo.num}">수정</a>
			<a href="javascript:delChk()">삭제</a>
		</div>
		<h2>< 업체 상세정보 ></h2>
		번호 : ${vo.num}<br/><br/>
		<b>상호명 : ${vo.cafename}</b><br/><br/>
		메인메뉴 : ${vo.cafemainmenu}<br/><br/>
		전화번호 : ${vo.cafephone}<br/><br/>
		주소 : ${vo.cafeaddr}<br/><br/>
		위도 : ${vo.latitude}<br/><br/>
		경도 : ${vo.longitude}<br/><br/>
		취향 : ${vo.cafefavor}<br/><br/>
		사진1 : ${vo.cafepic1}<br/><img src="/webApp/upload/${vo.cafepic1}"/><br/><br/>
		사진2 : ${vo.cafepic2}<br/><img src="/webApp/upload/${vo.cafepic2}"/><br/><br/>
		사진3 : ${vo.cafepic3}<br/><img src="/webApp/upload/${vo.cafepic3}"/><br/><br/>
		별점 : ${vo.cafestar}<br/><br/>
		주차유무 : ${vo.cafeparking}<br/><br/>
		휴무 : ${vo.cafeholi}<br/><br/>
		영업시간 : ${vo.cafetime}<br/><br/>
		영업유무 : ${vo.cafeshutdown}<br/><br/>
		배달여부 : ${vo.cafedelivery}<br/><br/>
		점심여부 : ${vo.cafelunch}<br/><br/>
		저녁여부 : ${vo.cafedinner}<br/><br/>
		야식여부 : ${vo.cafelate}<br/><br/>
		술안주여부 : ${vo.cafealcohol}<br/><br/>
		등록일 : ${vo.cafewritedate}<br/>
	</div>
</body>
</html>