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
#one{ 
    padding: 20px 15px 16px;
    text-align: center;
}
#two{
    width: 100%;
    height: 52px;
    border: 0;
    font-size: 1.5em;
    background: #26d1ce;
    color:white;
    text-align:center;
    line-height:52px;border-radius:10px
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
	$(function(){
		$("#loginBtn").click(function(){
			if($("#user_email").val()==""||("#user_email").val()=="이메일"){
				alert("이메일을 입력하세요...");
				return false;
			}
			if($("#user_email_password").val()==""||("#user_email_password").val()=="1234"){
				alert("비밀번호를 입력하세요...");
				return false;
			}
			$("#loginFrm").submit();
		});
	});
</script>
<script>
	function user_emailCheck(){
		var user_email = document.getElementById("user_email");
		if(user_email.value =="이메일"){
			user_email.value="";
		}
		user_email.style.backgroundColor='#26d1ce';
	}
	
	function user_emailCheckOut(){
		user_email.style.backgroundColor='lightgray';
	}
	
	function user_email_passwordCheck(){
		var user_email_password = document.getElementById("user_email_password");
		if(user_email_password.value == "1234"){
			user_email_password.value="";
		}
		user_email_password.style.backgroundColor='#26d1ce';
	}
	
	function user_email_passwordCheckOut(){
		user_email_password.style.backgroundColor='lightgray';
	}
	
	var emailjoin;
	function emailjoinOpen(){
		cw=screen.availWidth;     //화면 넓이
		ch=screen.availHeight;    //화면 높이
		
		sw=350;    //띄울 창의 넓이
		sh=350;    //띄울 창의 높이
		
		ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
		mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
		 //근데 왜 안돼냥?
		emailjoin = window.open("/webApp/email_join","email_join","width=400, height=550, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no");
	}
</script>
</head>
<body>
<div id="#dialog-emailmain">
	<div id="first">
		<strong id="emaillogin">이메일 로그인</strong>   
	</div>

	<div id="snd">
	<form method="post" id="loginFrm" action="/webApp/email_login_ok">
		<div id="login2">
			<span class="inp_txt">
				<input type="text" name="user_email" id="user_email" value="이메일" onfocus="user_emailCheck()" onblur="user_emailCheckOut()">
			</span>
			
			<span class="inp_txt" >
				<input type="password" name="user_email_password" id="user_email_password" value="1234" onfocus="user_email_passwordCheck()" onblur="user_email_passwordCheckOut()">
			</span>
		</div><br/>

		<div id="for">
			<button class="btn2" id="loginBtn">로그인</button>
		</div>
	</form>
		
		<div id="fiv">
			<p>비밀번호를 잊어버리셨나요?</p>
			<p>1234-1234 문의해주세요</p>
		</div>
		
		<div id="log3">
			<div id="one">
				<p style="color:blue">이거나 먹어라에 가입하지 않으셨다면</p>
			</div>
			
			<div id="two">
				<a href="/webApp/email_join" onClick="return winClose();">이메일주소로 회원 가입</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>