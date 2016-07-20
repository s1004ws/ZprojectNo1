<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
a {text-decoration: none}

#emailmain{width:400px;height:480px;background:gray}
#first{padding: 20px 30px 0;
       background: gray;}   
#emaillogin
   {display: block;
    padding-bottom: 16px;
    border-bottom: 1px solid #000;
    font-size: 18px;
    color: #000;}
#snd{padding:15px 15px 34px;
   background:yellow}
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
    background: #f7f7f7;}
#user_email{    
   width: 100%;
    height: 100%;
    border: 0;
    background: none;
    font-size: 14px;
    color: blue;
}
#user_password{    
   width: 100%;
    height: 100%;
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
    font-size: 14px;
    background: black;
    color:white
}
#fiv{    
   margin-top: 20px;
    text-align: center;}
#one{ 
    padding: 42px 15px 16px;
    text-align: center;
}
#two{
    width: 100%;
    height: 52px;
    border: 0;
    background: none;
    font-size: 14px;
    background: black;
    color:white;
    text-align:center;
    line-height:52px
}

</style>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script>
$(function(){

	$("#email_login").click(function(){
		$("#dialog-emailmain").dialog("open");
	}); 


	$("#dialog-emailmain").dialog({
		autoOpen:false,
		draggable:true, //창 드래그 못하게
		resizable:false,
		position:{ my:"center", at:"center", of:"#box1" },
		//my : dialog 의 위치 
		//at : 위치할 개체의 위치 
		//of : 위치할 개체
		height:450,
		width:350,
		modal: true,
		open: function() {
			$(this).parents('.ui-dialog').attr('tabindex', -1)[0].focus();
		}
	});
	
});
</script>
</head>
<body>
<div id="#dialog-emailmain">
	<div id="first">
		<strong id="emaillogin">로그인</strong>   
	</div>

	<div id="snd">
		<div id="login2">
			<span class="inp_txt">
				<input type="text" id="user_email">
			</span>
			
			<span class="inp_txt" >
				<input type="password" id="user_password" >
			</span>
		</div>
		<div id="trd">                   
			<span class="inp_chk sp" ><input type="checkbox" id="login_retain" ></span>
			<label for="login_retain">로그인 유지</label>
		</div>
		
		<div id="for">
			<button class="btn2">로그인</button>
		</div>
		
		<div id="fiv">
			<p><a href="#">비밀번호를 잊어버리셨나요?</a></p>
		</div>
		
		<div id="log3">
			<div id="one">
				<p id=>이거나 먹어라에 가입하지 않으셨다면</p>
			</div>
			
			<div id="two">
				<a href="#" class="btn email">이메일주소로 회원 가입</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>