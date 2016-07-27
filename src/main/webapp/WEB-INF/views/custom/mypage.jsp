<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body,ul,li{margin:0px;paddimg:0px}
	#back_div{
	position:relative;
	z-index:2;
	width:100%;
	height:665px;
	background:url(/webApp/resources/mypageback.jpg) center no-repeat;
	background-size:cover;
}
	#op_div{
	position:relative;
	z-index:1;
	width:100%;
	height:100%;
	background: rgba(0,0,0,.4);
}
#back_div_content{
	position:absolute;
	z-index:1;
	top:400px;
	width:100%;
	height:100px;
	text-align:left;
}
	li{list-style-type:none;}
	#favor{width:80%;height:160px;background-color:rgba(0,205,205,0.7);margin:0 auto;
	padding-top:40px;padding-left:10px;border-radius:20px;color:white;}
	#favor>div{float:left;width:140px}
	#submit>input{position:relative;top:10px;text-align:center;width:100px;margin-top:5px;margin-left:10px;}

#user_info_div{
	position:absolute;
	z-index:1;
	top:150px;
	width:100%;
	height:100px;
	text-align:left;
}
#user_info{width:80%;height:160px;background-color:rgba(0,205,205,0.7);margin:0 auto;
	padding-top:40px;padding-left:10px;border-radius:20px;color:white;}
</style>
<script src="/webApp/js_css/member.js"></script>
</head>
<body>
<form method="post" name="favorFrm" action="/webApp/myfavorOk" Onsubmit="return favorCheck()">
	<div id="back_div">
		<div id="op_div"></div>
		<div id="user_info_div">
			<div id="user_info">
				${user_email} 당신의 취향은?<br/>
				1. ${favor1}<br/>
				2. ${favor2}<br/>
				3. ${favor3}<br/>
				4. ${favor4}<br/>
				5. ${favor5}<br/>
			
			</div>
		</div>
		<div id="back_div_content">
			<div id="favor" >
				<div>당신의 입맛은?</div>
				<div id="1st">
					<ul>
						<li><input type="checkbox" name="favor" value="매운맛"/>매운맛</li>
						<li><input type="checkbox" name="favor" value="뜨거운맛"/>뜨거운맛</li>
						<li><input type="checkbox" name="favor" value="짭짤한맛"/>짭짤한맛</li>
						<li><input type="checkbox" name="favor" value="시원한맛"/>얼큰한맛</li>
					</ul>
				</div>
				<div id="2nd">
					<ul>
						<li><input type="checkbox" name="favor" value="달콤한맛"/>달콤한맛</li>
						<li><input type="checkbox" name="favor" value="상큼한맛"/>상큼한맛</li>
						<li><input type="checkbox" name="favor" value="시큼한맛"/>시큼한맛</li>
						<li><input type="checkbox" name="favor" value="구수한맛"/>구수한맛</li>
					</ul>
				</div>
				
				<div id="3rd">
					<ul>
						<li><input type="checkbox" name="favor" value="돼지고기"/>돼지고기</li>
						<li><input type="checkbox" name="favor" value="소고기"/>소고기<li>
						<li><input type="checkbox" name="favor" value="양고기"/>해산물<li>
						<li><input type="checkbox" name="favor" value="닭고기"/>닭고기<li>
					</ul>
				</div>
				
				<div id="4th">
					<ul>
						<li><input type="checkbox" name="favor" value="국물요리"/>국물요리</li>
						<li><input type="checkbox" name="favor" value="쌀"/>쌀</li>
						<li><input type="checkbox" name="favor" value="밀"/>밀</li>
						<li><input type="checkbox" name="favor" value="아이들입맛"/>아이들입맛</li>
					</ul>
				</div>
				
				<div id="5th">
					<ul>
						<li><input type="checkbox" name="favor" value="찜요리"/>찜요리</li>
						<li><input type="checkbox" name="favor" value="중화요리"/>중화요리</li>
						<li><input type="checkbox" name="favor" value="일식요리"/>일식요리</li>
						<li><input type="checkbox" name="favor" value="해외요리"/>해외요리</li>
					</ul>
				</div>
				
				<div id="6th">
					<ul>
						<li><input type="checkbox" name="favor" value="술안주"/>술안주</li>
						<li><input type="checkbox" name="favor" value="커피"/>커피</li>
						<li><input type="checkbox" name="favor" value="후식"/>후식</li>
						<li><input type="checkbox" name="favor" value="차"/>차</li>
					</ul>
				</div>      
				
				
				<div id="submit">
				   <input type="submit" value="선택완료"/>
				   <input type="reset" value="다시선택"/>   
				</div>
			</div>
		</div>
		
	</div>
</form>
</body>
</html>