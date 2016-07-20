<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cafe list</title>
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
<div id="cafelistdiv">
	<h3>총 등록된 Cafe 수 : ${totalRecord}곳</h3>
	<a href="/webApp/admin">Admin홈</a>
	<a href="/webApp/cafe_regist">업체등록</a>
	<br/><br/>
	<ul id="cafelist_title">
		<li>번호</li>
		<li>상호명</li>
		<li>메인메뉴</li>
		<li>업체취향</li>
		<li>별점</li>
		<li>업체등록일</li>
	</ul><br/><br/>
	<c:forEach var="i" items="${list}">
		<ul>
			<li>${i.num}</li>
			<li><a href="/webApp/cafe_view?num=${i.num}">${i.cafename}</a></li>
			<li>${i.cafemainmenu}</li>
			<li>${i.cafefavor}</li>
			<li>${i.cafestar}</li>
			<li>${i.cafewritedate}</li>
		</ul>
		<br/><br/>
	</c:forEach>
</div>
</body>
</html>