<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
a {text-decoration: none;}
body,ul,li{margin:0px;padding:0px}
#emailmain{width:400px;height:480px;background:white}
#first{padding: 20px 30px 0;
       background: white;}   
#emaillogin
   {display: block;
    padding-bottom: 16px;
    border-bottom: 1px solid #000;
    font-size: 18px;
    color: #000;}
#snd{padding:15px 15px 34px;
   background:white}
#login2{    
   margin: 0;
    padding: 0;
    font-family: '나눔바른고딕','nb','맑은고딕','MalgunGothic','돋움',dotum,sans-serif;
    font-size: 12px;
    color: #000;
   }
.inp_txt{   
    display: block;
    position: relative;
    height: 52px;
    margin-top: 10px;
    padding: 0 15px;
    background: lightgray;
    border-radius:10px}
#user_joinemail{    
   width: 100%;
    height: 100%;
    border: 0;
    background: none;
    font-size: 14px;
    color: blue;
}
#user_email{    
   width: 100%;
    height: 95%;
    border: 0;
    background: none;
    font-size: 14px;
    color: blue;
}
#user_email_password{    
   width: 100%;
    height: 95%;
    border: 0;
    background: none;
    font-size: 14px;
    color: blue;
}
#user_email_password2{    
   width: 100%;
    height: 95%;
    border: 0;
    background: none;
    font-size: 14px;
    color: blue;
}
.btn2{
    width: 100%;
    height: 52px;
    border: 0;
    background: none;
    font-size: 1.5em;
	background:#26d1ce;color:white;border-radius:10px
}
#fiv{    
   	margin-top: 20px;
    text-align: center;}
</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="/webApp/js_css/member.js"></script>
<script>
$(function(){
	//아이디 중복확인 이벤트
	$("#emailChk").click(function(){
		window.open("/webApp/emailCheck?user_email="+$("#user_email").val(),"emailChk","width=450, height=150");
	});
});
</script>
</head>
<body>
<div id="#dialog-emailmain">
	<form method="post" name="frm" action="/webApp/email_join_ok" onSubmit="return memCheck()">
		<div id="first">
			<strong id="emaillogin">이메일로 가입하기</strong>   
		</div>
	
		<div id="snd">
			<div id="login2">
				이메일 주소 입력 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="이메일중복확인" id="emailChk"/>
				<input type="hidden" name="emailCheck" id="emailCheck"/><br/>
				<span class="inp_txt">
					<input type="text" name="user_email" id="user_email" >
				</span><br/>
				
				비밀번호 입력<br/>
				<span class="inp_txt" >
					<input type="password" name="user_email_password" id="user_email_password" >
				</span><br/>
				비밀번호 입력확인 <br/>
				<span class="inp_txt" >
					<input type="password" name="user_email_password2" id="user_email_password2">
				</span>
			</div><br/>
			<div id="for">
				<button class="btn2">가입하기</button>
			</div>
			
			<div id="fiv">
				<p>이거나 먹어라의 다양한 해택을 받아보세요~</p>
				<p>당신에게 새로운 삷의 방식을 제공합니다.</p>
			</div>
		
		</div>
	</form>
</div>
</body>
</html>